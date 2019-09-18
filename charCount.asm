; computes and prints number of characters in myString

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc


.data

myString BYTE "Hello World", 0



.code
main proc
INVOKE Str_length, ADDR myString
call WriteInt
main endp



end main




