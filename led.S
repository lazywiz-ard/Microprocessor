;
; Assembly Code for LED Blinking
;

#define __SFR_OFFSET 0x00
#include "avr/io.h"

.global start
.global led

; Initialize LED pin
start:
    SBI DDRB, 5         ; Set PB5 (pin D13) as output
    RET                 ; Return to setup() function

; Control LED state
led:
    CPI R24, 0x00       ; Compare input value in R24 with 0
    BREQ ledOFF         ; Branch to ledOFF if value is 0
    SBI PORTB, 5        ; Set PB5 (turn LED ON)
    RCALL myDelay       ; Call delay function
    RET                 ; Return to loop()

ledOFF:
    CBI PORTB, 5        ; Clear PB5 (turn LED OFF)
    RCALL myDelay       ; Call delay function
    RET                 ; Return to loop()

; Delay Subroutine
.equ delayVal, 10000   ; Set initial delay count
myDelay:
    LDI R20, 100        ; Outer loop counter
outerLoop:
    LDI R30, lo8(delayVal) ; Load lower byte of delay count
    LDI R31, hi8(delayVal) ; Load upper byte of delay count
innerLoop:
    SBIW R30:31, 1      ; Subtract 1 from 16-bit counter
    BRNE innerLoop      ; Repeat until counter is zero
    SUBI R20, 1         ; Decrement outer loop counter
    BRNE outerLoop      ; Repeat until R20 is zero
    RET                 ; Return
