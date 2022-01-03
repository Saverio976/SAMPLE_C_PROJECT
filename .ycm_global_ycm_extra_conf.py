def Settings( **kwargs ):
    return {
        'flags': [ '-x', 'c', '-Wall', '-Wextra', '-Werror',
            '-Ilib/include', '-Iinclude', '-I../include', '-I../lib/include'],
    }
