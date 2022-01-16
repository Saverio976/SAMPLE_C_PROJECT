/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** show word array with \n between
*/

#include <stddef.h>
#include "my_puts.h"

void my_wordarray_show(char *const *array)
{
    if (array == NULL) {
        return;
    }
    for (int i = 0; array[i] != NULL; i++) {
        my_putstr(array[i]);
        my_putchar('\n');
    }
}
