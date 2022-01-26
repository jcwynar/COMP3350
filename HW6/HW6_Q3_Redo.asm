TITLE	Search Procedure

INCLUDE Irvine32.inc

.data
	prompt BYTE "Please input a value: ",0
	spacing BYTE ", ",0;
	String1 BYTE "The target value is ",0
	String2 BYTE ", and is located at index: ",0
	Array1 SWORD 1,2,3,4,5,6
	TargetValue DWORD ?

.code
main PROC
	mov edx, OFFSET prompt
	call crlf
	call WriteString
	call ReadInt
	mov [TargetValue], eax

	; Add values to stack
	mov ecx, LENGTHOF Array1
	mov esi, 0
L1:
	movsx eax, Array1[esi]
	push eax
	add esi, 2
	loop L1

	call Search
	call crlf
	mov edx, OFFSET String1
	call WriteString
	mov eax, [TargetValue]
	call WriteInt
	mov edx, OFFSET String2
	call WriteString
	mov eax, esi
	call WriteInt
	call crlf

	exit
main ENDP

Search PROC
	pop edi
	mov ecx, LENGTHOF Array1
	mov esi, 0

L2:
	pop eax
	.if eax == [TargetValue]
		mov edx, ecx
		sub edx, 1
		mov esi, edx
	.endif
	loop L2

	push edi
	ret
Search ENDP
END main