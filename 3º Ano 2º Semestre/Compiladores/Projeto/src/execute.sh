#!/bin/bash

commands=(
    #"echo 'dor'"
    "antlr4-build pdraw"
    "antlr4-build -python ipdraw"

    "cat p1.pdraw | antlr4-run"
    "mv pdraw_program.py pdraw_program1.py"

    "cat p2.pdraw | antlr4-run "
    "mv pdraw_program.py pdraw_program2.py"

    "cat p3.pdraw | antlr4-run "
    "mv pdraw_program.py pdraw_program3.py"

    "cat fractalcomfuncao.pdraw | antlr4-run"
    "mv pdraw_program.py fractalcomfuncao.py"

    "cat sun.pdraw | antlr4-run "
    "mv pdraw_program.py sun.py"

    "cat house.pdraw | antlr4-run "
    "mv pdraw_program.py house.py"

    "cat multiplepens.pdraw | antlr4-run "
    "mv pdraw_program.py multiplepens.py"

    "cat pausepolygon.pdraw | antlr4-run "
    "mv pdraw_program.py pausepolygon.py"

    "cat spiral.pdraw | antlr4-run "
    "mv pdraw_program.py spiral.py"

)

# Iterate over the commands and execute them
for cmd in "${commands[@]}"; do
    eval "$cmd"
done
