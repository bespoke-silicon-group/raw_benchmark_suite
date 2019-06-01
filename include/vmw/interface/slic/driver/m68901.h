/* Copyright (c) 1992 by Sun Microsystems, Inc. */

#pragma ident  "@(#)m68901.h 1.1     92/10/29 SMI"

#ifdef	__cplusplus
extern "C" {
#endif

typedef struct {
	u_char	
		gpip,	/* General Pupose I/O register */
		aer,	/* Active Edge Register */
		ddr,	/* Data Direction Register */
		iera,	/* Interrupt Enable Register A */
		ierb,	/* Interrupt Enable Register B */
		ipra,	/* Interrupt Pending Register A */
		iprb,	/* Interrupt Pending Register B */
		isra,	/* Interrupt In-Service Register A */
		isrb,	/* Interrupt In-Service Register B */
		imra,	/* Interrupt Mask Register A */
		imrb,	/* Interrupt Mask Register B */
		vr,		/* Vector Register */
		tacr,	/* Timer A Control Register */
		tbcr,	/* Timer B Control Register */
		tcdcr,	/* Timers C & D Control Register */
		tadr,	/* Timer A Data Register */
		tbdr,	/* Timer B Data Register */
		tcdr,	/* Timer C Data Register */
		tddr,	/* Timer D Data Register */
		scr,	/* Synchronous Character Register */
		ucr,	/* USART Control Register */
		rsr,	/* Receiver Status Register */
		tsr,	/* Transmitter Status Register */
		udr;	/* USART Data Register */
} m68901_t;

extern m68901_t	m68901;

/* m68901 interrupt channels
 *  interrupt registers A
 *	F x80	General Purpose Interrupt 7 (I7)	(Highest)
 *	E x40	General Purpose Interrupt 6 (I6)
 *	D x20	Timer A
 *	C x10	Recieve Buffer Full
 *	B x08	Recieve Error
 *	A x04	Transmit Buffer Empty
 *	9 x02	Transmit Error
 *	8 x01	Timer B

 *  interrupt registers A
 *	7 x80	General Purpose Interrupt 5 (I5)
 *	6 x40	General Purpose Interrupt 4 (I4)
 *	5 x20	Timer C
 *	4 x10	Timer D
 *	3 x08	General Purpose Interrupt 3 (I3)
 *	2 x04	General Purpose Interrupt 2 (I2)
 *	1 x02	General Purpose Interrupt 1 (I1)
 *	0 x01	General Purpose Interrupt 0 (I0)	(Lowest)
 */
#define CLOCKRATE	(4915200/2)	/* P2 Clock Rate */
#define TAI_FREQ	1	/* XXX Timer A input frequency in ?units? */
#define TBI_FREQ	1	/* XXX Timer B input frequency in ?units? */

#define IRA_ETXB_PERR	(0x80)	/* Parity Error on Etx B */
#define IRA_ETXA_PERR	(0x40)	/* Parity Error on Etx A */
#define IRA_TIMEA		(0x20)	/* Timer A (time base, pSOS clock) */
#define IRA_RB_FULL		(0x10)	/* receive buffer full */
#define IRA_RCV_ERR		(0x08)	/* receive error */
#define IRA_XMIT_EMPTY	(0x04)	/* transmit buffer empty */
#define IRA_XMIT_ERR	(0x02)	/* transmit error */
#define IRA_TIMEB		(0x01)	/* Timer B */

#define IRB_HOST		(0x80)	/* interrupt from unix host */
#define IRB_DMA			(0x40)	/* DMA completion interrupt */
#define IRB_TIMEC		(0x20)	/* Timer C (SCC clock [maybe]) XXX */
#define IRB_TIMED		(0x10)	/* Timer D (baud rate generator) */
#define IRB_ACE			(0x08)	/* ACE flags on packet */
#define IRB_LINEB		(0x04)	/* line B status change */
#define IRB_LINEA		(0x02)	/* line A status change */
#define IRB_HSS_DTR		(0x01)	/* P2: DTR Output on HSS */
#define IRB_LQM			(0x01)	/* P3: Link quality monitor interrupt */


#define IRA_EMASK	(IRA_TIMEA|IRA_TIMEB)
#define IRB_EMASK	(IRB_HOST|IRB_DMA|IRB_LINEB|IRB_LINEA|IRB_LQM)

/* unused interrupts */
#define BOGUS_A ((u_char)~IRA_EMASK)
#define BOGUS_B ((u_char)~IRB_EMASK)

#define TMODE_STOP					(0)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV4			(1)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV10			(2)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV16			(3)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV50			(4)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV64			(5)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV100			(6)	/* tacr, tbcr, tcdcr */
#define TMODE_DELAY_DIV200			(7)	/* tacr, tbcr, tcdcr */
#define TMODE_EVENT_COUNT			(8)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV4		(9)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV10		(10)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV16		(11)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV50		(12)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV64		(13)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV100	(14)	/* tacr, tbcr */
#define TMODE_PULSE_WIDTH_DIV200	(15)	/* tacr, tbcr */

#define TCDCR(cmode,dmode)	((cmode << 4) | dmode)

/* USART control Register Definitions */
#define UCR_CLK_DIV1		(0<<7)	/* divide input clock freq by 1 */
#define UCR_CLK_DIV16		(1<<7)	/* divide input clock freq by 16 */
#define UCR_WL_8			(0<<5)	/* 8 data bits */
#define UCR_WL_7			(1<<5)	/* 7 data bits */
#define UCR_WL_6			(2<<5)	/* 6 data bits */
#define UCR_WL_5			(3<<5)	/* 5 data bits */
#define UCR_SSBITS_0_0		(0<<3)	/* 0 start bits, 0 stop bits */
#define UCR_SSBITS_1_1		(1<<3)	/* 1 start bit, 1 stop bit */
#define UCR_SSBITS_1_15		(2<<3)	/* 1 start bit, 1.5 stop bits */
#define UCR_SSBITS_1_2		(3<<3)	/* 1 start bit, 2 stop bits */
#define UCR_PARITY_DISABLE	(0<<2)
#define UCR_PARITY_ENABLE	(1<<2)
#define UCR_ODD_PARITY		(0<<1)
#define UCR_EVEN_PARITY		(1<<1)
	/* Bit 0 of the UCR is not used */

#define RSR_FULL			(1<<7)	/* Receive Buffer Full */
#define RSR_OVERRUN			(1<<6)	/* Receive Buffer Overrun (new data is lost) */
#define RSR_PARITY			(1<<5)	/* Parity Error */
#define RSR_FRAME			(1<<4)	/* Frame Error */
#define RSR_BREAK			(1<<3)	/* Break Condition */
#define RSR_CIP				(1<<2)	/* Receive Character in Progress */
#define RSR_RECV_ENABLE		(1<<0)	/* Receiver Enable */

#define TSR_EMPTY			(1<<7)	/* Transmit Buffer Empty */
#define TSR_UNDERRUN		(1<<6)	/* Underrun Error */
#define TSR_AUTO_TURNAROUND	(1<<5)	/* XXX ? */
#define TSR_END				(1<<4)	/* XXX ? */
#define TSR_BREAK			(1<<3)	/* Send Break */
#define TSR_HIGH_IMPEDANCE	(0<<1)	/* Configure Xmit output (SO) */
#define TSR_LOW				(1<<1)	/* Configure Xmit output (SO) */
#define TSR_HIGH			(2<<1)	/* Configure Xmit output (SO) */
#define TSR_LOOPBACK		(3<<1)	/* Configure Xmit output (SO) */
#define TSR_XMIT_ENABLE		(1<<0)

/* Arguments to m68901_init */
#define INIT_DBPORT	(0)	/* initialize debug port */
#define INIT_L3		(1)	/* initialize lev 3 interrupt ctlr */

/* Status of input port */
#define STS_NODATA	0
#define STS_CHAR	1
#define STS_BREAK	2

#define TICKRATE	100	/* Ticks per second */
