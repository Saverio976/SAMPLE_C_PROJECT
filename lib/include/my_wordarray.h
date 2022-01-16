/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** manage char ** word array
*/

#ifndef WORD_ARRAY_H_
    #define WORD_ARRAY_H_

// free wordarray
void my_wordarray_free(char **arr);

// get lenght of wordarray
int my_wordarray_len(char *const *array);

// print each 'word' on newline
void my_wordarray_show(char *const *array);

// create wordarray from str
char **my_wordarray_from_str(const char *str, char delim);

// copy wordarray
char **my_wordarray_from_wordarray(char *const env[]);

// get index of the fist 'word' that start with str
int my_wordarray_get_index_startswith(char *const *arr, char const *str);

#endif
