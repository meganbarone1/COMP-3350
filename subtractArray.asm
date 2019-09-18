

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
Array1 WORD 3, 6, 9, 12, 15, 18, 21, 24, 27, 30 
Array2 WORD 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
Array3 WORD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
Array1Str BYTE "Array 1: ", 0
Array2Str BYTE "Array 2: ", 0
Array3Str BYTE "Array 3: ", 0
Space BYTE ", ",

.code		
main PROC	

mov ecx, 10
L1: 
	mov esi, 10
	sub esi, ecx
	imul esi, 2
	mov bx, [Array1 + esi]
	sub bx, [Array2 + esi]
	mov Array3[esi], bx
	sub ecx, 1
	LOOP L1
mov ecx, 10
mov esi, 10
mov edx, OFFSET Array1Str
call WriteString
mov edx, OFFSET Space
L2: 
	mov esi, 10
	sub esi, ecx
	imul esi, 2
	mov ax, Array1[esi]
	movzx eax, ax
	call WriteInt
	call WriteString
	LOOP L2
call Crlf
mov ecx, 10
mov esi, 10
mov edx, OFFSET Array2Str
call WriteString
mov edx, OFFSET Space
L3: 
	mov esi, 10
	sub esi, ecx
	imul esi, 2
	mov ax, Array2[esi]
	movzx eax, ax
	call WriteInt
	call WriteString
	LOOP L3
call Crlf
mov ecx, 10
mov esi, 10
mov edx, OFFSET Array3Str
call WriteString
mov edx, OFFSET Space
L4: 
	mov esi, 10
	sub esi, ecx
	imul esi, 2
	mov ax, Array3[esi]
	movzx eax, ax
	call WriteInt
	call WriteString
	LOOP L4
	call Crlf

	


exit
main ENDP
END main




