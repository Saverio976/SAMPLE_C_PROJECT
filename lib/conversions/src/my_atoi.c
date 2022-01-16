/*
** EPITECH PROJECT, 2022
** LIBCONVERSION
** File description:
** get nbr from str
*/

#include "my_conversions.h"

int my_atoi(char const *str)
{
    int is_error = 0;

    return (my_atoi_err(str, &is_error));
}
