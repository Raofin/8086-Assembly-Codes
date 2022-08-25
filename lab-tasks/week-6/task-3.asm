; Put the sum 100 + 95 + 90 + ... + 5 in AX.

.MODEL SMALL 
.STACK 100H
.CODE
   MAIN PROC     
      ; total loops = (last term - first term) / difference
      ; (100 - 5) / 5 = 19 loops      
      
      MOV CX, 19        ; number of loop
      
      MOV AX, 0         ; AX: store the addition result
      MOV BX, 100       ; BX: numbers to add in AX
      
      LOOP1:
         ADD AX, BX     ; add BX to AX
         SUB BX, 5      ; sub 5 from BX as the difference
                        ; of the sequence is 5  
         LOOP LOOP1
      
      EXIT:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN