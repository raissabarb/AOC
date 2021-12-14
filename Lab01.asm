.data

    msg1: .asciiz "Dia invalido.\n"
    msg2: .asciiz "Mes invalido.\n"
    msg3: .asciiz "Ano invalido.\n"
    entrada1: .asciiz "Entre com o dia (DD): \n"
    entrada2: .asciiz "Entre com o mes (MM): \n"
    entrada3: .asciiz "Entre com o ano (AAAA): \n"
    saida: .asciiz "\nData de Nascimento: "
    traco: .asciiz "/"
    
.text

    .globl main
    main: 
    
    dia:
        # Pegando o dia   
        la $a0, entrada1
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $t0, $v0
        
        # Verificando o limite dos numeros
        blt $t0, 1, diaErrado
        bgt $t0, 31, diaErrado

    mes:
        # Pegando o mes
        la $a0, entrada2
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $t1, $v0
        
        # Verificando o limite dos numeros
        blt $t1, 1, mesErrado
        bgt $t1, 12, mesErrado
    
    ano:
        # Pegando o ano
        la $a0, entrada3
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $t2, $v0
        
        # Verificando o limite dos numeros
        blt $t2, 1900, anoErrado
        bgt $t2, 2021, anoErrado
    
    # Imprimindo a saida
    la $a0, saida
    li $v0, 4
    syscall
    
    # Caso t0 seja menor que dez o programa entra no if
    blt $t0, 10, impressaoDia
    li $v0, 1
    move $a0, $t0
    syscall
    
    la $a0, traco
    li $v0, 4
    syscall
    
    # Pulando a parte que coloca o zero no dia
    j continuacao1
        
    impressaoDia:
        # Colocando o zero antes dos numeros ate nove
        move $a0, $zero
        li $v0, 1
        syscall
        
        li $v0, 1
        move $a0, $t0
        syscall
        
        la $a0, traco
        li $v0, 4
        syscall
        
    continuacao1:
        # Caso t1 seja menor que dez o programa entra no if
        blt $t1, 10, impressaoMes
        li $v0, 1
        move $a0, $t1
        syscall
        
        la $a0, traco
        li $v0, 4
        syscall
        
        # Pulando a parte que coloca o zero no mes
        j impressaoAno
        
    impressaoMes:
        move $a0, $zero
        li $v0, 1
        syscall
        
        li $v0, 1
        move $a0, $t1
        syscall
        
        la $a0, traco
        li $v0, 4
        syscall
        
    impressaoAno:
        li $v0, 1
        move $a0, $t2
        syscall
        
    # Finalizando o programa
    li $v0, 10
    syscall
        
    diaErrado:
        la $a0, msg1
        li $v0, 4
        syscall    
        
        beq $zero, 0, dia
        
    mesErrado:
        la $a0, msg2
        li $v0, 4
        syscall    
        
        beq $zero, 0, mes
        
    anoErrado:
        la $a0, msg3
        li $v0, 4
        syscall    
        
        beq $zero, 0, ano