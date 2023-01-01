Include irvine32.inc
.data
;variable declarations go here

stacksize DWORD 12
stack1 DWORD -1,0,0,0,0,0,0,0,0,0,0,0,0
stack2 DWORD -1,0,0,0,0,0,0,0,0,0,0,0,0
stack3 DWORD -1,0,0,0,0,0,0,0,0,0,0,0,0

towerofhanoi byte '  ______                                 ____   __  __                  _ ',0ah,0dh
byte ' /_  __/___ _      _____  _____   ____  / __/  / / / /___ _____  ____  (_)',0ah,0dh
byte '  / / / __ \ | /| / / _ \/ ___/  / __ \/ /_   / /_/ / __ `/ __ \/ __ \/ / ',0ah,0dh     
byte ' / / / /_/ / |/ |/ /  __/ /     / /_/ / __/  / __  / /_/ / / / / /_/ / /  ',0ah,0dh
byte '/_/  \____/|__/|__/\___/_/      \____/_/    /_/ /_/\__,_/_/ /_/\____/_/   ',0ah,0dh,0ah,0dh
byte 'INSTRUCTIONS: ',0ah,0dh,0ah,0dh
byte '         a: move top tile from stack 1 to stack 2',0ah,0dh
byte '         s: move top tile from stack 2 to stack 3',0ah,0dh
byte '         d: move top tile from stack 1 to stack 3',0ah,0dh
byte '         q: move top tile from stack 2 to stack 1',0ah,0dh
byte '         w: move top tile from stack 3 to stack 2',0ah,0dh
byte '         e: move top tile from stack 3 to stack 1',0ah,0dh,0ah,0dh
byte 'Objective of the game is to: ',0ah,0dh
byte '         Move all tiles from stack 1 to stack 3',0ah,0dh,0ah,0dh
byte 'Enter size of stack (1-10): ',0

youwin byte ' ',0ah,0dh,0ah,0dh,0ah,0dh,0ah,0dh
byte '       Y88b   d88P                                   d8b          ',0ah,0dh
byte '        Y88b d88P                                    Y8P          ',0ah,0dh
byte '         Y88o88P                                                  ',0ah,0dh
byte '          Y888P  .d88b.  888  888      888  888  888 888 88888b.  ',0ah,0dh
byte '           888  d88""88b 888  888      888  888  888 888 888 "88b ',0ah,0dh
byte '           888  888  888 888  888      888  888  888 888 888  888 ',0ah,0dh
byte '           888  Y88..88P Y88b 888      Y88b 888 d88P 888 888  888 ',0ah,0dh
byte '           888   "Y88P"   "Y88888       "Y8888888P"  888 888  888 ',0
.code

initializeGame proc
mov esi, offset stack1
shl eax, 1
mov stacksize, eax
startinit:
add esi, 4
mov [esi], eax
cmp eax, 0
je endinit
sub eax, 2
jmp startinit
endinit:
ret

initializeGame endp

checkWin proc
mov ebx, stacksize
mov ebp, offset stack3
add ebp,4
checkstart:
mov eax, [ebp]
cmp eax, ebx
jne checkfails
sub ebx, 2
add ebp, 4
cmp ebx, 0
je win
jmp checkstart
checkend:
checkfails:
ret

win:
call clrscr
mov edx, offset youwin
call writestring
Exit
ret

checkWin endp

printstack proc
mov bl, dl

add esi, 4
mov ecx, [esi]
cmp ecx, 0
je empty


start:
mov eax, [esi]
shr eax,1
mov bl,al
sub dl,al
call Gotoxy

mov ecx, [esi]
mov  eax,ecx
call SetTextColor   
displaytile:
mov eax, 219
call writechar
loop displaytile

add dl, bl
call Gotoxy


add esi,4
dec dh

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
mov edx,offset towerofhanoi
call writestring
call readint
call initializeGame
call clrscr
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
