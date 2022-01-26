; Program to get input from two sensors and prints certain messages accordingly
; Jack Cwynar

include Irvine32.inc

.data
	agreeMsg BYTE "Agree",0
	disagreeMsg BYTE "Disagree",0
	actionMsg BYTE "Take Action",0
	;testData BYTE 0,0, 20,20, 70,-70, 50,50, 40,-40, 30,40, 60,50
	;testData BYTE 2,2, 10,-10, 40,50, 60,-60, 40,30, 20,20, 65,65
	testData BYTE 14,45, 52,61, 12,43, 17,64, 1,65, 70,70
	testMsg BYTE "Test Number: ",0
	sensor1 BYTE "Sensor 1: ",0
	space BYTE ", ",0
	sensor2 BYTE "Sensor 2: ",0

.code
main PROC
	mov ecx, LENGTHOF testData / 2
	mov esi, 0
	mov edi, 1
L1:
	mov edx, OFFSET testMsg
	call WriteString
	mov eax, edi
	call WriteDec
	call crlf
	mov edx, OFFSET sensor1
	call WriteString
	movsx eax, testData[esi]
	call WriteInt
	mov edx, OFFSET space
	call WriteString
	mov edx, OFFSET sensor2
	call WriteString
	movsx eax, testData[esi + 1]
	call WriteInt
	call crlf
	movsx eax, testData[esi]
	movsx ebx, testData[esi + 1]
	call sensor
	call crlf
	call crlf
	add esi, 2
	inc edi

	loop L1
	exit
main ENDP

sensor proc uses edx
	mov edx, eax
	sub edx, ebx

	cmp edx, 4
	jbe agree
	cmp edx, -4
	jb disagree

	agree:
		mov edx, offset agreeMsg
		call WriteString

		cmp eax, 49
		jl return
		cmp ebx, 49
		jl return

		action:
			call crlf
			mov edx, OFFSET actionMsg
			call WriteString
			jmp return

	disagree:
		mov edx, OFFSET disagreeMsg
		call WriteString

	return:
	ret
sensor ENDP
END main
