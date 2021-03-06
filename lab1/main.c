#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <memory.h>
#include <time.h>
#include <sys/resource.h>

#define STATIC_ARRAY_SIZE 100000
#define STATIC_BLOCK_SIZE 1000

//if flag DLL is set then load library
#ifdef DLL

#include <dlfcn.h>

struct array_struct{
    char **array;
    int blocks;
    int block_size;
    int is_static;
};


struct array_struct* (*create_struct) (int, int, int);
void (*delete_array)(struct array_struct*);
void (*add_block)(struct array_struct*, int, char*);
void (*delete_block)(struct array_struct*, int);
char* (*find_block)(struct array_struct*, int);

//if not then just load lib
#else

#include "library.h"

#endif

//global variable used to print communicate after making function
char *operation_print;

//generate block with random chars
char *generate_rand_block(int length){
    if (length < 1 || length >= STATIC_BLOCK_SIZE) return NULL;
    char *table = "1234567890abcdefghijklmnoprstuwvxyzABCDEFGHIJKLMNOPRSTUWVXYZ!@#$%^&*()";
    char *block = malloc (length * sizeof(char));

    for (int i = 0 ; i < length-1 ; i++){
        block[i] = table[rand() % strlen(table)];
    }
    block[length] = '\0';
    return block;
}

//delete blocks from start_index to start_index+number_of_blocks
void delete_blocks(struct array_struct *arr_struct, int start_index, int number_of_blocks){
    for (int i = start_index ; i < (start_index + number_of_blocks) ; i++){
        delete_block(arr_struct,i);
    }
}

//add number_of_blocks blocks after start_index
void add_blocks(struct array_struct *arr_struct, int start_index, int number_of_blocks, int block_size){
    for (int i = start_index ; i < start_index + number_of_blocks ; i++){
        char *tmp = generate_rand_block(block_size);
        add_block(arr_struct, i, tmp);
    }
}

//calculate system time in function call
float calculate_system_timediff(struct rusage *r_usage, int step_counter){
    if(step_counter == 0) {
        return (((float)(r_usage[step_counter].ru_stime.tv_sec) * 1000000) + r_usage[step_counter].ru_stime.tv_usec) / 1000000;
    }
    else {
        float x = r_usage[step_counter].ru_stime.tv_sec - r_usage[step_counter - 1].ru_stime.tv_sec;
        float y = r_usage[step_counter].ru_stime.tv_usec - r_usage[step_counter - 1].ru_stime.tv_usec;
        return ((x * 1000000)
                + y) / 1000000;
    }
}

//calculate user time in function call
float calculate_user_timediff(struct rusage *r_usage, int step_counter){
    if(step_counter == 0) {
        return (((float)(r_usage[step_counter].ru_utime.tv_sec) * 1000000) + r_usage[step_counter].ru_utime.tv_usec) / 1000000;
    }
    else {
        float x = r_usage[step_counter].ru_utime.tv_sec - r_usage[step_counter - 1].ru_utime.tv_sec;
        float y = r_usage[step_counter].ru_utime.tv_usec - r_usage[step_counter - 1].ru_utime.tv_usec;
        return ((x * 1000000)
                + y) / 1000000;
    }
}

//calculate real execution time
double calculate_real_timediff(struct timeval start, struct timeval end){
    return (((double)end.tv_sec * 1000000 + end.tv_usec)-((double) start.tv_sec* 1000000+ start.tv_usec))/1000000;
}

//prints time to console and to file
void print_time(struct timeval real_start, struct timeval real_end, struct rusage *r_usage, FILE *file, int step_counter){
    printf("Real time: %lf    ", calculate_real_timediff(real_start, real_end));
    printf("User time: %lf    ", calculate_user_timediff(r_usage,step_counter));
    printf("System time: %lf    \n", calculate_system_timediff(r_usage,step_counter));
    fprintf(file, "Real time: %lf    ", calculate_real_timediff(real_start, real_end));
    fprintf(file, "User time: %lf    ", calculate_user_timediff(r_usage,step_counter));
    fprintf(file, "System time: %lf    \n", calculate_system_timediff(r_usage,step_counter));
}

//function detecting and making operation
void make_operation(struct array_struct *arrstruct, char *operation, int parameter, int block_length){
    if(strcmp(operation, "find") == 0){
        operation_print = "Finding closest block:\n";
        find_block(arrstruct,parameter);
        return;
    }
    else if(strcmp(operation, "dta") == 0){
        operation_print = "Deleting then adding:\n";
        delete_blocks(arrstruct, 0, parameter);
        add_blocks(arrstruct, 0, parameter,block_length);
    }
    else if(strcmp(operation, "ada") == 0){
        operation_print = "Alternately deleting and adding:\n";

        for(int i = 0 ; i < parameter ; i++){

            delete_block(arrstruct, i);
            add_block(arrstruct, i, generate_rand_block(block_length));
        }
    }
    else {
        printf("Wrong argument, choose one of the following: \n find - finds block with closest char sum \n ");
        printf("dta - delete then add given number of blocks  \n ada - alternately delete and add blocks \n ");
    }
}


//----------------------------------------------------------------

int main(int argc, char *argv[]){

//using dlsym to sync functions
#ifdef DLL
    void *dynamic_handle = dlopen("./libdynamiclib.so", RTLD_LAZY);

    *(void**) (&create_struct) = dlsym(dynamic_handle, "create_struct");
    *(void**) (&delete_array) = dlsym(dynamic_handle, "delete_array");
    *(void**) (&add_block) = dlsym(dynamic_handle, "add_block");
    *(void**) (&delete_block) = dlsym(dynamic_handle, "delete_block");
    *(void**) (&find_block) = dlsym(dynamic_handle, "find_block");
#endif

    FILE *file = fopen(argv[1], "a"); //opening file with a option

    if (file == NULL){
        printf("Cannot open the file.\n");
        return 1;
    }

    if (argc < 5) {
        printf("Not enough arguments, please input array size, block length and allocation type.\n");
        return 0;
    }
    if (argc > 12) {
        printf("Too many commands, maximum is 3.\n");
        return 0;
    }

    //array struct parameters
    int array_size = (int) strtol(argv[2], NULL, 10);
    int block_length = (int) strtol(argv[3], NULL, 10);
    int is_static = (int) strtol(argv[4], NULL, 10);

    //srand for random generation
    srand(time(NULL));

    printf("Array Size: %d   Block Length: %d   Allocation: %d\n", array_size, block_length, is_static);
    fprintf(file, "Array Size: %d   Block Length: %d   Allocation: %d\n", array_size, block_length, is_static);


    //variables needed for time measurement
    struct timeval start, end;
    struct rusage *r_usage = malloc(7 * sizeof(*r_usage));
    int step_counter = 0; //variable shows where in r_usage array

    gettimeofday(&start, NULL);

    //creating structure
    struct array_struct *arrstruct = create_struct(array_size, block_length, is_static);
    add_blocks(arrstruct,0,arrstruct -> blocks, arrstruct -> block_size);
    gettimeofday(&end, NULL);

    getrusage(RUSAGE_SELF, &r_usage[step_counter]);

    printf("Create array:\n");
    fprintf(file, "Create array:\n");
    print_time(start,end,r_usage,file,step_counter);

    step_counter++;


    //function calls
    if(argc > 6) {
        gettimeofday(&start, NULL);

        make_operation(arrstruct, argv[5], (int) strtol(argv[6], NULL, 10), block_length);

        gettimeofday(&end, NULL);
        getrusage(RUSAGE_SELF, &r_usage[step_counter]);

        printf("%s", operation_print);
        fprintf(file, "%s", operation_print);
        print_time(start,end,r_usage,file,step_counter);

        step_counter++;
    }
    if(argc > 8) {
        gettimeofday(&start, NULL);

        make_operation(arrstruct, argv[7], (int) strtol(argv[8], NULL, 10), block_length);

        gettimeofday(&end, NULL);
        getrusage(RUSAGE_SELF, &r_usage[step_counter]);

        printf("%s", operation_print);
        fprintf(file, "%s", operation_print);
        print_time(start,end,r_usage, file, step_counter);

        step_counter++;
    }

    if(argc > 10) {
        gettimeofday(&start, NULL);

        make_operation(arrstruct, argv[9], (int) strtol(argv[10], NULL, 10), block_length);

        gettimeofday(&end, NULL);
        getrusage(RUSAGE_SELF, &r_usage[step_counter]);

        printf("%s", operation_print);
        fprintf(file, "%s", operation_print);
        print_time(start,end,r_usage, file, step_counter);
    }

    //fclose(file);
    return 0;
}


