DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
msg db 'insert any lower case character it will return its upper case character$'
invalid_msg db 'Invalid input. You were supposed to enter a lowercase character.$'

.CODE
MAIN PROC
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,9
int 21h
;Enter key and carriage return
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
;Taking Input
mov ah,8
int 21h

;Call the UpperCaseConvertor procedure
call UpperCaseConvertor
mov ah,2
int 21h

mov ah,4ch
int 21h
MAIN ENDP
; Procedure to convert a user input lowercase character to uppercase
UpperCaseConvertor PROC
    mov dl, al  ; Move the input character to DL
    cmp al, 'a' ; Compare with 'a' (ASCII value 97)
    jb invalid_input  ; If the input character is less than 'a', it's not a lowercase letter
    cmp al, 'z' ; Compare with 'z' (ASCII value 122)
    ja invalid_input  ; If the input character is greater than 'z', it's not a lowercase letter
    sub dl, 32  ; Convert lowercase to uppercase by subtracting 32 from the ASCII value
    jmp done  ; Jump to the end of the procedure
invalid_input:
    ; Print error message
    mov dx, offset invalid_msg
    mov ah, 09h
    int 21h
    ; Exit program
    mov ah, 4Ch
    int 21h
done:
    mov al, dl  ; Move the result back to AL
    ret  ; Return from the procedure
UpperCaseConvertor ENDP

END MAIN
