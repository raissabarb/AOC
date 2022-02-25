.data
 
    msg1: .asciiz "Bem-vindo a Loja de Computadores UNIFESP!\n"
    menu: .asciiz "\nEscolha a categoria de produtos:\n0 - Finalizar compra\n1 - Processador\n2 - Memoria interna\n3 - Memoria externa\n4 - Perifericos\n"
    opcDesej: .asciiz "\nDigite a opcao desejada: \n"
    
    primOpProces: .asciiz "Processadores:\n0 - Voltar\n1 - AMD Ryzen 7 4.2GHz (R$ 2150.50)\n2 - Intel Core i9 5.2GHz (R$ 3760.00)\n3 - Intel Core i7 3.8 GHz (R$ 2290.90)\n"
    segOpMemInt: .asciiz "Memoria interna:\n0 - Voltar\n1 - DDR5 16GB Kingstone (R$ 1299.90)\n"
    terOpMemExt: .asciiz "Memoria externa:\n0 - Voltar\n1 - HD de 2TB Seagate (R$ 440.00)\n2 - SSD de 1TB Seagate (R$ 720.00)\n"
    quarOpPerif: .asciiz "Perifericos:\n0 - Voltar\n1 - Mouse Dell (R$ 98.50)\n2 - Combo Teclado e Mouse Logitech (R$ 149.90)\n3 - Fone de Ouvido JBL (R$ 300.00)\n"
    
    escolhaProd: .asciiz "\nDigite o numero do modelo do produto desejado: "
    qtd: .asciiz "Digite a quantidade: "
    
    valUnit: .asciiz "\nValor unitario: "
    valTot: .asciiz "\nValor total: R$ "
    valTotPedido: .asciiz "Valor total do pedido: R$ "
    espaco: .asciiz "\n\n"
    
    prim: .float 2150.50
    seg: .float 3760.00
    terc: .float 2290.90
    quar: .float 1299.90
    quin: .float 440.00
    sext: .float 720.00
    setm: .float 98.50
    oit: .float 149.90
    non: .float 300.00
    zero: .float 0.0
    
    prim2: .asciiz "R$ 2150.50"
    seg2: .asciiz "R$ 3760.00"
    terc2: .asciiz "R$ 2290.90"
    quar2: .asciiz "R$ 1299.90"
    quin2: .asciiz "R$ 440.00"
    sext2: .asciiz "R$ 720.00"
    setm2: .asciiz "R$ 98.50"
    oit2: .asciiz "R$ 149.90"
    non2: .asciiz "R$ 300.00"
    
    proc1: .asciiz "x AMD Ryzen 7 4.2GHz"
    proc2: .asciiz "x Intel Core i9 5.2GHz"
    proc3: .asciiz "x Intel Core i7 3.8 GHz"
    memi1: .asciiz "x DDR5 16GB Kingstone"
    meme1: .asciiz "x HD de 2TB Seagate"
    meme2: .asciiz "x SSD de 1TB Seagate"
    perif1: .asciiz "x Mouse Dell"
    perif2: .asciiz "x Combo Teclado e Mouse Logitech"
    perif3: .asciiz "x Fone de Ouvido JBL"
    
    pedido: .asciiz "Pedido:\n\n" 
    
.text
 
    .globl main
    main: 
    
    move $t1, $zero
    move $t2, $zero
    move $t3, $zero
    move $t4, $zero
    move $t5, $zero
    move $t6, $zero
    move $t7, $zero
    move $t8, $zero
    move $t9, $zero
    
    la $a0, msg1
    li $v0, 4
    syscall
    
    menuPrincipal:
    
        # Imprimindo o primeiro menu
        la $a0, menu
        li $v0, 4
        syscall
        
        # Escolha dentre os produtos, no geral
        la $a0, opcDesej
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $t0, $v0   # primeira escolha
        
        beq $t0, 0, resultado    # Finalizacao forcada
        beq $t0, 1, processadores
        beq $t0, 2, memoriaInterna
        beq $t0, 3, memoriaExterna
        beq $t0, 4, perifericos
        
    processadores:
        la $a0, primOpProces
        li $v0, 4
        syscall
        
        la $a0, escolhaProd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0
        
        beq $s0, 0, menuPrincipal
        beq $s0, 1, somaAMD
        beq $s0, 2, somaInteli9
        beq $s0, 3, somaInteli7
        
    memoriaInterna:
        la $a0, segOpMemInt
        li $v0, 4
        syscall
        
        la $a0, escolhaProd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s1, $v0
        
        beq $s1, 0, menuPrincipal
        beq $s1, 1, somaDDR5
    
    memoriaExterna:
        la $a0, terOpMemExt
        li $v0, 4
        syscall
        
        la $a0, escolhaProd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s2, $v0
        
        beq $s2, 0, menuPrincipal
        beq $s2, 1, somaHD
        beq $s2, 2, somaSSD
        
    perifericos:
        la $a0, quarOpPerif
        li $v0, 4
        syscall
        
        la $a0, escolhaProd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s3, $v0
        
        beq $s3, 0, menuPrincipal
        beq $s3, 1, somaMouse
        beq $s3, 2, somaCombo
        beq $s3, 3, somaFone
        
    somaAMD:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0
        
        add $t1, $t1, $s0
      
        beq $zero, 0, menuPrincipal 
        
    somaInteli9:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0
        
        add $t2, $t2, $s0
      
        beq $zero, 0, menuPrincipal
        
    somaInteli7:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0
        
        add $t3, $t3, $s0
      
        beq $zero, 0, menuPrincipal
        
    somaDDR5:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s1, $v0
        
        add $t4, $t4, $s1
      
        beq $zero, 0, menuPrincipal
        
    somaHD:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s2, $v0
        
        add $t5, $t5, $s2
      
        beq $zero, 0, menuPrincipal
        
    somaSSD:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s2, $v0
        
        add $t6, $t6, $s2
      
        beq $zero, 0, menuPrincipal
        
    somaMouse:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s3, $v0
        
        add $t7, $t7, $s3
      
        beq $zero, 0, menuPrincipal
        
    somaCombo:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s3, $v0
        
        add $t8, $t8, $s3
      
        beq $zero, 0, menuPrincipal
        
    somaFone:
        la $a0, qtd
        li $v0, 4
        syscall
        
        li $v0, 5
        syscall
        move $s3, $v0
        
        add $t9, $t9, $s3
      
        beq $zero, 0, menuPrincipal
        
        
    resultado:   
        la $a0, pedido
        li $v0, 4
        syscall
    
        resultAMD:
            beq $t1, $zero, resulti9
        
            move $a0, $t1
            li $v0, 1
            syscall
        
            la $a0, proc1
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, prim2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t1, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, prim
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f20, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resulti9:
            beq $t2, $zero, resulti7
        
            move $a0, $t2
            li $v0, 1
            syscall
        
            la $a0, proc2
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, seg2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t2, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, seg
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f21, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
        
        resulti7:
            beq $t3, $zero, resultDDR5
        
            move $a0, $t3
            li $v0, 1
            syscall
        
            la $a0, proc3
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, terc2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t3, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, terc
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f22, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resultDDR5:
            beq $t4, $zero, resultHD
        
            move $a0, $t4
            li $v0, 1
            syscall
        
            la $a0, memi1
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, quar2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t4, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, quar
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f23, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resultHD:
            beq $t5, $zero, resultSSD
        
            move $a0, $t5
            li $v0, 1
            syscall
        
            la $a0, meme1
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, quin2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t5, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, quin
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f24, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resultSSD:
            beq $t6, $zero, resultMouse
        
            move $a0, $t6
            li $v0, 1
            syscall
        
            la $a0, meme2
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, sext2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t6, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, sext
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f25, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resultMouse:
            beq $t7, $zero, resultCombo
        
            move $a0, $t7
            li $v0, 1
            syscall
        
            la $a0, perif1
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, setm2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t7, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, setm
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f26, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resultCombo: 
            beq $t8, $zero, resutFone
        
            move $a0, $t8
            li $v0, 1
            syscall
        
            la $a0, perif2
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, oit2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t8, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, oit
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f27, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
            
        resutFone:
            beq $t9, $zero, fim
        
            move $a0, $t9
            li $v0, 1
            syscall
        
            la $a0, perif3
            li $v0, 4
            syscall
        
            la $a0, valUnit
            li $v0, 4
            syscall
            
            la $a0, non2
            li $v0, 4
            syscall
            
            la $a0, valTot
            li $v0, 4
            syscall
            
            mtc1 $t9, $f1 # Convertendo para float
            cvt.s.w $f1, $f1
            lwc1 $f2, non
            mul.s $f12, $f1, $f2
            li $v0, 2
            syscall
            
            mov.s $f28, $f12
            
            la $a0, espaco
            li $v0, 4
            syscall
        
    # Finalizando o programa
    
    fim:
        
        # Somando todos os valores para obter o total    
        
        add.s $f21, $f21, $f20
        add.s $f22, $f22, $f21
        add.s $f23, $f23, $f22
        add.s $f24, $f24, $f23
        add.s $f25, $f25, $f24
        add.s $f26, $f26, $f25
        add.s $f27, $f27, $f26
        add.s $f28, $f28, $f27
        mov.s $f12, $f28
            
        la $a0, valTotPedido
        li $v0, 4
        syscall
        
        li $v0, 2
        syscall
    
        li $v0, 10
        syscall
    