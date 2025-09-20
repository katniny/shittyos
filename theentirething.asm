[bits 16]
[org 0x7c00]

start:
    ; set 80x25 text mode
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; vga text memory segment
    mov ax, 0xb800
    mov es, ax

    ; fill screen with brown background (black text)
    ; attribute = (bg << 4) | fg = (6 << 4) | 0 = 0x60
    ; word = attr<<8 | ' ' = 0x6020
    mov ax, 0x6020
    xor di, di
    mov cx, 80*25
    rep stosw

    ; prepare to print: point ds:si at our message and di back at screen start
    mov ax, 0x0000
    mov ds, ax
    mov si, message
    xor di, di

print_loop:
    lodsb ; al = next char (from ds:si)
    cmp al, 0
    je hang
    mov ah, 0x60 ; attribute in high byte
    stosw ; write word (ah:al) to es:di
    jmp print_loop

hang:
    cli
    hlt
    jmp hang

message db 'Congrats on running ShittyOS. Now you can go back to using Windows, macOS, Linux, *BSD, HaikuOS, or whatever the hell you use.',0

; pad to 512 bytes with boot signature
times 510-($-$$) db 0
dw 0xaa55