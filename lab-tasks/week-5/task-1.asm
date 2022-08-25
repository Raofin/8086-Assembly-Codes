.MODEL SMALL
.STACK 100H
.CODE
   MAIN PROC
      MOV AX, 68       ; a random number in AX
        
      CMP AX, 0        ; compare AX with 0
      JGE IF           ; jump to IF, if greater than 0
      JMP END_IF       ; otherwise jump to END_IF
        
      IF:
         MOV BX, -1    ; put -1 in BX
         JMP END_IF    ; jump to END_IF
            
      END_IF:          
         MOV AH, 4CH   ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN