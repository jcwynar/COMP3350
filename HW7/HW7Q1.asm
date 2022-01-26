; Program to search alphanumeric array for first alphabet
; Jack Cwynar

include Irvine32.inc

.data
	;testArray DWORD 'A', 'B', 'C', 'D', 'E'
	;testArray DWORD '1', '2', '3', '4', '5'
	testArray DWORD '7', '6', '4', 'G', 'W', '9'
	;testArray DWORD '2', '5', '6', 'S', '3', 'D'
	startMessage BYTE "The array to be scanned is: ",0
	spacing BYTE " ",0
	notFound BYTE "No alphabet found.",0
	found BYTE "Alphabet found with value ",0
	valueInfo BYTE " at an index of ",0

.code
main PROC
	mov edx, OFFSET startMessage
	call WriteString
	mov edx, OFFSET spacing
	mov esi, 0
	mov ecx, LENGTHOF testArray
printArray:
	mov eax, testArray[esi*4]
	call WriteString
	call WriteChar
	inc esi
	loop printArray
	call crlf

	mov eax, 0
	mov esi, 0
	mov ecx, LENGTHOF testArray
findAlphabet:
	mov eax, testArray[esi*4]
	cmp eax, 41h
	jge alphabetFound

	inc esi
	loop findAlphabet

	mov edx, OFFSET notFound
	call WriteString
	call crlf
	exit

alphabetFound:
	mov edx, OFFSET found
	call WriteString
	call WriteChar
	push eax
	mov eax, esi
	mov edx, OFFSET valueInfo
	call WriteString
	call WriteInt
	call crlf
	exit

main ENDP

END main

