; Program that multiplies EBX by the value 11 using binary multiplication
; Jack Cwynar

include Irvine32.inc

.data
	mulPrompt BYTE "Please enter an integer to be mutliplied by 11: ",0
	mulResult BYTE "Your result is: ",0
	movDec BYTE "In progress: moving the first and last two numeric components of A1BC23D4 into DH and DL, respectively.",0
	dhValuePrompt BYTE "DH: ",0
	dlValuePrompt BYTE "DL: ",0
	dhValue WORD ?
	dlValue WORD ?

.code
main PROC
	mov edx, OFFSET mulPrompt
	call WriteString
	call ReadInt
	call binMul
	mov edx, OFFSET mulResult
	call WriteString
	call WriteInt
	call crlf
	call crlf
	
	mov edx, OFFSET movDec
	call WriteString
	call crlf
	mov eax, 0A1BC23D4h ; eax = 1010 0001 1011 1100 0010 0011 1101 0100
	mov edx, 0
	; NEED = 00100010
	and al, 00001111b	; eax = 1010 0001 1011 1100 0010 0011 0000 0100
	and ah, 11110000b	; eax = 1010 0001 1011 1100 0010 0000 0000 0100
	ror al, 3			; eax = 1010 0001 1011 1100 0010 0000 1000 0000
	ror al, 3			; eax = 1010 0001 1011 1100 0010 0000 0001 0000
	ror ah, 5			; eax = 1010 0001 1011 1100 0000 0001 0001 0000
	ror ax, 3			; eax = 1010 0001 1011 1100 0000 0000 0010 0010
	mov dlValue, ax		; dlValue = 34

	; NEED = 00001100
	and al, 00000000b	; clear ax
	shr eax, 16			; eax = 0000 0000 0000 0000 1010 0001 1011 1100
	and ah, 00000000b	; eax = 0000 0000 0000 0000 0000 0000 1011 1100
	and al, 00001111b	; eax = 0000 0000 0000 0000 0000 0000 0000 1100
	mov dhValue, ax		; dhValue = 12

	mov edx, OFFSET dhValuePrompt
	call WriteString
	movzx eax, dhvalue
	call WriteInt
	call crlf
	mov edx, OFFSET dlValuePrompt
	call WriteString
	movzx eax, dlvalue
	call WriteInt
	call crlf
	
	exit
main ENDP

binMul PROC uses ebx ecx edx
	mov ebx, 11d
	mov edx, eax
	mov ecx, 32
	mov eax, 0
L1:
	shr edx, 1
	jnc L2
	add eax, ebx
L2:
	shl ebx, 1
	loop L1
	ret
binMul ENDP

END main