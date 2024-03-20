DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
msg db 'insert any lower case character we will return its upper case character$'

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

;Procedure to convert a user input lowercase string to an uppercase string
UpperCaseConvertor PROC

    mov dl,al         ; Move the input character to DL
    cmp al,'a'
    
    sub dl,32         ; Add 32 to convert lowercase to uppercase
    
    ret               ; Return from the procedure

UpperCaseConvertor ENDP
END MAIN
