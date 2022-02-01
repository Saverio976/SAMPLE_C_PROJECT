/*
** EPITECH PROJECT, 2022
** LIBCONVERSION
** File description:
** int to str in base 10
*/

#include "my_conversions.h"

char *my_itoa(int nb)
{
    int is_error = 0;

    return (my_itoa_err(nb, &is_error));
}
