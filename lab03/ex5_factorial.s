.globl factorial

.data
n: .word 5

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE
    addi t0, x0, 1
    add t1, a0, x0
    li t2, 1
    bge t0, t1, result
loop:
    mul t2, t2, t0
    addi t0, t0, 1
    bge t1, t0, loop
    j result
result:
    mv a0 t2
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
