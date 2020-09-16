# Mario Palacios
# CSC 35 - Lab05
# 06/21/2019

 .data
 space:
     .ascii "\n\0"
 guess:
     .ascii "Input a Guess: \0"
 high: 
     .ascii "You are too high!\n\0"
 low:
     .ascii "You are too low!\n\0"
 correct: 
     .ascii "Correct! It took you a total of \0"
 attempts: 
     .ascii " attempts!\n\0"

 .text
 .global _start

 _start:
 
     mov $100, %rcx
     call Random
     add $1, %rcx
     mov %rcx, %rax
     
 While: 
     mov $guess, %rcx
     call PrintCString
     call ScanInt
     cmp %rcx, %rax
     jl PrintHigh
     jg PrintLow
     je PrintCorrect
 
 PrintHigh: 
     mov $high, %rcx
     call PrintCString
     add $1, %rbx
     mov $space, %rcx
     call PrintCString
     jmp While

 PrintLow: 
     mov $low, %rcx
     call PrintCString
     add $1, %rbx
     mov $space, %rcx
     call PrintCString
     jmp While

 PrintCorrect: 
    mov $correct, %rcx
    call PrintCString
    mov %rbx, %rcx
    call PrintInt
    mov $attempts, %rcx
    call PrintCString
     
 End: 
    call EndProgram
