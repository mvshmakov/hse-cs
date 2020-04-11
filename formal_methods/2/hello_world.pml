bool b = true;

active proctype main() {
    printf("Hello, world!\n");
    b = false;
} 

ltl p1 { [] b }
