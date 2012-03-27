
#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

#define LOW(a)     (a & 0xFF)
#define HIGH(a)    ((a>>8) & 0xFF)
#define CLOCK_FREQ 40000000     //40 MHz
#define EXEC_FREQ CLOCK_FREQ/4  //4 clock cycles to execute 1 instruction

#define INT1F INTCON3bits.INT1F // Interruption INT1 : généré par le bouton
#define INT3F INTCON3bits.INT3F // Interruption INT3 : généré par le bouton
#define TMR0F INTCONbits.TMR0IF // Int TMR0, généré par le timer

void display_string(BYTE pos, char* text);
void display_word(BYTE pos, WORD w);
size_t strlcpy(char *dst, const char *src, size_t siz);
void dumb_delay1ms (void);
void display_time();
void increment_time();
void test_inc_current_time();
void alarm();

char time[] = "00:00  00:00:00";
char* currentTime = &time[7];
int position = 0;
int alarmflag = 0;
short refresh = 1;
unsigned long long int bres = 0;

void high_isr (void) __interrupt 1
{
    /*  Interruption of button 1 */
    if (INT3F)
    {
        if(position<2 || (position>2 && position<5))
            increment_time();

        if((position>6 && position<9) || (position>9 && position<12) || (position>12 && position<15)){
            currentTime[position-7]++;
            test_inc_current_time();
        }
        /*  Reset flag of interruption */
        INT3F = 0;
        refresh = 1;
    }
    /*  Interruption of button 2 */
    if ( INT1F ) {
        //LED2_IO ^= 1; 
        position++;
        if(position == 2) position = 3;
        if(position == 5) position = 7;
        if(position == 9) position = 10;
        if(position == 12) position = 13;
        if(position == 15) position = 0;
        refresh = 1;
        /*  Reset flag of interruption */
        INT1F  = 0;	
    }
    
    /* Timer interruption */
    if ( TMR0F ){        
        bres += 4096;  
        if(bres >= 390625)
	    {
            bres -= 390625;	
		    LED0_IO ^= 1;
            currentTime[7]++;
            test_inc_current_time();
	    }
	    refresh = 1;
	    TMR0F = 0; 
    }
}


void main(void)
    {
    int i;
    char string[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

    LED0_TRIS = 0; //configure 1st led pin as output (yellow)
    LED1_TRIS = 0; //configure 2nd led pin as output (red)
    LED2_TRIS = 0; //configure 3rd led pin as output (red)

    BUTTON0_TRIS = 1; //configure button0 as input
    BUTTON1_TRIS = 1; //configure button1 as input 
    
    RCONbits.IPEN      = 1;   // Interrupts Priority ENable

    INT1F  = 0;   //clear INT1 flag

    /*  INT1 interruptuon has a high priority */
    INTCON3bits.INT1P  = 1; 
    
    INTCON2bits.INTEDG1= 0;

    /*  Authorize interrupions */
    INTCONbits.GIE     = 1;

    /* Authorize interruption of both buttons */
    INTCON3bits.INT1E  = 1;
    INTCON3bits.INT3E  = 1;

    T0CONbits.T0CS     = 1;
    
    LCDInit();
    for(i=0;i<100;i++) dumb_delay1ms();

    display_time (); 

	/*  Connect interruptions TMR0 with high priority*/
	INTCON2bits.TMR0IP	 = 1; 
	
	/* clear interruption flag */
	TMR0F    = 0;
    	
	/*  Configure timer in 16 bits */
	T0CONbits.T08BIT    = 0;

	T0CONbits.PSA       = 1;

	INTCONbits.TMR0IE   = 1;
	
	T0CONbits.TMR0ON    = 1;
    
    /*  Loop that refreshes the display everytime the refresh is set to 1 */
    while(1)
    {
        if ( refresh == 1){
            refresh = 0;
            display_time();
            if ( alarmflag == 1){
                alarm();
            }
        }
    }
}

void increment_time(){
        time[position]++;
        if(time[4] == ':'){
            time[4] = '0';
            ++time[3];
        }
        if(time[3]=='6'){
            time[3]='0';
            time[1]++;
        }
        if(time[1] == ':'){
            time[1] = '0';
            ++time[0];
        }
        else if(time[0]=='2' && time[1]>='4'){
            time[0]='0';
            time[1]='0';
        }
        else if(time[0]=='3'){
            time[0]='0';
        }
}


void alarm(){
    int blink = 1;
    int i = 0;
    int j = 0;
    int k = 0;
    for(i; i<5; i++){
        if(currentTime[i]!=time[i]){
            blink = 0;
            i = 5;
        }
    }
    if(blink){
        display_string(0,"    Wake up!    ");
        display_string(16, "                ");
        for(j; j<30; j++){
            LED1_IO ^=1;
            for(k=0; k<40;++k) 
                dumb_delay1ms();
        }
        LED1_IO ^=1;
    }
    alarmflag = 0;
}

void test_inc_current_time(){        
    if(currentTime[7] == ':'){
        currentTime[7] = '0';
        ++currentTime[6];
    }
    if(currentTime[6]=='6'){
        currentTime[6]='0';
        currentTime[4]++;
        alarmflag = 1;
    }
    if(currentTime[4] == ':'){
        currentTime[4] = '0';
        ++currentTime[3];
    }
    if(currentTime[3]=='6'){
        currentTime[3]='0';
        currentTime[1]++;
    }
    if(currentTime[1] == ':'){
        currentTime[1] = '0';
        ++currentTime[0];
    }
    if(currentTime[0]=='2' && currentTime[1]=='4'){
        currentTime[0]='0';
        currentTime[1]='0';
    }
    if(currentTime[0]=='3'){
        currentTime[0]='0';
    }
}

void display_time(){    
    display_string(0,time);         
    if(position == 0) display_string(16+position-1," ^");
    else display_string(16+position-3,"   ^");
}
 
/*************************************************
 Function display_word:
 writes a WORD in hexa on the position indicated by
 pos. 
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD

 __SDCC__ only: for debugging
*************************************************/
#if defined(__SDCC__)
void display_word(BYTE pos, WORD w) //WORD is a 16 bits unsigned
{
    BYTE WDigit[6]; //enough for a  number < 65636: 5 digits + \0
    BYTE j;
    BYTE LCDPos=0;  //write on first line of LCD
    unsigned radix=10; //type expected by sdcc's ultoa()

    LCDPos=pos;
    ultoa(w, WDigit, radix);      
    for(j = 0; j < strlen((char*)WDigit); j++)
    {
       LCDText[LCDPos++] = WDigit[j];
    }
    if(LCDPos < 32u)
       LCDText[LCDPos] = 0;
    LCDUpdate();
}
/*************************************************
 Function display_string: 
 Writes an IP address to string to the LCD display
 starting at pos
*************************************************/
void display_string(BYTE pos, char* text)
{
   BYTE l= strlen(text)+1;
   BYTE max= 32-pos;
   strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
   LCDUpdate();
}
#endif


/*-------------------------------------------------------------------------
 *
 * strlcpy.c
 *    strncpy done right
 *
 * This file was taken from OpenBSD and is used on platforms that don't
 * provide strlcpy().  The OpenBSD copyright terms follow.
 *-------------------------------------------------------------------------
 */

/*  $OpenBSD: strlcpy.c,v 1.11 2006/05/05 15:27:38 millert Exp $    */

/*
 * Copyright (c) 1998 Todd C. Miller <Todd.Miller@courtesan.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 
/*
 * Copy src to string dst of size siz.  At most siz-1 characters
 * will be copied.  Always NUL terminates (unless siz == 0).
 * Returns strlen(src); if retval >= siz, truncation occurred.
 * Function creation history:  http://www.gratisoft.us/todd/papers/strlcpy.html
 */
size_t
strlcpy(char *dst, const char *src, size_t siz)
{
    char       *d = dst;
    const char *s = src;
    size_t      n = siz;

    /* Copy as many bytes as will fit */
    if (n != 0)
    {
        while (--n != 0)
        {
            if ((*d++ = *s++) == '\0')
                break;
        }
    }

    /* Not enough room in dst, add NUL and traverse rest of src */
    if (n == 0)
    {
        if (siz != 0)
            *d = '\0';          /* NUL-terminate dst */
        while (*s++)
            ;
    }



    return (s - src - 1);       /* count does not include NUL */
}


void dumb_delay1ms (void)
{
    TMR0H = HIGH (0x10000-EXEC_FREQ/1000);
    TMR0L = LOW  (0x10000-EXEC_FREQ/1000);
    T0CONbits.TMR0ON = 0;  //disable timer0
    T0CONbits.T08BIT = 0;  //use timer0 16-bit counter
    T0CONbits.T0CS   = 0;  //use timer0 instruction cycle clock
    T0CONbits.PSA    = 1;  //disable timer0 prescaler
    INTCONbits.T0IF   = 0;  //clear timer0 overflow bit
    T0CONbits.TMR0ON = 1;  //enable timer0
    while(!INTCONbits.T0IF){} //busy wait for timer0 to overflow
    INTCONbits.T0IF   = 0;  //clear timer0 overflow bit
    //T0CONbits.TMR0ON = 0;  //disable timer0   
}
