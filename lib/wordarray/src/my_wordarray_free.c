/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** free word array
*/

#include <stdlib.h>

void my_wordarray_free(char **arr)
{
    if (arr == NULL) {
        return;
    }
    for (int i = 0; arr[i] != NULL; i++) {
        free(arr[i]);
    }
    free(arr);
}
