; �������������������������������������������������������������������������

;                 Build this with the "Project" menu using
;                       "Console Assemble and Link"

comment * �����������������������������������������������������������������

Malware Analysis
������������������������������������������������������������������������� *
    .486                                    ; create 32 bit code
    .model flat, stdcall                    ; 32 bit memory model
    option casemap :none                    ; case sensitive
 
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros

  ; -----------------------------------------------------------------
  ; include files that have MASM format prototypes for function calls
  ; -----------------------------------------------------------------
    include \masm32\include\masm32.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
    include \masm32\include\debug.inc

  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
    includelib \masm32\lib\debug.lib
    .data
        txtmsg1 db "Malware Analysis: data in the initialised data section", 0
        
    .code                       ; Tell MASM where the code starts

; �������������������������������������������������������������������������

start:                          ; The CODE entry point to the program

    push OFFSET txtmsg1
    call main ; branch to the main procedures
    
    exit
; �������������������������������������������������������������������������
main proc
    pop eax ; store return address to eax
    pop edx ; store param to edx
    push eax ; store return address to stack
    
    print edx
    ret             ; return to the next instruction after call
main endp

; �������������������������������������������������������������������������

end start                       ; Tell MASM where the program ends
