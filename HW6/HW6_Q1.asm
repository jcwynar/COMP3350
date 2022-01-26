TITLE	DisplayTiger

INCLUDE Irvine32.inc

.data
	UserPrompt BYTE "Please enter an integer from 0 to 2: ",0
	TigerString BYTE "War Eagle",0

.code
main PROC
	mov eax, -1
	mov edx, OFFSET UserPrompt
	.while eax < 0 || eax > 2
		call WriteString
		call ReadInt
	.endw

	mov bx, ax
	call crlf
	call DisplayTiger
	call crlf
	exit
main ENDP

DisplayTiger PROC uses eax edx
	.if bx == 0
		mov eax, blue
	.elseif bx == 1
		mov eax, lightred
	.else
		mov eax, white + (black*16)
	.endif
	call SetTextColor
	mov edx, OFFSET TigerString
	call WriteString

	mov eax, white + (black*16)
	call SetTextColor
	ret
DisplayTiger ENDP
END main