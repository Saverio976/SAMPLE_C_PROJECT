/*
** EPITECH PROJECT, 2021
** LIBMY
** File description:
** the conversions part of libmy
*/

#ifndef MY_CONVERSIONS_H_
    #define MY_CONVERSIONS_H_

// str to int
int my_atoi(char const *str);

// str to int with an error status
int my_atoi_err(char const *str, int *is_error);

// int to str
char *my_itoa(int nb);

// int to str with an error status
char *my_itoa_err(int nb, int *is_error);

// int to str in base b
char *my_itoa_base(int nb, char const *base);

// int to str in base b with an error status
char *my_itoa_base_err(int nb, char const *base, int *is_error);

#endif
