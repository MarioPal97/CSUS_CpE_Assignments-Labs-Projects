# lab2.s 
# Mario Palacios
# CSC35 - Section02  

 .data
 Message:
     .ascii "Throwing a 3 pointer   : 30 points\n\0"
 Message2: 
     .ascii "Doing a lay-up         : 2 points\n\0" 
 Message3: 
     .ascii "Being late to practice : -10 points\n\0"
 Prompt: 
     .ascii "How many studnets scored 3-pointers?\n\0"
 Prompt2: 
     .ascii "How many students did a lay-up?\n\0"
 Prompt3: 
     .ascii "How many students were late to practice?\n\0"
 Prompt4: 
     .ascii "Total number of points scored: \0"     

 .text
 .global _start

 _start: 
     mov $Message, %rcx 
     call PrintCString 
   
     mov $Message2, %rcx 
     call PrintCString

     mov $Message3, %rcx
     call PrintCString

     mov $Prompt, %rcx 
     call PrintCString 
     call ScanInt
     imul $30, %rcx
     mov %rcx, %rbx 

     mov $Prompt2, %rcx 
     call PrintCString
     call ScanInt
     imul $2, %rcx
     add %rcx, %rbx

     mov $Prompt3, %rcx
     call PrintCString
     call ScanInt
     imul $10, %rcx
     sub %rcx, %rbx 
     
     mov $Prompt4, %rcx
     call PrintCString
     mov %rbx, %rcx
     call PrintInt 
    
     call EndProgram
