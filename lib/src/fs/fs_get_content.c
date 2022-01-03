/*
** EPITECH PROJECT, 2021
** LIBMY
** File description:
** get filess content from a buffer
*/

#include <stdlib.h>
#include <unistd.h>
#include "my_fs.h"
#include "my_strings.h"

static char *close_and_return_null(int fd)
{
    close(fd);
    return (NULL);
}

char *fs_get_content(char const *path)
{
    char *buffer = NULL;
    int size = 0;
    int nbyte = 0;
    int fd = fs_open_ronly(path);

    if (fd < 0)
        return (NULL);
    size = fs_get_size(path);
    if (size <= 0)
        return (close_and_return_null(fd));
    buffer = my_calloc(sizeof(char) * (size + 1));
    if (buffer == NULL)
        return (close_and_return_null(fd));
    nbyte = read(fd, buffer, size);
    if (nbyte != size) {
        free(buffer);
        return (close_and_return_null(fd));
    }
    return (buffer);
}
