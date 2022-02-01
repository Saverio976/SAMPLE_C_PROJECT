/*
** EPITECH PROJECT, 2022
** LIBCONVERSION
** File description:
** int to str base 10 with a status error
*/

#include "my_conversions.h"

static const char BASE_TEN[] = "0123456789";

char *my_itoa_err(int nb, int *is_error)
{
    return (my_itoa_base_err(nb, BASE_TEN, is_error));
}
