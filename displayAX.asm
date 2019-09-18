; displays contents of ax on the screen

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data
buffer BYTE 16 DUP(0), 0


.code
main PROC
	mov ecx,16
	mov esi,OFFSET buffer
L1:	shl ax,1
	mov BYTE PTR [esi],'0'
	jnc L2
	mov BYTE PTR [esi],'1'
L2:	inc esi
	loop L1
mov edx, OFFSET buffer
call WriteString





exit
main ENDP
END main




