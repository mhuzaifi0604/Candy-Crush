;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@ GROUP MEMBERS @@@@@@@@@@@
;@@	Muhammad Huzaifa 20I-0604 @@@@
;@@	Faisal Subhani   20I-0955 @@@@
;@@	Ismail Ramzan 	 20I-0941 @@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Message Printer @@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

msg_printer macro string
	lea dx,string		;Macro for printing a specific message
	mov ah,09
	int 21h
endm

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@ Character Printer @@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

char_printer macro char
	mov dl,char
	mov ah,02
	int 21h				;Macro for printing any char in output
endm

.model small
.stack 100h

.data			;DATA SEGMENT

	str1 db "  __                   __     			",10,13,'$'
	str2 db " /    _. ._   _|      /   ._     _ |_  	",10,13,'$'
	str3 db " \__ (_| | | (_| \/   \__ |  |_|_> | | 	",10,13,'$'
	str4 db "                 /                   	",10,13,'$'
	msg db "WELCOME TO CANDY CRUSH$"
	msg2 db "Please Enter Your Name: $"
	msg3 db "Sr.No$"							;Printing
	msg4 db "Level$"							;Messages
	msg5 db "Press$"							;To
	msg6 db "Complexity$"						;Display
	msg7 db "Level1$"							;at
	msg8 db "Press1$"							;Random
	msg9 db "Easy$"								;Places
	msg10 db "Level2$"							;in
	msg11 db "Press2$"							;code
	msg12 db "Medium$"
	msg13 db "Level3$"
	msg14 db "Press3$"
	msg15 db "Complex$"
	string db "CANDY CRUSH$"
	string2 db "Choose Level: $"
	string3 db "Welcome to Level 01 Let's Begin!$"
	string4 db "Invalid Input Try Again$"
	string5 db "Rules$"
	string6 db "1- Swap the candies to get them crushed$"
	string7 db "2- If three candies match they get crushed$"
	string8 db "3- If 5 candies match they form a color bomb$"
	string9 db "Press Any Key To Continue $"
	file1 db 0ah,"Level 01: ",0ah
	file2 db "Level 02: ",0ah
	file3 db "Level 03: ",0ah
	file4 db "Total: ",0ah
	output1 db "Moves:  0$" ,0ah
	output2 db "Score:  0$",0ah
	output3 db "-------------$",0ah

	output_boder_x_axis dw 10D
	output_boder_y_axis dw 10D
	output_boder_width dw 20D
	output_boder_height dw 20D
	
	
	num db 1
	input dw 0
	input2 dw 0
	input3 dw 0
	arr db 49 dup(?)
    x dw 10
    y dw 40
    count dw 0 
    count2 dw 0
    count3 dw 0
    count4 dw 0
    tempx dw 0
    tempy dw 0
	array db 30 dup ('$')
	 xaxis  dw 40D    ; cx--> x-axis  ; For center add 6D
    yaxis  dw 30D    ;dx -> y-axis   ; For center add 7D
    widths  dw 141D
    height  dw 141D     ; the widths and the height of the shape
    middle    dw ?
    block_helper_var_1 dw ?
    block_helper_var_2 dw ?
    double_triangle_candy_initial_x_position dw 65D  ; cx--> x-axis
    double_triangle_candy_initial_y_position dw 57D  ;dx -> y-axis
    double_triangle_candy_width dw 8D
    double_triangle_candy_height dw 5D ; the width and the height of the shape
    double_triangle_middle_position dw ?

    color_bomb_x_axis dw 20D
    color_bomb_y_axis dw 20D
    color_bomb_width dw 6D
    color_bomb_height dw 1D
    
    lollipop_candy_x_axis dw 10D
    lollipop_candy_y_axis dw 60D
    lollipop_candy_width dw 7D
    lollipop_candy_height dw 6D
    lollipop_candy_leggy dw 5D

    butterfly_candy_x_axis dw 10D
    butterfly_candy_y_axis dw 80D
    butterfly_candy_width dw 6D   ; double of height
    butterfly_candy_height dw 3D ; half of width
    butterfly_candy_middle dw 5D
	fname db "User.txt"
	fhandle dw 0
	file db "User.txt"
	buffer dw 5000 dup ('$')
	
	x_dimention_swap dw 0
	y_dimention_swap dw 0
	swap_test db 0
	
.code					;CODE SEGMENT

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@ Main Procedure @@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

main proc

mov ax,@data
mov ds,ax
	
	mov ah,05h
	mov al,01h
	int 10h
	mov ah,06h
		mov al,0h	;scroll window set to 0
		mov bh,04h	;red foreground
		mov ch,0
		mov cl,0	;Setting dimensions
		mov dh,24
		mov dl,79
		int 10h
	mov cx,0
	.while(cx<10)
		call new_line
		inc cx
	.endw
	mov cx,5
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	mov cx,15
    .while(cx>0)
		char_printer ':'		;While loop to print spaces at start
		dec cx
	.endw
	mov cx,35
    .while(cx>0)
		char_printer '-'		;While loop to print spaces at start
		dec cx
		
	.endw
	mov cx,15
    .while(cx>0)
		char_printer ':'		;While loop to print spaces at start
		dec cx
	.endw
	call new_line
	mov cx,15
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	lea dx,str1
	mov ah,09
	int 21h
	mov cx,15
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	lea dx,str2
	mov ah,09
	int 21h
	mov cx,15
	.while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	lea dx,str3
	mov ah,09
	int 21h
	mov cx,15
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	lea dx,str4
	mov ah,09
	int 21h		; To next lines
	mov cx,5
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	mov cx,15
    .while(cx>0)
		char_printer ':'		;While loop to print spaces at start
		dec cx
	.endw
	mov cx,35
    .while(cx>0)
		char_printer '-'		;While loop to print spaces at start
		dec cx
		
	.endw
	mov cx,15
    .while(cx>0)
		char_printer ':'		;While loop to print spaces at start
		dec cx
	.endw
	call new_line
	call new_line
	mov cx,20
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
	msg_printer msg2
	mov bx,0
		.while(al!=13)
			mov ah,01
			mov [array+bx],al
			inc bx
			int 21h
		.endw
		mov cx,35
    .while(cx>0)
		char_printer '-'		;While loop to print spaces at start
		dec cx
	.endw
		mov ah,3ch
		mov cl,2
		mov dx,offset fname
		int 21h
		mov ah,3dh
		int 21h
		mov cx,lengthof array
		mov bx,ax
		mov dx,offset array
		mov ah,40h
		int 21h
		mov cx,lengthof file1
		mov dx,offset file1
		mov ah,40h
		int 21h
		mov cx,lengthof file2
		mov dx,offset file2
		mov ah,40h
		int 21h
		mov cx,lengthof file3
		mov dx,offset file3
		mov ah,40h
		int 21h
		mov cx,lengthof file4
		mov dx,offset file4
		mov ah,40h
		int 21h
		
		mov ah,05h
		mov al,02h			;Changing page for a new and better view
		int 10h
		
		mov ah,06h
		mov al,0h	;scroll window set to 0
		mov bh,05h	;red foreground
		mov ch,0
		mov cl,0	;Setting dimensions
		mov dh,24
		mov dl,79
		int 10h
		
		mov ah,02h
		mov cx,15
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
		mov cx,20
		.while(cx>0)
			char_printer '-'		;While loop to print spaces at start
			dec cx
		.endw
		call new_line
		mov cx,18
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
		mov cx,3
		.while(cx>0)
			char_printer ':'
			dec cx
		.endw
		lea dx,array
		mov ah,09
		int 21h
		mov cx,3
		.while(cx>0)
			char_printer ':'
				dec cx
		.endw
		call new_line
		mov cx,15
    .while(cx>0)
		call space		;While loop to print spaces at start
		dec cx
	.endw
		mov cx,20
		.while(cx>0)
			char_printer '-'		;While loop to print spaces at start
			dec cx
		.endw
		call new_line
		
		mov cx,0
		.while(cx<50)
		char_printer '-'
		inc cx
		.endw
		call new_line
		
		mov cx,15
        .while(cx>0)
			call space		;While loop to print spaces at start
			dec cx
		.endw

		mov cx,5
        .while(cx>0)
			char_printer ':'		;While loop to print spaces at start
			dec cx
		.endw
		
		msg_printer string5		;Rules
		
		mov cx,5
        .while(cx>0)
			char_printer ':'		;While loop to print spaces at start
			dec cx
		.endw

		call new_line
		mov cx,0
		.while(cx<50)
		char_printer '-'
		inc cx
		.endw
		call new_line
		call new_line

		msg_printer string6			;Ruke # 01
		call new_line
		call new_line
		mov cx,0
		.while(cx<50)
		char_printer '-'
		inc cx
		.endw
		call new_line
		call new_line
		msg_printer string7			;Printing rules for game		// Rule # 02
		call new_line
		call new_line
		mov cx,0
		.while(cx<50)
		char_printer '-'
		inc cx
		.endw
		call new_line
		call new_line
		msg_printer string8				;Rule # 03
		call new_line
		call new_line
		mov cx,0
		.while(cx<50)
		char_printer '-'
		inc cx
		.endw
		call new_line
		call new_line
		mov cx,0
		.while(cx<20)
		call space
		inc cx
		.endw
		msg_printer string9			;Taking input from user if he agrees or not
		mov ah,01
		int 21h
			jmp next_page
		
		next_page:
		mov ah,05
		mov al,03		;Moving to the next page
		int 10h
			
		mov ah,06h
		mov al,0h	;scroll window set to 0
		mov bh,02h	;green foreground
		mov ch,0
		mov cl,0	;Setting dimensions
		mov dh,24
		mov dl,79
		int 10h
		
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'
		mov cx,11
		.while(cx>0)
			char_printer '-'			;Printing 
			dec cx						;	|
		.endw							;Hyphens
										;	|
		msg_printer string				;&
		mov cx,11						;colons
		.while(cx>0)					;for|
			char_printer '-'			;	|
			dec cx						;code beauty
		.endw
		
		char_printer ':'
		call new_line
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'

		mov cx,33
		.while(cx>0)
			char_printer '-'			;Printing hyphen (-) 30 times
			dec cx
		.endw
		char_printer ':'
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'
		call space
		msg_printer msg3
		call space
		call space
		msg_printer msg4
		call space			;Printing messages with spaces
		call space
		msg_printer msg5
		call space			;# Output Beauty
		call space
		msg_printer msg6
		call space
		char_printer ':'
		call new_line
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'
		
		mov cx,33
		.while(cx>0)
			char_printer '-';Again Printing Hyphens for 30 times
			dec cx
		.endw
		char_printer ':'
		call new_line
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'
		call space
		mov dl,num
		add dl,30h
		mov ah,02	;Printing Serial Numbers for levels
		int 21h
		inc num
		
		mov cx,5
		.while(cx>0)
			call space;Printing space
			dec cx
		.endw
		
		msg_printer msg7
		call space
		call space
		msg_printer msg8
		call space		;Printing messages with spaces
		call space
		msg_printer msg9
		call space
		call space
		char_printer ':'
		call new_line
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'
		call space
		
		mov dl,num
		add dl,30h			;Printing Serial Numbers for levels
		mov ah,02
		int 21h
		inc num
		mov cx,5
		.while(cx>0)
			call space;Printing space
			dec cx
		.endw
		
		msg_printer msg10
		call space
		call space
		msg_printer msg11
		call space				;Printing messages with spaces
		call space
		msg_printer msg12
		call space
		call space
		char_printer ':'
		call new_line
		call new_line
		mov cx,0
		.while cx<20
			call space
			inc cx
		.endw
		char_printer ':'			;calling newline function
		call space
		
		mov dl,num
		add dl,30h
		mov ah,02
		int 21h
		inc num
		mov cx,5
		.while(cx>0)
			call space;Printing space
			dec cx
		.endw
		msg_printer msg13
		call space
		call space
		msg_printer msg14			;Printing messages with spaces
		call space
		call space
		msg_printer msg15
		call space
		call space
		char_printer ':'
		call new_line	
		call new_line
mov cx,0
		.while cx<20
			call space
			inc cx
		.endw		;printing spaces and colons
		char_printer ':'
		mov cx,33
		.while(cx>0)
			char_printer '-'		;Pinting Ending Hyphens
			dec cx
		.endw
		
		char_printer ':'
		call new_line
		call new_line
		again:
		mov cx,0
		.while cx<30
		call space
		inc cx
		.endw
		msg_printer string2
		mov ah,01
		int 21h
		
		.if(al==49)		;conditions for level choosage
			jmp grid_page
		.elseif (al== 50)
		jmp ismail
		.elseif (al==51)
		jmp level_3
		.else
			call new_line					;else if choice is neither of three then getting iout again
			msg_printer string4
			call new_line
			jmp again
		.endif
		
		grid_page:
		mov ah,05
		mov al,04			;Moving onto the next page
		int 10h
		
	;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    ;FILLING THE BOARD WITH RANDOM VALUES FROM 0~3
    ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    mov si, offset arr
    mov ax, 0
    mov count, 0
    .while count<=49
        mov byte ptr [si], al
        inc ax
        .if ax==3
            mov ax, 0			;filling the board with values
        .endif					;between 0 & 2
        inc count				;cause we've made a total of three candies
        inc si
    .endw
	
    ;initialising video 
    mov ah, 00h
    mov al, 13
    int 10h; 

    ;setting background color
    mov ah, 0bh
    mov bh, 00h
    mov bl, 0h;
    int 10h
	
	
    call grid
	mov cx,0
	.while cx<20
		call space
		inc cx
	.endw
	lea dx,msg7
	mov ah,09
	int 21h	
	call new_line
	lea dx,array
	mov ah,09
	int 21h
	mov ah,4ch
	int 21h
	
	
	ismail:
						 mov   ah,00h
                         mov   al,13h
                         int   10h
                         ;set background color
                          mov   ah,0bh
                         mov   bh,00h
                         mov   bl,09h
                         int   10h

                         ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis
                            ; call color_bomb_candy
                         draw_horizaontal_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,08h
                         mov   bh,00h
                         int   10H
                         inc   CX                      
                         mov   ax,CX
                         sub   ax,xaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < widths)
                         jmp   draw_horizaontal_lines
                         .ENDW
                        ;Reset the Position of the x-axis
                         mov   cx,xaxis
                        ; Now move to the next columns..
                         add   Dx,20D
                         mov   ax,Dx
                         sub   ax,yaxis
                         ; Stop drawing when u reach the Particular Height..
                        .WHILE(ax < height)
                         jmp   draw_horizaontal_lines
                         .ENDW


                        ; Now drawing the Vertical Lines...
                          ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis

                         draw_vertical_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,08h
                         mov   bh,00h
                         int   10H
                         inc   DX                      
                         mov   ax,DX
                         sub   ax,yaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < height)
                         jmp   draw_vertical_lines
                         .ENDW
                         ; move cx..Further
                         add cx,20D
                         ;dx will be the same Position
                         mov dx,yaxis
                        mov ax,cx
                        sub ax,xaxis
                          .WHILE (ax < widths)
                         jmp   draw_vertical_lines
                         .ENDW

                        ; Now grid has been made..
                        ; let's block the GRIDs..
                        ; BLOCKING THE FIRST col....                        
                        mov block_helper_var_2,30D
                        .WHILE(block_helper_var_2 <= 150D)
                        mov block_helper_var_1,40D
                        call block_proc
                        .if((block_helper_var_2 != 50D && block_helper_var_2 != 90D))
                        add block_helper_var_2,20D
                        .else
                        add block_helper_var_2,40D
                        .endif
                        .ENDW
                        ; blocking the Last rcol
                        mov block_helper_var_2,30D
                        .WHILE(block_helper_var_2 <= 150D)
                        mov block_helper_var_1,160D
                        call block_proc
                        .if((block_helper_var_2 != 50D && block_helper_var_2 != 90D))
                        add block_helper_var_2,20D
                        .else
                        add block_helper_var_2,40D
                        .endif
                        .ENDW

                        ; Now blocking the Third Column..
                        mov block_helper_var_1,100D
                        mov block_helper_var_2,30D
                        call block_proc
                        
                        mov block_helper_var_1,100D
                        mov block_helper_var_2,150D
                        call block_proc
                        ; drawing the candy
                        ;call double_triangle_candy
                        
                       ; call color_bomb_candy

                      ;  call lollipop_candy
                     ;   call butterfly_candy
                      ;   call color_bomb_candy
                        ;Populate the Grid...
                        ; 40D,30D -- 1x1

                        

                        mov double_triangle_candy_initial_x_position,46D
                        mov double_triangle_candy_initial_y_position,20D
                      
                        
                        mov si, offset arr
                        mov di,1d
                        .while(di <= 49d)
                            add double_triangle_candy_initial_y_position,20D
                            ;gENERATE THE random Numbers,,,
                            mov ah,2ch
                            int 21h
                            ;int  1Ah    ; TIME - Get System time
                            ; CX:DX = number of clock ticks since midnight
                                ;  AL = midnight flag
                            mov ax,0
                            add dx,di
                            add dx,double_triangle_candy_initial_x_position
                            mov al,Dl
                            
                            mov bl,4D
                            div bl
							
                            ; Now add the data to the array
                           ; mov [si],ah
                            add di,1D
							mov [si],ah
                            inc si
							
                            ;Specifying only avaliable..
                            .if(!(di == 1D || di == 2D || di == 3D|| di == 5D || di == 7D || di == 8D ||di == 23D || di == 29D || di == 44D || di == 45D || di == 47D || di == 49D  || di == 50D))
                                .if(ah == 0D)
                                        call double_triangle_candy                            
                                .ELSEIF(ah == 1D)
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov lollipop_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov lollipop_candy_y_axis,bx
                                        call lollipop_candy
                                .ELSEIF(ah == 2D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov butterfly_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov butterfly_candy_y_axis,bx
                                        call butterfly_candy
                                .ELSEIF(ah == 3D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        add bx,2D
                                        mov color_bomb_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        sub bx,5d
                                        mov color_bomb_y_axis,bx
                                        call color_bomb_candy
                                .endif
                            .endif
                            .if(di == 8D || di == 15D || di == 22d || di == 29d ||  di == 36d || DI == 43D)
                                add double_triangle_candy_initial_x_position,20D
                                mov double_triangle_candy_initial_y_position,20D
                            .endif
                        .endw



                        ; Now al, contains the Remainder... %3 so 0,1,2 or 3

                        
                      ;************PRINT THE SCORE AND LEVEL IN THE SCREEN
					
					 ; let's make the border
					 ;border_horizontal:
					; drawing a pixel
					
						; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
						;mov ax,CX 
						;sub ax,output_boder_x_axis
						;.while (ax < output_boder_width)
						;jmp border_horizontal 
						;.endw 
					
						 mov ah,02
					  mov al,05h
					  mov bh,00
					  mov dh,3
					  mov dl,27
					  int 10h
					 
					  lea dx,offset output3
					  mov ah,09
					  int 21h
					
					  mov ah,02
					  mov al,05h
					  mov bh,00
					  mov dh,5
					  mov dl,30
					  int 10h
					 
					  lea dx,offset array
					  mov ah,09
					  int 21h
					  
					  
					   mov ah,02
					  mov bh,00
					  mov dh,8
					  mov dl,30
					  int 10h
					  
					  
					  lea dx,offset output1
					  mov ah,09
					  int 21h
					  
					  
					   mov ah,02
					  mov bh,00
					  mov dh,11
					  mov dl,30
					  int 10h
					  
					  lea dx,offset output2
					  mov ah,09
					  int 21h
                         mov ah,02
					  mov bh,0
					  mov dh,13
					  mov dl,27
					  int 10h
						
					lea dx,offset output3
					mov ah,09
					int 21h
					
                      ;  jmp fill_the_board
                       ; .ENDW


                        ; This code check's when the Left key of the Mouse if Pressed
                        left_key_pressed:
                        again1:
                        ; get draw info
                        mov ax,5
                        mov bx,0
                        int 33h
                        cmp ax,1
                        jne again1

                        ; setting the Mouse Position..
                      ; mov ax,04h
                     ;   mov cx,50D
                     ;   mov dx,30D
                        ;mov cx,0
                        ;mov dx,0
                       ; mov ax,03  
                       ; mov ax,20h
                       ; int 33h
                       ; mov ax,01h
                       ; int 33h

                        
                     ;    mov cx,0
                     ;   mov dx,0

                       mov ax,03  
                       int 33h

                        ; Perform anything in here..
                        ; we have the x-corrdinates and Y-corrdinates...
                      mov ax,01h
                        int 33h
                     
                        ;sub cx,120D
                        ; Important CODE for Exact Mouse Positions..!!
                       ; mov dx,0
                        mov ax,CX
                        mov bl,2
                        div bl
                        add ax,0                
                        mov cx,ax

                         

                        .if((cx >= 00D) && (cx <= 320D))
                        ; Iniside the Board
                            ;1) find the Box where the Button is Pressed
                                .if( (cx >= 40D) && (cx <= 60D))
                                    .if((dx >= 30D) && (dx<=50D))
                                    mov   ah,0ch
                                    mov   al,05h
                                    mov   bh,00h
                                    int   10H
                                    .endif
									.if((dx >= 50D) && (dx<=70D))
                                    mov   ah,0ch
                                    mov   al,05h
                                    mov   bh,00h
                                    int   10H
                                    .endif
									.if((dx >= 70D) && (dx<=90D))
										;mov al,byte ptr [arr+3]
										
									
		
											mov si,offset arr
											add si,2d
															
											mov al,1D
											mov x_dimention_swap,50D
											mov y_dimention_swap,80D
											mov swap_test,al
											mov [si],al
											call swap_it
											mov ah,05
											mov al,07h
											int 10h
										call make_the_border
										mov double_triangle_candy_initial_x_position,46D
										mov double_triangle_candy_initial_y_position,20D
										call populate_the_grid
									                   
									
										
										
                                    .endif
									
                                    ; drawing a pixel
                                
                                    
                                
                                .ELSEIF( (cx >= 60D) && (cx <= 80D))
                                ; drawing a pixel
                            
                                mov   ah,0ch
                                mov   al,02
                                mov   bh,00h
                                int   10H
                            
                                .ELSEIF( (cx >= 80D) && (cx <= 100D))
                                ; drawing a pixel
                            
                                mov   ah,0ch
                                mov   al,0fh
                                mov   bh,00h
                                int   10H
                                
                                .ELSEIF( (cx >= 100D) && (cx <= 120D))
                                ; drawing a pixel
                            
                                mov   ah,0ch
                                mov   al,04h
                                mov   bh,00h
                                int   10H

                                .ELSEIF( (cx >= 120D) && (cx <= 140D))
                                ; drawing a pixel
                            
                                mov   ah,0ch
                                mov   al,07h
                                mov   bh,00h
                                int   10H

                                .ELSEIF( (cx >= 140D) && (cx <= 160D))
                                ; drawing a pixel
                            
                                mov   ah,0ch
                                mov   al,08h
                                mov   bh,00h
                                int   10H
                                .ELSE
                                mov   ah,0ch
                                mov   al,10h
                                mov   bh,00h
                                int   10H
                                .endif 

                            
                          ;2) Remove the Candy from that Box
                          ;3) Check where the User has made Movement
                          ;4) Move the removed candy to that new Box
                          ;5) Bring the old candy to the new Box...
                          ;6) Check if there  is some crush
                          ; 7) if there is then do bubble
                          ; 8) else remove the above steps and move the candy back's 
                        .endif

                        cmp cx,9999D
                        jne left_key_pressed

                        MOV   AH,4ch
                        int   21h
						
		level_3:
						 mov   ah,00h
                         mov   al,13h
                         int   10h
                         ;set background color
                          mov   ah,0bh
                         mov   bh,00h
                         mov   bl,09h
                         int   10h

                         ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis
                            ; call color_bomb_candy
                         draw_horizaontal_lines_one:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,08h
                         mov   bh,00h
                         int   10H
                         inc   CX                      
                         mov   ax,CX
                         sub   ax,xaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < widths)
                         jmp   draw_horizaontal_lines_one
                         .ENDW
                        ;Reset the Position of the x-axis
                         mov   cx,xaxis
                        ; Now move to the next columns..
                         add   Dx,20D
                         mov   ax,Dx
                         sub   ax,yaxis
                         ; Stop drawing when u reach the Particular Height..
                        .WHILE(ax < height)
                         jmp   draw_horizaontal_lines_one
                         .ENDW


                        ; Now drawing the Vertical Lines...
                          ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis

                         draw_vertical_lines_one:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,08h
                         mov   bh,00h
                         int   10H
                         inc   DX                      
                         mov   ax,DX
                         sub   ax,yaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < height)
                         jmp   draw_vertical_lines_one
                         .ENDW
                         ; move cx..Further
                         add cx,20D
                         ;dx will be the same Position
                         mov dx,yaxis
                        mov ax,cx
                        sub ax,xaxis
                          .WHILE (ax < widths)
                         jmp   draw_vertical_lines_one
                         .ENDW



						   ; Now grid has been made..
                        ; let's block the GRIDs..
                        ; BLOCKING THE FIRST col....                        
                        mov block_helper_var_2,30D
                        .WHILE(block_helper_var_2 <= 150D)
                        mov block_helper_var_1,100D
                        call block_proc
                        add block_helper_var_2,20D
                        .ENDW
						
						  mov block_helper_var_1,40D
                        .WHILE(block_helper_var_1 <= 170D)
                        mov block_helper_var_2,90D
                        call block_proc
                        add block_helper_var_1,20D
                        .ENDW
						
						
                        mov double_triangle_candy_initial_x_position,46D
                        mov double_triangle_candy_initial_y_position,20D
                      
                        
                        mov si, offset arr
                        mov di,1d
                        .while(di <= 49d)
                            add double_triangle_candy_initial_y_position,20D
                            ;gENERATE THE random Numbers,,,
                            mov ah,2ch
                            int 21h
                            ;int  1Ah    ; TIME - Get System time
                            ; CX:DX = number of clock ticks since midnight
                                ;  AL = midnight flag
                            mov ax,0
                            add dx,di
                            add dx,double_triangle_candy_initial_x_position
                            mov al,Dl
                            
                            mov bl,4D
                            div bl
							
                            ; Now add the data to the array
                           ; mov [si],ah
                            add di,1D
							mov [si],ah
                            inc si
							
                            ;Specifying only avaliable..
                            .if(!(di == 5D || di == 12D || di == 19D || di == 23D || di == 24D || di == 25D ||di == 26D ||di == 27D ||di == 28D ||di == 29D|| di == 33D || di == 40D || di == 47D)) 
                                .if(ah == 0D)
                                        call double_triangle_candy                            
                                .ELSEIF(ah == 1D)
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov lollipop_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov lollipop_candy_y_axis,bx
                                        call lollipop_candy
                                .ELSEIF(ah == 2D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov butterfly_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov butterfly_candy_y_axis,bx
                                        call butterfly_candy
                                .ELSEIF(ah == 3D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        add bx,2D
                                        mov color_bomb_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        sub bx,5d
                                        mov color_bomb_y_axis,bx
                                        call color_bomb_candy
                                .endif
                            .endif
                            .if(di == 8D || di == 15D || di == 22d || di == 29d ||  di == 36d || DI == 43D)
                                add double_triangle_candy_initial_x_position,20D
                                mov double_triangle_candy_initial_y_position,20D
                            .endif
                        .endw

                       
                      
                        ; drawing the candy

		exit:
		mov ah,4ch		;Code For terminating terminal
		int 21h
		
main endp			;Ending main procedure

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@ CREATING GRID @@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
grid proc uses si ax bx cx dx
    mov ah, 0ch ;writing a pixel
    mov al, 05h ;setting color of pixel
    mov bh, 0 
	
    mov x, 10

    mov cx, x
    mov count, 0
    .while count<=7			;loop runs until 07 vertical lines 
        mov dx, y			;	|
        .while dx!=180		;of length 180
            int 10h;		;	|
            inc dx			;are not drawn
        .endw
        inc count
        add cx, 20		;addition in cx for moving towards the next line
    .endw
mov al,04h
    mov dx, y
    mov count, 0
    .while count<=7
        mov cx, x
        .while cx!=150			;Its the same processs
            int 10h;			;	|
            inc cx				; but this time 
        .endw			;for horizontal lines

		inc count
        add dx, 20
    .endw

    ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    ;FILLING THE BOARD WITH CANDIES
    ;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
	
	
    mov si, offset arr
    mov cx, x
    mov dx, y			;moving array,x & y values to relevant registers
    mov count3, 0
    .while count3<49
        mov ax, [si]
        .if al==0
            call square		;if number at that place is 0 then square candy gets printed
        .elseif al==1
            call rectangle; if number atthat place is 1 then triangle candy gets printed
        .else 
            call triangle	; otherwise rectangle candy gets printed
        .endif
        add cx, 20			;addition in cx to move tp the next block of grid
        mov ax, count3
        inc ax
        mov bx, 7			; filling all 7 blocks of a row
        div bl
        .if ah==0
            add dx, 20		;moving towards the 2nd row
            mov cx, 10		;start of the 2nd row
        .endif
        inc count3
        inc si
    .endw

    ret
grid endp
;@@@@@@@@@@@@@@@@@@@@@@@@2
; Popu;ate the grid using the array
;@@@@@@@@@@@@@@@@@@@@@@@@

populate_the_grid proc uses ax bx cx dx si di
						mov si, offset arr
                        mov di,1d
                        .while(di <= 49d)
                            add double_triangle_candy_initial_y_position,20D
                            ;gENERATE THE random Numbers,,,
                           
						   mov ah,[si]
							
                            ; Now add the data to the array
                           ; mov [si],ah
                            add di,1D
							;mov [si],ah
                            inc si
							
                            ;Specifying only avaliable..
                            .if(!(di == 1D || di == 2D || di == 3D|| di == 5D || di == 7D || di == 8D ||di == 23D || di == 29D || di == 44D || di == 45D || di == 47D || di == 49D  || di == 50D))
                                .if(ah == 0D)
                                        call double_triangle_candy                            
                                .ELSEIF(ah == 1D)
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov lollipop_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov lollipop_candy_y_axis,bx
                                        call lollipop_candy
                                .ELSEIF(ah == 2D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        mov butterfly_candy_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        mov butterfly_candy_y_axis,bx
                                        call butterfly_candy
                                .ELSEIF(ah == 3D)
                                        mov bx,0
                                        mov bx,double_triangle_candy_initial_x_position
                                        add bx,2D
                                        mov color_bomb_x_axis,bx
                                        mov bx,double_triangle_candy_initial_y_position
                                        sub bx,5d
                                        mov color_bomb_y_axis,bx
                                        call color_bomb_candy
                                .endif
								
								
                            .endif
                            .if(di == 8D || di == 15D || di == 22d || di == 29d ||  di == 36d || DI == 43D)
                                add double_triangle_candy_initial_x_position,20D
                                mov double_triangle_candy_initial_y_position,20D
                            .endif
                        .endw

ret
populate_the_grid endp
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; Make the BORDERS

;@@@@@@@@@@@@@@@@@@@@@@@@@@

make_the_border proc uses ax bx cx dx si di

						
						 mov ah,00h
						 mov al,13h
						 int 10h
                         mov   ah,0bh
                         mov   bh,00h
                         mov   bl,09h
                         int   10h

                         ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis
                            ; call color_bomb_candy
                         draw_horizaontal_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,09h
                         mov   bh,00h
                         int   10H
                         inc   CX                      
                         mov   ax,CX
                         sub   ax,xaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < widths)
                         jmp   draw_horizaontal_lines
                         .ENDW
                        ;Reset the Position of the x-axis
                         mov   cx,xaxis
                        ; Now move to the next columns..
                         add   Dx,20D
                         mov   ax,Dx
                         sub   ax,yaxis
                         ; Stop drawing when u reach the Particular Height..
                        .WHILE(ax < height)
                         jmp   draw_horizaontal_lines
                         .ENDW


                        ; Now drawing the Vertical Lines...
                          ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis

                         draw_vertical_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,09h
                         mov   bh,00h
                         int   10H
                         inc   DX                      
                         mov   ax,DX
                         sub   ax,yaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < height)
                         jmp   draw_vertical_lines
                         .ENDW
                         ; move cx..Further
                         add cx,20D
                         ;dx will be the same Position
                         mov dx,yaxis
                        mov ax,cx
                        sub ax,xaxis
                          .WHILE (ax < widths)
                         jmp   draw_vertical_lines
                         .ENDW

                        ; Now grid has been made..
                        ; let's block the GRIDs..
                        ; BLOCKING THE FIRST col....                        
                        mov block_helper_var_2,30D
                        .WHILE(block_helper_var_2 <= 150D)
                        mov block_helper_var_1,40D
                        call block_proc
                        .if((block_helper_var_2 != 50D && block_helper_var_2 != 90D))
                        add block_helper_var_2,20D
                        .else
                        add block_helper_var_2,40D
                        .endif
                        .ENDW
                        ; blocking the Last rcol
                        mov block_helper_var_2,30D
                        .WHILE(block_helper_var_2 <= 150D)
                        mov block_helper_var_1,160D
                        call block_proc
                        .if((block_helper_var_2 != 50D && block_helper_var_2 != 90D))
                        add block_helper_var_2,20D
                        .else
                        add block_helper_var_2,40D
                        .endif
                        .ENDW

                        ; Now blocking the Third Column..
                        mov block_helper_var_1,100D
                        mov block_helper_var_2,30D
                        call block_proc
                        
                        mov block_helper_var_1,100D
                        mov block_helper_var_2,150D
                        call block_proc
                        ; drawing the candy



ret
make_the_border endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; ### Swap test #######
;@@@@@@@@@@@@@@@@@@@@@@@@@
swap_it proc uses ax bx cx dx di si

										.if(swap_test == 0D)
										mov ax,x_dimention_swap
										mov bx,y_dimention_swap
										mov double_triangle_candy_initial_x_position,ax
										mov double_triangle_candy_initial_y_position,bx
										call double_triangle_candy
										.endif
										.if(swap_test == 1D)
										mov ax,x_dimention_swap
										mov bx,y_dimention_swap
										mov lollipop_candy_x_axis,ax
										mov lollipop_candy_y_axis,bx
										call lollipop_candy
										.endif
										.if(swap_test == 2D)
										mov ax,x_dimention_swap
										mov bx,y_dimention_swap
										mov butterfly_candy_x_axis,ax
										mov butterfly_candy_y_axis,bx
										call butterfly_candy
										.endif
										.if(swap_test == 3D)
										mov ax,x_dimention_swap
										mov bx,y_dimention_swap
										mov color_bomb_x_axis,ax
										mov color_bomb_y_axis,bx
										call color_bomb_candy
										.endif

ret
swap_it endp


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@ Level 3 Grid @@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

grid3 proc uses ax bx cx dx

MOV   CX, xaxis
                         mov   Dx, yaxis
                            ; call color_bomb_candy
                         draw_horizaontal_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,09h
                         mov   bh,00h
                         int   10H
                         inc   CX                      
                         mov   ax,CX
                         sub   ax,xaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < widths)
                         jmp   draw_horizaontal_lines
                         .ENDW
                        ;Reset the Position of the x-axis
                         mov   cx,xaxis
                        ; Now move to the next columns..
                         add   Dx,20D
                         mov   ax,Dx
                         sub   ax,yaxis
                         ; Stop drawing when u reach the Particular Height..
                        .WHILE(ax < height)
                         jmp   draw_horizaontal_lines
                         .ENDW


                        ; Now drawing the Vertical Lines...
                          ; Defining the initial Positions
                         MOV   CX, xaxis
                         mov   Dx, yaxis

                         draw_vertical_lines:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,09h
                         mov   bh,00h
                         int   10H
                         inc   DX                      
                         mov   ax,DX
                         sub   ax,yaxis
                                                  ;Stop creating Line with reaches the a Particular X-axis Position
                         .WHILE (ax < height)
                         jmp   draw_vertical_lines
                         .ENDW
                         ; move cx..Further
                         add cx,20D
                         ;dx will be the same Position
                         mov dx,yaxis
                        mov ax,cx
                        sub ax,xaxis
                          .WHILE (ax < widths)
                         jmp   draw_vertical_lines
                         .ENDW
			ret
grid3 endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@Function for blocking grid blocks@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

block_proc proc
                         MOV   CX, block_helper_var_1
                        mov   Dx, block_helper_var_2

                         block_vertical_first_block:
                         ; drawing a pixel
                         mov   ah,0ch
                         mov   al,08h
                         mov   bh,00h
                         int   10H
                         inc   CX                      
                         mov   ax,CX
                         sub   ax,block_helper_var_1

                         .WHILE (ax < 20D)
                         jmp   block_vertical_first_block
                         .ENDW                    

                        inc dx
                        mov cx,block_helper_var_1
                        mov ax,dx
                        sub ax,block_helper_var_2
                        .WHILE(ax < 20D)
                        jmp block_vertical_first_block
                        .ENDW

ret
block_proc endp


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@Function for butterfly candy@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


butterfly_candy proc uses di ax bx cx dx 
  ; Defining the initial Positions
MOV CX, butterfly_candy_x_axis
mov Dx,butterfly_candy_y_axis

butterfly_candy_horizontal:
    ; drawing a pixel
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H
    inc CX ; increase the x-axis
    ; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
    mov ax,CX 
    sub ax,butterfly_candy_x_axis
    .while (ax <= butterfly_candy_width)
    jmp butterfly_candy_horizontal 
    .endw 
    
    mov cx,butterfly_candy_x_axis
    mov dx,butterfly_candy_y_axis
butterfly_candy_left_first_tilt:
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H 
    inc cx
    inc dx
    mov ax,CX 
    sub ax,butterfly_candy_x_axis
    .while (ax <= butterfly_candy_height)
    jmp butterfly_candy_left_first_tilt 
    .endw 
    ;changing x-axis and y-axis position..
    mov di,butterfly_candy_x_axis
    mov butterfly_candy_x_axis,cx
    mov butterfly_candy_y_axis,dx
butterfly_candy_right_first_tilt:
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H 
    inc cx
    dec dx
    mov ax,CX 
    sub ax,butterfly_candy_x_axis
    .while (ax <= butterfly_candy_height)
    jmp butterfly_candy_right_first_tilt 
    .endw 

    
    mov cx,butterfly_candy_x_axis
    mov dx,butterfly_candy_y_axis
    butterfly_candy_right_second_tilt:
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H 
    inc cx
    inc dx
    mov ax,CX 
    sub ax,butterfly_candy_x_axis
    .while (ax <= butterfly_candy_height)
    jmp butterfly_candy_right_second_tilt 
    .endw 

    mov si,butterfly_candy_x_axis
    sub si,butterfly_candy_height
   ; add si,2D
    mov cx,butterfly_candy_x_axis
    mov dx,butterfly_candy_y_axis
     butterfly_candy_straight_second_tilt:
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H 
    dec cx
    inc dx
    mov ax,CX 
    sub ax,si
    mov butterfly_candy_x_axis,cx
    mov butterfly_candy_y_axis,dx
    .while (ax <= butterfly_candy_width )
    jmp butterfly_candy_straight_second_tilt 
    .endw 


    mov cx,di
    mov dx,butterfly_candy_y_axis
    draw_straight_final_line:
    mov ah,0ch
    mov al,0ah
    mov bh,00h
    int 10H 
    inc cx
     mov ax,CX 
    sub ax,di
    .while (ax <= butterfly_candy_width)
    jmp draw_straight_final_line 
    .endw 
   
ret
butterfly_candy endp


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@Function for lollipop Candy@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


lollipop_candy proc
; Defining the initial Positions
MOV CX, lollipop_candy_x_axis
mov Dx,lollipop_candy_y_axis

lollipop_candy_horizontal:
    ; drawing a pixel
    mov ah,0ch
    mov al,04h
    mov bh,00h
    int 10H
    inc CX ; increase the x-axis
    ; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
    mov ax,CX 
    sub ax,lollipop_candy_x_axis
    .while (ax < lollipop_candy_width)
    jmp lollipop_candy_horizontal 
    .endw

    inc dx
    mov cx,lollipop_candy_x_axis
    mov ax,Dx
    sub ax,lollipop_candy_y_axis
    .while (ax < lollipop_candy_height)
    jmp lollipop_candy_horizontal 
    .endw

    ;Drawing the Leg of the Lollipop candy..
    mov lollipop_candy_y_axis,dx
    add cx,3D
    lollipop_candy_leg:
     mov ah,0ch
    mov al,06h
    mov bh,00h
    int 10H
    inc dx
    mov ax,dx
    sub ax,lollipop_candy_y_axis
    
    .while(ax < lollipop_candy_leggy)
    jmp lollipop_candy_leg
    .endw

ret
lollipop_candy endp


;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@ Function for Color Bomb @@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



color_bomb_candy proc uses ax bx cx dx di si 
; Defining the initial Positions

mov si,color_bomb_width
.while(si != 12D)
    MOV CX, color_bomb_x_axis
    mov Dx,color_bomb_y_axis
    mov al,04h
    draw_lollipop_horizontal:
        ; drawing a pixel
        mov ah,0ch
        ;mov al,04h
        mov bh,00h
        int 10H
        inc CX ; increase the x-axis
        ; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
        mov ax,CX 
        sub ax,color_bomb_x_axis
        .while (ax < color_bomb_width)
        jmp draw_lollipop_horizontal 
        .endw

        add dx,1
        mov cx,color_bomb_x_axis
        mov ax,Dx
        sub ax, color_bomb_y_axis
        .while(ax < color_bomb_height)
        jmp draw_lollipop_horizontal
        .endw
        add si,2D
     ;   add dx,1D
      sub color_bomb_x_axis,1D
        add color_bomb_y_axis,2D  
        add color_bomb_width,2D
        inc al
    .endw

    mov si,6D
.while(si != 14D)
    MOV CX, color_bomb_x_axis
    mov Dx,color_bomb_y_axis
    mov al,01h
    draw_lollipop_horizontal_1:
        ; drawing a pixel
        mov ah,0ch
        
        mov bh,00h
        int 10H
        inc CX ; increase the x-axis
        ; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
        mov ax,CX 
        sub ax,color_bomb_x_axis
        .while (ax < color_bomb_width)
        jmp draw_lollipop_horizontal_1 
        .endw

        add dx,1
        mov cx,color_bomb_x_axis
        mov ax,Dx
        sub ax, color_bomb_y_axis
        .while(ax < color_bomb_height)
        jmp draw_lollipop_horizontal_1
        .endw
        add si,2D
     ;   add dx,1D
     add color_bomb_x_axis,1D
        add color_bomb_y_axis,2D  
        sub color_bomb_width,2D
        inc al
    .endw
    ret
color_bomb_candy endp




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;FUNCTION FOR MAKING A SQUARE CANDY
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
square proc uses ax bx cx dx
    mov ah, 0ch ;writing a pixel
    mov al, 0ah ;setting green
    mov bh, 0 
    mov tempx, cx	; cx & dx values from filling grid code
    mov tempy, dx	;moving to tempx & tempy
    mov count, 0
    add dx, 7		;adding 7 so shape gets printed in center
    .while count<2
        mov cx, tempx
        add cx, 7
        mov count2, 0			;Repeating the same procedure as for grid
        .while count2<=5		;		|
            int 10h;			;But this time
            inc cx				; for smaller squares
            inc count2
        .endw
        add dx, 5			;addition in dx for vertical increment
        inc count
    .endw
    mov cx, tempx
    add cx, 7
    mov count, 0
    .while count<2
        mov dx, tempy
        add dx, 7				;same as previos loop
        mov count2, 0
        .while count2<=5
            int 10h;
            inc dx
            inc count2
        .endw
        add cx, 5				;addition in cx for horizontal increment
        inc count
    .endw
        
    ret
square endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;FUNCTION FOR MAKING A TRIANGLE CANDY
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
triangle proc uses ax bx cx dx
    mov ah, 0ch ;writing a pixel
    mov al, 04h ;setting blue
    mov bh, 0 
    mov tempx, cx			; cx & dx values from filling grid code
    mov tempy, dx			;moving to tempx & tempy
    add dx, 7
    add cx, 10				;adding 7 & 10 so shape gets printed in center
    mov count2, cx
    mov count4, cx
    mov count, 0
    .while count<5
        mov cx, count2		;Printing both sides of a triangle
        int 10h;
        mov cx, count4		;Thats why both count2 & 4 have same values (cx)
        int 10h;
        inc count4
        dec count2
        inc dx
        inc count			;incremention count to reach loop w=value
    .endw

    mov cx, tempx
    add cx, 5
    mov dx, tempy
    add dx, 12
    mov count, 0
    .while count<=10		;drawing the base line of trianglr
        int 10h;			;triangles base line is leftside + rightside
        inc cx				;that's why cx gets incremented 10 times (left arm = 5 + right arm = 5 ) 
        inc count;			
    .endw

    ret
triangle endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;FUNCTION FOR MAKING A RECTANGLE CANDY
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rectangle proc uses ax bx cx dx
    mov ah, 0ch ;writing a pixel
    mov al, 09h ;setting blue
    mov bh, 0 
    mov tempx, cx		; cx & dx values from filling grid code
    mov tempy, dx		;moving to tempx & tempy
    mov count, 0
    add dx, 7			;adding 7 so shape gets printed in center
    .while count<2
        mov cx, tempx
        add cx, 5
        mov count2, 0
        .while count2<=10		;loop runs 10 times because we want
            int 10h;			; our upper and lower lines greater than side lines
            inc cx
            inc count2
        .endw
        add dx, 5			;addition in dx for drawing verticle lines of rectangle
        inc count
    .endw
    mov cx, tempx
    add cx, 5
    mov count, 0
    .while count<2
        mov dx, tempy
        add dx, 7
        mov count2, 0
        .while count2<=5			;in this loop count2 is 5
            int 10h;				;beacuse our side lines of rectangle
            inc dx					;are half the length of upper & lower lines
            inc count2
        .endw
        add cx, 10					;addition in cx for drawing horizontal lines of rectangle
        inc count
    .endw

    ret
rectangle endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;Function for making a Color BomB
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

color_bomb proc uses ax bx cx dx
	mov ah,0ch
	mov al,04h
	mov bh,0
	 mov tempx, cx		; cx & dx values from filling grid code
    mov tempy, dx		;moving to tempx & tempy
    mov count, 0
    add dx, 7			;adding 7 so shape gets printed in center
    .while count<2
        mov cx, tempx
        add cx, 5
        mov count2, 0
        .while count2<=8		;loop runs 10 times because we want
            int 10h;			; our upper and lower lines greater than side lines
            inc cx
            inc count2
        .endw
		mov al,0ah
		add dx,3
		inc count
		.endw
	mov al,09h
	mov cx, tempx
    add cx, 7
    mov count, 0
    .while count<2
        mov dx, tempy
        add dx, 5
        mov count2, 0
        .while count2<=8			;in this loop count2 is 8
            int 10h;				;beacuse our side lines of color bomb
            inc dx					;are half the length of upper & lower lines
            inc count2
        .endw
		mov al,05h
        add cx, 4					;addition in cx for drawing horizontal lines of rectangle
        inc count
    .endw
	ret
color_bomb endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@ SPACER CANDY @@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

double_triangle_candy proc
; Defining the initial Positions
MOV CX, double_triangle_candy_initial_x_position
mov Dx,double_triangle_candy_initial_y_position

draw_ball_horizontal:
    ; drawing a pixel
    mov ah,0ch
    mov al,05h
    mov bh,00h
    int 10H
    inc CX ; increase the x-axis
    ; compare the x-axis with the ball size cx - ball-x-position > size ( go to next line)
    mov ax,CX 
    sub ax,double_triangle_candy_initial_x_position
    .while (ax < double_triangle_candy_width)
    jmp draw_ball_horizontal 
    .endw
    ;cmp ax,Ball_size
    ;jng draw_ball_horizontal
    mov cx,double_triangle_candy_initial_x_position
    ; otherwise go to the next column
    inc Dx
    mov ax,Dx
    sub ax,double_triangle_candy_initial_y_position
    ; if this condition does not satisfy then stop creating
    .while(ax < double_triangle_candy_height)
    jmp draw_ball_horizontal
    .endw
    ; otherwise stop..
    
    
    
    ;Finding the Middle of the Rectangle.. for drawing of corners..
    mov dx,0
    mov ax,double_triangle_candy_height
    mov bx,2
    div bx
    add ax,double_triangle_candy_initial_y_position
    mov double_triangle_middle_position,ax


    ; Start Drawing the Left Corner of the Candy.
    mov cx,double_triangle_candy_initial_x_position
    mov dx,double_triangle_middle_position

    ; Now i need to draw the triangle's on the side of the candy
   
    ; drawing the top tilted line.
    draw_left_side:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        dec cx
        dec dx
        mov ax,dx
        sub ax,double_triangle_candy_initial_y_position
        .while(ax < double_triangle_candy_height)
        jmp draw_left_side
        .endw
  
    ; Drawing the straight line between corners
    mov cx,cx
    mov dx,dx
    
    draw_straight_line:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        inc dx
        mov ax,dx 
        sub ax,double_triangle_candy_initial_y_position
        .while(ax < double_triangle_candy_height)
        jmp draw_straight_line
        .endw
    ; Drawing the tilted left line
    mov cx,cx
    mov dx,dx
    draw_right_side:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        inc cx
        dec dx
        mov ax,dx
        sub ax,double_triangle_candy_initial_y_position
        .while(ax < double_triangle_middle_position)
        jmp draw_right_side
        .endw
    
    
    ;; Now left Corner of the Candy is made.. Let's create the second Corner
    
    
    ; Get the middle value of the Shape
    mov dx,0
    mov ax,double_triangle_candy_height
    mov bx,2
    div bx
    add ax,double_triangle_candy_initial_y_position
    mov double_triangle_middle_position,ax
    
   
    mov cx,double_triangle_candy_initial_x_position
    add cx,double_triangle_candy_width
    mov cx,cx
    mov dx,double_triangle_middle_position
     ; drawing the bottom tilted line.
    draw_right_bottom_side_of_first_candy:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        inc cx
        inc dx
        mov ax,dx
        sub ax,double_triangle_candy_initial_y_position
        .while(ax < double_triangle_candy_height)
        jmp draw_right_bottom_side_of_first_candy
        .endw
        
    mov cx,cx
    mov dx,dx
    ; drawing the Straight Line
    draw_line_side_of_first_candy:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        dec dx
        mov ax,dx
        sub ax,double_triangle_candy_initial_y_position
        .while(ax < double_triangle_candy_height)
        jmp draw_line_side_of_first_candy
        .endw
        
     
    mov cx,cx
    mov dx,dx
    mov si,0
    mov si,dx
    ; Drawing the Left tilted line.
    draw_left_bottom_side_of_first_candy:
        mov ah,0ch
        mov al,05h
        mov bh,00h
        int 10h
        dec cx
        inc dx   
        mov ax,dx
        sub ax,si
        .while(ax < double_triangle_candy_height)
        jmp draw_left_bottom_side_of_first_candy
        .endw
ret
double_triangle_candy endp




;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
;Function for making Circular candy
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

circle proc uses ax bx cx dx
	 mov ah, 0ch ;writing a pixel
    mov al, 0ah ;setting green
    mov bh, 0 
    mov tempx, cx	; cx & dx values from filling grid code
    mov tempy, dx	;moving to tempx & tempy
    mov count, 0
	mov si,2
	mov di,10
    add dx, 5		;adding 7 so shape gets printed in center
    .while count<3
        mov cx, tempx
        add cx, di
		mov input,cx
        mov count2, 0			;Repeating the same procedure as for grid
        .while count2<=si			;		|
            int 10h;			;But this time
            inc cx			; for smaller squad
			inc count2
        .endw
		inc al
		add si,2
		dec di
		mov input3,di
        add dx, 2		;addition in dx for vertical increment
        mov input2,dx
		inc count
    .endw
	;mov cx,tempx
	;add dx,11
	mov di,7
	mov si,6
	mov count,0
	mov al,05h
	.while count<3
		mov cx,tempx
		add cx,di
		mov count2,0
		.while count2<=si
			int 10h
			inc cx
			inc count2
			.endw
			sub si,2
			inc di
			add dx,2
			inc count
		.endw
	ret
circle endp

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;Function for newline and carriage return
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

new_line proc		;Procedure for newline

	mov dl,13
	mov ah,02		;Code for newline
	int 21h			;and
	mov dl,10		;carriage return
	mov ah,02
	int 21h
	ret				;returning from procedure
new_line endp		;ending procedure

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;Function for printing spaces
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@

space proc			;Procedure for space
	mov dl," "
	mov ah,02		;Printing Spaces
	int 21h
	ret				;returning from function
space endp			;Ending space procedure
end main			;Ending Code