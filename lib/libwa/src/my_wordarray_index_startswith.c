/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** get index from a str startswith
*/

#include <stddef.h>
#include "my_strings.h"

int my_wordarray_get_index_startswith(char *const *arr, char const *str)
{
    int i = 0;
    int find = 0;

    if (arr == NULL) {
        return (-1);
    }
    for (; arr[i] != NULL && find == 0; i++) {
        if (my_strstartswith(arr[i], str)) {
            find = 1;
        }
    }
    if (find == 0) {
        return (-1);
    } else {
        return (i - 1);
    }
}
