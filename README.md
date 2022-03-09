# Sample C Project
for epitech C projects

(this repo is just for personal use, please modify or just use some pieace of code)
(if you use it, without modification in an Epitech project, marvin can detect you as a cheater)

# Installation
```bash
git clone https://github.com/Saverio976/SAMPLE_C_PROJECT.git
```

and in your `~/.gitconfig` add this:
```gitconfig
[init]
    templateDir = PATH_TO_SAMPLE_C_PROJECT/
```

# Usage
now, each time you `git clone` and empty git / `git init`,
the content of SAMPLE_C_PROJECT will be in .git/

To put all files on the repo root, do:
```bash
make -C .git/ init_repo NAME=PROJECT_NAME
```

GG you have a preconfigured project that look like this:
```txt
.
├── include
│   └── proj.h
├── lib
│   ├── include
│   │   ├── my_conversions.h
│   │   ├── my_fs.h
│   │   ├── my_macro.h
│   │   ├── my_puts.h
│   │   ├── my_strings.h
│   │   └── my_wordarray.h
│   ├── libconv
│   │   ├── Makefile
│   │   └── src
│   │       ├── my_atoi.c
│   │       ├── my_atoi_err.c
│   │       ├── my_itoa_base.c
│   │       ├── my_itoa_base_err.c
│   │       ├── my_itoa.c
│   │       └── my_itoa_err.c
│   ├── libfs
│   │   ├── Makefile
│   │   └── src
│   │       ├── fs_get_content.c
│   │       ├── fs_get_size.c
│   │       └── fs_open_ronly.c
│   ├── libputs
│   │   ├── Makefile
│   │   └── src
│   │       ├── my_printf.c
│   │       ├── myprintf_dependencies
│   │       │   ├── my_printf.h
│   │       │   ├── print_b.c
│   │       │   ├── print_c.c
│   │       │   ├── print_d.c
│   │       │   ├── print_mod.c
│   │       │   ├── print_o.c
│   │       │   ├── print_s.c
│   │       │   ├── print_u.c
│   │       │   └── print_x.c
│   │       ├── my_putchar.c
│   │       ├── my_putnbr_base.c
│   │       ├── my_putnbr.c
│   │       ├── my_putstr.c
│   │       └── my_putunbr_base.c
│   ├── libstr
│   │   ├── Makefile
│   │   └── src
│   │       ├── my_calloc.c
│   │       ├── my_revstr.c
│   │       ├── my_strcat.c
│   │       ├── my_strcmp.c
│   │       ├── my_strcontainc.c
│   │       ├── my_strcontains.c
│   │       ├── my_strcpy.c
│   │       ├── my_strdup.c
│   │       ├── my_strlen.c
│   │       └── my_strstartswith.c
│   ├── libwa
│   │   ├── Makefile
│   │   └── src
│   │       ├── my_wordarray_free.c
│   │       ├── my_wordarray_from_str.c
│   │       ├── my_wordarray_from_wordarray.c
│   │       ├── my_wordarray_index_startswith.c
│   │       ├── my_wordarray_len.c
│   │       └── my_wordarray_show.c
│   └── Makefile
├── Makefile
├── src
│   └── main.c
└── tests
    ├── fn_tests.sh
    └── test_basic.c

16 directories, 57 files
```

## lib docs
[https://saverio976.github.io/SAMPLE_C_PROJECT/files.html](https://saverio976.github.io/SAMPLE_C_PROJECT/files.html)

(thanks to [jothepro](https://github.com/jothepro/doxygen-awesome-css/) i have a dark theme)
