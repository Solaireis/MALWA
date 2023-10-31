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

  ; ------------------------------------------------
  ; Library files that have definitions for function
  ; exports and tested reliable prebuilt code.
  ; ------------------------------------------------
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
    includelib \masm32\lib\debug.lib

    .code                       ; Tell MASM where the code starts

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

start:                          ; The CODE entry point to the program

    print chr$("Welcome to Malware Analysis - Basic Assembly Language Programming.", 13, 10)
    PrintLine ; print a seperate line
    PrintText "Debugging: Malware Analysis" ; debugging print text
    
    mov eax, 100 ; set value of a variable as 100
    PrintLine ; print a seperate line
    PrintDec eax, "eax value"
    
    mov ebx, 200 ; set value of b variable as 200
    PrintLine ; print a seperate line
    PrintDec ebx, "ebx value"

    push eax
    push ebx

    mov ecx, [esp] ; indirect pointer takes the value of the top stack as the answer, in this case is 200
    PrintLine ; print a seperate line 
    PrintDec ecx, "ecx value"  ; 
    
    mov edx, [esp+32] ; takes the indirect value of the top stack then offset the bytes by 32
    PrintLine ; print a seperate line
    PrintDec edx, "edx value" 

    ;solving bonus qn
    mov edx, [esp+4] ; takes the indirect value of the top stack then offset the bytes by 4 (go down)
    PrintLine ; print a seperate line
    PrintDec edx, "edx value" ; the answer should be 100 which is eax

    


    

    exit

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

end start                       ; Tell MASM where the program ends
