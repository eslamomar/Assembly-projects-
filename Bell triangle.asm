include 'emu8086.inc' 
    

    org 100h 
    DEFINE_SCAN_NUM

    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS 
    mov cx,0000h
   
    mov si,cx
    mov di,0000h
    mov ds,cx
    mov cx,1000
    mov es,cx
    mov cx,0000h
    mov dx,0000h
    mov ax,1
    mov bx,0000h
    mov cx,20
 
zz: mov es:[di],dx
    add dx,0002h
    add di,2
    loop zz 
    mov di,0000h
    mov dx,0000h
    call print_num
    jmp newline   

      
     
      
start:     mov [si],ax
           push si
           push bx
           push cx
           
           mov bx,es:[di]
           sub si,bx
           add ax,[si]
           
           pop cx
           pop bx
           pop si
           add si,2
           
           call print_num
           print ' '
            
       
          
          
          
          
          
          
          
          
           inc cx
           cmp cx,bx  
           jnz start
           jmp newline

  
  newline: cmp cx,dx
           jz aa
           add di,2
  aa:      mov cx,0000h
           push dx 
           push bx
           mov bx,ax  
           mov dx,13
           mov ah,2
           int 21h  
           mov dx,10
           mov ah,2
           int 21h
           mov ax,bx
           pop bx
           pop dx
           
           call print_num
           print ' '
           inc bx
           jmp start 
 finish:   NOP  
                
           
          