TITLE Arrays and Stacks

INCLUDE Irvine32.inc

.data
	PromptUser BYTE "Please enter a value: ",0
	Array1 SWORD 5 DUP (?)

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 5
	mov edx, OFFSET PromptUser
	call crlf

L1:
	call WriteString
	call ReadInt
	push eax
	add ebx, 2
	loop L1

	mov ebx, 0
	mov ecx, 5

L2:
	pop eax
	call WriteInt
	call crlf
	add ebx, 2
	loop L2

	exit
main ENDP
END main

