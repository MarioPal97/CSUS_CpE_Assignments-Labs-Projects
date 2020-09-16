# lab3.s
# Mario Palacios 
# CSC 35 - Section 02 

 .data

 space: 
     .ascii"\n\0" 
 machine: 
     .ascii "The Junk-o-matic Vending Machine\n\0" 
 globe: 
     .ascii "0.  Antique Globe (85 bottle caps)\n\0" 
 lights: 
     .ascii "1.  Broken Light Bulb (125 bottle caps)\n\0" 
 tray: 
     .ascii "2.  Dirty Ashtray (50 bottle caps)\n\0"
 ball: 
     .ascii "3.  Deflated Kickball (100 bottle caps)\n\0"

 junk:
     .quad globe
     .quad lights
     .quad tray
     .quad ball
 
 cost:
     .quad 85
     .quad 125
     .quad 50
     .quad 100
 
 change:
     .ascii "Your change is: \0"
 money: 
     .ascii "Enter Number of Bottle Caps: \0"
 select: 
     .ascii "Whatcha Want: \0" 
 bottleCaps:
     .ascii " Bottle Caps\n\0"

 .text
 .global _start

 _start:
     mov $machine, %rcx
     call PrintCString
     mov $space, %rcx
     call PrintCString

     mov $globe, %rcx
     call PrintCString
     mov $lights, %rcx
     call PrintCString
     mov $tray, %rcx
     call PrintCString
     mov $ball, %rcx
     call PrintCString
     mov $space, %rcx
     call PrintCString

     mov $money, %rcx
     call PrintCString
     call ScanInt
     mov %rcx, %rbx
     mov $select, %rcx
     call PrintCString
     call ScanInt
     mov %rcx, %rdi
     mov $space, %rcx
     call PrintCString

     mov junk(, %rdi, 8), %rcx
     call PrintCString
     mov cost(, %rdi, 8), %rcx
     sub %rcx, %rbx
     mov $change, %rcx
     call PrintCString
     mov %rbx, %rcx
     call PrintInt
     mov $bottleCaps, %rcx
     call PrintCString
     mov $space, %rcx
     call PrintCString

     call EndProgram
