org 0x7c00	; origin, bios assumes this is where the bootloader resides 
bits 16	; 16 bit mode 
start: 
	jmp boot

msg 	db "Welcome to davrOS", 0ah, 0dh, 0h	; a: newline, d: carriage return, 0 null terminated 

boot: 
	cli	; resets interrupt flag to zero 
	cld	; resets direction flag to zero 
	hlt	; halt flag 
	
times 510 - ($-$$) db 0	; 510 0 bytes to make file 512 bytes long (one sector)
dw 	0xAA55			; boot signature 
