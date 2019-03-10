; TinyRAM V=1.00 W=32 K=8

; Simple test program. Read from the input tape, from the aux tape, and check
; if they're equal.

; begin prelude
store.w 0, r0
mov r0, 2147483648
read r1, 0
cjmp 7
add r0, r0, 4
store.w r0, r1
jmp 2
store.w 2147483648, r0
; end prelude
load.w r0, 2147483648 ; The first word of the primary input tape should be here. (memory 0x8000 0000, this is 1<<(w-1))
read r1, 1
xor r0, r0, r1 ; r0 is 0 iff r0 = r1
answer r0
