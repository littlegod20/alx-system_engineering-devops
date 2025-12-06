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

### 6-create_local_variable

Creates a new local variable named `BEST` with the value `School`. When sourced, this script creates the local variable in the current shell session.

### 7-create_global_variable

Creates a new global variable (environment variable) named `BEST` with the value `School`. Uses the `export` command to make the variable available to child processes. When sourced, this script creates the global variable in the current shell session.

### 8-true_knowledge

Prints the result of adding 128 to the value stored in the environment variable `TRUEKNOWLEDGE`, followed by a newline. Uses bash arithmetic expansion `$((...))` to perform the addition.

### 9-divide_and_rule

Prints the result of dividing the value stored in the environment variable `POWER` by the value stored in the environment variable `DIVIDE`, followed by a newline. Uses bash arithmetic expansion `$((...))` to perform the division.

### 10-love_exponent_breath

Prints the result of raising the value stored in the environment variable `BREATH` to the power of the value stored in the environment variable `LOVE`, followed by a newline. Uses bash arithmetic expansion `$((...))` with the `**` operator to perform exponentiation.

### 11-binary_to_decimal

Converts a binary number (base 2) stored in the environment variable `BINARY` to decimal (base 10), followed by a newline. Uses bash arithmetic expansion `$((...))` with base conversion syntax `2#number` to convert from binary to decimal.
