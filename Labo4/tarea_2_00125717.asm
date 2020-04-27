;Ejercicio 1

        org 100h;

        ;Carnet = 00125717, digitos a ocupar 25717
        ; (2+5+7+1+7)/5 = 22/5 = 4.4

        mov ax, 0000h
        add ax, 2d
        add ax, 5d
        add ax, 7d
        add ax, 1d
        add ax, 7d
        mov cl, 5d
        div cl
        
        ;linea final
        int 20h
