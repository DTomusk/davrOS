org 0x7c00	; origin, bios assumes this is where the bootloader resides 
bits 16	; 16 bit mode 
start: 
	jmp boot

msg 	db "Welcome to davrOS", 0ah, 0dh, 0h	; a newline, d carriage return, 0 null terminated 

boot: 
	cli	; resets interrupt flag to zero 
	cld	; resets direction flag to zero 
	
	mov 	ax, 0x50
	
	mov 	es, ax
	xor 	bx, bx
	
	mov 	al, 2
	mov 	ch, 0
	mov 	cl, 2
	mov	dh, 0
	mov 	dl, 0
	
	mov	ah, 0x02
	int	0x13
	jmp 	0x50:0x0
	
	hlt	; halt flag
	
times 510 - ($-$$) db 0	; 510 0 bytes to make file 512 bytes long (one sector)
dw 	0xAA55			; boot signature 
