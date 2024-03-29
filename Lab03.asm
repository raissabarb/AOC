.data
  
    msg1: .asciiz "Insira a mensagem: "
    msg2: .asciiz "Numero total de caracteres: "
    msg3: .asciiz "Mensagem Criptografada: "
    msg4: .asciiz "Insira a senha: "
    msg5: .asciiz "Mensagem Original: "
    msg6: .asciiz "Senha incorreta."
    senha: .word 159753
    quebraLinha: .asciiz "\n"
    criptografia: 
        .align 2
        .space 1000
 
.text
 
    .globl main
    main:
 
    # Iniciando o vetor e algumas informacoes importantes
 
    move $t1, $zero # indice do array
    move $t2, $zero # contador de caracteres
    move $t3, $zero # contador pro loop de impressao
 
    # Imprimindo primeira mensagem
    
    la $a0, msg1
    li $v0, 4
    syscall
    
    # Input
    
    input:
        li $v0, 12
        syscall
        move $t0, $v0
        beq $t0, 10, endInput # compara com ascii enter
        sw $t0, criptografia($t1)
        addi $t1, $t1, 4
        addi $t2, $t2, 1
        j input
        
    endInput:
        move $t1, $zero
        
    # Decodificacao
    
    loop:
        beq $t3, $t2, verif
        lb $a0, criptografia($t1)
        move $t5, $a0
        beq $t5, 32, substSpace
        beq $t5, 97, substa
        beq $t5, 65, substA
        beq $t5, 114, substr
        beq $t5, 82, substR
        beq $t5, 101, subste
        beq $t5, 69, substE
        beq $t5, 111, substo
        beq $t5, 79, substO
        beq $t5, 109, substm
        beq $t5, 77, substM
        beq $t5, 104, substh
        beq $t5, 72, substH
        beq $t5, 108, substl
        beq $t5, 76, substL
        beq $t5, 115, substs
        beq $t5, 83, substS
        beq $t5, 112, substp
        beq $t5, 80, substP
        beq $t5, 48, subst0
        beq $t5, 49, subst1
        beq $t5, 50, subst2
        beq $t5, 51, subst3
        beq $t5, 52, subst4
        beq $t5, 53, subst5
        beq $t5, 54, subst6
        beq $t5, 55, subst7
        beq $t5, 56, subst8
        beq $t5, 57, subst9
        j proximo
        
        substSpace:
            li $t4, 48
            sw $t4, criptografia($t1)
            j proximo
        
        substa:
            li $t4, 49
            sw $t4, criptografia($t1)
            j proximo            
            
        substA:
            li $t4, 49
            sw $t4, criptografia($t1)
            j proximo
            
        substr:
            li $t4, 50
            sw $t4, criptografia($t1)
            j proximo
            
        substR:
            li $t4, 50
            sw $t4, criptografia($t1)
            j proximo
            
        subste:
            li $t4, 51
            sw $t4, criptografia($t1)
            j proximo
            
        substE:
            li $t4, 51
            sw $t4, criptografia($t1)
            j proximo
            
        substo:
            li $t4, 52
            sw $t4, criptografia($t1)
            j proximo
            
        substO:
            li $t4, 52
            sw $t4, criptografia($t1)
            j proximo
            
        substm:
            li $t4, 53
            sw $t4, criptografia($t1)
            j proximo
            
        substM:
            li $t4, 53
            sw $t4, criptografia($t1)
            j proximo
            
        substh:
            li $t4, 54
            sw $t4, criptografia($t1)
            j proximo
            
        substH:
            li $t4, 54
            sw $t4, criptografia($t1)
            j proximo
        
        substl:
            li $t4, 55
            sw $t4, criptografia($t1)
            j proximo
            
        substL:
            li $t4, 55
            sw $t4, criptografia($t1)
            j proximo
            
        substs:
            li $t4, 56
            sw $t4, criptografia($t1)
            j proximo
            
        substS:
            li $t4, 56
            sw $t4, criptografia($t1)
            j proximo
            
        substp:
            li $t4, 57
            sw $t4, criptografia($t1)
            j proximo
            
        substP:
            li $t4, 57
            sw $t4, criptografia($t1)
            j proximo
            
        subst0:
            li $t4, 32
            sw $t4, criptografia($t1)
            j proximo
            
        subst1:
            li $t4, 65
            sw $t4, criptografia($t1)
            j proximo
            
        subst2:
            li $t4, 82
            sw $t4, criptografia($t1)
            j proximo
            
        subst3:
            li $t4, 69
            sw $t4, criptografia($t1)
            j proximo
            
        subst4:
            li $t4, 79
            sw $t4, criptografia($t1)
            j proximo
            
        subst5:
            li $t4, 77
            sw $t4, criptografia($t1)
            j proximo
            
        subst6:
            li $t4, 72
            sw $t4, criptografia($t1)
            j proximo
            
        subst7:
            li $t4, 76
            sw $t4, criptografia($t1)
            j proximo
            
        subst8:
            li $t4, 83
            sw $t4, criptografia($t1)
            j proximo
            
        subst9:
            li $t4, 80
            sw $t4, criptografia($t1)
            j proximo
    
        proximo:
            addi $t1, $t1, 4
            addi $t3, $t3, 1
            
        j loop
 
    verif:
        move $t1, $zero
        move $t3, $zero
    
    # Imprimindo a quantidade de caracteres
    
    la $a0, msg2
    li $v0, 4
    syscall
    
    move $a0, $t2
    li $v0, 1
    syscall
    
    # Imprimindo a mensagem criptografada
    
    la $a0, quebraLinha
    li $v0, 4
    syscall
    
    la $a0, msg3
    li $v0, 4
    syscall
    
    fimMensagem:
        beq $t3, $t2, parte2
        li $v0, 11
        lb $a0, criptografia($t1)
        syscall
    
        addi $t1, $t1, 4
        addi $t3, $t3, 1
        j fimMensagem
        
    parte2:    
    
        # Mensagem pedindo a senha
        
        la $a0, quebraLinha
        li $v0, 4
        syscall
    
        la $a0, msg4
        li $v0, 4
        syscall
        
        # Pegando a senha
    
        li $v0, 5
        syscall
        move $t6, $v0
        
        # Verificando se a senha esta correta
        
        lw $a0, senha
        beq $t6, $a0, senhaCorreta
        bne $t6, $a0, senhaIncorreta
        
        senhaIncorreta:
            la $a0, msg6
            li $v0, 4
            syscall
            j fim
            
        senhaCorreta:
        
            # Decodificacao
            
            move $t3, $zero
            move $t1, $zero
    
            loop2:
                beq $t3, $t2, verif2
                li $v0, 12
                lb $a0, criptografia($t1)
                move $t5, $a0
                beq $t5, 32, substSpace2
                #beq $t5, 97, substa2
                beq $t5, 65, substA2
                #beq $t5, 114, substr2
                beq $t5, 82, substR2
                #beq $t5, 101, subste2
                beq $t5, 69, substE2
                #beq $t5, 111, substo2
                beq $t5, 79, substO2
                #beq $t5, 109, substm2
                beq $t5, 77, substM2
                #beq $t5, 104, substh2
                beq $t5, 72, substH2
                #beq $t5, 108, substl2
                beq $t5, 76, substL2
                #beq $t5, 115, substs2
                beq $t5, 83, substS2
                #beq $t5, 112, substp2
                beq $t5, 80, substP2
                beq $t5, 48, subst02
                beq $t5, 49, subst12
                beq $t5, 50, subst22
                beq $t5, 51, subst32
                beq $t5, 52, subst42
                beq $t5, 53, subst52
                beq $t5, 54, subst62
                beq $t5, 55, subst72
                beq $t5, 56, subst82
                beq $t5, 57, subst92
                j proximo2
                
                substSpace2:
                    li $t4, 48
                    sw $t4, criptografia($t1)
                    j proximo2
                
                substa2:
                    li $t4, 49
                    sw $t4, criptografia($t1)
                    j proximo2            
                    
                substA2:
                    li $t4, 49
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substr2:
                    li $t4, 50
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substR2:
                    li $t4, 50
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subste2:
                    li $t4, 51
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substE2:
                    li $t4, 51
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substo2:
                    li $t4, 52
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substO2:
                    li $t4, 52
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substm2:
                    li $t4, 53
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substM2:
                    li $t4, 53
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substh2:
                    li $t4, 54
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substH2:
                    li $t4, 54
                    sw $t4, criptografia($t1)
                    j proximo2
                
                substl2:
                    li $t4, 55
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substL2:
                    li $t4, 55
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substs2:
                    li $t4, 56
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substS2:
                    li $t4, 56
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substp2:
                    li $t4, 57
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                substP2:
                    li $t4, 57
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst02:
                    li $t4, 32
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst12:
                    li $t4, 65
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst22:
                    li $t4, 82
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst32:
                    li $t4, 69
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst42:
                    li $t4, 79
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst52:
                    li $t4, 77
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst62:
                    li $t4, 72
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst72:
                    li $t4, 76
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst82:
                    li $t4, 83
                    sw $t4, criptografia($t1)
                    j proximo2
                    
                subst92:
                    li $t4, 80
                    sw $t4, criptografia($t1)
                    j proximo2
            
                proximo2:
                    addi $t1, $t1, 4
                    addi $t3, $t3, 1
                    
                j loop2
        
            verif2:
                move $t1, $zero
                move $t3, $zero
                
            # Imprimindo a mensagem criptografada descriptografada
    
            la $a0, msg5
            li $v0, 4
            syscall
            
            fimMensagem2:
                beq $t3, $t2, fim
                li $v0, 11
                lb $a0, criptografia($t1)
                syscall
            
                addi $t1, $t1, 4
                addi $t3, $t3, 1
                j fimMensagem2
        
    fim:
        li $v0, 10
        syscall    