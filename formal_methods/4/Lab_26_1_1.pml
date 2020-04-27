#define NUM_PILLARS 5

bit pillar_states[NUM_PILLARS] = {0,1,0,1,1};
chan ctl[NUM_PILLARS] = [0] of {bit};
bit gate_opened = 0;

active [NUM_PILLARS] proctype ControlPillar () {
    bit command;

	do
	:: ctl[_pid]?command;
        atomic {
            pillar_states[_pid] = 1 - pillar_states[_pid];
            byte next_pid = (_pid + 1) % NUM_PILLARS;
            pillar_states[next_pid] = 1 - pillar_states[next_pid];
            byte prev_pid = (_pid - 1 + NUM_PILLARS) % NUM_PILLARS;
            pillar_states[prev_pid] = 1 - pillar_states[prev_pid];
            int i = 0;

            do
            :: i < NUM_PILLARS -> {
                if 
                :: !pillar_states[i] -> break;
                fi;
                i++;
            }
            :: i == NUM_PILLARS -> gate_opened = 1;
            :: else -> break;
            od;
        }
	od;
}

active [1] proctype Commander () {
    int i = 0; 
    do
    :: gate_opened -> break;
    :: else -> {
        i = 0;
        do
        :: i < NUM_PILLARS - 1 -> i++;
        :: true -> break;
        od;
        ctl[i]!1;
    }
    od;
}

ltl p1 { [] !gate_opened };
