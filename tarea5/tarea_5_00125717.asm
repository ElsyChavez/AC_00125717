org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 106d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_h

    mov	si, 106d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_v

	mov 	si, 106d ; X -> Columna
	mov 	di, 155d ; Y -> Fila
	call 	linea_h

    mov	si, 126d ; X -> Columna
	mov 	di, 65d ; Y -> Fila
	call 	linea_v2

    mov	si, 126d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	call 	linea_v3

    mov 	si, 126d ; X -> Columna
	mov 	di, 65d ; Y -> Fila
	call 	linea_h

    mov 	si, 126d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea_h

    mov 	si, 126d ; X -> Columna
	mov 	di, 110d ; Y -> Fila
	call 	linea_h

    mov 	si, 126d ; X -> Columna
	mov 	di, 135d ; Y -> Fila
	call 	linea_h

    mov	si, 166d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_v4

    mov	si, 166d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
	call 	linea_v5

    mov	si, 166d ; X -> Columna
	mov 	di, 135d ; Y -> Fila
	call 	linea_v6

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 166d
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 155d
	jne 	lupi_v
	ret

linea_v2:
lupi_v2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 90d
	jne 	lupi_v2
	ret

linea_v3:
lupi_v3:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 135d
	jne 	lupi_v3
	ret

linea_v4:
lupi_v4:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 65d
	jne 	lupi_v4
	ret

linea_v5:
lupi_v5:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 110d
	jne 	lupi_v5
	ret

linea_v6:
lupi_v6:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 155d
	jne 	lupi_v6
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data