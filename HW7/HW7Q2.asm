; Program to encode a string using XOR
; Jack Cwynar

include Irvine32.inc

.data
	stringName BYTE "Jack Cwynar",0
	key = 89h
	startMessage BYTE "The string that will be encoded is: ",0
	encoded BYTE "The encoded string is: ",0
	decoded BYTE "The decoded string is: ",0

.code
main PROC
	mov edx, offset startMessage
	call WriteString
	mov edx, OFFSET stringName
	call WriteString
	call crlf

	mov ecx, LENGTHOF stringName - 1
	mov esi, 0
L1:
	xor stringName[esi], key
	inc esi
	loop L1

	mov edx, OFFSET encoded
	call WriteString
	mov edx, OFFSET stringName
	call WriteString
	call crlf

	mov ecx, LENGTHOF stringName - 1
	mov esi, 0
L2:
	xor stringName[esi], key
	inc esi
	loop L2

	mov edx, OFFSET decoded
	call WriteString
	mov edx, OFFSET stringName
	call WriteString
	call crlf
	exit
main ENDP

END main
