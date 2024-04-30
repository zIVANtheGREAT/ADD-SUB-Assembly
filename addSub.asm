; Using Visual Studios Assembly language.
; Refer to https://www.youtube.com/watch?v=NoLal5jNLBU&t=91s
; Beginning Assembly: This code goes over addition
; and subtraction, increment and decrement
; between immediate values, registers and memory.

.DATA
MyData DWORD 30		;DWORD specifies 32 bits
					; MyData is a variable of 32 bits with the value 30


.CODE

main PROC
	mov rax, 0		; Clears register rax

;	Add/Sub <register>, <immediate values>

	add rax, 3
	add rax, 8
	sub rax, 3
	sub rax, 2

;	Add/Sub <register>, <register>

	mov rax, 7		; Populates rax register with immediate value 7
	mov rbx, 3		; Populates rbx register with immediate value 3
	add rax, rbx	; Adds rbx (3) to rax (7): 3 + 7 = A
	sub rax, rbx	; Subs rbx (3) from rax (A): A - 3 = 7

;	Add/Sub <register>, <memory>
;	Add/Sub <memory>, <register>

	add eax, MyData	; eax is a 32 bit register. 
	sub MyData, 2

;	Overflow/ underflow-------------

	mov al, 255
	add al, 1		;carry flag is set.

	mov al, 255
	add ax, 1

	mov ax, 2
	sub al, 1
	sub al, 1
	sub al, 1		; Underflow, carry flag set

	mov al, 0
	sub ax, 1

;	inc / dec

	mov rax, 7
	inc rax
	inc rax
	dec rax
	dec rax

;	inc <memory>
;	dec <memory>

	inc MyData
	dec MyData

;	Overflow is not detected with inc and dec

	mov al, 252
	add al, 1
	inc al
	inc al
	inc al		; no carry flag set, add would have set the flag
	dec al		; no carry flag set, sub would ahve set the flag

	mov eax, 0
	ret
main ENDP


END
