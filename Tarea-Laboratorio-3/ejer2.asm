; Jaime Orlando Serrano Rivas 00025318 - Laboratorio 2 - Ejercicio 02     
        org 100h

        section .text
            ; Limpiamos los registros que utilizaremos
            XOR AX, AX
            MOV word CX, 4d ; Preparamos nuestro contador para el Loop, dependiendo del factorial a encontrar

            MOV AL, 5d  ; Le asignamos al registro AL con el valor del cual queremos conocer su factorial
            CMP CL, 0d  ; Realizamos la comparación inicial si el contador es igual a cero
            JZ  factorial   ; Bandera que indica si es posible iniciar la iteración
        
        factorial:
            MUL CL  ; Comienza las iteraciones con las multiplicaciones para encontrar el factorial
            LOOP factorial

            MOV [20bh], AL ; Guardamos el resultado en el espacio de memoria 20Bh
        
        exit:
            int 20h