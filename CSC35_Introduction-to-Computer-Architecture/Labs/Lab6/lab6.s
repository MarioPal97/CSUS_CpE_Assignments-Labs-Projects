# Mario Palacios
# CSC35 - Lab06
# 06/26/2019

 .data
 Hello: 
     .ascii "Hello World!\n\0"
 Name:
     .ascii "My name is Mario Palacios\n\0"
 Words:
     .ascii "R.T.F.M.\n\0"

 .text 
 .global _start

 _start:
     
     mov $Hello, %rcx
     mov $13, %rbx
     call Print

     mov $Name, %rcx
     mov $26, %rbx
     call Print

     mov $Words, %rcx
     mov $9, %rbx
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

 Exit: 
     mov $60, %rax
     mov $0, %rdi
     syscall
