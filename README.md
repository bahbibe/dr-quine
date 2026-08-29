# Dr_Quine

Self-reproducing programs (quines) written in **C** and **x86-64 Assembly (NASM)** on Linux, plus a bonus **Python** redo.

The project builds three programs, each in both languages — Colleen, Grace and Sully — exploring
self-reproduction, self-replication and self-execution (the recursion theorem of Kleene).

## Repository layout

```
dr-quine/
├── C/                  # C implementations, own Makefile
│   ├── Colleen.c
│   ├── Grace.c
│   ├── Sully.c
│   └── Makefile
├── ASM/                # NASM implementations, own Makefile
│   ├── Colleen.s
│   ├── Grace.s
│   ├── Sully.s
│   └── Makefile
└── Python/             # Bonus: same three programs, redone in Python
    ├── Colleen.py
    ├── Grace.py
    └── Sully.py
```

## Programs

| Program | Behavior |
|---------|----------|
| `Colleen` | prints its own source code to stdout |
| `Grace`   | writes its own source to `Grace_kid.{c,s}` |
| `Sully`   | writes `Sully_X.{c,s}`, compiles and runs it, decrementing the integer until `X < 0` |

## Build

Each folder has its own Makefile with the usual rules (`all`, `clean`, `fclean`, `re`):

```sh
make -C C
make -C ASM
```

## Verify (must pass)

```sh
# Colleen
./C/Colleen > /tmp/out.c && diff /tmp/out.c C/Colleen.c
./ASM/Colleen > /tmp/out.s && diff /tmp/out.s ASM/Colleen.s

# Grace
./C/Grace && diff C/Grace.c C/Grace_kid.c
./ASM/Grace && diff ASM/Grace.s ASM/Grace_kid.s

# Sully
./C/Sully && diff C/Sully_0.c <(sed 's/5/0/' C/Sully.c)
./ASM/Sully && diff ASM/Sully_0.s <(sed 's/5/0/' ASM/Sully.s)
```

## Bonus

`Python/` redoes all three programs in Python (only evaluated once the mandatory part above is perfect). No Makefile — run directly:

```sh
# Colleen
python3 Python/Colleen.py | diff - Python/Colleen.py

# Grace (run from a scratch dir, not the repo)
python3 Python/Grace.py && diff Grace_kid.py Python/Grace.py

# Sully (run from a scratch dir; chains down to Sully_0.py, compiling+running each generation)
python3 Python/Sully.py
diff Sully.py Sully_0.py
```
