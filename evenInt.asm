; scans array to find and return first even integer and its index
; prints "no even integer found" if array is all odds

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
arrayA DWORD 5, 3, 7, 9, 11 
arrayB DWORD 2, 4, 6, 8, 10
arrayC DWORD 1,3,6,9,8
arrayD DWORD 4,5,6,7,8
arrayE DWORD 1,5,3,7,12
value DWORD ?
index DWORD ?
success BYTE "even integer found", 0
failure BYTE "no even integer found", 0
number BYTE "first even integer: ", 0
indexStr BYTE "found at index: ", 0



.code
main PROC
mov esi, OFFSET arrayD
mov ecx, LENGTHOF arrayD
next:
mov edx, 0
mov eax, [esi]
mov value, eax
mov index, ecx
sub index, LENGTHOF arrayD
neg index
mov ebx, 2
div ebx
cmp edx, 0
je found
add esi, TYPE arrayD

loop next
sub esi, TYPE arrayD
notFound:
mov edx, OFFSET failure
call WriteString
jmp quit

found: 
mov edx, OFFSET success
call WriteString
call Crlf
mov edx, OFFSET number
call WriteString
mov eax, value
call WriteDec
call Crlf
mov edx, OFFSET indexStr
call WriteString
mov eax, index 
call WriteDec
jmp quit



quit:
exit
main ENDP
END main




