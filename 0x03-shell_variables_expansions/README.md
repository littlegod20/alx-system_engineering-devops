# Shell Variables and Expansions

This directory contains scripts demonstrating shell variables and expansions in bash.

## Scripts

### 0-alias

Creates an alias named `ls` with the value `rm *`. When sourced, this alias will replace the `ls` command with `rm *`, causing all files in the current directory to be deleted when `ls` is executed.

### 1-hello_you

Prints "hello" followed by the current Linux user's username. Uses the `$USER` environment variable to get the current user.

### 2-path

Adds `/action` to the PATH environment variable. The `/action` directory will be the last directory the shell looks into when searching for a program. When sourced, this script appends `:/action` to the current PATH.

### 3-paths

Counts the number of directories in the PATH environment variable. The script converts colons to newlines using `tr` and counts the resulting lines with `wc -l`.

### 4-global_variables

Lists all environment variables in the current shell session. Uses the `env` command to display all environment variables in the format `VARIABLE=value`, one per line.

### 5-local_variables

Lists all local variables, environment variables, and functions in the current shell session. Uses the `set` command to display all shell variables (both local and environment) and functions in the format `VARIABLE=value`, one per line.
