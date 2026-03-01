# ICU26 Library for C

**libicu26** is a robust and easy-to-use C library designed to simplify user input handling. It provides a suite of functions to prompt users and safely read various data types (integers, floats, strings, etc.) from standard input, handling validation and memory management automatically.

## Features

- **Type-Safe Input**: Dedicated functions for reading `char`, `int`, `long`, `float`, `double`, and `string`.
- **Input Validation**: Automatically reprompts the user if the input is invalid (e.g., entering text when an integer is expected) or causes an overflow.
- **Automatic Memory Management**: Strings returned by `get_string` are stored on the heap and automatically freed when the program exits, preventing memory leaks without manual `free()` calls.
- **Cross-Platform**: Compatible with Linux, macOS, and Windows.

## File Structure

The library consists of two core files located in the parent directory:

### 1. `icu26.h`

This is the **header file**. It serves as the interface for the library.

- **Usage**: You include this file in your C programs (`#include "icu26.h"`).
- **Contents**:
  - Defines the `string` type (a typedef for `char *`).
  - Contains the function prototypes (declarations) for all input functions like `get_int`, `get_string`, etc.

### 2. `icu26.c`

This is the **implementation file**. It contains the actual code that makes the library work.

- **Usage**: This file must be compiled and linked alongside your main program.
- **Contents**:
  - Implements the logic for reading characters from `stdin`.
  - Handles buffer resizing for dynamic string input.
  - Contains the logic for parsing and validating numbers.
  - **Constructor/Destructor**: Includes special setup and teardown functions that run before `main()` (to disable output buffering) and after `main()` (to free allocated memory).

## Installation and Usage

Since `libicu26` is a lightweight library, "installation" simply involves adding the source files to your project and compiling them with your code.

### Prerequisites

- **Windows**: MinGW (GCC) or Visual Studio (MSVC).
- **Linux**: GCC or Clang.
- **macOS**: Xcode Command Line Tools (Clang).

### Step 1: Setup

Copy `icu26.h` and `icu26.c` into your project directory.

### Step 2: Write your Code

Create a file named `main.c` and include the header:

```c
#include <stdio.h>
#include "icu26.h"

int main(void)
{
    string name = get_string("What is your name? ");
    printf("Hello, %s\n", name);

    int age = get_int("How old are you? ");
    printf("You are %d years old.\n", age);

    return 0;
}
```

### Step 3: Compile and Run

#### Linux and macOS

Open your terminal and run the following command to compile your program (`main.c`) together with the library (`icu26.c`):

```bash
# Compile
gcc main.c icu26.c -o myapp

# Run
./myapp
```

#### Windows (MinGW / Git Bash)

If you are using GCC via MinGW:

```bash
# Compile
gcc main.c icu26.c -o myapp.exe

# Run
./myapp.exe
```

#### Windows (Visual Studio)

1.  Create a new **Empty Project (C++)**.
2.  Right-click "Source Files" in the Solution Explorer -> **Add** -> **Existing Item**.
3.  Select `icu26.c`, `icu26.h`, and your `main.c`.
4.  Press **F5** to Build and Run.

_Note: Visual Studio compiles `.c` files as C code automatically._

### Using Build Scripts

For convenience, you can use the provided build scripts to compile your project.

#### Linux / macOS (`build.sh`)

```bash
#!/bin/bash

# Check if a filename was provided
if [ -z "$1" ]; then
    echo "Usage: $0 filename.c"
    exit 1
fi

filename="$1"
outputname="${filename%.c}"

# Compile with icu26.c
gcc "$filename" icu26.c -o "$outputname"
```

#### Windows (`build.bat`)

```bat
@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: build.bat filename
    exit /b 1
)

set filename=%1
set outputname=%filename:.c=%

gcc !filename! icu26.c -o !outputname!
```

## API Reference

All functions accept a `printf`-style format string for the prompt.

| Function                  | Description                           | Returns           |
| :------------------------ | :------------------------------------ | :---------------- |
| `get_char(fmt, ...)`      | Prompts for a single character.       | `char`            |
| `get_int(fmt, ...)`       | Prompts for an integer.               | `int`             |
| `get_long(fmt, ...)`      | Prompts for a long integer.           | `long`            |
| `get_long_long(fmt, ...)` | Prompts for a long long integer.      | `long long`       |
| `get_float(fmt, ...)`     | Prompts for a floating-point number.  | `float`           |
| `get_double(fmt, ...)`    | Prompts for a double-precision float. | `double`          |
| `get_string(fmt, ...)`    | Prompts for a line of text.           | `string` (char\*) |

## License

BSD 3-Clause License.

Copyright (c) 2026 Marcel Nazare. All rights reserved.
