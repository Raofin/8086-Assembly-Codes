.MODEL SMALL
.STACK 100H
.DATA
   MSG DB 'Enter a number (1-4): $'
      
.CODE
   MAIN PROC
      MOV AX, @data      ; initialize data segment
      MOV DS, AX
      
      MOV AH, 9          ; display MSG
      LEA DX, MSG
      INT 21H
      
      MOV AH, 1          ; user input
      INT 21H
      
      CMP AL, '1'        ; compare the input with 1 & 3
      JE ODD             ; if matches, jump to ODD if 
      CMP AL, '3'
      JE ODD
      
      CMP AL, '2'        ; compare the input with 2 & 4
      JE EVEN            ; if matches, jump to EVEN if
      CMP AL, '4'
      JE EVEN
      
      ODD:      
      MOV DL, 'o'        ; display 'o'
      MOV AH, 2
      INT 21H
      JMP EXIT           ; jump to EXIT
      
      EVEN:
      MOV DL, 'e'        ; display 'e'
      MOV AH, 2
      INT 21H 
      JMP EXIT           ; jump to EXIT
      
      EXIT:
      MOV AH, 4CH        ; return control to DOS
      INT 21H
   MAIN ENDP
END MAIN