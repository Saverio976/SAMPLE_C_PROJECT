/*
** EPITECH PROJECT, 2022
** LIBMY
** File description:
** copy a word array
*/

#include <stdlib.h>
#include "my_strings.h"
#include "my_wordarray.h"

char **my_wordarray_from_wordarray(char *const env[])
{
    int len = my_wordarray_len(env);
    char **new;

    if (len == 0) {
        return (NULL);
    }
    new = malloc(sizeof(char *) * (len + 1));
    for (int i = 0; env[i] != NULL; i++) {
        new[i] = my_strdup(env[i]);
    }
    new[len] = NULL;
    return (new);
}
