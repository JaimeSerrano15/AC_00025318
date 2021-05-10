; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 2 - Ejercicio 01 
        org 100h

        section .text
                ; Limpiamos los registros que utilizaremos
                XOR DI, DI
                XOR AX, AX
                MOV word CX, 8d ; Establecemos el valor inicial del Registro CX que servirá como contador del Loop
                JMP iterar
        
        iterar:
                MOV byte BL, [crn+DI] ; Vamos recorriendo cada caracter de la cadena de texto que contiene el número de carnet
                SUB BL, 48 ; Utilizando las equivalencias de la tabla ASCII, se transforma el caracter a su equivalencia en número entero
                ADD AL, BL ; El Registro AL sirve como acumulador de la suma de dígitos
                INC DI  ; Incrementamos el registro de índice para seguir avanzando en la cadena del carnet
                LOOP iterar ; Realizamos la iteración hasta que el contador llegue a cero (CX)
                
                MOV BL, 8d
                DIV BL  ; Realizamos la división de la suma de dígitos entre la cantidad de dígitos
                MOV [20ah], AL ; Guardamos el resultado en el espacio de memoria 20Ah
        exit:
                int 20h

        section .data
        crn DB "00025318" ; Variable "string" que contiene el número de carnet