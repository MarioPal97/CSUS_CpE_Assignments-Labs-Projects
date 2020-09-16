# lab1.s 
# Mario Palacios
# 
# 1. Assemble : as -o lab1.o lab1.s 
# 2. Link : ld -o a.out lab1.o csc35.o 
# 3. Execute : a.out

.data					#Start the data section 
Message: 				#Message is an address
    .ascii "Hello, world!\n\0"		#Create a buffer of ASCII
Name: 
    .ascii "My name is Mario Palacios.\n\0"
Quote: 
    .ascii "With great power, comes great responsibility.\n\0"
Graduate: 
    .ascii "I will graduate in \0"
SacState: 
    .ascii " from Sacramento State!\n\0"

.text 					#Start the text section
.global _start				#Make the _start label public

_start: 				#UNIX starts here
    mov $Message, %rcx 			#Put the address into rcx
    call PrintCString			#Execute the csc35.o subroutine
    
    mov $Name, %rcx
    call PrintCString
    
    mov $Quote, %rcx
    call PrintCString

    mov $Graduate, %rcx
    call PrintCString

    mov $2021, %rcx
    call PrintInt

    mov $SacState, %rcx
    call PrintCString

    call EndProgram 			#Execute the csc35.o subroutine 
