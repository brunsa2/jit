Source
======
Roughly sample program from Dragon Book
---------------------------------------
```
function x(v, a) {
  var x;

  while (true) {
    var i = 0;

    do {
      i = i + 1;
    } while (a[i] < v);

    var j = 99;

    do {
      j = j - 1;
    } while (a[j] > v);

    if (i >= j) {
      break;
    }

    x = a[i];
    a[i] = a[j];
    a[j] = x;
  }
}
```

Old tree for program
```
function :x, parameters: %i(v a) do
  declare :x

  while_loop true do
    declare :i
    assign :i, 0

    do_while_loop :a[:i] < :v do
      assign :i, :i + 1
    end

    declare :j
    assign :j, 99

    do_while_loop :a[:j] > :v do
      assign :j, :j - 1
    end

    if_statement :i >= :j do
      loop_break
    end

    assign :x, :a[:i]
    assign :a[:i], :a[:j]
    assign :a[:j], :x
  end
end
```

Function with closures
----------------------
```
function makeAdders() {
  var adders = [];

  for (var i = 0; i < 10; i = i + 1) {
    adders[i] = function(other) {
      return i + other;
    };
  }

  return adders;
}

adders = makeAdders();
print(adders[3](5));
```

Note that `function x() { }` is syntactic sugar for `x = function() { };`



Compiled bytecode (old instructions)
====================================
```
      ; r0 = v
      ; r1 = a
      ; r2 = x

      ; line 3
_0:   
      load.true r3
      jf r3, _1

      ; r3 = i

      ; line 5
      load.i r3, 0

      ; line 7
_2:
      ; line 8
      load.i r4, 1
      add r5, r3, r4
      mov r3, r5

      ; line 9
      array_load r4, r1, r3
      lt r5, r4, r0
      jt r5, _2

      ; r4 = j

      ; line 11
      load.i r4, 99

      ; line 13
_3:
      ; line 14
      load.i r5, 1
      sub r6, r4, r5
      mov r4, r6

      ; line 15
      array_load r5, r1, r4
      lt r6, r5, r0
      jt r6, _3

      ; line 17
      lte r5, r4, r3
      jf r5, _4

      ; line 18
      j _1

      ; line 19
_4:

      ; line 21
      array_load r5, r1, r3
      mov r2, r5

      ; line 22
      array_load r5, r1, r4
      array_store r1, r3, r5

      ; line 23
      array_store r1, r4, r2

      ; line 25
      l _0
_1:
      load.nil r0
      ret
```
