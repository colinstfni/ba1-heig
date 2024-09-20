default: run

run: build
    ./main.out

build:
    g++ -o main.out --pedantic -std=c++20 main.cpp