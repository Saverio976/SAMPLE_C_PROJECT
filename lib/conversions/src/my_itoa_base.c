/*
** EPITECH PROJECT, 2022
** LIBCONVERSION
** File description:
** int to str with base b
*/

#include "my_conversions.h"

char *my_itoa_base(int nb, char const *base)
{
    int is_error = 0;

    return (my_itoa_base_err(nb, base, &is_error));
}
