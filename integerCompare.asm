; ompares two integer values
; Prints "Agree." if they are within +/- 5 of each other, "Disagree." otherwise.
; If values are both greater than 45, additionally prints "Take action."
.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data
n DWORD 46
m DWORD 50

agreeMsg BYTE "Agree.", 0
disagreeMsg BYTE "Disagree.", 0
takeActionMsg BYTE "Take action.", 0

.code
main PROC
mov eax, n
mov ebx, m
sub ebx, eax
cmp ebx, 5
jle agree
jg disagree
agree: 
	mov edx, OFFSET agreeMsg
	call WriteString	
	mov eax, n
	sub eax, 45
	cmp eax, 0
	jg secondInt
	jmp quit
disagree: 
	mov edx, OFFSET disagreeMsg
	call WriteString
	jmp quit
secondInt:
	mov ebx, m
	sub ebx, 45
	cmp ebx, 0
	jg takeAction
takeAction:
	call Crlf
	mov edx, OFFSET takeActionMsg
	call WriteString
	
quit:	
	exit
	main ENDP
	END main




