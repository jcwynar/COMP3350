; Program that computes the value of an arithmetic expression
; Jack Cwynar

include Irvine32.inc

.data
	welcome BYTE "Computing the value of the expression X = A - B + C.",0
	promptA BYTE "Enter a value for A: ",0
	promptB BYTE "Enter a value for B: ",0
	promptC BYTE "Enter a value for C: ",0
	variableA SDWORD ?
	variableB SDWORD ?
	variableC SDWORD ?
	valueX BYTE "The value of X is ",0
.code
main PROC
	mov edx, OFFSET welcome
	call WriteString
	call crlf
	mov edx, OFFSET promptA
	call writeString
	call ReadInt
	push eax
	mov edx, OFFSET promptB
	call WriteString
	call ReadInt
	push eax
	mov edx, OFFSET promptC
	call WriteString
	call ReadInt
	push eax
	mov ebx, 10
	call arithmetic
	mov eax, [edi]
	mov edx, OFFSET valueX
	call WriteString
	call WriteInt
	call crlf
	exit
main ENDP

arithmetic PROC
	pop ebx
	pop edx
	pop eax
	add eax, edx
	pop edx
	sub edx, eax
	push eax
	mov edi, esp
	push ebx
	ret
arithmetic ENDP

END main
