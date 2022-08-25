; Write an assembly program that prints Hello World five times 
; and then prints Bye world. Hints: Use unconditional CMP, 
; conditional JE, JNE instruction. 

.MODEL SMALL
.STACK 100H
.DATA
   STR1 DB 'Hello World', 10, 13, '$'
   STR2 DB 10, 13, 'Bye World $'

.CODE
   MAIN PROC
      MOV AX, @DATA       ; initialize ds
      MOV DS, AX    
      
      MOV CX, 0           ; set counter register to 0
      MOV AH, 9           ; set AH to string output
      
      LABEL1:         
         LEA DX, STR1     ; display STR1
         INT 21H
         
         INC CX           ; increment
         CMP CX, 5        ; compare CX to the limit
         JE LABEL2        ; jump to LABEL2 if CMP is equal
         JNE LABEL1       ; jump to LABEL1 if CMP is not equal
         
      LABEL2:
         LEA DX, STR2     ; display STR2
         INT 21H 
      
      EXIT:
         MOV AH, 4CH      ; return control to DOS 
         INT 21H
   MAIN ENDP
END MAIN