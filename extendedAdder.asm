; adds values Apple and Berry and stores them as Cherry

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data
Apple QWORD 1111222233334444h 
Berry QWORD 13572468ABCD0000h
Cherry QWORD ?
app BYTE "Apple: ", 0
ber BYTE "Berry: ",0
cher BYTE "Cherry: ", 0



.code
main PROC
mov eax, 0
mov ebx, 0
mov esi, 0
mov ecx, 4

L1:
	
	mov ax, word ptr Apple[si]
	mov bx, word ptr Berry[si]
	add ax, bx
	mov word ptr Cherry[si], ax
	add si, 2
	
	loop L1
mov edx, OFFSET app
call WriteString
mov ecx, 2
mov eax, 0
mov esi, 4
L2:
	
	mov eax, dword ptr Apple[esi]
	
	call WriteHex
	sub esi, 4
	loop L2
Call Crlf
mov edx, OFFSET ber
call WriteString
mov ecx, 2
mov eax, 0
mov esi, 4

L3:
	mov eax, dword ptr Berry[esi]
	call WriteHex
	sub si, 4
	loop L3
Call Crlf
mov edx, OFFSET cher
call WriteString
mov ecx, 2
mov eax, 0
mov esi, 4

L4:
	mov eax, dword ptr Cherry[esi]
	call WriteHex
	sub si, 4
	loop L4




exit
main ENDP
END main




