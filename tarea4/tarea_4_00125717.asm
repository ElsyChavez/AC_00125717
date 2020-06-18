    org 100h

section .text

	mov dx, msg1
	call w_strng
    xor si, si

lupi: call kb
	  cmp al, "$"
	  je prev
      sub al, 30h
	  mov [300h+si], al
	  inc si
	  jmp lupi

prev: mov bx, 0000h
      mov ax, 0000h

prom: add al, [300h+bx]
      inc bx
      cmp bx, 05h
      jb prom
      mov [310h], al
      mov [320h], bl
      mov cl, bl
      div cl
      mov [330h], al

mostrar: mov dx, nl     
	     call w_strng
	     cmp al, 0Ah
         je lect1
         cmp al, 09h
         je lect2
         cmp al, 08h
         je lect3
         cmp al, 07h
         je lect4
         cmp al, 06h
         je lect5
         cmp al, 05h
         je lect6
         cmp al, 04h
         je lect7
         cmp al, 03h
         je lect8
         cmp al, 02h
         je lect9
         cmp al, 01h
         je lect10

lect1: mov dx, msg2
       jmp ending
lect2: mov dx, msg3
       jmp ending
lect3: mov dx, msg4
       jmp ending
lect4: mov dx, msg5
       jmp ending
lect5: mov dx, msg6
       jmp ending
lect6: mov dx, msg7
       jmp ending
lect7: mov dx, msg8
       jmp ending
lect8: mov dx, msg9
       jmp ending
lect9: mov dx, msg10
       jmp ending
lect10: mov dx, msg11
        jmp ending
	
ending: call w_strng
	    call kb
	    int 20h

texto: mov ah, 00h
	   mov al, 03h
	   int 10h
	   ret

kb: mov	ah, 1h 
	int 21h
	ret

w_strng: mov ah, 09h
	     int 21h
	     ret

section .data

msg1 db "Ingrese los ultimos 5 digitos de su carnet: $"
msg2 db "Perfecto solo Dios$"
msg3 db "Siempre me esfuerzo$"
msg4 db "Colocho$"
msg5 db "Muy bien$"
msg6 db "Peor es nada$"
msg7 db "En el segundo$"
msg8 db "Me recupero$"
msg9 db "Hay salud$"
msg10 db "Aun se pasa$"
msg11 db "Solo necesito el 0$"

nl db 0xA, 0xD, "$"