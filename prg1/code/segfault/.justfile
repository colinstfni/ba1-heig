default: run

run output="main.out": (build output)
    ./{{output}}

build output="main.out":
    g++ -o {{output}} --pedantic -std=c++20 main.cpp