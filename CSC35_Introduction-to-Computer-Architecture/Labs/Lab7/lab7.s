# Mario Palacios
# CSC35 - Lab07
# 06/28/2019

 .data
 EnterName:
     .ascii "Enter a name:\n\0"
 Name: 
     .space 50      #50 character buffer
 NameLength:
     .quad 0        #One long integer with an intial value of 0 
 EnterNoun: 
     .ascii "Enter a noun:\n\0"
 Noun: 
     .space 50 
 NounLength: 
     .quad 0
 EnterAnimal: 
     .ascii "Enter an animal:\n\0"    #char: 17
 Animal: 
     .space 50
 AnimalLength: 
     .quad 0 
 Lib: 
     .ascii "Listen, \0"    #Char: 8-9 
 Lib2:
     .ascii ", I hate to break it to you, but what people call \0"  #Char: 50-51/58-60
 Lib3: 
     .ascii " is just a chemical reaction that compels \0"  #Char: 42-43/100-103
 Lib4:
     .ascii " to breed.\n\0"    #char: 11-12/111-115
 
 .text 
 .global _start

 _start:
     mov $EnterName, %rcx
     mov $14, %rbx
     call Print
   
     mov $Name, %rcx
     mov $50, %rbx
     call Read
     sub $1, %rbx
     mov %rbx, NameLength    

     mov $EnterNoun, %rcx
     mov $14, %rbx
     call Print
  
     mov $Noun, %rcx
     mov $50, %rbx
     call Read
     sub $1, %rbx
     mov %rbx, NounLength      #Save the returned length
     
     mov $EnterAnimal, %rcx
     mov $20, %rbx 
     call Print

     mov $Animal, %rcx
     mov $50, %rbx
     call Read
     sub $1, %rbx
     mov %rbx, AnimalLength
  
     mov $Lib, %rcx
     mov $8, %rbx
     call Print

     mov $Name, %rcx
     mov NameLength, %rbx
     call Print

     mov $Lib2, %rcx
     mov $50, %rbx
     call Print

     mov $Noun, %rcx
     mov NounLength, %rbx
     call Print

     mov $Lib3, %rcx
     mov $42, %rbx
     call Print

     mov $Animal, %rcx
     mov AnimalLength, %rbx
     call Print

     mov $Lib4, %rcx
     mov $11, %rbx
     call Print
     
     call Exit
 
 Print:
     push %rax
     push %rdi
     push %rsi
     push %rdx
     mov $1, %rax
     mov $1, %rdi
     mov %rcx, %rsi
     mov %rbx, %rdx
     syscall
     pop %rdx
     pop %rsi
     pop %rdi
     pop %rax
     ret

 Read:        #RAX returns the actual bytes read
     push %rax
     push %rdi
     push %rsi
     push %rdx
     mov $0, %rax
     mov $0, %rdi
     mov %rcx, %rsi
     mov %rbx, %rdx
     syscall
     mov %rax, %rbx
     pop %rdx
     pop %rsi
     pop %rdi
     pop %rax
     ret

 Exit: 
     mov $60, %rax
     mov $0, %rdi
     syscall
