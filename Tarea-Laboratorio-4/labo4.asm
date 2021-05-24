; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 4
;MAIN
        org     100h

        section .text

        MOV     BL,ctd  ; Divisor general
        call    OddEven ; Se llama a la función principal

        int     20h

        section .data
arrNum  db      01,02,03,04,05,06,07,08,09,10,0xA       ; Arreglo de 10 números
ctd     equ     2       ; Divisor general
zero    equ     0       ; Constante cero

;FUNCIONES

;Funcion para determinar si es par e impar y guardar su valor
OddEven:
        XOR     SI,SI   ; SI = 0
        XOR     DI,DI   ; DI = 0
        XOR     AX,AX   ; AX = 0
while:
        mov     AL,[arrNum+SI]  ;Se guardan un elemento del arreglo en AL
        cmp     AL, 0xA         ;Se verifica que no se haya llegado al final del arreglo
        je      end             ;Si se llegó al final del arreglo termina la ejecucion
        mov     DL,AL           ;Se guarda el valor de AL en DL
        div     BL              ;Se hace la divison AX / BL
        cmp     AH,zero         ;Se compara si el residuo de la division es cero
        je      StoreEven       ;Si el residuo es cero, se guarda un par
        jmp     StoreOdd        ;Si el residuo no es cero, se guarda un impar
        jmp     end             
end:
        ret

;Guardar un Par
StoreEven:
        mov     [300h+DI],DL
        inc     DI
        inc     SI
        jmp     while

;Guardar un Impar
StoreOdd:
        mov     [320h+DI],DL
        inc     DI
        inc     SI
        jmp     while