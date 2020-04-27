#define MIN_VALUE 1
#define MAX_VALUE 3

int sum = 0;

active [1] proctype Oscillator () {
    int v;
    do
    :: {
        v = MIN_VALUE;
        do
        :: v < MAX_VALUE -> v++;
        :: true -> break;
        od;
        if
        :: sum > 0 -> sum = sum - v;
        :: else -> sum = sum + v;
        fi;
    }
    od;
}

ltl p1 { []<> (sum == 0) };
ltl p2 { [] ((sum >= -3) && (sum <= 3)) };
ltl p3 { [] ((sum > 0 -> <> (sum < 0)) && (sum < 0 -> <> (sum > 0))) };
ltl p4 { [] ((sum > 0 -> <> (sum <= 0)) && (sum < 0 -> <> (sum >= 0))) };
