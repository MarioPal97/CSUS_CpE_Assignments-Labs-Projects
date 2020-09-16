# Mario Palacios
# 06/19/2019
# CSC 35 - Lab04
# y = 121, n = 110

 .data
 space:
     .ascii "\n\0" 
 test:
     .ascii "Chances of Surviving a Nuclear Fallout\n\0"
 question1:
     .ascii "Do you have a hazmat suit at hand? (y/n)\n\0"
 question2: 
     .ascii "Do you have a first aid kit? (y/n)\n\0"
 question3:
     .ascii "Can you set up a power generator? (y/n)\n\0"
 question4:
     .ascii "Are you afraid of Deathclaws and/or Ghouls? (y/n)\n\0"
 question5:
     .ascii "Are you able to build a fallout shelter? (y/n)\n\0"
 chance:
     .ascii "You have a \0"
 percent: 
     .ascii "% chance of surviving a Nuclear Fallout\n\0"
 .text
 .global _start
 
 _start: 
     mov $test, %rcx
     call PrintCString
     mov $space, %rcx
     call PrintCString

     mov $question1, %rcx
     call PrintCString
     call ScanChar
     cmp $121, %cl
     jl Kit                  #Answering YES will add points to rbx 
     #True Block
     mov $5, %rbx           #Running total points
    
 Kit:                          #Question 2
     mov $question2, %rcx
     call PrintCString
     call ScanChar
     cmp $121, %cl            
     jl Power                  #Answering YES will add points to rbx
     #TrueBlock
     add $1, %rbx

 Power:                         #Question 3
     mov $question3, %rcx
     call PrintCString
     call ScanChar
     cmp $121, %cl
     jl Ghouls                 #Answering YES will add points to rbx
     #True Block
     add $5, %rbx

 Ghouls:                         #Question 4
     mov $question4, %rcx
     call PrintCString
     call ScanChar
     cmp $110, %cl            
     jg Build                  #Answering NO will add points to rbx   
     #True Block 
     add $10, %rbx

 Build:                          #Question 5 
     mov $question5, %rcx
     call PrintCString
     call ScanChar
     cmp $121, %cl
     jl Total                  #Answering NO will take you to percentage
     #TRUUUUU                  #Answering YES will add points to rbx 
     add $10, %rbx

 Total: 
     mov $space, %rcx
     call PrintCString
     mov $chance, %rcx
     call PrintCString
     imul $100, %rbx
     mov %rbx, %rax
     mov $31, %rbx
     CQO
     idiv %rbx
     mov %rax, %rcx
     call PrintInt
     mov $percent, %rcx
     call PrintCString

 End:
     #mov $space, %rcx
     #call PrintCString 
     call EndProgram
