	org 100h

section .text

	call texto	
	call cursor 

    mov ah, 5d
    mov [200h], ah
    mov ah, 15d
    mov [210h], ah

	call phrase

    mov ah, 11d
    mov [200h], ah
    mov ah, 39d
    mov [210h], ah

	call phrase1

    mov ah, 17d
    mov [200h], ah
    mov ah, 20d
    mov [210h], ah

	call phrase2
	call kbwait

	int 20h

texto:	mov ah, 00h
	    mov	al, 03h
	    int 10h
	    ret

cursor: mov	ah, 01h
	    mov ch, 00000000b
	    mov cl, 00001110b
		;   IRGB
	    int 10h
	    ret

w_char:	mov ah, 09h
	    mov al, cl
	    mov bh, 0h
	    mov bl, 00001111b
	    mov cx, 1h
	    int 10h
	    ret

kbwait: mov ax, 0000h
	    int 16h
	    ret

m_cursr: mov ah, 02h
	     mov dx, di  ; columna
	     add dl, [210h]
	     mov dh, [200h] ; fila
	     mov bh, 0h
	     int 10h
	     ret

phrase:	mov di, 0d
lupi:	mov cl, [msg+di]
	    call m_cursr
	    call w_char
	    inc	di
	    cmp di, len
	    jb	lupi
	    ret

phrase1: mov di, 0d
lupi1:	mov cl, [msg1+di]
	    call m_cursr
	    call w_char
	    inc	di
	    cmp di, len1
	    jb	lupi1
	    ret

phrase2: mov di, 0d
lupi2:	mov cl, [msg2+di]
	    call m_cursr
	    call w_char
	    inc	di
	    cmp di, len2
	    jb	lupi2
	    ret

section .data
msg	db "Just be empty"
len equ	$-msg

msg1 db "So finally one day"
len1 equ $-msg1

msg2 db "You can be happy"
len2 equ $-msg2