;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Mar 13 2012) (UNIX)
; This file was generated Tue Mar 27 17:22:23 2012
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _increment_time
	global _alarm
	global _test_inc_current_time
	global _display_time
	global _display_word
	global _display_string
	global _strlcpy
	global _dumb_delay1ms
	global _time
	global _currentTime
	global _position
	global _alarmflag
	global _refresh
	global _bres
	global _high_isr
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_time	db	0x30, 0x30, 0x3a, 0x30, 0x30, 0x20, 0x20, 0x30, 0x30, 0x3a, 0x30, 0x30
	db	0x3a, 0x30, 0x30, 0x00
_currentTime	db	LOW((_time + 7)), HIGH((_time + 7)), 0x80
_position	db	0x00, 0x00
_alarmflag	db	0x00, 0x00
_refresh	db	0x01, 0x00
_bres	db	0x00, 0x00, 0x00, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1

udata_testint_0	udata
_main_string_1_1	res	16

udata_testint_1	udata
_display_word_WDigit_1_1	res	6

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_testint_ivec_0x1_high_isr	code	0X000008
ivec_0x1_high_isr:
	GOTO	_high_isr

; I code from now on!
; ; Starting pCode block
S_testint__main	code
_main:
	BANKSEL	_main_string_1_1
;	.line	87; testint.c	char string[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	CLRF	_main_string_1_1, B
	BANKSEL	(_main_string_1_1 + 1)
	CLRF	(_main_string_1_1 + 1), B
	BANKSEL	(_main_string_1_1 + 2)
	CLRF	(_main_string_1_1 + 2), B
	BANKSEL	(_main_string_1_1 + 3)
	CLRF	(_main_string_1_1 + 3), B
	BANKSEL	(_main_string_1_1 + 4)
	CLRF	(_main_string_1_1 + 4), B
	BANKSEL	(_main_string_1_1 + 5)
	CLRF	(_main_string_1_1 + 5), B
	BANKSEL	(_main_string_1_1 + 6)
	CLRF	(_main_string_1_1 + 6), B
	BANKSEL	(_main_string_1_1 + 7)
	CLRF	(_main_string_1_1 + 7), B
	BANKSEL	(_main_string_1_1 + 8)
	CLRF	(_main_string_1_1 + 8), B
	BANKSEL	(_main_string_1_1 + 9)
	CLRF	(_main_string_1_1 + 9), B
	BANKSEL	(_main_string_1_1 + 10)
	CLRF	(_main_string_1_1 + 10), B
	BANKSEL	(_main_string_1_1 + 11)
	CLRF	(_main_string_1_1 + 11), B
	BANKSEL	(_main_string_1_1 + 12)
	CLRF	(_main_string_1_1 + 12), B
	BANKSEL	(_main_string_1_1 + 13)
	CLRF	(_main_string_1_1 + 13), B
	BANKSEL	(_main_string_1_1 + 14)
	CLRF	(_main_string_1_1 + 14), B
	BANKSEL	(_main_string_1_1 + 15)
	CLRF	(_main_string_1_1 + 15), B
;	.line	89; testint.c	LED0_TRIS = 0; //configure 1st led pin as output (yellow)
	BCF	_TRISJbits, 0
;	.line	90; testint.c	LED1_TRIS = 0; //configure 2nd led pin as output (red)
	BCF	_TRISJbits, 1
;	.line	91; testint.c	LED2_TRIS = 0; //configure 3rd led pin as output (red)
	BCF	_TRISJbits, 2
;	.line	93; testint.c	BUTTON0_TRIS = 1; //configure button0 as input
	BSF	_TRISBbits, 3
;	.line	94; testint.c	BUTTON1_TRIS = 1; //configure button1 as input 
	BSF	_TRISBbits, 1
;	.line	96; testint.c	RCONbits.IPEN      = 1;   // Interrupts Priority ENable
	BSF	_RCONbits, 7
;	.line	98; testint.c	INT1F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	101; testint.c	INTCON3bits.INT1P  = 1; 
	BSF	_INTCON3bits, 6
;	.line	103; testint.c	INTCON2bits.INTEDG1= 0;
	BCF	_INTCON2bits, 5
;	.line	106; testint.c	INTCONbits.GIE     = 1;
	BSF	_INTCONbits, 7
;	.line	109; testint.c	INTCON3bits.INT1E  = 1;
	BSF	_INTCON3bits, 3
;	.line	110; testint.c	INTCON3bits.INT3E  = 1;
	BSF	_INTCON3bits, 5
;	.line	112; testint.c	T0CONbits.T0CS     = 1;
	BSF	_T0CONbits, 5
;	.line	114; testint.c	LCDInit();
	CALL	_LCDInit
;	.line	115; testint.c	for(i=0;i<100;i++) dumb_delay1ms();
	MOVLW	0x64
	MOVWF	r0x00
	CLRF	r0x01
_00183_DS_:
	CALL	_dumb_delay1ms
	MOVLW	0xff
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x01, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00183_DS_
;	.line	117; testint.c	display_time (); 
	CALL	_display_time
;	.line	120; testint.c	INTCON2bits.TMR0IP	 = 1; 
	BSF	_INTCON2bits, 2
;	.line	123; testint.c	TMR0F    = 0;
	BCF	_INTCONbits, 2
;	.line	126; testint.c	T0CONbits.T08BIT    = 0;
	BCF	_T0CONbits, 6
;	.line	128; testint.c	T0CONbits.PSA       = 1;
	BSF	_T0CONbits, 3
;	.line	130; testint.c	INTCONbits.TMR0IE   = 1;
	BSF	_INTCONbits, 5
;	.line	132; testint.c	T0CONbits.TMR0ON    = 1;
	BSF	_T0CONbits, 7
_00179_DS_:
	BANKSEL	_refresh
;	.line	137; testint.c	if ( refresh == 1){
	MOVF	_refresh, W, B
	XORLW	0x01
	BNZ	_00192_DS_
	BANKSEL	(_refresh + 1)
	MOVF	(_refresh + 1), W, B
	BZ	_00193_DS_
_00192_DS_:
	BRA	_00179_DS_
_00193_DS_:
	BANKSEL	_refresh
;	.line	138; testint.c	refresh = 0;
	CLRF	_refresh, B
	BANKSEL	(_refresh + 1)
	CLRF	(_refresh + 1), B
;	.line	139; testint.c	display_time();
	CALL	_display_time
	BANKSEL	_alarmflag
;	.line	140; testint.c	if ( alarmflag == 1){
	MOVF	_alarmflag, W, B
	XORLW	0x01
	BNZ	_00194_DS_
	BANKSEL	(_alarmflag + 1)
	MOVF	(_alarmflag + 1), W, B
	BZ	_00195_DS_
_00194_DS_:
	BRA	_00179_DS_
_00195_DS_:
;	.line	141; testint.c	alarm();
	CALL	_alarm
	BRA	_00179_DS_
	RETURN	

; ; Starting pCode block
S_testint__dumb_delay1ms	code
_dumb_delay1ms:
;	.line	340; testint.c	void dumb_delay1ms (void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	342; testint.c	TMR0H = HIGH (0x10000-EXEC_FREQ/1000);
	MOVLW	0xd8
	MOVWF	_TMR0H
;	.line	343; testint.c	TMR0L = LOW  (0x10000-EXEC_FREQ/1000);
	MOVLW	0xf0
	MOVWF	_TMR0L
;	.line	344; testint.c	T0CONbits.TMR0ON = 0;  //disable timer0
	BCF	_T0CONbits, 7
;	.line	345; testint.c	T0CONbits.T08BIT = 0;  //use timer0 16-bit counter
	BCF	_T0CONbits, 6
;	.line	346; testint.c	T0CONbits.T0CS   = 0;  //use timer0 instruction cycle clock
	BCF	_T0CONbits, 5
;	.line	347; testint.c	T0CONbits.PSA    = 1;  //disable timer0 prescaler
	BSF	_T0CONbits, 3
;	.line	348; testint.c	INTCONbits.T0IF   = 0;  //clear timer0 overflow bit
	BCF	_INTCONbits, 2
;	.line	349; testint.c	T0CONbits.TMR0ON = 1;  //enable timer0
	BSF	_T0CONbits, 7
_00383_DS_:
;	.line	350; testint.c	while(!INTCONbits.T0IF){} //busy wait for timer0 to overflow
	BTFSS	_INTCONbits, 2
	BRA	_00383_DS_
;	.line	351; testint.c	INTCONbits.T0IF   = 0;  //clear timer0 overflow bit
	BCF	_INTCONbits, 2
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__strlcpy	code
_strlcpy:
;	.line	309; testint.c	strlcpy(char *dst, const char *src, size_t siz)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	311; testint.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	312; testint.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	313; testint.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	316; testint.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00363_DS_
;	.line	318; testint.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00359_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00378_DS_
;	.line	320; testint.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00359_DS_
_00378_DS_:
;	.line	321; testint.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00363_DS_:
;	.line	326; testint.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00370_DS_
;	.line	328; testint.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00377_DS_
;	.line	329; testint.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00377_DS_:
;	.line	330; testint.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00366_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00366_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00370_DS_:
;	.line	336; testint.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__display_string	code
_display_string:
;	.line	264; testint.c	void display_string(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	266; testint.c	BYTE l= strlen(text)+1;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
	INCF	r0x04, F
;	.line	267; testint.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	268; testint.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00350_DS_
	MOVFF	r0x05, r0x04
_00350_DS_:
	CLRF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	269; testint.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__display_word	code
_display_word:
;	.line	242; testint.c	void display_word(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	250; testint.c	ultoa(w, WDigit, radix);      
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_display_word_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_display_word_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	251; testint.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00331_DS_:
	MOVLW	HIGH(_display_word_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_word_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00341_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00341_DS_:
	BC	_00334_DS_
;	.line	253; testint.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_display_word_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_display_word_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	251; testint.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00331_DS_
_00334_DS_:
;	.line	255; testint.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00342_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00342_DS_:
	BC	_00330_DS_
;	.line	256; testint.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00330_DS_:
;	.line	257; testint.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__display_time	code
_display_time:
;	.line	226; testint.c	void display_time(){    
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	227; testint.c	display_string(0,time);         
	MOVLW	HIGH(_time)
	MOVWF	r0x01
	MOVLW	LOW(_time)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_display_string
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_position
;	.line	228; testint.c	if(position == 0 || position == 1) display_string(16+position-1," ^");
	MOVF	_position, W, B
	BANKSEL	(_position + 1)
	IORWF	(_position + 1), W, B
	BZ	_00316_DS_
	BANKSEL	_position
	MOVF	_position, W, B
	XORLW	0x01
	BNZ	_00323_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00316_DS_
_00323_DS_:
	BRA	_00317_DS_
_00316_DS_:
	BANKSEL	_position
	MOVF	_position, W, B
	MOVWF	r0x00
	MOVLW	0x0f
	ADDWF	r0x00, F
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_display_string
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00320_DS_
_00317_DS_:
	BANKSEL	_position
;	.line	229; testint.c	else display_string(16+position-3,"   ^");
	MOVF	_position, W, B
	MOVWF	r0x00
	MOVLW	0x0d
	ADDWF	r0x00, F
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_display_string
	MOVLW	0x04
	ADDWF	FSR1L, F
_00320_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__test_inc_current_time	code
_test_inc_current_time:
;	.line	195; testint.c	void test_inc_current_time(){        
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	BANKSEL	_currentTime
;	.line	196; testint.c	if(currentTime[7] == ':'){
	MOVF	_currentTime, W, B
	ADDLW	0x07
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x3a
	BNZ	_00272_DS_
;	.line	197; testint.c	currentTime[7] = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_currentTime
;	.line	198; testint.c	++currentTime[6];
	MOVF	_currentTime, W, B
	ADDLW	0x06
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00272_DS_:
	BANKSEL	_currentTime
;	.line	200; testint.c	if(currentTime[6]=='6'){
	MOVF	_currentTime, W, B
	ADDLW	0x06
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x36
	BNZ	_00274_DS_
;	.line	201; testint.c	currentTime[6]='0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_currentTime
;	.line	202; testint.c	currentTime[4]++;
	MOVF	_currentTime, W, B
	ADDLW	0x04
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	203; testint.c	alarmflag = 1;
	MOVLW	0x01
	BANKSEL	_alarmflag
	MOVWF	_alarmflag, B
	BANKSEL	(_alarmflag + 1)
	CLRF	(_alarmflag + 1), B
_00274_DS_:
	BANKSEL	_currentTime
;	.line	205; testint.c	if(currentTime[4] == ':'){
	MOVF	_currentTime, W, B
	ADDLW	0x04
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x3a
	BNZ	_00276_DS_
;	.line	206; testint.c	currentTime[4] = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_currentTime
;	.line	207; testint.c	++currentTime[3];
	MOVF	_currentTime, W, B
	ADDLW	0x03
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00276_DS_:
	BANKSEL	_currentTime
;	.line	209; testint.c	if(currentTime[3]=='6'){
	MOVF	_currentTime, W, B
	ADDLW	0x03
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x36
	BNZ	_00278_DS_
;	.line	210; testint.c	currentTime[3]='0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	BANKSEL	_currentTime
;	.line	211; testint.c	currentTime[1]++;
	MOVF	_currentTime, W, B
	ADDLW	0x01
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00278_DS_:
	BANKSEL	_currentTime
;	.line	213; testint.c	if(currentTime[1] == ':'){
	MOVF	_currentTime, W, B
	ADDLW	0x01
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x3a
	BNZ	_00280_DS_
;	.line	214; testint.c	currentTime[1] = '0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	215; testint.c	++currentTime[0];
	MOVFF	_currentTime, r0x03
	MOVFF	(_currentTime + 1), r0x04
	MOVFF	(_currentTime + 2), r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x06, F
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
_00280_DS_:
;	.line	217; testint.c	if(currentTime[0]=='2' && currentTime[1]=='4'){
	MOVFF	_currentTime, r0x03
	MOVFF	(_currentTime + 1), r0x04
	MOVFF	(_currentTime + 2), r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x32
	BNZ	_00282_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x34
	BNZ	_00282_DS_
;	.line	218; testint.c	currentTime[0]='0';
	MOVFF	_currentTime, r0x03
	MOVFF	(_currentTime + 1), r0x04
	MOVFF	(_currentTime + 2), r0x05
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	219; testint.c	currentTime[1]='0';
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00282_DS_:
;	.line	221; testint.c	if(currentTime[0]=='3'){
	MOVFF	_currentTime, r0x00
	MOVFF	(_currentTime + 1), r0x01
	MOVFF	(_currentTime + 2), r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x33
	BNZ	_00286_DS_
;	.line	222; testint.c	currentTime[0]='0';
	MOVFF	_currentTime, r0x00
	MOVFF	(_currentTime + 1), r0x01
	MOVFF	(_currentTime + 2), r0x02
	MOVLW	0x30
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
_00286_DS_:
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__alarm	code
_alarm:
;	.line	171; testint.c	void alarm(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
;	.line	172; testint.c	int blink = 1;
	MOVLW	0x01
	MOVWF	r0x00
	CLRF	r0x01
;	.line	173; testint.c	int i = 0;
	CLRF	r0x02
	CLRF	r0x03
_00240_DS_:
;	.line	176; testint.c	for(i; i<5; i++){
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00263_DS_
	MOVLW	0x05
	SUBWF	r0x02, W
_00263_DS_:
	BC	_00243_DS_
;	.line	177; testint.c	if(currentTime[i]!=time[i]){
	MOVF	r0x02, W
	BANKSEL	_currentTime
	ADDWF	_currentTime, W, B
	MOVWF	r0x04
	MOVF	r0x03, W
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x05
	CLRF	WREG
	BTFSC	r0x03, 7
	SETF	WREG
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x04
	MOVLW	LOW(_time)
	ADDWF	r0x02, W
	MOVWF	r0x05
	MOVLW	HIGH(_time)
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x05
	MOVF	r0x04, W
	XORWF	r0x05, W
	BZ	_00242_DS_
;	.line	178; testint.c	blink = 0;
	CLRF	r0x00
	CLRF	r0x01
;	.line	179; testint.c	i = 5;
	MOVLW	0x05
	MOVWF	r0x02
	CLRF	r0x03
_00242_DS_:
;	.line	176; testint.c	for(i; i<5; i++){
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00240_DS_
_00243_DS_:
;	.line	182; testint.c	if(blink){
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSC	STATUS, 2
	BRA	_00239_DS_
;	.line	183; testint.c	display_string(0,"    Wake up!    ");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_display_string
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	184; testint.c	display_string(16, "                ");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_display_string
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	185; testint.c	for(j; j<30; j++){
	CLRF	r0x00
	CLRF	r0x01
_00247_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00266_DS_
	MOVLW	0x1e
	SUBWF	r0x00, W
_00266_DS_:
	BC	_00250_DS_
;	.line	186; testint.c	LED1_IO ^=1;
	CLRF	r0x02
	BTFSC	_LATJbits, 1
	INCF	r0x02, F
	MOVLW	0x01
	XORWF	r0x02, F
	MOVF	r0x02, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATJbits
;	.line	187; testint.c	for(k=0; k<40;++k) 
	MOVLW	0x28
	MOVWF	r0x02
	CLRF	r0x03
_00246_DS_:
;	.line	188; testint.c	dumb_delay1ms();
	CALL	_dumb_delay1ms
	MOVLW	0xff
	ADDWF	r0x02, F
	BTFSS	STATUS, 0
	DECF	r0x03, F
;	.line	187; testint.c	for(k=0; k<40;++k) 
	MOVF	r0x02, W
	IORWF	r0x03, W
	BNZ	_00246_DS_
;	.line	185; testint.c	for(j; j<30; j++){
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00247_DS_
_00250_DS_:
;	.line	190; testint.c	LED1_IO ^=1;
	CLRF	r0x00
	BTFSC	_LATJbits, 1
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATJbits
_00239_DS_:
	BANKSEL	_alarmflag
;	.line	192; testint.c	alarmflag = 0;
	CLRF	_alarmflag, B
	BANKSEL	(_alarmflag + 1)
	CLRF	(_alarmflag + 1), B
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__increment_time	code
_increment_time:
;	.line	147; testint.c	void increment_time(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	148; testint.c	time[position]++;
	MOVLW	LOW(_time)
	BANKSEL	_position
	ADDWF	_position, W, B
	MOVWF	r0x00
	MOVLW	HIGH(_time)
	BANKSEL	(_position + 1)
	ADDWFC	(_position + 1), W, B
	MOVWF	r0x01
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x02
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	BANKSEL	(_time + 4)
;	.line	149; testint.c	if(time[4] == ':'){
	MOVF	(_time + 4), W, B
	XORLW	0x3a
	BNZ	_00201_DS_
;	.line	150; testint.c	time[4] = '0';
	MOVLW	0x30
	BANKSEL	(_time + 4)
	MOVWF	(_time + 4), B
	BANKSEL	(_time + 3)
;	.line	151; testint.c	++time[3];
	INCF	(_time + 3), W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_time + 3)
	MOVWF	(_time + 3), B
_00201_DS_:
	BANKSEL	(_time + 3)
;	.line	153; testint.c	if(time[3]=='6'){
	MOVF	(_time + 3), W, B
	XORLW	0x36
	BNZ	_00203_DS_
;	.line	154; testint.c	time[3]='0';
	MOVLW	0x30
	BANKSEL	(_time + 3)
	MOVWF	(_time + 3), B
;	.line	155; testint.c	time[1]++;
	MOVFF	(_time + 1), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_time + 1)
	MOVWF	(_time + 1), B
_00203_DS_:
;	.line	157; testint.c	if(time[1] == ':'){
	MOVFF	(_time + 1), r0x00
	MOVF	r0x00, W
	XORLW	0x3a
	BNZ	_00211_DS_
;	.line	158; testint.c	time[1] = '0';
	MOVLW	0x30
	BANKSEL	(_time + 1)
	MOVWF	(_time + 1), B
	BANKSEL	_time
;	.line	159; testint.c	++time[0];
	INCF	_time, W, B
	MOVWF	r0x01
	MOVF	r0x01, W
	BANKSEL	_time
	MOVWF	_time, B
	BRA	_00213_DS_
_00211_DS_:
;	.line	161; testint.c	else if(time[0]=='2' && time[1]>='4'){
	MOVFF	_time, r0x01
	MOVF	r0x01, W
	XORLW	0x32
	BNZ	_00207_DS_
	MOVF	r0x00, W
	ADDLW	0x80
	ADDLW	0x4c
	BNC	_00207_DS_
;	.line	162; testint.c	time[0]='0';
	MOVLW	0x30
	BANKSEL	_time
	MOVWF	_time, B
;	.line	163; testint.c	time[1]='0';
	MOVLW	0x30
	BANKSEL	(_time + 1)
	MOVWF	(_time + 1), B
	BRA	_00213_DS_
_00207_DS_:
;	.line	165; testint.c	else if(time[0]=='3'){
	MOVF	r0x01, W
	XORLW	0x33
	BNZ	_00213_DS_
;	.line	166; testint.c	time[0]='0';
	MOVLW	0x30
	BANKSEL	_time
	MOVWF	_time, B
_00213_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_testint__high_isr	code
_high_isr:
;	.line	38; testint.c	void high_isr (void) __interrupt 1
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	41; testint.c	if (INT3F)
	BTFSS	_INTCON3bits, 2
	BRA	_00117_DS_
	BANKSEL	(_position + 1)
;	.line	43; testint.c	if(position<2 || (position>2 && position<5))
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00150_DS_
	MOVLW	0x02
	BANKSEL	_position
	SUBWF	_position, W, B
_00150_DS_:
	BNC	_00105_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00151_DS_
	MOVLW	0x03
	BANKSEL	_position
	SUBWF	_position, W, B
_00151_DS_:
	BNC	_00106_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00152_DS_
	MOVLW	0x05
	BANKSEL	_position
	SUBWF	_position, W, B
_00152_DS_:
	BC	_00106_DS_
_00105_DS_:
;	.line	44; testint.c	increment_time();
	CALL	_increment_time
_00106_DS_:
	BANKSEL	(_position + 1)
;	.line	46; testint.c	if((position>6 && position<9) || (position>9 && position<12) || (position>12 && position<15)){
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00153_DS_
	MOVLW	0x07
	BANKSEL	_position
	SUBWF	_position, W, B
_00153_DS_:
	BNC	_00113_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00154_DS_
	MOVLW	0x09
	BANKSEL	_position
	SUBWF	_position, W, B
_00154_DS_:
	BNC	_00109_DS_
_00113_DS_:
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00155_DS_
	MOVLW	0x0a
	BANKSEL	_position
	SUBWF	_position, W, B
_00155_DS_:
	BNC	_00115_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00156_DS_
	MOVLW	0x0c
	BANKSEL	_position
	SUBWF	_position, W, B
_00156_DS_:
	BNC	_00109_DS_
_00115_DS_:
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00157_DS_
	MOVLW	0x0d
	BANKSEL	_position
	SUBWF	_position, W, B
_00157_DS_:
	BNC	_00110_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00158_DS_
	MOVLW	0x0f
	BANKSEL	_position
	SUBWF	_position, W, B
_00158_DS_:
	BC	_00110_DS_
_00109_DS_:
	BANKSEL	_position
;	.line	47; testint.c	currentTime[position-7]++;
	MOVF	_position, W, B
	ADDLW	0xf9
	MOVWF	r0x00
	MOVLW	0xff
	BANKSEL	(_position + 1)
	ADDWFC	(_position + 1), W, B
	MOVWF	r0x01
	CLRF	r0x02
	BTFSC	r0x01, 7
	SETF	r0x02
	BANKSEL	_currentTime
	MOVF	_currentTime, W, B
	ADDWF	r0x00, F
	BANKSEL	(_currentTime + 1)
	MOVF	(_currentTime + 1), W, B
	ADDWFC	r0x01, F
	BANKSEL	(_currentTime + 2)
	MOVF	(_currentTime + 2), W, B
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	48; testint.c	test_inc_current_time();
	CALL	_test_inc_current_time
_00110_DS_:
;	.line	51; testint.c	INT3F = 0;
	BCF	_INTCON3bits, 2
;	.line	52; testint.c	refresh = 1;
	MOVLW	0x01
	BANKSEL	_refresh
	MOVWF	_refresh, B
	BANKSEL	(_refresh + 1)
	CLRF	(_refresh + 1), B
_00117_DS_:
;	.line	55; testint.c	if ( INT1F ) {
	BTFSS	_INTCON3bits, 0
	BRA	_00129_DS_
	BANKSEL	_position
;	.line	57; testint.c	position++;
	INCF	_position, F, B
	BNC	_10383_DS_
	BANKSEL	(_position + 1)
	INCF	(_position + 1), F, B
_10383_DS_:
	BANKSEL	_position
;	.line	58; testint.c	if(position == 2) position = 3;
	MOVF	_position, W, B
	XORLW	0x02
	BNZ	_00159_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00160_DS_
_00159_DS_:
	BRA	_00119_DS_
_00160_DS_:
	MOVLW	0x03
	BANKSEL	_position
	MOVWF	_position, B
	BANKSEL	(_position + 1)
	CLRF	(_position + 1), B
_00119_DS_:
	BANKSEL	_position
;	.line	59; testint.c	if(position == 5) position = 7;
	MOVF	_position, W, B
	XORLW	0x05
	BNZ	_00161_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00162_DS_
_00161_DS_:
	BRA	_00121_DS_
_00162_DS_:
	MOVLW	0x07
	BANKSEL	_position
	MOVWF	_position, B
	BANKSEL	(_position + 1)
	CLRF	(_position + 1), B
_00121_DS_:
	BANKSEL	_position
;	.line	60; testint.c	if(position == 9) position = 10;
	MOVF	_position, W, B
	XORLW	0x09
	BNZ	_00163_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00164_DS_
_00163_DS_:
	BRA	_00123_DS_
_00164_DS_:
	MOVLW	0x0a
	BANKSEL	_position
	MOVWF	_position, B
	BANKSEL	(_position + 1)
	CLRF	(_position + 1), B
_00123_DS_:
	BANKSEL	_position
;	.line	61; testint.c	if(position == 12) position = 13;
	MOVF	_position, W, B
	XORLW	0x0c
	BNZ	_00165_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00166_DS_
_00165_DS_:
	BRA	_00125_DS_
_00166_DS_:
	MOVLW	0x0d
	BANKSEL	_position
	MOVWF	_position, B
	BANKSEL	(_position + 1)
	CLRF	(_position + 1), B
_00125_DS_:
	BANKSEL	_position
;	.line	62; testint.c	if(position == 15) position = 0;
	MOVF	_position, W, B
	XORLW	0x0f
	BNZ	_00167_DS_
	BANKSEL	(_position + 1)
	MOVF	(_position + 1), W, B
	BZ	_00168_DS_
_00167_DS_:
	BRA	_00127_DS_
_00168_DS_:
	BANKSEL	_position
	CLRF	_position, B
	BANKSEL	(_position + 1)
	CLRF	(_position + 1), B
_00127_DS_:
;	.line	63; testint.c	refresh = 1;
	MOVLW	0x01
	BANKSEL	_refresh
	MOVWF	_refresh, B
	BANKSEL	(_refresh + 1)
	CLRF	(_refresh + 1), B
;	.line	65; testint.c	INT1F  = 0;	
	BCF	_INTCON3bits, 0
_00129_DS_:
;	.line	69; testint.c	if ( TMR0F ){        
	BTFSS	_INTCONbits, 2
	BRA	_00134_DS_
;	.line	70; testint.c	bres += 4096;  
	MOVLW	0x10
	BANKSEL	(_bres + 1)
	ADDWF	(_bres + 1), F, B
	MOVLW	0x00
	BANKSEL	(_bres + 2)
	ADDWFC	(_bres + 2), F, B
	MOVLW	0x00
	BANKSEL	(_bres + 3)
	ADDWFC	(_bres + 3), F, B
;	.line	71; testint.c	if(bres >= 390625)
	MOVLW	0x00
	BANKSEL	(_bres + 3)
	SUBWF	(_bres + 3), W, B
	BNZ	_00169_DS_
	MOVLW	0x05
	BANKSEL	(_bres + 2)
	SUBWF	(_bres + 2), W, B
	BNZ	_00169_DS_
	MOVLW	0xf5
	BANKSEL	(_bres + 1)
	SUBWF	(_bres + 1), W, B
	BNZ	_00169_DS_
	MOVLW	0xe1
	BANKSEL	_bres
	SUBWF	_bres, W, B
_00169_DS_:
	BTFSS	STATUS, 0
	BRA	_00131_DS_
;	.line	73; testint.c	bres -= 390625;	
	MOVLW	0x1f
	BANKSEL	_bres
	ADDWF	_bres, F, B
	MOVLW	0x0a
	BANKSEL	(_bres + 1)
	ADDWFC	(_bres + 1), F, B
	MOVLW	0xfa
	BANKSEL	(_bres + 2)
	ADDWFC	(_bres + 2), F, B
	MOVLW	0xff
	BANKSEL	(_bres + 3)
	ADDWFC	(_bres + 3), F, B
;	.line	74; testint.c	LED0_IO ^= 1;
	CLRF	r0x00
	BTFSC	_LATJbits, 0
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
	BANKSEL	_currentTime
;	.line	75; testint.c	currentTime[7]++;
	MOVF	_currentTime, W, B
	ADDLW	0x07
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_currentTime + 1)
	ADDWFC	(_currentTime + 1), W, B
	MOVWF	r0x01
	MOVLW	0x00
	BANKSEL	(_currentTime + 2)
	ADDWFC	(_currentTime + 2), W, B
	MOVWF	r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	76; testint.c	test_inc_current_time();
	CALL	_test_inc_current_time
_00131_DS_:
;	.line	78; testint.c	refresh = 1;
	MOVLW	0x01
	BANKSEL	_refresh
	MOVWF	_refresh, B
	BANKSEL	(_refresh + 1)
	CLRF	(_refresh + 1), B
;	.line	79; testint.c	TMR0F = 0; 
	BCF	_INTCONbits, 2
_00134_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
__str_0:
	DB	0x20, 0x20, 0x20, 0x20, 0x57, 0x61, 0x6b, 0x65, 0x20, 0x75, 0x70, 0x21
	DB	0x20, 0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_1:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_2:
	DB	0x20, 0x5e, 0x00
; ; Starting pCode block
__str_3:
	DB	0x20, 0x20, 0x20, 0x5e, 0x00


; Statistics:
; code size:	 3550 (0x0dde) bytes ( 2.71%)
;           	 1775 (0x06ef) words
; udata size:	   22 (0x0016) bytes ( 0.57%)
; access size:	   22 (0x0016) bytes


	end
