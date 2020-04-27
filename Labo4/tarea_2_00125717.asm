;Ejercicio 1

        org 100h;

        ;Carnet = 00125717, digitos a ocupar 25717
        ; (2+5+7+1+7)/5 = 22/5 = 4.4
        ;Mensaje: me recupero :,v

        mov ax, 0000h
        add ax, 2d
        add ax, 5d
        add ax, 7d
        add ax, 1d
        add ax, 7d
        mov cl, 5d
        div cl

        mov cl, "M"
        mov [200h], cl
        mov cl, "E"
        mov [201h], cl

        mov cl, "R"
        mov [203h], cl
        mov cl, "E"
        mov [204h], cl
        mov cl, "C"
        mov [205h], cl
        mov cl, "U"
        mov [206h], cl
        mov cl, "P"
        mov [207h], cl
        mov cl, "E"
        mov [208h], cl
        mov cl, "R"
        mov [209h], cl
        mov cl, "O"
        mov [20Ah], cl

;Ejercicio 2

        mov ax, 0000h
        mov al, 2d
        mov bx, 210h 
        mov cx, 2d

esti:   mul cx
        mov [bx], ax
        cmp ah, 00h 
        ja segundo
        je primero

segundo:        add bx, 2h 
                jmp n

primero:        add bx, 1h 

n:              cmp bx, 21Fh
                jb esti

;Ejercicio 3

        mov ax, 0000h
        mov ax, 0d
        mov [220h], ax
        mov ax, 1d
        mov [221h], ax
        mov bx, 222h

fiboF:  mov ax, 0000h
        mov [bx], ax
        sub bx, 2h 
        mov al, [bx]
        add bx, 1h 
        add ax, [bx]
        add bx, 1h 
        mov [bx], ax
        add bx, 1h
        cmp bx, 22Fh
        jb fiboF
        
        ;linea final
        int 20h
