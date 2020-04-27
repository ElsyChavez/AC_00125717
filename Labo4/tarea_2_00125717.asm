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
        
        ;linea final
        int 20h
