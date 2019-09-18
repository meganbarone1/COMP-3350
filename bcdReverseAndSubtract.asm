; uses shifts to reverse myAuburnID (a BCD) and stores it, prints both
; subtracts the reverse ID from the original and returns it

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data
count = 5
myAuburnID BYTE 09h, 03h, 70h, 57h, 05h
myAuburnIDRev BYTE count DUP(?)
result BYTE count DUP(?)


.code
main proc
	push OFFSET myAuburnID
	push count
	call writeArray

	push OFFSET myAuburnID
	push OFFSET myAuburnIDRev
	push count
	call reverse

	call crlf
	push OFFSET myAuburnIDRev
	push count
	call writeArray

	mov ebx, OFFSET result
	mov esi, OFFSET myAuburnID
	mov edi, OFFSET myAuburnIDRev
	mov ecx, count
	call ExtendedSub

	call crlf
	push OFFSET result
	push count
	call writeArray

	invoke ExitProcess,0
main endp

writeArray PROC
	push ebp
	mov ebp, esp
	mov esi, [ebp+12]
	mov ecx, count 
	mov ebx, TYPE BYTE
L1: 
	movzx eax, BYTE PTR [esi]
	call writehexb
	call crlf
	inc esi
	loop L1

	pop ebp
	
	ret 8
writeArray ENDP

reverse PROC
	push ebp
	mov ebp, esp
	mov edx, [ebp + 16] ; Array to feed 
	mov esi, [ebp + 12] ; Array to fill
	mov ecx, [ebp + 8]
	mov ebx, 0
	add edx, 4

L1: 
	movzx ax, BYTE PTR [edx]
	rol al, 4
	shld bx, ax, 16
	mov [esi], BYTE PTR bl
	inc esi
	dec edx
	loop L1

	pop ebp

	ret 8
reverse ENDP 

ExtendedSub PROC
	pushad
	clc 

L1: mov al,[esi] 
	sbb al,[edi] 
	das

	pushfd 

	mov [ebx],al 
	add esi,1 
	add edi,1
	add ebx,1
	popfd 

	loop L1 

	mov byte ptr [ebx],0 
	sbb byte ptr [ebx],0 
	popad
	ret
ExtendedSub ENDP

end main




