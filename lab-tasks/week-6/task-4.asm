; Read a character and display it 50 times on the next line. 
; Hints: use LOOP instructions and put cx = 50

.MODEL SMALL 
.STACK 100H
.DATA
   MSG DB 'Enter a character: $'
   NEW_LINE DB 10, 13, '$'

.CODE
   MAIN PROC
      MOV AX, @DATA     ; initialize DS
      MOV DS, AX
      
      MOV AH, 9         ; display MSG
      LEA DX, MSG
      INT 21H
      
      MOV AH, 1         ; set single char input function
      INT 21H
      MOV BL, AL
      
      MOV AH, 9         ; display NEW_LINE
      LEA DX, NEW_LINE  
      INT 21H
      
      MOV CX, 50        ; initialize CX with 50
      
      MOV AH, 2         ; set single char output function
      MOV DL, BL        ; put BL in DL to display
      
      LOOP1:
         INT 21H        ; display
         LOOP LOOP1     ; start the loop again 
      
      EXIT:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
   MAIN ENDP
END MAIN