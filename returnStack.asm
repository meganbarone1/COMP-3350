
; Prompts user for input value 6 times
; Stores input values in a stack and returns them 
.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
PromptUser BYTE "Please enter a value: ", 0


.code		
main PROC	



mov ecx, 6
L1: 
	mov edx, OFFSET PromptUser
	call WriteString
	call Crlf
	call ReadInt
	push eax
	LOOP L1

mov ecx, 6
L2:
	pop eax
	call WriteInt
	LOOP L2
	
exit
main ENDP
END main




