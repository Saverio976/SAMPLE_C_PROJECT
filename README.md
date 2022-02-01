# Sample C Project
for epitech C projects

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

GG you have a pre configured project

## lib docs
[https://saverio976.github.io/SAMPLE_C_PROJECT/files.html](https://saverio976.github.io/SAMPLE_C_PROJECT/files.html)

(thanks to [jothepro](https://github.com/jothepro/doxygen-awesome-css/) i have a dark theme)
