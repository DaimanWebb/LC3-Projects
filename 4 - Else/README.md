# LC3 Assembly Projects
A collection of LC-3 assembly programs for learning and experimentation.

# 1 - PROGRAMMING ASSIGNMENTS

## Programming Assignment 1
The following program performs the action:
R3 <-- 12 * 6 ; (i.e. multiply 12 by 6 and write the result into Register 3)
using the equivalent of a DO-WHILE loop:
And just filling in the registers, setting breakpoints at the start of the loop to see if the program does what it is supposed to

## Programming Assignment 2
Prompts user to enter 2 numbers and echos them to screen, displaying newlines
Displays N1 - N2 = RESULT
    If minus, display '-' char with corresponding magnitude
    If not, just display magnitude


# 2 - LABS
## Lab 1
### Exercise 0
Print “Hello World” to the Console (in the Simulation Tab).
### Exercise 1
Create a program that multiplies R1 by R2.
## Lab 2
### Exercise 1
Uses .FILL pseudo-op to load the values #65 (decimal65) and x41 (hexadecimal 41) into two memory locations with the labels DEC_65 and HEX_41, respectively.

Then uses the LD instruction to load these two values into registers R3 and R4, respectively

### Exercise 2
Copy the program from exercise 1 into your lab2_ex2.asm file and replace the data stored at DEC_65
and HEX_41 with two far away addresses such as x4000 and x4001 respectively, and rename the labels
to DEC_65_PTR and HEX_41_PTR (because your labels are now pointers to remote data)

You can load the data into the new locations by putting the following code at the end of your current
data block, after the HALT instruction and the .END pseudo-op. Notice that in LC3Tools, each .orig
needs its own .end, just like how a function in C++ needs opening and closing braces:

;; Remote data
.orig x4000
NEW_DEC_65 .FILL #65
NEW_HEX_41 .FILL x41
.END

But now we have a problem!
As we have already seen, the LC-3 Direct memory addressing mode (LD, ST instructions) only works
with labels that are within +/- #256 memory locations of the instruction, so our new data locations are too far away from the code to be accessed with LD and ST, even though we have provided new labels for them.

Replace the LD instruction with one using LDI to load the data into R3 and R4
(Hint: use the _PTR labels, not the NEW_ ones – in fact you can now remove those, they are of no use!)

Next, add code to increment the values in R3 and R4 by 1

Finally, store the incremented values back into addresses x4000 and x4001 using STI.

### Exercise 3 
Start with the same setup as in exercise 2: You have two labeled locations (“pointers”), which contain two “remote” memory addresses; your actual data is stored at those remote addresses.

Directly load (LD) the values of the pointers (i.e. the actual remote memory addresses) into R5 and R6
respectively.

Now, use the relative memory addressing mode (LDR) to load the remote data into R3 and R4, using R5
and R6 as "Base Registers" - i.e. the registers that hold the memory pointers.

Perform the same manipulation as in exercise 2 – i.e. increment the values in R3 & R4, then store those
incremented values back into x4000 and x4001, this time using STR (inspect your registers to confirm,
as always).

### Exercise 4
Use the conditional branch instruction (BR) to construct a counter-controlled loop (the same control
structure you learned in lab 1 and assn 1).

Hard-code (i.e. use .FILL) local data values x61 and x1A, and load them into R0 and R1 respectively.
Inside a loop, output to console the contents of R0 as an ascii character (Trap x21, or OUT), then
immediately increment R0 by 1.

Use R1 as the loop counter by decrementing it by 1 each iteration, right before the BR nstruction
controlling the loop, just as you did in lab 1.

If you do it right, the loop will be executed exactly x1A times.

Think about how and when to terminate the loop: do you use BRn or BRnz or BRz or BRzp or ??
What does this loop do? Can you figure it out before you run it?

## Lab 3
### Exercise 0.0
Takes a single character from the keyboard, using Trap x20 (aka GETC).

### Exercise 0.1
Prompt a password.
Input a password.
Echo to console the symbol '*' for each char input by the user

### Exercise 1
Copy lab2_ex3 into the lab3_ex1.asm file in your current directory, but this time use just a single pointer in the local data block

.FILL the address of the start of the remote data block (your remote .ORIG). Call the local pointer DATA_PTR.

You already know how to get the first data item from the remote location: how will you get the next?

    Hint: LDI won't work, because we don't have a pointer to it in the remote memory location.
How about LDR? But isn't the base register pointing to the first data value? How can you point to the
next?

When you have figured this out, run the code:
    1. read the two remote data values
    2. modify them
    3. store the modified data back to the remote location

### Exercise 2
This program builds and populates an array in the local data area:
    - Use .BLKW to set up a blank array of 10 locations in the local data area (no remote data this time)
    - This is where you will have to use the LEA instruction to get the actual starting address of the array   into a register!
    - Have the program prompt the user to enter exactly 10 characters from the keyboard, and populate that array with the characters as they are input.
    - This will require a counter-controlled loop (DO-WHILE loop)
Test your program, inspecting the contents of the array in the LC-3 simulator after every character
input.

### Exercise 3 
Copy exercise 2 into lab3_ex3.asm
Extend it by adding another loop to traverse the array again, and output each stored character to the console, one per line (i.e. print a newline '\n' = ASCII x0A after each character).

Your program will now be complete: it will accept exactly 10 characters from input, storing them one by
one in a remote array, and then output the whole list to console, one character per line

### Exercise 4
In the previous exercises, you were able to traverse the arrays because you knew up front how many
elements were in them – in fact that number was hard-coded into the .BLKW pseudo-op.

Can you think of a way to create and/or traverse an array without knowing beforehand how many
elements it will contain, and without using .BLKW?
Hint: think about the difference between counter & sentinel control of loops.
Another hint: we will actually need two separate sentinels!

First, you have to use a specific key to tell the program to stop collecting characters from the
keyboard; then you have to store a sentinel in the array to mark the end of the collected characters.

Now copy Exercise 3 into your lab3_ex4.asm file, and modify it as follows:
    - It must capture a sequence of characters as long as you like (within reason - for now, let's keep our tests to less than 100), and stop when you enter your "input" sentinel character.
    - The program will store each character as it is entered in an array starting at x4000 (we will just
assume for now that there is a vast amount of free memory up there), with a sentinel character
marking the end of the data; and then output them all to the console in a separate loop.
    - Remove the newline after each character output - i.e. the entire array will now be output on a single line. DO terminate that line with a newline.

There are three separate problems to be solved here:
    1. How do I communicate to the program that I have finished input?
    Hint: what is the most common keyboard method of signaling “I'm done with this message” in, say, a chat app?
    2. How do I build the array so that it “knows” where it ends - i.e. what sentinel do I store at the end of the array? This is usually different from your "input" sentinel.
    Hint: how does .STRINGZ do it?
    3. How does the program know when to stop traversing the array for output?
    See previous hint, and think PUTS!

Once you solve these problems you will have in your algorithmic toolkit a very powerful technique –
sentinel-controlled loops—that you will be using to manage i/o for the rest of the course.

## Lab 4
### Exercise 1
Create an array of size 10 in local data (the data of the main program).
    - Create a new subroutine called “SUB_FILL_ARRAY_3200”
        ○  R1 should be a parameter with the address of the array from local data.
        ○  Programmatically populate the array with 0 through 9 (decimal numbers, not ASCII).
        ○  At the end of the subroutine, revert R1 to the original address of the array!
    - In the main program, call the subroutine you created!

Exercise 1
;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY
; Parameter (R1): The starting address of the array. This should be
unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------

### Exercise 2
Copy exercise 1 into exercise 2 file.
    - Create a new subroutine at x3400!
        ○  Subroutine should load each element from the array, convert it to an ASCII character, and store it back into the array.
    - Call the subroutine in your main program (placed after the call to your previous subroutine)
    
Exercise 2
;------------------------------------------------------------------------
; Subroutine: SUB_CONVERT_ARRAY
; Parameter (R1): The starting address of the array. This should be
unchanged at the end of the subroutine!
; Postcondition: Each element (number) in the array should be represented as
a character. E.g. 0 -> ‘0’
; Return Value (None)
;-------------------------------------------------------------------------

### Exercise 3 
Copy the exercise 2 code into your exercise 3 file.
    ●  Create a new subroutine at x3600 called “SUB_PRINT_ARRAY_3600”
        ○  Load each element from the array, and print it out using OUT.
    ● Call the subroutine in the main program after calls to your previous subroutine.
    ● Ensure that the program runs correctly such that 0 through 9 prints out to the console
    (e.g. “0123456789”)

Exercise 3
;------------------------------------------------------------------------
; Subroutine: SUB_PRINT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the
end of the subroutine!
; Postcondition: Each element (character) in the array is printed out to the
console.
; Return Value (None)
;-------------------------------------------------------------------------

### Exercise 4
Copy the exercise 3 code into your exercise 4 file.
    ● Create a new subroutine at x3800 called “SUB_PRETTY_PRINT_ARRAY_3800”
     ○  Print out “=====” (5 equal signs) before and after printing out the array.
     ○  Call your “SUB_PRINT_ARRAY” subroutine. Do not copy the print array logic!
    ● Call the subroutine in the main program after calls to your previous subroutines.
    ● This will not work properly! Step through the program and answer the questions in the lab manual.

Exercise 4
;------------------------------------------------------------------------
; Subroutine: SUB_PRETTY_PRINT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged
at the end of the subroutine!
; Postcondition: Prints out “=====” (5 equal signs), prints out the array,
and after prints out “=====” again.
; Return Value (None)
;-------------------------------------------------------------------------


# 3 - PERSONAL STUFF
1. addnums_literal.asm – 
2. addnums.bin - binary version of above file

## ADDING NUMBERS
### addinput.asm
### addnums_literal.asm
Simple program adding the values held at x3000 to x3009, sequentially, using x0F
### addnums_label.asm
### multiply.bin
### addinput.asm
### addnums.bin
## DATA MOVEMENT
### access_violation_ldi.asm
### access_violation_ldr.asm
### data_moves.asm

# LC3Tools&Tips
✅ Use x0A (LF) when checking for Enter in LC-3 sentinel loops.
🚫 NOT xOD (CR)
ctrl + shift + up/down arrow increments/decrements a number

# TRAP VECTOR TABLE
TRAP x20 - GETC
TRAP x21 - OUT
TRAP x22 - PUTS
TRAP x23 - IN
TRAP x25 - HALT

# Ongoing Inquiries
x20 DIFFERENCE BETWEEN ASCII ALPHABET CASES

TEST RELOADING OBJECT FILES WITH ALL FILES IN LAB3 -- does memory/data get overwritten?

Test program overwriting own memory instructions (SELF REFERENTIAL PROGRAM) -- how does lc3-sim guard against this?
- logical vs literal (subroutine corrupting memory used by program ahead)

how many combinations of nzp exist?

CAN WE SET PC TO BRANCH INSTRUCTION UPON RETURNING FROM SUBROUTINE

WHY WERE OUR ASSIGNMENTS SO OBSESSED WITH NEWLINES??

WHAT IF R5 POINTS TO JUNK before a JSRR call?