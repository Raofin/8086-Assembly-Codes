; Put the sum of the first 50 terms of the arithmetic sequence
; I, 5, 9, 13, ... in DX. 

.MODEL SMALL 
.STACK 100H
.CODE
   MAIN PROC      
      MOV CX, 50        ; we need the first 50 terms.
                        ; so, the number of loop 50
      MOV AX, 0         ; AX: store the addition result
      MOV BX, 1         ; BX: numbers to add in AX
      
      LOOP1:
         ADD BX, AX     ; add BX to AX
         ADD AX, 4      ; add 4 to AX as the difference
                        ; of the sequence is 4
         LOOP LOOP1
      
      EXIT:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN