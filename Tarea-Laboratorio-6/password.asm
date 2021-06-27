; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 06
org 100h

        section .text

        ; Mostramos el mensaje inicial solicitando la clave
        mov     DX,msg1
        call    writeString

        ; Ingresamos la clave
        mov     BP,input
        call    readString

        ; Comparamos la clave con la clave guardada
        call comparePassword

        ; Escribir el resultado de la comparación
        call writeString

        int     20h

; Definimos todas las variable a utilizar
        section .data
password        DB      "jaiser"
msg1            DB      "Ingrese la clave: ", "$"
msgAccess       DB      "BIENVENIDO", "$"
msgError        DB      "INCORRECTO", "$"
input           times   20      DB      " "

; Función que permite leer un carácter, logrando observar lo que se escribe.
waitKey:
        mov     AH,01h
        int     21h
        ret

; Función que permite leer una cadena de texto desde el teclado.
readString:
        XOR     SI,SI
while:
        call    waitKey
        cmp     AL,0x0D
        je      exit
        mov     [BP+SI],AL
        inc     SI
        jmp     while
exit:
        mov     byte [BP+SI], "$"
        ret

; Función que permite escribir una cadena de texto en la salida estandar.
writeString:
        mov     AH,09h
        int     21h
        ret

; Función que se encarga de comparar la clave ingresada con la clave guardada.
comparePassword:
        mov     AL,[password]
        mov     AH,[input]
        cmp     AL,AH
        je      correct
        jne     incorrect
        ret
correct:
        mov     DX,msgAccess
        ret
incorrect:
        mov     DX,msgError
        ret