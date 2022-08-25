.MODEL SMALL
.STACK 100H
.CODE
   MAIN PROC    
      MOV AL, 68       ; a random number in AL
        
      CMP AL, 0        ; compare AL with 0
      JG IF            ; jump to IF, if greater than 0
      JLE ELSE         ; otherwise jump to ELSE
        
      IF:
         MOV AH, 0FFH  ; put 0FFh in AH
         JMP END_IF
      
      ELSE:
         MOV AH, 0     ; put 0 in AH
         JMP END_IF
            
      END_IF:          ; return control to DOS
         MOV AH, 4CH
         INT 21H
   MAIN ENDP
END MAIN