.686
.model flat, stdcall

.stack 100h

.data
x dw 87A3h
y dw 5322h
z dw 07F1h
nx dw ?
ny dw ?
nz dw ?
i dw 0
m dw ?
r dw ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:

mov ax, x

loopshift:
shr ax, 3
cmp i, 0
je first
cmp i, 1
je second
mov nz, ax
jmp skip

first:
mov nx, ax
inc i
mov ax, y
jmp loopshift

second:
mov ny, ax
inc i
mov ax, z
jmp loopshift

skip:
mov ax, nx
mov bx, nz
sub ax, bx
mov bx, ny
add ax, bx
mov m, ax
cmp m, 0
ja plusfive
mov ax, m
not ax
add ax, 1
jmp next

plusfive:
mov ax, m
add ax, 5

next:
mov r, ax
cmp r, 007Dh
ja last
mov ax, r
or ax, 17D1h
jmp exit

last:
xor edx, edx
mov ax, r
mov bx, 2
div bx

exit:
Invoke ExitProcess, ax
End Start