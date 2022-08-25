; Suppose that CL contains the value of 5. Take an integer from user.  
; Compare the value with CL. AND show whether the user input is less  
; than, greater than AND equal to CL. Hints: use CMP, JL, JG, JE

.MODEL SMALL 
.STACK 100H 
.DATA 
   STR1 DB 'Enter a number: $' 
   STR2 DB 10, 13, 'Greater than 5 $' 
   STR3 DB 10, 13, 'Less than 5 $' 
   STR4 DB 10, 13, 'Equal to 5 $' 

.CODE 
   MAIN PROC 
      MOV AX, @DATA          ; initialize ds
      MOV DS, AX     
      
      MOV AH, 9              ; display STR1
      LEA DX, STR1 
      INT 21H 
      
      MOV AH,1               ; take an input
      INT 21H 
       
      CMP AL, '5'            ; compare AH with 5
      JG GREATER             ; jump to GREATER if CMP is greater
      JL LESS                ; jump to LESS if CMP is less
      JE EQUAL               ; jump to EQUAL if CMP is equal
      
      GREATER: 
         MOV AH, 9           ; display STR2
         LEA DX, STR2 
         INT 21H 
         JMP EXIT            ; jump to EXIT
      
      LESS: 
         MOV AH, 9           ; display STR3
         LEA DX, STR3 
         INT 21H 
         JMP EXIT            ; jump to EXIT
      
      EQUAL: 
         MOV AH, 9           ; display STR4
         LEA DX, STR4 
         INT 21H 
         JMP EXIT            ; jump to EXIT
      
      EXIT: 
         MOV AH, 4CH         ; return control to DOS 
         INT 21H 
   MAIN ENDP 
END MAIN