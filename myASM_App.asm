; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

;                 Build this with the "Project" menu using
;                       "Console Assemble and Link"

comment * ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

Malware Analysis
ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл *
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
    include \masm32\include\msvcrt.inc

  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
    includelib \masm32\lib\debug.lib
    includelib \masm32\lib\msvcrt.lib

    .data
        txttitle db "Malware Analysis - Simple Addition using registers and assembly instructions", 0 ; an initialised string 
        txtmsg1 db "enter the first number: ", 0
        txtmsg2 db "enter the second number: ", 0
        txtmsg3 db "The total sum of the numbers is: ", 0
        
    .data?
        var1 dd ? ; unitialised single 32bit space (you must initialised first for it to work!)
        var2 dd ?
        str1 dd ?
        
    .code                       ; Tell MASM where the code starts

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

start:                          ; The CODE entry point to the program
    print OFFSET txtmsg1 ; 
    mov str1, input() ;
    mov var1, sval(str1) ;

    print OFFSET txtmsg2 ;
    mov str1, input() ;
    mov var2, sval(str1) ;

    print chr$(13, 10, 13, 10) ; print 2 new lines to the console
    print OFFSET txtmsg3

    mov eax, var1
    mov ecx, var2
    add eax, ecx
    print str$(eax)
   

    exit

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

end start                       ; Tell MASM where the program ends
