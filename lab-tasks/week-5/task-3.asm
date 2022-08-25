.MODEL SMALL
.STACK 100H
.DATA
   MSG DB ?
   
.CODE
   MAIN PROC
      MOV DL, 68       ; a random ASCII code in DL
      
      CMP DL, 'A'      ; compare DL with 'A'
      JGE IF           ; jump to "IF" if greater/equal
      JL ELSE          ; jump to "ELSE" if less than

      IF:
         CMP DL, 'z'   ; compare DL with 'z'
         JLE DISPLAY   ; jump to "DISPLAY" if less/equal
      
      ELSE:
         JMP END_IF    ; jump to END_IF
      
      DISPLAY:
         MOV AH, 2     ; print the value stored in DL
         INT 21h
         JMP END_IF
      
      END_IF:
         MOV AH, 4CH   ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN