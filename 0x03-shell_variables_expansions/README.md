# Shell Variables and Expansions

This directory contains scripts demonstrating shell variables and expansions in bash.

## Scripts

### 0-alias

Creates an alias named `ls` with the value `rm *`. When sourced, this alias will replace the `ls` command with `rm *`, causing all files in the current directory to be deleted when `ls` is executed.

### 1-hello_you

Prints "hello" followed by the current Linux user's username. Uses the `$USER` environment variable to get the current user.

### 2-path

Adds `/action` to the PATH environment variable. The `/action` directory will be the last directory the shell looks into when searching for a program. When sourced, this script appends `:/action` to the current PATH.
