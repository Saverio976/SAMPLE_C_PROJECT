/*
** EPITECH PROJECT, 2021
** LIBMY
** File description:
** the file part of libmy
*/

#ifndef MY_FS_H_
    #define MY_FS_H_

// get content of file
char *fs_get_content(char const *);

// get size of file
int fs_get_size(char const *);

// open read only file
int fs_open_ronly(char const *);

#endif
