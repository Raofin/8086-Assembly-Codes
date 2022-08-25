.MODEL SMALL
.STACK 100H   
.CODE
   MAIN PROC
      MOV AX, 'P'       ; random values in AX, BX and CX
      MOV BX, 'Q'
      MOV CX, 'R'

      CMP AX, BX        ; compare AX with BX
      JL IF1            ; AX < BX then jump to IF1
      JMP ELSE1         ; otherwise jump to ELSE1

      IF1:
         MOV AX, 0      ; put 0 in AX
         JMP END_IF     ; jump to END_IF 
         
      ELSE1:
         CMP BX, CX     ; compare BX with CX
         JL IF2         ; BX < CX then jump to IF2
         JMP ELSE2      ; otherwise jump to ELSE2                  

      IF2:
         MOV BX, 0      ; put 0 in BX
         JMP END_IF     ; jump to END_IF
      
      ELSE2:
         MOV CX, 0      ; put 0 in CX
         JMP END_IF     ; jump to END_IF
 
      END_IF:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN