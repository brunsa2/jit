Instructions
============
nop
mov rd, rs
add rd, ra, rb
sub rd, ra, rb
mul rd, ra, rb
div rd, ra, rb
neg rd, rs
eq rd, ra, rb
neq rd, ra, rb
lt rd, ra, rb
lte rd, ra, rb
j dist
jt rs, dist
jf rs, dist
l dist
load.i rd, int
load.f rd, float
load.true rd
load.false rd
array_alloc rd, rs
array_load rd, array, index
array_store array, index, rs
call.# num, rd
ret


nop
mov rd, rs
add rd, rs
sub rd, rs
mul rd, rs
div rd, rs
neg rd, rs

eq
neq
lt
lte

j dest
l dest

array rd
load_from_array rd, rarray, ridx
store_to_array rarray, ridx, rs
call.# rclosure, rframe

closure rd, func_const

ret

Types
=====
Integer (32 bit signed)
Double (IEEE) Const pool
Numeric (Integer/Double, roughly interchangable)
Boolean
Nil
Array Const pool, heap
Function Const pool, heap
ByteBuffer Const pool, heap
Closure Not in bytecode file, heap
