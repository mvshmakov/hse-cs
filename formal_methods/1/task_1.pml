// active [2] proctype main() {
//   printf("my pid is %d\n", _pid)
// }

// proctype you_run(byte x) {
//   printf("x = %d, pid = %d\n", x, _pid)
//   // run you_run(x + 1) // recursive call
// }

init {
  int a = 1;
  int b = 2;
  int c = 0;

  int i = 0

  bool d = true;

  if
    :: ( a < b ) -> printf("good\n");
    :: else -> printf("bad\n");
  fi

  if
    :: ( b > c ) -> a = b
    :: else -> a = c
  fi

  printf("a = %d\n", a);

  do
    :: (a > b) -> break;
    :: else -> a = a + 1;
  od

  printf("a = %d\n", a);

  do
    :: (i < 100) ->  printf("i = %d\n", i) -> i = i + 1
    :: else -> break
  od

  // run you_run(0)
}
