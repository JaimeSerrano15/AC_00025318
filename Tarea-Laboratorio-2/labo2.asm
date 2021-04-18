        ; Tarea Laboratorio #2 - AC Ciclo01/2021 - Jaime Orlando Serrano Rivas 00025318
        org     100h
        section .text

        ; Escribiendo iniciales de nombre "Jaime Orlando Serrano Rivas"
        mov     byte [200h], "J"
        mov     byte [201h], "O"
        mov     byte [202h], "S"
        mov     byte [203h], "R"

        ; Direccionamiento Directo para AX
        mov     AL, [200h]

        ; Direccionamiento indirecto por registro para CX
        mov     BX, 201h
        mov     CL, [BX]

        ; Dirreccionamiento indirecto base más indice para DX
        mov     SI, 0001h
        mov     DL, [BX+SI]

        ; Direccionamiento relativo por registro para DI
        mov     DI, [SI+202h]

        int     20h