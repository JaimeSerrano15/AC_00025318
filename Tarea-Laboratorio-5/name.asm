; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 05
org 100h

        section .text
        ; Se limpian los registros a utilizar
        xor     AX, AX
        xor     SI, SI
        xor     BX, BX
        XOR     CX, CX
        xor     DX, DX

        ; Se preparan los punteros
        MOV     SI, 0
        MOV     DI, 0d

        MOV     DH, 10 ; Fila inicial en la que se mostrará el cursor
        MOV     DL, 20 ; Columna Inicial en la que se mostrará el cursor

        call    modotexto ; Subrutina encargada de activar el modo texto

        iterar:
                call    escribir ; Primera llamada a la subrutina para escribir el Nombre
                MOV     byte [cant],7 ; Ahora la cantidad de iteraciones será 7
                MOV     DH,12   ; Se establace una nueva fila
                MOV     DL,20   ; Se establece la columna inicial
                XOR     DI,DI   ; Se limpia el puntero
                call    escribir ; Segunda llamada a la subrutina para escribir el Nombre
                MOV     byte [cant],7 ; Ahora la cantidad de iteraciones será 7
                MOV     DH,14 ; Se establace una nueva fila
                MOV     DL,20 ; Se establece la columna inicial
                XOR     DI,DI ; Se limpia el puntero
                call    escribir ; Tercera llamada a la subrutina para escribir el Nombre
                MOV     byte [cant],5 ; Ahora la cantidad de iteraciones será 5
                MOV     DH,16 ; Se establace una nueva fila
                MOV     DL,20 ; Se establece la columna inicial
                XOR     DI,DI ; Se limpia el puntero
                call    escribir ; Cuarta llamada a la subrutina para escribir el Nombre
                JMP     esperartecla ; Saltamos a la subrutina encargada de esperar a presionar una tecla
        
        escribir:
                call    movercursor ; Llamada a subrutina encargada de mover el cursor a donde se desee
                MOV     CL, [nombre+SI] ; Movimiento entre los caracteres de la cadena (nombre)
                call    escribircaracter ; Subrutina encargada de escribir el caracter correspondiente
                INC     SI ; Se incrementa en 1 para avanzar al siguiente caracter
                INC     DL ; Se incrementa en 1 para avanzan a la siguiente columna
                INC     DI ; Se incrementa en 1 para acercarse al total de iteraciones
                CMP     DI, [cant] ; Si DI es igual al número de iteraciones, se acaba de escribir esta palabra
                JB      escribir  ; Se repite con cada palabra
                RET

        modotexto: 
                MOV     AH, 0h ; Se activa el modo texto
                MOV     AL, 03h ; Se selecciona el modo gráfico deseado (25x80)
                INT     10h
                RET

        movercursor:
                MOV     AH, 02h ; Se colocan el cursor
                MOV     BH, 0h ; Pagina en la que se trabajará
                INT     10h
                RET

        escribircaracter:
                MOV     AH, 0Ah ; Se escribe el cursor en pantalla
                MOV     AL, CL ; Se especifica el caracter a escribir
                MOV     BH, 0h ; Se especifica el numero de página
                MOV     CX, 1h ; El caracter se escribirá solo una vez
                INT     10h
                RET

        esperartecla:
                MOV     AH, 00h ; Se espera hasta que el usuario presione una tecla
                INT     16h

        exit:
                int     20h



    section .data

    nombre      DB      'JaimeOrlandoSerranoRivas' ; Variable que contiene el nombre completo
    cant        DB       5 ; Variable que determina el numero de iteraciones
    