# Bubble Sort


# $a3 -> endereço do vetor
# $a1 -> conterá o tamanho do vetor
# $s0 -> i
# $s1 -> j

        .data

sep:  .asciiz ","
vetor:    .word 10, 5, 3, 7, 6, 4, 2, 3
n:  .word 8

        .text
main:   la $a3, vetor
        lw $a1, n
       

	li $s0, 1               # (s0) i = 0
	subi $a2, $a1, 1	# (a2) = n - 1
	
begin:  bge $s0, $a1, endFor       # for (i = 0; i < n ; i++)
        
        li  $s1, 0		# j = 0 
jloop:  bge $s1, $a2, endloopj  # for (j = 0; j < n - 1 ; j++)

        sll $t2, $s1, 2         # t2 = j * 4 
        add $t1, $a3, $t2   	# t1 = vector[j]
        addi $t2, $t2, 4	# t2 = (j* 4) + 4
        add $t2, $a3, $t2   	# vector[j+1]
        

        lw $t3, ($t1)           # t3 = vector[j]
        lw $t4, ($t2)           # t4 = vector[j+1]

        blt $t4, $t3, swap	# if vector[j+1] < vector[j]
back_swap:
        addi $s1, $s1, 1  #j++
        j jloop
swap:
        sw $t3, ($t2)           # troca de valores
        sw $t4, ($t1)          
        j back_swap

endloopj:
        addi $s0, $s0, 1        # i++
        j begin

endFor:
	li $s0, 0		#s0 = 0
	
print:    
	bge $s0, $a1, end	#for (i = 0; i < n; i++)
	sll $s1, $s0, 2 	# 
	add $t1, $a3, $s1	#
	lw $t7, ($t1)		#
	li $v0, 1   		# print(vector_ordenado[i])
	la $a0, ($t7)      	#
        syscall          	#
        li $v0, 4		#
        la $a0, sep		# print(',')
        syscall			#
        addi $s0, $s0, 1	#
        j print			#
        
end:
        li $v0, 10
        syscall