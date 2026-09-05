# Programs to Processes

A hands-on exploration of what actually happens when a C program becomes a running process — from source code, to assembly, to object files, to a linked executable, all the way down to the operating system via syscalls.

## Overview

This project walks through the full toolchain that turns human-readable C code into something a CPU can execute. Rather than treating the compiler as a black box, each stage is inspected and manipulated directly:

- **Compiling** C source into x86 assembly
- **Assembling** that assembly into relocatable object files
- **Linking** object files (including hand-written assembly) into a final executable
- **Automating the build** with a Makefile
- **Interfacing with the OS** directly through raw syscalls

The environment is Linux running on Intel x86_64, since the generated assembly and syscall behavior are architecture-specific.

## What's in here

- `mini.c` — three small C functions (`sort`, `branch`, `loop`) used to explore compilation and control flow at the assembly level
- `mini_mod.S` — a hand-modified version of the compiled assembly, where the `sort` function's logic is rewritten directly in assembly (returns `11` if `x > 5`, else `17`)
- `calc.c` / `mystery.S` — a small calculator that dispatches on an operation struct, where one function is implemented purely in assembly and linked into the C program via the C calling convention
- `caller.c` — a program extended with raw `write` syscalls to standard out and standard error, inspected with `strace` to see exactly what the OS is doing under the hood
- `Makefile` — build automation for producing `test-mini`, `test-mini2`, and `calc` from their respective sources
- `questions.txt` — notes on syscall behavior observed via `strace`

## Toolchain, at a glance

```
C source (.c) → [compiler] → Assembly (.s/.S) → [assembler] → Object file (.o) → [linker] → Executable
```

- `gcc -S` stops after compiling to assembly, letting you read/edit the generated `.s` file directly
- `gcc -c` stops after assembling, producing a relocatable `.o`
- `gcc` (no flags) or `ld` links one or more object files into a final executable
- `as` invokes the assembler directly on a `.s`/`.S` file

## Key concepts explored

- **Registers & the x86 ISA** — how instructions like `add` map to real operations on the 8 general-purpose registers
- **The C calling convention** — how a function written entirely in assembly (`mystery.S`) can be called seamlessly from C, thanks to shared conventions for argument passing, return values, and stack frame setup/teardown
- **Syscalls** — how a user-space process asks the kernel to do privileged work (like writing to a file descriptor), observed directly with `strace`

## Building & running

```bash
# Build and run the basic C program
gcc test.c mini.c -Wall -o test-mini
./test-mini ALL

# Build and run the assembly-modified version
make test-mini2
./test-mini2 3

# Build and run the calculator (C + hand-written assembly)
make calc
./calc

# Inspect syscalls made by the syscall demo
strace ./caller
```

## Why this project

Modern development happens almost entirely above the level of assembly and syscalls — but understanding what's underneath demystifies a lot of "magic": why a segfault happens, what a stack frame actually is, why calling conventions exist, and how a program talks to the OS at all. This project was a chance to get hands dirty with that layer directly, rather than just reading about it.
