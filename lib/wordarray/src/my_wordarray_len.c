/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** get length of word array
*/

#include <stddef.h>

int my_wordarray_len(char *const *array)
{
    int i = 0;

    if (array == NULL) {
        return (0);
    }
    for (; array[i] != NULL; i++);
    return (i);
}
