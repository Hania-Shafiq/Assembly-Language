; Macro to draw a black square
blackSquare macro srow, scolumn, erow, ecolumn
    mov ah, 6          ; BIOS: Scroll Up/Window Control
    mov al, 0          ; Number of lines to scroll (0 = fill)
    mov bh, 00000000b  ; Black color attribute
    mov ch, srow        ; Top row of the square
    mov cl, scolumn     ; Left column of the square
    mov dh, erow       ; Bottom row of the square
    mov dl, ecolumn     ; Right column of the square
    int 10h            ; Call BIOS interrupt
endm

.model small
.stack 100h
.data
.code
main proc
    ; Draw a white background rectangle.
    mov ah, 6             ; BIOS: Scroll Up/Window Control
    mov al, 0             ; Number of lines to scroll (0 = fill)
    mov bh, 01111111b     ; White color attribute
    mov ch, 0             ; Top row of the rectangle
    mov cl, 0             ; Left column of the rectangle
    mov dh, 10            ; Bottom row of the rectangle
    mov dl, 23            ; Right column of the rectangle
    int 10h               ; Call BIOS interrupt
    
    ; Draw black squares for the chessboard pattern
    ; Row 1
    blackSquare 0, 0, 5, 5      ; First black square in the top row
    blackSquare 0, 12, 5, 17    ; Second black square in the top row
    
    ; Row 2
    blackSquare 6, 6, 10, 11    ; First black square in the second row
    blackSquare 6, 18, 10, 23   ; Second black square in the second row
    
    ; Terminate program
    mov ah, 4Ch           ; DOS: Terminate Program
    int 21h               ; Call DOS interrupt
main endp
end main
