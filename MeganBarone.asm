; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
message BYTE "Megan Barone",0

.CODE 
main PROC 
mov edx, offset message 
Call WriteString 
exit 
main ENDP 
END main


