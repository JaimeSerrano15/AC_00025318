; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 4
;Otra solución que logré desarrollar para la tarea de laboratorio
;MAIN
        org     100h

        section .text

        MOV     BL,ctd  ; Divisor general
        call    StoreEven
        call    StoreOdd

        int     20h

        section .data
arrNum  db      01,02,03,04,05,06,07,08,09,12,0xA       ; Arreglo de 10 números
ctd     equ     2       ; Divisor general
zero    equ     0       ; Constante cero

;FUNCIONES
;Función (Interrupción) para guardar los pares
StoreEven:
        XOR     SI,SI
        XOR     DI,DI
        XOR     AX,AX
whileEven:
        mov     AL,[arrNum+SI]
        cmp     AL, 0xA
        je      endEven
        mov     DL,AL
        div     BL
        cmp     AH,zero
        je      even
        INC     SI
        jmp     whileEven
endEven:
        ret
even:
        mov     [300h+DI],DL
        inc     DI
        inc     SI
        jmp     whileEven

;Función (interrupción) para guardar los impares
StoreOdd:
        XOR     SI,SI
        XOR     DI,DI
        XOR     AX,AX
whileOdd:
        mov     AL,[arrNum+SI]
        cmp     AL, 0xA
        je      endOdd
        mov     DL,AL
        div     BL
        cmp     AH,zero
        je      back
        jmp     odd
endOdd:
        ret
back:
        INC SI
        jmp whileOdd
odd:
        mov     [320h+DI],DL
        inc     DI
        inc     SI
        jmp     whileOdd

