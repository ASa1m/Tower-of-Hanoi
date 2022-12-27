TITLE x86 Assembler (Assembler.asm)
;
; Assemble x86 instructions to machine code
;
;

Include irvine32.inc
.data
;variable declarations go here
stack1 DWORD -1,6,4,2,0,0,0,0,0,0,0,0,0
stack2 DWORD -1,0,0,0,0,0,0,0,0,0,0,0,0
stack3 DWORD -1,0,0,0,0,0,0,0,0,0,0,0,0

.code

checkWin proc
mov ebx, 6
mov ebp, offset stack3
add ebp, 4
checkstart:
mov eax, [ebp]
cmp eax, ebx
jne checkend
sub ebx, 2
add ebp, 4
jmp checkstart
checkend:
cmp ebx, 0
je win
ret

win:
mov eax, 10
call writechar
Exit
ret

checkWin endp

printstack proc
;######################
mov bl, dl
; dl = bl-([esi]/2)
; mov eax, [esi]
; shr eax, 1
; sub bl, al
; add dl, bl
add esi, 4
mov ecx, [esi]
cmp ecx, 0
je empty


start:
mov ecx, [esi]
displaytile:
mov eax, 219
call writechar
loop displaytile

mov eax, [esi]
add esi,4
;###################
dec dh
inc dl
;###################
call Gotoxy

mov eax, [esi]
cmp eax, 0
jne start

empty:

ret

printstack endp

updatestack proc

mov esi, offset stack1

mov dh, 20
mov dl, 20
call Gotoxy

call printstack

mov esi, offset stack2

mov dh, 20
mov dl, 40
call Gotoxy

call printstack

mov esi, offset stack3

mov dh, 20
mov dl, 60
call Gotoxy

call printstack


ret

updatestack endp

toTop proc
front1:
add esi, 4
mov eax, [esi]
cmp eax, 0
jne front1

sub esi, 4

front2:
add edi, 4
mov eax, [edi]
cmp eax, 0
jne front2

sub edi, 4

ret

toTop endp

Main Proc

startingpoint:

call updatestack

call checkWin
call readchar
cmp al, 'a'
je oneToTwo
cmp al, 's'
je twoToThree
cmp al, 'd'
je oneToThree
cmp al, 'q'
je twoToOne
cmp al, 'w'
je threeToTwo
cmp al, 'e'
je threeToOne
jne startingpoint

oneToTwo:
mov esi, offset stack1
mov edi, offset stack2
jmp swapping

twoToOne:
mov esi, offset stack2
mov edi, offset stack1
jmp swapping

twoToThree:
mov esi, offset stack2
mov edi, offset stack3
jmp swapping

threeToTwo:
mov esi, offset stack3
mov edi, offset stack2
jmp swapping

oneToThree:
mov esi, offset stack1
mov edi, offset stack3
jmp swapping

threeToOne:
mov esi, offset stack3
mov edi, offset stack1
jmp swapping

swapping:
call toTop
mov eax, [esi]
mov ebx, [edi]
cmp eax, -1
je startingpoint
cmp ebx, -1
je skipcomparison

cmp eax, ebx
jnl startingpoint

skipcomparison:

add edi, 4
mov [edi], eax
mov eax, 0
mov [esi], eax

call clrscr
call updatestack

jmp startingpoint

Exit
Main endp
End Main
