; Read an integer from user. Check whether the number is
; positive OR negative. Hints: JMP, JL, JG instructions

.MODEL SMALL
.STACK 100H
.DATA
   STR1 DB 10, 13, 'Positive $'
   STR2 DB 10, 13, 'Negative $'

.CODE
   MAIN PROC
      MOV AX, @DATA       ; initialize ds
      MOV DS, AX
      
      MOV AH, 1           ; take an input
      INT 21h
      
      CMP AL, 0           ; compare AL to 0
      JL NEGATIVE         ; jump to NEGATIVE if CMP is less
      JGE POSITIVE        ; jump to POSITIVE if CMP is greater/equal
      
      POSITIVE: 
         MOV AH, 9        ; display STR1
         LEA DX, STR1     
         INT 21H
         JMP EXIT         ; jump to EXIT
         
      NEGATIVE:
         MOV AH, 9        ; display STR2
         LEA DX, STR2     
         INT 21H
         JMP EXIT         ; jump to EXIT
      
      EXIT:
         MOV AH, 4CH      ; return control to DOS 
         INT 21H
   MAIN ENDP
END MAIN