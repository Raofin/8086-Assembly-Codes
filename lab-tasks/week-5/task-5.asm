.MODEL SMALL
.STACK 100H   
.CODE
   MAIN PROC
      MOV AX, 'C'       ; random values in AX, BX and CX
      MOV BX, 'B'
      MOV CX, 'A'

      CMP AX, BX        ; compare AX with BX
      JL IF             ; jump to "IF" if less than
      JMP ELSE          ; otherwise jump to "ELSE"
      
      CMP BX, CX        ; compare BX with CX
      JL IF             ; jump to "IF" if less than
      JMP ELSE          ; otherwise jump to "ELSE"

      IF:
         MOV DX, 0      ; put 0 in DX
         JMP END_IF     ; jump to "END_IF"

      ELSE:
         MOV DX, 1      ; put 1 in DX
         JMP END_IF     ; jump to "END_IF"

      END_IF:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN