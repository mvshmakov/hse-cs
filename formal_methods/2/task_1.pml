byte x;

active proctype A () {
    x = 1;
    do
        :: select(x:0..10);
    od;
}

ltl p1 { x == 0 }; // верно
ltl p2 { x != 0 }; // не верно
ltl p3 { (x == 0) -> X (x !=0) }; // верно
ltl p4 { (x == 0) -> <> (x != 0) }; // верно
ltl p5 { [] ((x == 0) -> X (x != 0)) }; // не верно
ltl p6 { [] ((x == 0) -> <> (x != 0))}; // не верно
