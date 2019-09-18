; searches for sequence of characters "rl" in a string

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data

string BYTE "Megan", 0
search BYTE "Search for characters rl ", 0
found BYTE "Found", 0
notFound BYTE "Not Found", 0

.code
main PROC

	mov edx, OFFSET string
	call WriteString
	call Crlf
	mov edx, OFFSET search
	call WriteString
	call Crlf 

	mov eax, 0
	mov edi, OFFSET string
	mov ah, 'r'
	mov al, 'l'
	mov ecx, LENGTHOF string
	cld
	repne scasb
	jnz fail
	dec edi
	mov edx, OFFSET found
	call WriteString
	call Crlf
	jmp quit

fail:
	mov edx, OFFSET notFound
	call WriteString
	call Crlf
quit:
	exit		
main ENDP

END main




