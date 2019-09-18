; extracts decimal digits from eax using logical shifts and prints new value


.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data




.code
main PROC
mov edx, 0
mov eax, 01234ABCDh


mov dl, al
shr eax, 8
add dh, al
shr eax, 22
mov eax, edx
call WriteHex




exit
main ENDP
END main




