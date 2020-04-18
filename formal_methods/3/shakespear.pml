#define NUM_MONKEYS 26
#define PHRASE_LEN 13
 
byte phrase[PHRASE_LEN] = {'t', 'o', 'b', 'e', 'o', 'r', 'n', 'o', 't', 't', 'o', 'b', 'e'}
chan Channel = [1] of {byte};
 
proctype monkey (byte letter) {
    do
    :: Channel!letter;
    od;
}
 
proctype reviewer () {
    byte i = 0;
    bit solved = 0;
    do
        :: solved = 0 ->
            i = 0;
            byte next_letter;
            do
            :: i < PHRASE_LEN ->
                Channel?<next_letter>;
                if
                :: next_letter == phrase[i] ->
                    Channel?next_letter; i = i + 1;
                :: else -> break;
                fi;
            :: else ->
found:
                solved = 1;
            od;
        :: solved = 1 ->
            break;
    od;
}
 
 
init {
    byte proc = 0;
    byte letter = 'a';
 
    atomic {
        do
            :: proc < NUM_MONKEYS ->
                run monkey(letter);
                letter++;
                proc++;
            :: else ->
                break;
        od
    }
}
 
ltl p1 { [] !reviewer@found }
// ltl p1 { [] !(reviewer:solved) }
