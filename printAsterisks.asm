
; Prints 5 rows containing 5 asterisks each
.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
PromptUser BYTE "Please enter a value: ", 0


.code		
main PROC	





mov ecx, 5
L1: 
	push ecx
	mov ecx, 5
	jmp L2
	ret

	L2:	
	mov al, 2ah
	call WriteChar
	LOOP L2
	pop ecx
	call Crlf
	LOOP L1

 

exit
main ENDP
END main




