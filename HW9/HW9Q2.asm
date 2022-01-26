; Program that subtracts 2 BCD numbers
; Jack Cwynar

include Irvine32.inc

.data
	firstNum byte "The first packed BCD number: ",0
	secondNum byte "The second packed BCD number: ",0
	resultmsg byte "The result of subtraction is ",0
	packed1 SDWORD 34567823h
	packed2 SDWORD 12345611h
	result SDWORD ?
.code
main PROC
	mov result, 0
	mov esi, 0

	mov edx, OFFSET firstNum
	call WriteString
	mov eax, packed1
	call WriteHex
	call crlf
	mov eax, 0
	mov edx, OFFSET secondNum
	call WriteString
	mov eax, packed2
	call WriteHex
	call crlf
	
	mov al, BYTE PTR packed1[esi]
	sub al, BYTE PTR packed2[esi]
	das
	mov BYTE PTR result[esi], al

	inc esi
	mov al, BYTE PTR packed1[esi]
	sub al, BYTE PTR packed2[esi]
	das
	mov BYTE PTR result[esi], al

	inc esi
	mov al, BYTE PTR packed1[esi]
	sub al, BYTE PTR packed2[esi]
	das
	mov BYTE PTR result[esi], al

	inc esi
	mov al, BYTE PTR packed1[esi]
	sbb al, BYTE PTR packed2[esi]
	das
	mov BYTE PTR result[esi], al

	inc esi
	mov al, 0
	mov bl, 0
	mov BYTE PTR result[esi], al

	mov edx, OFFSET resultmsg
	call WriteString
	mov eax, result
	call WriteHex
	call crlf
	exit
main ENDP
END main