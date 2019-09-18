; Prompts user for input values 6 times
; Returns value closest to zero, and its index

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
prompt BYTE "Please input a value: ",0
spacing BYTE ", ",0 
String1	BYTE "The target value is ",0
String2	BYTE ", and is located at index: ",0
closest DWORD 0ffffffffh 
index DWORD -1

.code
findMinor PROC
mov ecx, 6
L1:
	mov edx, OFFSET prompt
	call WriteString
	call Crlf
	call ReadInt
	push eax
	LOOP L1


pop eax
mov closest, eax
mov index, 6 
mov ecx, 5
L2:
	pop eax
	mov ebx, closest
	
	
	call negate
	

	mov edx, eax 
	
	call negate2
	

	cmp eax, ebx
	jl LessThan
	loop L2
	jmp print

LessThan:
	mov closest, eax
	mov index, ecx
	loop L2
	
print:
	mov edx, OFFSET String1
	call WriteString
	mov eax, closest
	call WriteInt
	mov edx, OFFSET String2
	call WriteString
	dec index
	mov eax, index
	call WriteInt
	ret



findMinor ENDP

negate PROC
	cmp ebx, 0
	js L3
	ret
	L3:
		neg ebx
		ret
negate ENDP

negate2 PROC
	
	cmp edx, 0
	js L4
	ret
	L4:
		neg edx
		ret
negate2 ENDP

main PROC
call findMinor

exit
main ENDP
END main




