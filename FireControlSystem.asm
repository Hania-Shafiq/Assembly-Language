; Define macro to print a string
print MACRO p1 
    mov dx, OFFSET p1   ; Move the offset address of the string to DX register
    mov ah, 9           ; Set AH register to 9 to indicate print string function
    int 21h             ; Call interrupt 21h to print the string
ENDM

.model small
.stack 100h
.data
; Define data variables
title1 db 10,13,'Fire alarm system of the building$'  ; Title of the fire alarm system
detail db 10,13,'The detector has wireless connectivity$'  ; Description of the system
a db 10, 13, 'Fetching system information...$'  ; Message indicating system info retrieval
systemInfo1 db 10, 13, 'Fire Alarm System Information:', '$'  ; Information about the fire alarm system
systemInfo2 db 10, 13, '--------------------------------', '$'  ; Separator for system information
systemInfo3 db 10, 13, 'Type: Wireless', '$'  ; Type of the fire alarm system
systemInfo4 db 10, 13, 'Connectivity: WiFi', '$'  ; Connectivity type of the system
systemInfo5 db 10, 13, 'Version: 1.0', '$'  ; Version of the fire alarm system

; Message strings for alarm testing
testingVoice db 10, 13, 'Testing the voice alarm system...$'
voiceTestSuccess db 10, 13, 'Voice alarm test successful! Audible warning is functioning properly.$'
smokeLevel1 db 10, 13, 'Smoke detector level: 1 - Safe environment.$'
smokeLevel2 db 10, 13, 'Smoke detector level: 2 - Safe environment.$'
smokeLevel3 db 10, 13, 'Smoke detector level: 3 - Safe environment.$'
smokeLevel4 db 10, 13, 'Smoke detector level: 4 - Safe environment.$'
smokeLevel5 db 10, 13, 'Smoke detector level: 5 - Danger! Activating showers, sending emergency alerts, calling fire brigade, opening emergency exits...$'
smokeDetectorInstall db 10, 13, '19 smoke detector devices installed in building showed with * sign in layout$'

; Other message strings
safeMsg db 10,13,'It''s safe$'  ; Message indicating that the environment is safe
msg1 db 10,13,'Emergency alert message sent to all the people in the building$'  ; Emergency alert message
msg2 db 10,13,'Voice instruction is given to all the people in the building$'  ; Voice instruction message
msg3 db 10,13,'Emergency showers are turned on$'  ; Message indicating activation of emergency showers
msg4 db 10,13,'All the emergency exits in the building are opened$'  ; Message indicating opening of emergency exits
msg5 db 10,13,'Emergency message is sent to the closest fire station$'  ; Message indicating sending emergency message to fire station
inputPrompt db 10,13,'Enter smoke level (1-10): $'  ; Prompt for user input of smoke level
menuPrompt db 10,13,'Select an option: $'  ; Prompt for selecting an option from the menu
menuOption1 db 10,13,'1. View Building Layout$'  ; Menu option for viewing building layout
menuOption2 db 10,13,'2. Display System Information$'  ; Menu option for displaying system information
menuOption3 db 10,13,'3. Test Alarm$'  ; Menu option for testing the alarm
menuOption4 db 10,13,'4. Fire Alarm System$'  ; Menu option for accessing the fire alarm system

; Building layout ASCII art
BUILDINGLAYOUT db 10,13,'_____________________________________________________________________________'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | *   *   *   *   *   *   *   *   *    *   *   *   *   *   *   *   *   *   * |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | o   o   o   o   o   o   o   o   o    o   o   o   o   o   o   o   o   o   o |'
db 10,13,' | []   []   []   []   []   []   []   []   []    []   []   []   []   []   []  |'
db 10,13,'_____________________________________________________________________________','$'

.code
main PROC
    MOV AH, 0     ; Set video mode
    MOV AL, 6     ; Mode 4
    INT 10H

MOV AH, 0BH   ; Set text color
MOV BH, 00H   ; Page number 
MOV BL, 00H   ; Background color (black)
INT 10H

    mov ax, @data
    mov ds, ax  ; Set DS to point to the data segment

    call ShowMenu  ; Call the main menu function

    mov ah, 4ch  ; Exit program
    int 21h
main ENDP

; Function to display the main menu
ShowMenu PROC
    print menuPrompt  ; Display menu prompt
    print menuOption1  ; Display menu option 1
    print menuOption2  ; Display menu option 2
    print menuOption3  ; Display menu option 3
    print menuOption4  ; Display menu option 4

    ; Input menu choice
    mov ah, 01h  ; Function to read character from standard input
    int 21h      ; BIOS interrupt
    
    cmp al, '1'  ; Check if input is option 1
    je ShowBuildingLayout  ; If yes, display building layout
    cmp al, '2'  ; Check if input is option 2
    je DisplaySystemInfo  ; If yes, display system information
    cmp al, '3'  ; Check if input is option 3
    je TestAlarm  ; If yes, test the alarm
    cmp al, '4'  ; Check if input is option 4
    je FireAlarmSystem  ; If yes, access fire alarm system
    ; Handle invalid input here
    jmp ShowMenu  ; If input is invalid, display menu again

ShowBuildingLayout:
    print BUILDINGLAYOUT  ; Display building layout
    jmp ShowMenu

; Function to display system information
DisplaySystemInfo:
    print a  ; Display system information message
    print systemInfo1  ; Display system information
    print systemInfo2  ; Display system information
    print systemInfo3  ; Display system information
    print systemInfo4  ; Display system information
    print systemInfo5  ; Display system information
    jmp ShowMenu  ; Return to main menu

; Function to test the alarm
TestAlarm:
    print testingVoice
    print voiceTestSuccess
    print smokeLevel1
    print smokeLevel2
    print smokeLevel3
    print smokeLevel4
    print smokeLevel5
    print smokeDetectorInstall
    jmp ShowMenu  ; Return to main menu

; Function for the fire alarm system
FireAlarmSystem PROC
    mov ax, @data
    mov ds, ax  ; Set DS to point to the data segment

    print title1  ; Display system title
    print detail  ; Display system details

    ; Input smoke level
    print inputPrompt  ; Prompt for smoke level input

    ; Input smoke level
    mov ah, 01h  ; Function to read character from standard input
    int 21h      ; BIOS interrupt
    sub al, 48  ; Convert ASCII to numeric value
    mov bl, al  ; Store the input in BL

    ; Compare smoke level
    cmp bl, 4  ; Compare smoke level to threshold
    jbe safe  ; If less than or equal to threshold, proceed to safe condition

    ; If greater than or equal to 5, danger
    print msg1  ; Display emergency alert message
    print msg2  ; Display voice instruction message
    print msg3  ; Display emergency showers activation message
    print msg4  ; Display emergency exits opening message
    print msg5  ; Display emergency message sent to fire station
    jmp end_fire_alarm  ; Exit fire alarm system

safe:
    ; Display safe message
    print safeMsg
    jmp end_fire_alarm

end_fire_alarm:
    ret  ; Return from fire alarm system
FireAlarmSystem ENDP

end main  ; End of main program 
