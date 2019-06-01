// vmw_synthprim.v

/*       Virtual Machine Works
//
// (C) COPYRIGHT, Virtual Machine Works, Inc. 1994, 1995, 1996
// All Rights Reserved
// Licensed Materials - Property of Virtual Machine Works
//
// No part of this file may be reproduced, stored in a retrieval system,
// or transmitted in any form or by any means --- electronic, mechanical,
// photocopying, recording, or otherwise --- without prior written permission
// of Virtual Machine Works, Inc.
//
// WARRANTY:
// Use all material in this file at your own risk.  Virtual Machine Works
// makes no claims about any material contained in this file.
*/

//
// VMW synthesis primitives, macros
//
// default is simulation models
// define VMWSYNLIB to enable prototypes for synthesis library definition
//
//
// If you add any non-primitive elements to vmw_synthprim.v, the following
// rules must be adhered to from here on out.
//
// 1. Only make use of primitives defined in vmw_synthprim.v, (not
//    vmw_reference.v).  You can add a new VMWS_ version of a primitive,
//    if you know what you're doing, but don't reference vmw_ versions
//    directly from synthprim.
//
// 2. Write all code using bind by name rather than bind by position so
//    the code is understandable.
//
//Charley
//

`ifdef VMW_USER_TIMESCALE
`include "vmw.timescale"
`endif

`ifdef VMW_NO_LIBNAMES
//`remove_netnames
`remove_gatenames
`endif

// clock-enabled d-flop w/set+reset
macromodule VMWS_DFFE
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC), .CLRN(FlopR_),
	         .PRN(FlopS_), .ENA(FlopE), .Q(FlopQ) );
    input  FlopD, FlopC, FlopR_, FlopS_, FlopE;
    output FlopQ;

`else
(D, CLK, CLRN, PRN, ENA, Q);
    input D, CLK, CLRN, PRN, ENA;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFFE u1 (Q, ENA, D, CLK, clr, pr);
`else
    VMWS_PRIM_DFFE u1 (Q, ENA, d, CLK, clr, pr);
    buf #(1.0) u1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

    not u2 (pr, PRN);
    not u3 (clr, CLRN);

`endif
endmodule

// clock-enabled d-flop
macromodule VMWS_DFFENP
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC), .ENA(FlopE), .Q(FlopQ) );
    input  FlopD, FlopC, FlopE;
    output FlopQ;

`else
(D, CLK, ENA, Q);
    input D, CLK, ENA;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFFE u1 (Q, ENA, D, CLK, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFFE u1 (Q, ENA, d, CLK, 1'b0, 1'b0);
    buf #(1.0) u1a (d, D);
`endif

`endif
endmodule

// d-flop
macromodule VMWS_DFF_RN
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC), .Q(FlopQ) );
    input  FlopD, FlopC;
    output FlopQ;

`else
(D, CLK, Q);
    input D, CLK;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF u1 (Q, D, CLK, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF u1 (Q, d, CLK, 1'b0, 1'b0);
    buf #(1.0) u1a (d, D);
`endif

`endif
endmodule


// d-flop w/presets
macromodule VMWS_DFFP
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC), .Q(FlopQ), .CLRN(FlopR_), .PRN(FlopS_) );
    input  FlopD, FlopC, FlopR_, FlopS_;
    output FlopQ;

`else
(D, CLK, Q, CLRN, PRN);
    input D, CLK, CLRN, PRN;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF u1 (Q, D, CLK, clr, pr);
`else
    VMWS_PRIM_DFF u1 (Q, d, CLK, clr, pr);
    buf #(1.0) u1a (d, D);
`endif
    not u2 (pr, PRN);
    not u3 (clr, CLRN);

`endif
endmodule


// negative-edge d-flop
macromodule VMWS_DFFNC
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC_), .Q(FlopQ) );
    input  FlopD, FlopC_;
    output FlopQ;

`else
(D, CLK, Q);
    input D, CLK;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF u1 (Q, D, clkn, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF u1 (Q, d, clkn, 1'b0, 1'b0);
    buf #(1.0) u1a (d, D);
`endif
    not u2 (clkn, CLK);

`endif
endmodule

// negative-edge d-flop w/presets
macromodule VMWS_DFFNCP
`ifdef VMWSYNLIB
( .D(FlopD), .CLK(FlopC_), .Q(FlopQ), .CLRN(FlopR_), .PRN(FlopS_) );
    input  FlopD, FlopC_, FlopR_, FlopS_;
    output FlopQ;

`else
(D, CLK, Q, CLRN, PRN);
    input D, CLK, CLRN, PRN;
    output Q;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF u1 (Q, D, clkn, clr, pr);
`else
    VMWS_PRIM_DFF u1 (Q, d, clkn, clr, pr);
    buf #(1.0) u1a (d, D);
`endif
    not u2 (pr, PRN);
    not u3 (clr, CLRN);
    not u4 (clkn, CLK);

`endif
endmodule

// internal tristate
macromodule VMWS_TRI
`ifdef VMWSYNLIB
( .IN(PadI), .OE(PadE), .OUT(PadO) );
    input  PadI, PadE;
    inout PadO;

`else
(IN, OE, OUT);
    input IN, OE;
    inout OUT;

`ifdef VCS 
    // Chrono dislikes bufif
    assign OUT = (OE) ? IN : 1'bz;
`else
    bufif1 (OUT, IN, OE);
`endif

`endif
endmodule

macromodule VMWS_AND2 (OUT, IN1, IN2);
    output OUT;
    input IN1, IN2;

`ifdef VMWSYNLIB
`else
    and (OUT, IN1, IN2);
`endif
endmodule

macromodule VMWS_NAND2 (OUT, IN1, IN2);
    output OUT;
    input IN1, IN2;

`ifdef VMWSYNLIB
`else
    nand (OUT, IN1, IN2);
`endif
endmodule

macromodule VMWS_AND3 (OUT, IN1, IN2, IN3);
    output OUT;
    input IN1, IN2, IN3;

`ifdef VMWSYNLIB
`else
    and (OUT, IN1, IN2, IN3);
`endif
endmodule

macromodule VMWS_AND4 (OUT, IN1, IN2, IN3, IN4);
    output OUT;
    input IN1, IN2, IN3, IN4;

`ifdef VMWSYNLIB
`else
    and (OUT, IN1, IN2, IN3, IN4);
`endif
endmodule

macromodule VMWS_OR2 (OUT, IN1, IN2);
    output OUT;
    input IN1, IN2;

`ifdef VMWSYNLIB
`else
    or (OUT, IN1, IN2);
`endif
endmodule

macromodule VMWS_NOR2 (OUT, IN1, IN2);
    output OUT;
    input IN1, IN2;

`ifdef VMWSYNLIB
`else
    nor (OUT, IN1, IN2);
`endif
endmodule

macromodule VMWS_OR3 (OUT, IN1, IN2, IN3);
    output OUT;
    input IN1, IN2, IN3;

`ifdef VMWSYNLIB
`else
    or (OUT, IN1, IN2, IN3);
`endif
endmodule
 
macromodule VMWS_NOR3 (OUT, IN1, IN2, IN3);
    output OUT;
    input IN1, IN2, IN3;
 
`ifdef VMWSYNLIB
`else
    nor (OUT, IN1, IN2, IN3);
`endif
endmodule

macromodule VMWS_XOR2 (OUT, IN1, IN2);
    output OUT;
    input IN1, IN2;

`ifdef VMWSYNLIB
`else
    xor (OUT, IN1, IN2);
`endif
endmodule

macromodule VMWS_NOT (OUT, IN);
    output OUT;
    input IN;

`ifdef VMWSYNLIB
`else
    not (OUT, IN);
`endif
endmodule

// internal buffer
macromodule VMWS_BUF (OUT, IN);
    output OUT;
    input IN;

`ifdef VMWSYNLIB
`else
    buf (OUT, IN);
`endif
endmodule

// input pad
macromodule VMWS_IPAD (OUT, IN);
    output OUT;
    input IN;

`ifdef VMWSYNLIB
`else
    buf (OUT, IN);
`endif
endmodule

// registered input pad
macromodule VMWS_IREG (OUT, IN, CLK, Q);
    output OUT, Q;
    input IN, CLK;

`ifdef VMWSYNLIB
`else
    buf u1 (OUT, IN);
`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF u2 (Q, IN, CLK, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF u2 (Q, in, CLK, 1'b0, 1'b0);
    buf #(1.0) u2a (in, IN);
`endif
`endif
endmodule

// clock input pad
macromodule VMWS_CPAD (OUT, IN);
    output OUT;
    input IN;

`ifdef VMWSYNLIB
`else
    buf (OUT, IN);
`endif
endmodule

// simple output pad
macromodule VMWS_OPAD (OUT, IN);
    output OUT;
    input IN;

`ifdef VMWSYNLIB
`else
    buf (OUT, IN);
`endif
endmodule

// tristatable output pad
macromodule VMWS_TPAD
`ifdef VMWSYNLIB
(.OUT(PadO), .IN(PadI), .OE(PadE));
    inout PadO;
    input PadI, PadE;

`else
(OUT, IN, OE);
    inout OUT;
    input IN, OE;


`ifdef VCS    
    // Chrono dislikes bufif
    assign OUT = (OE) ? IN : 1'bz;
`else
    bufif1 (OUT, IN, OE);
`endif
`endif
endmodule

// pad pullup/pulldown

macromodule VMWS_PULLUP(Z);
    inout Z;

`ifdef VMWSYNLIB
`else
    pullup(Z);
`endif
endmodule

macromodule VMWS_PULLDOWN(Z);
    inout Z;

`ifdef VMWSYNLIB
`else
    pulldown(Z);
`endif
endmodule


// dependency-breaking buffer
macromodule VMWS_NODEPEND (OUT, IN);
    output OUT;
    input IN;

    assign OUT = IN;
endmodule


//
// synthesis macros
//

// 2-input mux
// Any changes to VMWS_FLOPEXT should also be made to VMWS_KEEPMUX
macromodule VMWS_FLOPEXT ( D, Q, ENA, OUT );
input  D, Q, ENA;
output OUT;

`ifdef VMWSYNLIB
    wire net_f2, net_f4, net_f5;
    VMWS_NOT F_NOT ( .IN(ENA), .OUT(net_f2) );
    VMWS_OR2 F_OR ( .IN1(net_f4), .IN2(net_f5), .OUT(OUT) );
    VMWS_AND2 F_AND0 ( .IN1(ENA), .IN2(D), .OUT(net_f4) );
    VMWS_AND2 F_AND1 ( .IN1(net_f2), .IN2(Q), .OUT(net_f5) );
`else
    VMW_PRIM_MUX1 p1 (OUT, ENA, Q, D);
`endif
endmodule

// alternate name for 2-input mux - keep the internals identical to VMWS_FLOPEXT
macromodule VMWS_KEEPMUX ( D, Q, ENA, OUT );
input  D, Q, ENA;
output OUT;

`ifdef VMWSYNLIB
    wire net_f2, net_f4, net_f5;
    VMWS_NOT F_NOT ( .IN(ENA), .OUT(net_f2) );
    VMWS_OR2 F_OR ( .IN1(net_f4), .IN2(net_f5), .OUT(OUT) );
    VMWS_AND2 F_AND0 ( .IN1(ENA), .IN2(D), .OUT(net_f4) );
    VMWS_AND2 F_AND1 ( .IN1(net_f2), .IN2(Q), .OUT(net_f5) );
`else
    VMW_PRIM_MUX1 p1 (OUT, ENA, Q, D);
`endif
endmodule

// 2-input mux, using different pin names
macromodule VMWS_MUX (I0, I1, SEL, OUT);
    input  I0, I1, SEL;
    output OUT;

`ifdef VMWSYNLIB
    wire net_f2, net_f4, net_f5;
    VMWS_NOT F_NOT ( .IN(SEL), .OUT(net_f2) );
    VMWS_OR2 F_OR ( .IN1(net_f4), .IN2(net_f5), .OUT(OUT) );
    VMWS_AND2 F_AND0 ( .IN1(SEL), .IN2(I1), .OUT(net_f4) );
    VMWS_AND2 F_AND1 ( .IN1(net_f2), .IN2(I0), .OUT(net_f5) );
`else
    VMW_PRIM_MUX1 p1 (OUT, SEL, I0, I1);
`endif
endmodule


// a pair of muxes used to build an internal scanchain around
// design flops
module VMWS_FLOPSCANEXT ( D, Q, ENA, OUT, SCAND, SCANENA );
input  D, Q, ENA, SCAND, SCANENA;
output OUT;
    wire net_fs5;
    VMWS_FLOPEXT FS_MUX1 ( .D(SCAND), .Q(net_fs5), .ENA(SCANENA),
			   .OUT(OUT) );
    VMWS_FLOPEXT FS_MUX0 ( .D(D), .Q(Q), .ENA(ENA), .OUT(net_fs5) );
endmodule

// scan i/o cells

// does NOT support redirect
module VMWS_SCAN_IN_NOPOD ( A, SCANIN, SCANLD, REDIRECT, SCANCLK,
		            SCANENA, SCANOUT, Z );
input  A, SCANIN, SCANLD, REDIRECT, SCANCLK, SCANENA;
output SCANOUT, Z;
    assign Z = SCANOUT;
    VMWS_DFFENP SI_DFF ( .D(SCANIN), .CLK(SCANCLK), .ENA(SCANENA),
			 .Q(SCANOUT) );
endmodule

// supports redirect
module VMWS_SCAN_IN ( A, SCANIN, SCANLD, REDIRECT, SCANCLK,
			 SCANENA, SCANOUT, Z );
input  A, SCANIN, SCANLD, REDIRECT, SCANCLK, SCANENA;
output SCANOUT, Z;
    VMWS_FLOPEXT SI_MUX2 ( .D(SCANOUT), .Q(A), .ENA(REDIRECT), .OUT(Z) );
    VMWS_DFFENP SI_DFF ( .D(SCANIN), .CLK(SCANCLK), .ENA(SCANENA),
			 .Q(SCANOUT) );
endmodule

// supports redirect and capturing of pod-input data
module VMWS_SCAN_IN_PODCAPTURE ( A, SCANIN, SCANLD, REDIRECT, SCANCLK,
			 SCANENA, SCANOUT, Z );
input  A, SCANIN, SCANLD, REDIRECT, SCANCLK, SCANENA;
output SCANOUT, Z;
    wire net_si2, net_si4;
    VMWS_FLOPEXT SI_MUX0 ( .D(SCANIN), .Q(net_si4), .ENA(SCANENA), .OUT(net_si2) );
    VMWS_FLOPEXT SI_MUX1 ( .D(Z), .Q(SCANOUT), .ENA(SCANLD), .OUT(net_si4) );
    VMWS_FLOPEXT SI_MUX2 ( .D(SCANOUT), .Q(A), .ENA(REDIRECT), .OUT(Z) );
    VMWS_DFF_RN SI_DFF ( .D(net_si2), .CLK(SCANCLK), .Q(SCANOUT) );
endmodule

module VMWS_SCAN_OUT ( A, SCANIN, SCANLD, REDIRECT, SCANCLK,
		       SCANENA, SCANOUT, Z );
input  A, SCANIN, SCANLD, REDIRECT, SCANCLK, SCANENA;
output SCANOUT, Z;
    assign Z = A;
    VMWS_FLOPEXT SO_MUX1 ( .D(A), .Q(SCANOUT), .ENA(SCANLD),
			   .OUT(net_so1) );
    VMWS_FLOPEXT SO_MUX2 ( .D(SCANIN), .Q(net_so1), .ENA(SCANENA),
			   .OUT(net_so2) );
    VMWS_DFF_RN SO_DFF ( .D(net_so2), .CLK(SCANCLK), .Q(SCANOUT) );
endmodule

// saves a LUT, but requires SCANENA to be asserted with SCANLD
// not currently used
module VMWS_SCAN_OUTOPT ( A, SCANIN, SCANLD, REDIRECT, SCANCLK,
		          SCANENA, SCANOUT, Z );
input  A, SCANIN, SCANLD, REDIRECT, SCANCLK, SCANENA;
output SCANOUT, Z;
    wire net_so3;
    assign Z = A;
    VMWS_FLOPEXT SO_MUX1 ( .D(A), .Q(SCANIN), .ENA(SCANLD),
			   .OUT(net_so3) );
    VMWS_DFFENP SO_DFF ( .D(net_so3), .CLK(SCANCLK), .ENA(SCANENA),
			 .Q(SCANOUT) );
endmodule


module VMWS_SCAN_CTRL ( SCANIN, SCANCLK, SCANCTL0, EXTSCANOUT, INTSCANOUT,
                        INENA, OUTENA, INTENA, SCANLD, REDIRECT, SCANOUT,
	                TCLKBAR, EMBED_ACTIVE, SCAN_MEM_WRITE, SCAN_MEM_WE,
                        SCAN_ACTIVE, SHIFT, EMBED_RESET, SCAN_MEM_OE);
  input SCANIN, SCANCLK, SCANCTL0, EXTSCANOUT, INTSCANOUT;
  output INENA, OUTENA, INTENA, SCANLD, REDIRECT, SCANOUT;
  output TCLKBAR, EMBED_ACTIVE, SCAN_MEM_WRITE, SCAN_MEM_WE, SCAN_ACTIVE;
  output SHIFT, EMBED_RESET, SCAN_MEM_OE;

    // Rename IOs
    wire TCLK;
    assign TCLK = SCANCLK;
    wire TMS;
    assign TMS = SCANCTL0;

    // All FSM flip-flops are SC_<STATE NAME>.
    // All FSM flip-flop outputs are SN_<State name>.

    // State elements
    VMWS_DFF_RN SC_IDLE (.D(go_to_idle), .CLK(TCLK), .Q(SN_Idle));
    VMWS_DFF_RN SC_ACTIVE (.D(net_sc4), .CLK(TCLK), .Q(SN_Active));
    VMWS_DFF_RN SC_SAMPLE (.D(net_sc7), .CLK(TCLK), .Q(SN_Sample));
    VMWS_DFF_RN SC_ACTIVE2 (.D(net_sc11), .CLK(TCLK), .Q(SN_Active2));
    VMWS_DFF_RN SC_RESET (.D(net_sc12), .CLK(TCLK), .Q(SN_EmbedReset));
    VMWS_DFF_RN SC_SHIFT (.D(go_to_shift), .CLK(TCLK), .Q(SN_Shift));
    VMWS_DFF_RN SC_REDIRECT (.D(net_sc16), .CLK(TCLK), .Q(SN_NoRedirect));
    VMWS_DFF_RN SC_MEMWRITE1 (.D(net_sc17), .CLK(TCLK), .Q(SN_Mem1));
    VMWS_DFF_RN SC_MEMWRITE2 (.D(SN_Mem1), .CLK(TCLK), .Q(SN_Mem2));
    VMWS_DFF_RN SC_MEMWRITE3 (.D(SN_Mem2), .CLK(TCLK), .Q(SN_Mem3));
    VMWS_DFF_RN SC_MEMWRITE4 (.D(SN_Mem3), .CLK(TCLK), .Q(SN_Mem4));

    assign SCANLD = SN_Sample;
    assign SCAN_ACTIVE = SN_Active;
    assign SCAN_MEM_WE = SN_Mem3;
    assign SHIFT = SN_Shift;
    assign EMBED_RESET = SN_EmbedReset;

    VMWS_NOT SC_NOT1 (.IN(TMS), .OUT(TMSbar));

    // Idle
    VMWS_NOR3 SC_GoToIdle (.OUT(go_to_idle), .IN1(TMS), .IN2(SN_Active), .IN3(SN_Active2));

    // Active
    VMWS_AND2 SC_AND2 (.IN1(TMS), .IN2(SN_Idle), .OUT(net_sc4));

    // Sample
    VMWS_AND2 SC_AND3 (.IN1(TMS), .IN2(SN_Active), .OUT(net_sc7));

    // Shift
    VMWS_AND2 SC_AND4 (.IN1(TMS), .IN2(SN_Sample), .OUT(sample_and_tms));
    VMWS_AND2 SC_AND5 (.IN1(TMS), .IN2(SN_Shift), .OUT(INENA));
    VMWS_OR2 SC_OR1 (.IN1(sample_and_tms), .IN2(INENA), .OUT(go_to_shift));

    // Active2
    VMWS_AND2 SC_AND6 (.IN1(TMSbar), .IN2(SN_Active), .OUT(net_sc11));

    // Embed Reset
    VMWS_AND2 SC_AND10 (.IN1(TMS), .IN2(SN_Active2), .OUT(net_sc12));

    // Redirect
    VMWS_AND2 SC_AND7 (.IN1(TMS), .IN2(SN_EmbedReset), .OUT(net_sc14));
    VMWS_OR2 SC_OR2 (.IN1(net_sc14), .IN2(net_sc15), .OUT(net_sc16));
    VMWS_AND2 SC_AND8 (.IN1(TMS), .IN2(SN_NoRedirect), .OUT(net_sc15));
    // REDIRECT (scan enable/pod disable) is asserted by default
    VMWS_NOT SC_NOT2 (.IN(SN_NoRedirect), .OUT(REDIRECT));

    // Memory write chain and outputs
    VMWS_AND2 SC_AND9 (.IN1(TMSbar), .IN2(SN_Active2), .OUT(net_sc17));
    VMWS_OR2 SC_OR3 (.IN1(SN_Mem3), .IN2(SN_Mem4), .OUT(MEMDATAENA));
    VMWS_OR2 SC_OR4 (.IN1(SN_Mem1), .IN2(SN_Mem2), .OUT(net_sc18));
    VMWS_OR2 SC_OR5 (.IN1(MEMDATAENA), .IN2(net_sc18), .OUT(MEMOEOFF));

    // TDO retime to TCLK-bar
    VMWS_NOT SC_INV (.IN(TCLK), .OUT(TCLKBAR));
    VMWS_DFF_RN SC_TDORETIME (.D(EXTSCANOUT), .CLK(TCLKBAR), .Q(SCANOUT));

    // Drive boring outputs.
    VMWS_BUF SC_BUFF0 (.OUT(OUTENA), .IN(1'b0));
    VMWS_BUF SC_BUFF1 (.OUT(INTENA), .IN(1'b0));


    // Utility outputs needed by all the mem scan controllers
    VMWS_OR2 or2_1 (EMBED_ACTIVE, SN_Idle, SN_NoRedirect);
    VMWS_OR3 or3_1 (mem1_3, SN_Mem1, SN_Mem2, SN_Mem3);
    VMWS_DFF_RN we_latch (.D(mem1_3), .Q(SCAN_MEM_WRITE), .CLK(TCLKBAR));
    // Enable outputs during w/o glitching during sample and cycle before and after
    VMWS_OR3 or3_2 (.OUT(mem_oe_pre), .IN1(net_sc4), .IN2(net_sc7), .IN3(SN_Sample));
    VMWS_DFF_RN SC_OE (.D(mem_oe_pre), .CLK(TCLK), .Q(SCAN_MEM_OE));
endmodule

module VMWS_SCAN_NULL_FPGA ( TDI, TCLK, TDO );
input TDI, TCLK;
output TDO;

    VMWS_DFF_RN SC_0(.D(TDI), .CLK(TCLK), .Q(net_sc1));
    VMWS_DFF_RN SC_1(.D(net_sc1), .CLK(TCLK), .Q(net_sc2));
    VMWS_DFF_RN SC_2(.D(net_sc2), .CLK(TCLK), .Q(net_sc3));
    VMWS_DFF_RN SC_3(.D(net_sc3), .CLK(TCLK), .Q(net_sc4));
    VMWS_DFF_RN SC_4(.D(net_sc4), .CLK(TCLK), .Q(net_sc5));
    VMWS_DFF_RN SC_5(.D(net_sc5), .CLK(TCLK), .Q(net_sc6));
    VMWS_DFF_RN SC_6(.D(net_sc6), .CLK(TCLK), .Q(net_sc7));
    VMWS_DFF_RN SC_7(.D(net_sc7), .CLK(TCLK), .Q(net_sc8));
    VMWS_NOT SC_NOT0 (.IN(TCLK), .OUT(tclk_bar));
    VMWS_DFF_RN SC_8(.D(net_sc8), .CLK(tclk_bar), .Q(TDO));

endmodule


// Memory scan elements

module VMWS_AO21 (Z, A, B, C);
  //    function : "((A B)+C)";
    output Z;
    input A,B,C;
    VMWS_AND2 g1(.OUT(t), .IN1(A), .IN2(B));
    VMWS_OR2 g2(.OUT(Z), .IN1(t), .IN2(C));
endmodule

module VMWS_AOI21 (Z, A, B, C);
   //    function : "((A B)+C)'";
    output Z;
    input A,B,C;
    VMWS_AND2 g1(.OUT(t), .IN1(A), .IN2(B));
    VMWS_NOR2 g2(.OUT(Z), .IN1(t), .IN2(C));
endmodule

// address enable element
module VMWS_ORN1 (Z, A, B);
  //    function: "(A'+B);
    output Z;
    input A,B;
    VMWS_NOT g1(.OUT(t), .IN(A));
    VMWS_OR2 g2(.OUT(Z), .IN1(t), .IN2(B));
endmodule

//scan mem ena
module VMWS_WE_SYNC (SCAN_WE, SCAN_WEE, VCLK, TCLKWE);
  output SCAN_WE, SCAN_WEE;
  input VCLK, TCLKWE;
  wire x;
  assign x=1'b0;
  VMWS_NOT n1(.OUT(y), .IN(x));
//  VMWS_DFFE flop1(.D(x), .CLK(TCLKWE), .Q(t1), .CLRN(t4), .PRN(1'b1), .ENA(x));
//  VMWS_DFFE flop2(.D(t1), .CLK(VCLK), .Q(t2), .CLRN(t4), .PRN(1'b1), .ENA(x));
  VMWS_DFFE flop1(.D(y), .CLK(TCLKWE), .Q(t1), .CLRN(t4), .PRN(1'b1), .ENA(y));
  VMWS_DFFE flop2(.D(t1), .CLK(VCLK), .Q(t2), .CLRN(t4), .PRN(1'b1), .ENA(y));
  VMWS_DFF_RN flop3(.D(t2), .CLK(VCLK), .Q(SCAN_WEE));
  VMWS_DFF_RN flop4(.D(SCAN_WEE), .CLK(VCLK), .Q(t5));
  VMWS_DFF_RN flop5(.D(t5), .CLK(VCLK), .Q(t6));
  VMWS_NOT g1(.OUT(t4), .IN(t6));
  VMWS_AND2 g2(.OUT(SCAN_WE), .IN1(t5), .IN2(t4));
endmodule
 
// Generate single Memory Address line using embedded address line and scan.
module VMWS_MEM_ADDR(e_mem_addr, shift, embed_active, scan_in, scan_out,
                     tclk, mem_addr);
  input e_mem_addr, shift, embed_active, scan_in, tclk;
  output mem_addr, scan_out;

  VMWS_DFFENP dff(.D(scan_in), .CLK(tclk), .ENA(shift), .Q(scan_out));
  VMWS_MUX mux(.OUT(mem_addr), .I0(scan_out), .I1(e_mem_addr), .SEL(embed_active));
endmodule

//  VMWS_OR2 or2(flop_ena, capture, shift);

// Generate Data In & Data Out signals using embedded signals + scan.
module VMWS_MEM_DATA(e_mem_in, e_mem_out, capture_or_shift, capture,
                     scan_in, scan_out, tclk, mem_in, mem_out,
                     embed_active);
  input e_mem_out, embed_active, scan_in, capture, capture_or_shift, mem_in;
  input tclk;
  output mem_out, scan_out, e_mem_in;

  assign e_mem_in = mem_in;

  VMWS_MUX mux(.OUT(capture_in), .I0( scan_in), .I1(e_mem_in), .SEL(capture));
  VMWS_DFFENP capture_flop(.D(capture_in), .ENA(capture_or_shift), .CLK(tclk),
                           .Q(scan_out));
  VMWS_MUX mux2(.OUT(mem_out), .I0(scan_out), .I1(e_mem_out), .SEL(embed_active));
endmodule

// NOTE:  The vectors have to be addressed [low:high] cause we just grab
// the offset of v[0] in the source, and index off of that.  This is dependent
// on the way the Verilog parser expands vectors.  Of course the SRAMs don't
// really care which address or data bit is which, so long as we access
// everything consistently.

// The "master" takes care of OE, and D[0:3]
module VMWS_MEM_MASTER(tclk, tclk_, vclk,

                  // states
                  capture, active, shift, scan_mem_we,

                  // control signals (calculated from states by VMWS_SCAN_CTRL)
                  embed_active,		// (idle || redirect)
                  scan_mem_write, 	// latched (mem1 || mem2 || mem3)
		  scan_mem_oe,

                  // embedded mem control signals
                  e_write_ena, e_WE_ena, e_output_ena,
                  e_addr_ena,
                  e_data_ena,

                  // merged mem control signals
                  write_ena_, WE_ena, output_ena_,
                  addr_ena, 		// [15]
                  data_ena,		// [8]

                  // data
                  scan_in, scan_out,
                  e_addr, mem_addr,     // [15]
                  e_data_in, e_data_out, mem_in, mem_out);	// [8]

  input tclk, tclk_, vclk, capture, active, shift, scan_mem_we, scan_mem_oe,
    e_write_ena, e_WE_ena, e_output_ena;
  input embed_active, scan_mem_write, scan_in;
  input [0:7] e_data_out, mem_in;
  input e_data_ena;
  input [0:14] e_addr;
  input e_addr_ena;

  output write_ena_, WE_ena, output_ena_, scan_out;
  output [0:7] e_data_in, mem_out, data_ena;
  output [0:14] mem_addr, addr_ena;

  wire [3:0] scan_mem_out;

  // Output enable: 	(embed_active && e_output_ena) || capture
  VMWS_AOI21 oe (.Z(pre_output_ena_), .A(embed_active), .B(e_output_ena), .C(scan_mem_oe));
  VMWS_DFF_RN oe_reg (.D(pre_output_ena_), .CLK(vclk), .Q(output_ena_));
  
  VMWS_WE_SYNC sync(.SCAN_WE(sync_scan_mem_we), .SCAN_WEE(sync_scan_mem_wee), .VCLK(vclk), .TCLKWE(scan_mem_write));


  // Mask through WE, WEE, DE, addrs through from the embedded logic
  VMWS_AND2 and2_2 (pre_WE_ena, e_WE_ena, embed_active);
  VMWS_DFF_RN wee_reg (.D(pre_WE_ena), .CLK(vclk), .Q(WE_ena));
  VMWS_NAND2 and2_3 (.OUT(pre_write_ena_), .IN1(e_write_ena), .IN2(embed_active));
  VMWS_DFF_RN we_reg (.D(pre_write_ena_), .CLK(vclk), .Q(write_ena_)); 

  // Mask and register address enables not scanned by this fpga
  VMWS_AND2 addr_ena_and (addr_ena_pre, e_addr_ena, embed_active);
  VMWS_DFF_RN addr_ena_reg (.D(addr_ena_pre), .CLK(vclk), .Q(addr_ena_common));

  assign addr_ena[0] = addr_ena_common;
  assign addr_ena[1] = addr_ena_common;
  assign addr_ena[2] = addr_ena_common;
  assign addr_ena[3] = addr_ena_common;
  assign addr_ena[4] = addr_ena_common;
  assign addr_ena[5] = addr_ena_common;
  assign addr_ena[6] = addr_ena_common;
  assign addr_ena[7] = addr_ena_common;
  assign addr_ena[8] = addr_ena_common;
  assign addr_ena[9] = addr_ena_common;
  assign addr_ena[10] = addr_ena_common;
  assign addr_ena[11] = addr_ena_common;
  assign addr_ena[12] = addr_ena_common;
  assign addr_ena[13] = addr_ena_common;
  assign addr_ena[14] = addr_ena_common;

  // Activate and register data enable for data elements scanned by this FPGA
  VMWS_AO21 data_this (data_ena_this_pre, e_data_ena, embed_active, sync_scan_mem_wee);
  VMWS_DFF_RN data_this_reg (.D(data_ena_this_pre), .CLK(vclk), .Q(data_ena_this));

  assign data_ena[0] = data_ena_this;
  assign data_ena[1] = data_ena_this;
  assign data_ena[2] = data_ena_this;
  assign data_ena[3] = data_ena_this;

  // Mask and register data-enables for data elements scanned by a different FPGA
  VMWS_AND2 data_other (data_ena_other_pre, e_data_ena, embed_active);
  VMWS_DFF_RN data_other_reg (.D(data_ena_other_pre), .CLK(vclk), .Q(data_ena_other));

  assign data_ena[4] = data_ena_other;
  assign data_ena[5] = data_ena_other;
  assign data_ena[6] = data_ena_other;
  assign data_ena[7] = data_ena_other;

  VMWS_OR2 or2_5 (capture_or_shift, capture, shift);
  VMWS_MEM_DATA d1(e_data_in[0], e_data_out[0], capture_or_shift, capture,
                  scan_in, s0_1, tclk, mem_in[0], scan_mem_out[0], embed_active);
  VMWS_MEM_DATA d2(e_data_in[1], e_data_out[1], capture_or_shift, capture,
                  s0_1, s1_2, tclk, mem_in[1], scan_mem_out[1], embed_active);
  VMWS_MEM_DATA d3(e_data_in[2], e_data_out[2], capture_or_shift, capture,
                  s1_2, s2_3, tclk, mem_in[2], scan_mem_out[2], embed_active);
  VMWS_MEM_DATA d4(e_data_in[3], e_data_out[3], capture_or_shift, capture,
                  s2_3, s3_4, tclk, mem_in[3], scan_mem_out[3], 
                  embed_active);
                  
  VMWS_DFFENP pad5 (.D(s3_4), .CLK(tclk), .ENA(shift), .Q(s4_5));
  VMWS_DFFENP pad6 (.D(s4_5), .CLK(tclk), .ENA(shift), .Q(s5_6));
  VMWS_DFFENP pad7 (.D(s5_6), .CLK(tclk), .ENA(shift), .Q(s6_7));
  VMWS_DFFENP pad8 (.D(s6_7), .CLK(tclk), .ENA(shift), .Q(scan_out));

  // Register all addresses and data
  VMWS_DFF_RN mem_addr_reg0 (.D(e_addr[0]), .CLK(vclk), .Q(mem_addr[0]));
  VMWS_DFF_RN mem_addr_reg1 (.D(e_addr[1]), .CLK(vclk), .Q(mem_addr[1]));
  VMWS_DFF_RN mem_addr_reg2 (.D(e_addr[2]), .CLK(vclk), .Q(mem_addr[2]));
  VMWS_DFF_RN mem_addr_reg3 (.D(e_addr[3]), .CLK(vclk), .Q(mem_addr[3]));
  VMWS_DFF_RN mem_addr_reg4 (.D(e_addr[4]), .CLK(vclk), .Q(mem_addr[4]));
  VMWS_DFF_RN mem_addr_reg5 (.D(e_addr[5]), .CLK(vclk), .Q(mem_addr[5]));
  VMWS_DFF_RN mem_addr_reg6 (.D(e_addr[6]), .CLK(vclk), .Q(mem_addr[6]));
  VMWS_DFF_RN mem_addr_reg7 (.D(e_addr[7]), .CLK(vclk), .Q(mem_addr[7]));
  VMWS_DFF_RN mem_addr_reg8 (.D(e_addr[8]), .CLK(vclk), .Q(mem_addr[8]));
  VMWS_DFF_RN mem_addr_reg9 (.D(e_addr[9]), .CLK(vclk), .Q(mem_addr[9]));
  VMWS_DFF_RN mem_addr_reg10 (.D(e_addr[10]), .CLK(vclk), .Q(mem_addr[10]));
  VMWS_DFF_RN mem_addr_reg11 (.D(e_addr[11]), .CLK(vclk), .Q(mem_addr[11]));
  VMWS_DFF_RN mem_addr_reg12 (.D(e_addr[12]), .CLK(vclk), .Q(mem_addr[12]));
  VMWS_DFF_RN mem_addr_reg13 (.D(e_addr[13]), .CLK(vclk), .Q(mem_addr[13]));
  VMWS_DFF_RN mem_addr_reg14 (.D(e_addr[14]), .CLK(vclk), .Q(mem_addr[14]));

  VMWS_DFF_RN mem_data_reg0 (.D(scan_mem_out[0]), .CLK(vclk), .Q(mem_out[0]));
  VMWS_DFF_RN mem_data_reg1 (.D(scan_mem_out[1]), .CLK(vclk), .Q(mem_out[1]));
  VMWS_DFF_RN mem_data_reg2 (.D(scan_mem_out[2]), .CLK(vclk), .Q(mem_out[2]));
  VMWS_DFF_RN mem_data_reg3 (.D(scan_mem_out[3]), .CLK(vclk), .Q(mem_out[3]));
  VMWS_DFF_RN mem_data_reg4 (.D(e_data_out[4]), .CLK(vclk), .Q(mem_out[4]));
  VMWS_DFF_RN mem_data_reg5 (.D(e_data_out[5]), .CLK(vclk), .Q(mem_out[5]));
  VMWS_DFF_RN mem_data_reg6 (.D(e_data_out[6]), .CLK(vclk), .Q(mem_out[6]));
  VMWS_DFF_RN mem_data_reg7 (.D(e_data_out[7]), .CLK(vclk), .Q(mem_out[7]));

  // Pass thru mem_in data which isn't touched
  assign e_data_in[4:7] = mem_in[4:7];
endmodule // mem master

// output-enable will not be asserted for any of the slaves, so we don't
// need to calculate it.

// "slave0" takes care of WE, and D[4:7]
module VMWS_MEM_SLAVE0(tclk, tclk_, vclk,

                  // states
                  capture, active, shift, scan_mem_we,

                  // control signals (calculated from states by VMWS_SCAN_CTRL)
                  embed_active,		// (idle || redirect)
                  scan_mem_write, 	// latched (mem1 || mem2 || mem3)
		  scan_mem_oe,

                  // embedded mem control signals
                  e_write_ena, e_WE_ena, e_output_ena,
                  e_addr_ena, 		// [15]
                  e_data_ena,		// [8]

                  // merged mem control signals
                  write_ena_, WE_ena, output_ena,
                  addr_ena, 		// [15]
                  data_ena,		// [8]

                  // data
                  scan_in, scan_out,
                  e_addr, mem_addr,     // [15]
                  e_data_in, e_data_out, mem_in, mem_out);	// [8]

  input tclk, tclk_, vclk, capture, active, shift, scan_mem_we, scan_mem_oe,
    e_write_ena, e_WE_ena, e_output_ena;
  input embed_active, scan_mem_write, scan_in;
  input [0:7] e_data_out, mem_in;
  input e_data_ena;
  input [0:14] e_addr;
  input e_addr_ena;

  output write_ena_, WE_ena, output_ena, scan_out;
  output [0:7] e_data_in, mem_out, data_ena;
  output [0:14] mem_addr, addr_ena;

  wire [7:4] scan_mem_out;

  // Write enable, write-enable enable
  VMWS_AOI21 we (.Z(pre_write_ena_), .A(embed_active), .B(e_write_ena), .C(sync_scan_mem_we));
  VMWS_DFF_RN we_reg (.D(pre_write_ena_), .CLK(vclk), .Q(write_ena_)); 

  VMWS_AO21 wee (pre_WE_ena, e_WE_ena, embed_active, sync_scan_mem_wee);
  VMWS_DFF_RN wee_reg (.D(pre_WE_ena), .CLK(vclk), .Q(WE_ena));

  VMWS_WE_SYNC sync(.SCAN_WE(sync_scan_mem_we), .SCAN_WEE(sync_scan_mem_wee), .VCLK(vclk), .TCLKWE(scan_mem_write));

  // Mask and register address enables not scanned by this fpga
  VMWS_AND2 addr_ena_and (addr_ena_pre, e_addr_ena, embed_active);
  VMWS_DFF_RN addr_ena_reg (.D(addr_ena_pre), .CLK(vclk), .Q(addr_ena_common));

  assign addr_ena[0] = addr_ena_common;
  assign addr_ena[1] = addr_ena_common;
  assign addr_ena[2] = addr_ena_common;
  assign addr_ena[3] = addr_ena_common;
  assign addr_ena[4] = addr_ena_common;
  assign addr_ena[5] = addr_ena_common;
  assign addr_ena[6] = addr_ena_common;
  assign addr_ena[7] = addr_ena_common;
  assign addr_ena[8] = addr_ena_common;
  assign addr_ena[9] = addr_ena_common;
  assign addr_ena[10] = addr_ena_common;
  assign addr_ena[11] = addr_ena_common;
  assign addr_ena[12] = addr_ena_common;
  assign addr_ena[13] = addr_ena_common;
  assign addr_ena[14] = addr_ena_common;

  // Activate and register data enable for data elements scanned by this FPGA
  VMWS_AO21 data_this (data_ena_this_pre, e_data_ena, embed_active, sync_scan_mem_wee);
  VMWS_DFF_RN data_this_reg (.D(data_ena_this_pre), .CLK(vclk), .Q(data_ena_this));

  assign data_ena[4] = data_ena_this;
  assign data_ena[5] = data_ena_this;
  assign data_ena[6] = data_ena_this;
  assign data_ena[7] = data_ena_this;

  // Mask and register data-enables for data elements scanned by a different FPGA
  VMWS_AND2 data_other (data_ena_other_pre, e_data_ena, embed_active);
  VMWS_DFF_RN data_other_reg (.D(data_ena_other_pre), .CLK(vclk), .Q(data_ena_other));

  assign data_ena[0] = data_ena_other;
  assign data_ena[1] = data_ena_other;
  assign data_ena[2] = data_ena_other;
  assign data_ena[3] = data_ena_other;

  VMWS_OR2 or2_5 (capture_or_shift, capture, shift);
  VMWS_MEM_DATA d1(e_data_in[4], e_data_out[4], capture_or_shift, capture,
                  scan_in, s4_5, tclk, mem_in[4], scan_mem_out[4], embed_active);
  VMWS_MEM_DATA d2(e_data_in[5], e_data_out[5], capture_or_shift, capture,
                  s4_5, s5_6, tclk, mem_in[5], scan_mem_out[5], embed_active);
  VMWS_MEM_DATA d3(e_data_in[6], e_data_out[6], capture_or_shift, capture,
                  s5_6, s6_7, tclk, mem_in[6], scan_mem_out[6], embed_active);
  VMWS_MEM_DATA d4(e_data_in[7], e_data_out[7], capture_or_shift, capture,
                  s6_7, s7_p1, tclk, mem_in[7], scan_mem_out[7], embed_active);

  VMWS_DFFENP pad5 (.D(s7_p1), .CLK(tclk), .ENA(shift), .Q(p1_2));
  VMWS_DFFENP pad6 (.D(p1_2), .CLK(tclk), .ENA(shift), .Q(p2_3));
  VMWS_DFFENP pad7 (.D(p2_3), .CLK(tclk), .ENA(shift), .Q(p3_4));
  VMWS_DFFENP pad8 (.D(p3_4), .CLK(tclk), .ENA(shift), .Q(scan_out));

  // Register all addresses and data
  VMWS_DFF_RN mem_addr_reg0 (.D(e_addr[0]), .CLK(vclk), .Q(mem_addr[0]));
  VMWS_DFF_RN mem_addr_reg1 (.D(e_addr[1]), .CLK(vclk), .Q(mem_addr[1]));
  VMWS_DFF_RN mem_addr_reg2 (.D(e_addr[2]), .CLK(vclk), .Q(mem_addr[2]));
  VMWS_DFF_RN mem_addr_reg3 (.D(e_addr[3]), .CLK(vclk), .Q(mem_addr[3]));
  VMWS_DFF_RN mem_addr_reg4 (.D(e_addr[4]), .CLK(vclk), .Q(mem_addr[4]));
  VMWS_DFF_RN mem_addr_reg5 (.D(e_addr[5]), .CLK(vclk), .Q(mem_addr[5]));
  VMWS_DFF_RN mem_addr_reg6 (.D(e_addr[6]), .CLK(vclk), .Q(mem_addr[6]));
  VMWS_DFF_RN mem_addr_reg7 (.D(e_addr[7]), .CLK(vclk), .Q(mem_addr[7]));
  VMWS_DFF_RN mem_addr_reg8 (.D(e_addr[8]), .CLK(vclk), .Q(mem_addr[8]));
  VMWS_DFF_RN mem_addr_reg9 (.D(e_addr[9]), .CLK(vclk), .Q(mem_addr[9]));
  VMWS_DFF_RN mem_addr_reg10 (.D(e_addr[10]), .CLK(vclk), .Q(mem_addr[10]));
  VMWS_DFF_RN mem_addr_reg11 (.D(e_addr[11]), .CLK(vclk), .Q(mem_addr[11]));
  VMWS_DFF_RN mem_addr_reg12 (.D(e_addr[12]), .CLK(vclk), .Q(mem_addr[12]));
  VMWS_DFF_RN mem_addr_reg13 (.D(e_addr[13]), .CLK(vclk), .Q(mem_addr[13]));
  VMWS_DFF_RN mem_addr_reg14 (.D(e_addr[14]), .CLK(vclk), .Q(mem_addr[14]));

  VMWS_DFF_RN mem_data_reg0 (.D(e_data_out[0]), .CLK(vclk), .Q(mem_out[0]));
  VMWS_DFF_RN mem_data_reg1 (.D(e_data_out[1]), .CLK(vclk), .Q(mem_out[1]));
  VMWS_DFF_RN mem_data_reg2 (.D(e_data_out[2]), .CLK(vclk), .Q(mem_out[2]));
  VMWS_DFF_RN mem_data_reg3 (.D(e_data_out[3]), .CLK(vclk), .Q(mem_out[3]));
  VMWS_DFF_RN mem_data_reg4 (.D(scan_mem_out[4]), .CLK(vclk), .Q(mem_out[4]));
  VMWS_DFF_RN mem_data_reg5 (.D(scan_mem_out[5]), .CLK(vclk), .Q(mem_out[5]));
  VMWS_DFF_RN mem_data_reg6 (.D(scan_mem_out[6]), .CLK(vclk), .Q(mem_out[6]));
  VMWS_DFF_RN mem_data_reg7 (.D(scan_mem_out[7]), .CLK(vclk), .Q(mem_out[7]));

  // Pass thru mem_in data which isn't touched
  assign e_data_in[0:3] = mem_in[0:3];
endmodule // mem slave0

// "slave1" takes care of ADDR[0:7]
module VMWS_MEM_SLAVE1(tclk, tclk_, vclk, 

                  // states
                  capture, active, shift, scan_mem_we,

                  // control signals (calculated from states by VMWS_SCAN_CTRL)
                  embed_active,		// (idle || redirect)
                  scan_mem_write, 	// latched (mem1 || mem2 || mem3)
		  scan_mem_oe,

                  // embedded mem control signals
                  e_write_ena, e_WE_ena, e_output_ena,
                  e_addr_ena, 		// [15]
                  e_data_ena,		// [8]

                  // merged mem control signals
                  write_ena_, WE_ena, output_ena,
                  addr_ena, 		// [15]
                  data_ena,		// [8]

                  // data
                  scan_in, scan_out,
                  e_addr, mem_addr,     // [15]
                  e_data_in, e_data_out, mem_in, mem_out);	// [8]


  input tclk, tclk_, vclk, capture, active, shift, scan_mem_we, scan_mem_oe,
    e_write_ena, e_WE_ena, e_output_ena;
  input embed_active, scan_mem_write, scan_in;
  input [0:7] e_data_out, mem_in;
  input e_data_ena;
  input [0:14] e_addr;
  input e_addr_ena;

  output write_ena_, WE_ena, output_ena, scan_out;
  output [0:7] e_data_in, mem_out, data_ena;
  output [0:14] mem_addr, addr_ena;

  wire [7:0] scan_mem_addr;

  // Activate and register address enas scanned by this fpga
  VMWS_ORN1 addr_ena_orn (addr_ena_this_pre, embed_active, e_addr_ena);
  VMWS_DFF_RN addr_ena_this_reg (.D(addr_ena_this_pre), .CLK(vclk), .Q(addr_ena_this));

  assign addr_ena[0] = addr_ena_this;
  assign addr_ena[1] = addr_ena_this;
  assign addr_ena[2] = addr_ena_this;
  assign addr_ena[3] = addr_ena_this;
  assign addr_ena[4] = addr_ena_this;
  assign addr_ena[5] = addr_ena_this;
  assign addr_ena[6] = addr_ena_this;
  assign addr_ena[7] = addr_ena_this;

  // Mask and register address ena's not scanned by this fpga
  VMWS_AND2 addr_ena_and (addr_ena_other_pre, e_addr_ena, embed_active);
  VMWS_DFF_RN addr_ena_other_reg (.D(addr_ena_other_pre), .CLK(vclk), .Q(addr_ena_other));

  assign addr_ena[8] = addr_ena_other;
  assign addr_ena[9] = addr_ena_other;
  assign addr_ena[10] = addr_ena_other;
  assign addr_ena[11] = addr_ena_other;
  assign addr_ena[12] = addr_ena_other;
  assign addr_ena[13] = addr_ena_other;
  assign addr_ena[14] = addr_ena_other;

  // Just pass WE, WEE through from the embedded logic
  VMWS_NAND2 we (.OUT(pre_write_ena_), .IN1(e_write_ena), .IN2(embed_active));
  VMWS_DFF_RN we_reg (.D(pre_write_ena_), .CLK(vclk), .Q(write_ena_)); 
  VMWS_AND2 wee (pre_WE_ena, e_WE_ena, embed_active);
  VMWS_DFF_RN wee_reg (.D(pre_WE_ena), .CLK(vclk), .Q(WE_ena));

  // Mask and register data-enables for data elements scanned by a different FPGA
  VMWS_AND2 data_other (data_ena_other_pre, e_data_ena, embed_active);
  VMWS_DFF_RN data_other_reg (.D(data_ena_other_pre), .CLK(vclk), .Q(data_ena_other));

  assign data_ena[0] = data_ena_other;
  assign data_ena[1] = data_ena_other;
  assign data_ena[2] = data_ena_other;
  assign data_ena[3] = data_ena_other;
  assign data_ena[4] = data_ena_other;
  assign data_ena[5] = data_ena_other;
  assign data_ena[6] = data_ena_other;
  assign data_ena[7] = data_ena_other;

  VMWS_MEM_ADDR s0 (e_addr[0], shift, embed_active, scan_in, s0_1, tclk,
                    scan_mem_addr[0]);
  VMWS_MEM_ADDR s1 (e_addr[1], shift, embed_active, s0_1, s1_2, tclk,
                    scan_mem_addr[1]);
  VMWS_MEM_ADDR s2 (e_addr[2], shift, embed_active, s1_2, s2_3, tclk,
                    scan_mem_addr[2]);
  VMWS_MEM_ADDR s3 (e_addr[3], shift, embed_active, s2_3, s3_4, tclk,
                    scan_mem_addr[3]);
  VMWS_MEM_ADDR s4 (e_addr[4], shift, embed_active, s3_4, s4_5, tclk,
                    scan_mem_addr[4]);
  VMWS_MEM_ADDR s5 (e_addr[5], shift, embed_active, s4_5, s5_6, tclk,
                    scan_mem_addr[5]);
  VMWS_MEM_ADDR s6 (e_addr[6], shift, embed_active, s5_6, s6_7, tclk,
                    scan_mem_addr[6]);
  VMWS_MEM_ADDR s7 (e_addr[7], shift, embed_active, s6_7, scan_out, tclk,
                    scan_mem_addr[7]);

  // Register all addresses and data
  VMWS_DFF_RN mem_addr_reg0 (.D(scan_mem_addr[0]), .CLK(vclk), .Q(mem_addr[0]));
  VMWS_DFF_RN mem_addr_reg1 (.D(scan_mem_addr[1]), .CLK(vclk), .Q(mem_addr[1]));
  VMWS_DFF_RN mem_addr_reg2 (.D(scan_mem_addr[2]), .CLK(vclk), .Q(mem_addr[2]));
  VMWS_DFF_RN mem_addr_reg3 (.D(scan_mem_addr[3]), .CLK(vclk), .Q(mem_addr[3]));
  VMWS_DFF_RN mem_addr_reg4 (.D(scan_mem_addr[4]), .CLK(vclk), .Q(mem_addr[4]));
  VMWS_DFF_RN mem_addr_reg5 (.D(scan_mem_addr[5]), .CLK(vclk), .Q(mem_addr[5]));
  VMWS_DFF_RN mem_addr_reg6 (.D(scan_mem_addr[6]), .CLK(vclk), .Q(mem_addr[6]));
  VMWS_DFF_RN mem_addr_reg7 (.D(scan_mem_addr[7]), .CLK(vclk), .Q(mem_addr[7]));
  VMWS_DFF_RN mem_addr_reg8 (.D(e_addr[8]), .CLK(vclk), .Q(mem_addr[8]));
  VMWS_DFF_RN mem_addr_reg9 (.D(e_addr[9]), .CLK(vclk), .Q(mem_addr[9]));
  VMWS_DFF_RN mem_addr_reg10 (.D(e_addr[10]), .CLK(vclk), .Q(mem_addr[10]));
  VMWS_DFF_RN mem_addr_reg11 (.D(e_addr[11]), .CLK(vclk), .Q(mem_addr[11]));
  VMWS_DFF_RN mem_addr_reg12 (.D(e_addr[12]), .CLK(vclk), .Q(mem_addr[12]));
  VMWS_DFF_RN mem_addr_reg13 (.D(e_addr[13]), .CLK(vclk), .Q(mem_addr[13]));
  VMWS_DFF_RN mem_addr_reg14 (.D(e_addr[14]), .CLK(vclk), .Q(mem_addr[14]));

  VMWS_DFF_RN mem_data_reg0 (.D(e_data_out[0]), .CLK(vclk), .Q(mem_out[0]));
  VMWS_DFF_RN mem_data_reg1 (.D(e_data_out[1]), .CLK(vclk), .Q(mem_out[1]));
  VMWS_DFF_RN mem_data_reg2 (.D(e_data_out[2]), .CLK(vclk), .Q(mem_out[2]));
  VMWS_DFF_RN mem_data_reg3 (.D(e_data_out[3]), .CLK(vclk), .Q(mem_out[3]));
  VMWS_DFF_RN mem_data_reg4 (.D(e_data_out[4]), .CLK(vclk), .Q(mem_out[4]));
  VMWS_DFF_RN mem_data_reg5 (.D(e_data_out[5]), .CLK(vclk), .Q(mem_out[5]));
  VMWS_DFF_RN mem_data_reg6 (.D(e_data_out[6]), .CLK(vclk), .Q(mem_out[6]));
  VMWS_DFF_RN mem_data_reg7 (.D(e_data_out[7]), .CLK(vclk), .Q(mem_out[7]));


  // Pass thru mem_in data which isn't touched
  assign e_data_in      	= mem_in;
endmodule

// "slave2" takes care of ADDR[14:8]
module VMWS_MEM_SLAVE2(tclk, tclk_, vclk,

                  // states
                  capture, active, shift, scan_mem_we,

                  // control signals (calculated from states by VMWS_SCAN_CTRL)
                  embed_active,		// (idle || redirect)
                  scan_mem_write, 	// latched (mem1 || mem2 || mem3)
		  scan_mem_oe,

                  // embedded mem control signals
                  e_write_ena, e_WE_ena, e_output_ena,
                  e_addr_ena, 		// [15]
                  e_data_ena,		// [8]

                  // merged mem control signals
                  write_ena_, WE_ena, output_ena,
                  addr_ena, 		// [15]
                  data_ena,		// [8]

                  // data
                  scan_in, scan_out,
                  e_addr, mem_addr,     // [15]
                  e_data_in, e_data_out, mem_in, mem_out);	// [8]


  input tclk, tclk_, vclk, capture, active, shift, scan_mem_we, scan_mem_oe,
    e_write_ena, e_WE_ena, e_output_ena;
  input embed_active, scan_mem_write, scan_in;
  input [0:7] e_data_out, mem_in;
  input e_data_ena;
  input [0:14] e_addr;
  input e_addr_ena;

  output write_ena_, WE_ena, output_ena, scan_out;
  output [0:7] e_data_in, mem_out, data_ena;
  output [0:14] mem_addr, addr_ena;

  wire [14:8] scan_mem_addr;

  // Activate and register address enas scanned by this fpga
  VMWS_ORN1 addr_ena_orn (addr_ena_this_pre, embed_active, e_addr_ena);
  VMWS_DFF_RN addr_ena_this_reg (.D(addr_ena_this_pre), .CLK(vclk), .Q(addr_ena_this));

  assign addr_ena[8] = addr_ena_this;
  assign addr_ena[9] = addr_ena_this;
  assign addr_ena[10] = addr_ena_this;
  assign addr_ena[11] = addr_ena_this;
  assign addr_ena[12] = addr_ena_this;
  assign addr_ena[13] = addr_ena_this;
  assign addr_ena[14] = addr_ena_this;

  // Mask and register address ena's not scanned by this fpga
  VMWS_AND2 addr_ena_and (addr_ena_other_pre, e_addr_ena, embed_active);
  VMWS_DFF_RN addr_ena_other_reg (.D(addr_ena_other_pre), .CLK(vclk), .Q(addr_ena_other));

  assign addr_ena[0] = addr_ena_other;
  assign addr_ena[1] = addr_ena_other;
  assign addr_ena[2] = addr_ena_other;
  assign addr_ena[3] = addr_ena_other;
  assign addr_ena[4] = addr_ena_other;
  assign addr_ena[5] = addr_ena_other;
  assign addr_ena[6] = addr_ena_other;
  assign addr_ena[7] = addr_ena_other;

  // Just pass WE, WEE through from the embedded logic
  VMWS_NAND2 we (.OUT(pre_write_ena_), .IN1(e_write_ena), .IN2(embed_active));
  VMWS_DFF_RN we_reg (.D(pre_write_ena_), .CLK(vclk), .Q(write_ena_)); 
  VMWS_AND2 wee (pre_WE_ena, e_WE_ena, embed_active);
  VMWS_DFF_RN wee_reg (.D(pre_WE_ena), .CLK(vclk), .Q(WE_ena));

  // Mask and register data-enables for data elements scanned by a different FPGA
  VMWS_AND2 data_other (data_ena_other_pre, e_data_ena, embed_active);
  VMWS_DFF_RN data_other_reg (.D(data_ena_other_pre), .CLK(vclk), .Q(data_ena_other));

  assign data_ena[0] = data_ena_other;
  assign data_ena[1] = data_ena_other;
  assign data_ena[2] = data_ena_other;
  assign data_ena[3] = data_ena_other;
  assign data_ena[4] = data_ena_other;
  assign data_ena[5] = data_ena_other;
  assign data_ena[6] = data_ena_other;
  assign data_ena[7] = data_ena_other;

  VMWS_MEM_ADDR s8 (e_addr[8], shift, embed_active, scan_in, s8_9, tclk,
                    scan_mem_addr[8]);
  VMWS_MEM_ADDR s9 (e_addr[9], shift, embed_active, s8_9, s9_10, tclk,
                    scan_mem_addr[9]);
  VMWS_MEM_ADDR s10 (e_addr[10], shift, embed_active, s9_10, s10_11, tclk,
                    scan_mem_addr[10]);
  VMWS_MEM_ADDR s11 (e_addr[11], shift, embed_active, s10_11, s11_12, tclk,
                    scan_mem_addr[11]);
  VMWS_MEM_ADDR s12 (e_addr[12], shift, embed_active, s11_12, s12_13, tclk,
                    scan_mem_addr[12]);
  VMWS_MEM_ADDR s13 (e_addr[13], shift, embed_active, s12_13, s13_14, tclk,
                    scan_mem_addr[13]);
  VMWS_MEM_ADDR s14 (e_addr[14], shift, embed_active, s13_14, s14_15, tclk,
                    scan_mem_addr[14]);

  VMWS_DFFENP pad15 (.D(s14_15), .CLK(tclk), .ENA(shift), .Q(scan_out));

  // Register all addresses and data
  VMWS_DFF_RN mem_addr_reg0 (.D(e_addr[0]), .CLK(vclk), .Q(mem_addr[0]));
  VMWS_DFF_RN mem_addr_reg1 (.D(e_addr[1]), .CLK(vclk), .Q(mem_addr[1]));
  VMWS_DFF_RN mem_addr_reg2 (.D(e_addr[2]), .CLK(vclk), .Q(mem_addr[2]));
  VMWS_DFF_RN mem_addr_reg3 (.D(e_addr[3]), .CLK(vclk), .Q(mem_addr[3]));
  VMWS_DFF_RN mem_addr_reg4 (.D(e_addr[4]), .CLK(vclk), .Q(mem_addr[4]));
  VMWS_DFF_RN mem_addr_reg5 (.D(e_addr[5]), .CLK(vclk), .Q(mem_addr[5]));
  VMWS_DFF_RN mem_addr_reg6 (.D(e_addr[6]), .CLK(vclk), .Q(mem_addr[6]));
  VMWS_DFF_RN mem_addr_reg7 (.D(e_addr[7]), .CLK(vclk), .Q(mem_addr[7]));
  VMWS_DFF_RN mem_addr_reg8 (.D(scan_mem_addr[8]), .CLK(vclk), .Q(mem_addr[8]));
  VMWS_DFF_RN mem_addr_reg9 (.D(scan_mem_addr[9]), .CLK(vclk), .Q(mem_addr[9]));
  VMWS_DFF_RN mem_addr_reg10 (.D(scan_mem_addr[10]), .CLK(vclk), .Q(mem_addr[10]));
  VMWS_DFF_RN mem_addr_reg11 (.D(scan_mem_addr[11]), .CLK(vclk), .Q(mem_addr[11]));
  VMWS_DFF_RN mem_addr_reg12 (.D(scan_mem_addr[12]), .CLK(vclk), .Q(mem_addr[12]));
  VMWS_DFF_RN mem_addr_reg13 (.D(scan_mem_addr[13]), .CLK(vclk), .Q(mem_addr[13]));
  VMWS_DFF_RN mem_addr_reg14 (.D(scan_mem_addr[14]), .CLK(vclk), .Q(mem_addr[14]));

  VMWS_DFF_RN mem_data_reg0 (.D(e_data_out[0]), .CLK(vclk), .Q(mem_out[0]));
  VMWS_DFF_RN mem_data_reg1 (.D(e_data_out[1]), .CLK(vclk), .Q(mem_out[1]));
  VMWS_DFF_RN mem_data_reg2 (.D(e_data_out[2]), .CLK(vclk), .Q(mem_out[2]));
  VMWS_DFF_RN mem_data_reg3 (.D(e_data_out[3]), .CLK(vclk), .Q(mem_out[3]));
  VMWS_DFF_RN mem_data_reg4 (.D(e_data_out[4]), .CLK(vclk), .Q(mem_out[4]));
  VMWS_DFF_RN mem_data_reg5 (.D(e_data_out[5]), .CLK(vclk), .Q(mem_out[5]));
  VMWS_DFF_RN mem_data_reg6 (.D(e_data_out[6]), .CLK(vclk), .Q(mem_out[6]));
  VMWS_DFF_RN mem_data_reg7 (.D(e_data_out[7]), .CLK(vclk), .Q(mem_out[7]));

  // Pass thru mem_in data which isn't touched
  assign e_data_in      = mem_in;
endmodule


// Synchronous "RS" flip flop
// Set sets to 1
// Clear clears to 0
// Set takes precedence (for initialization reasons)
// outcom is combinational 
// outseq updates at vclock

module VMWS_RS_SYNC(clk, set, clear, outseq, outcom);

  input clk, set, clear;
  output outseq, outcom;

  VMWS_DFF_RN state (.D(outcom), .CLK(clk), .Q(outseq));
  VMWS_OR2 or0 (.OUT(outcom), .IN1(set), .IN2(down));
  VMWS_NOT inv0 (.OUT(clear_), .IN(clear));
  VMWS_AND2 and0 (.OUT(down), .IN1(clear_), .IN2(outseq));

endmodule


// This module arbitrates access to the memory bus between the independent
// control FSMs for asynchronous domains.

module VMWS_MEM_FIFO_FSM(vclock, request0, request1, rw_0, rw_1,
			 grant0, grant1, memOE, WEE0, WEE1);

  input vclock;    // VClock
  input request0;  // 0-side request
  input rw_0;      // 0-side request type (R / W_)
  output grant0;   // Output grant, timed to cycle prior to active cycle
  output WEE0;      // Write-enable enable for 0 side

  input request1;  // 1-side request
  input rw_1;      // 1-side request type (R / W_)
  output grant1;   // Output grant, timed to cycle prior to active cycle
  output WEE1;      // Write-enable enable for 1 side

  output memOE;    // The output enable signal for either side's reads, (used by master)

  // Req0 buffering - Set by request and cleared by grant
  VMWS_RS_SYNC req0reg (.clk(vclock), .set(request0), .clear(grant0), .outcom(req0));
  VMWS_NOT req0inv (.OUT(req0_), .IN(req0));

  // Grant0 logic - Grant 0s request unless 1 is active
  VMWS_AND2 gr0and (.OUT(gr0), .IN1(req0), .IN2(grant1_));
  VMWS_DFF_RN grant0reg (.D(gr0), .CLK(vclock), .Q(grant0));
  VMWS_NOT gr0inv (.OUT(grant0_), .IN(grant0));

  // Req1 buffering
  VMWS_RS_SYNC req1reg (.clk(vclock), .set(request1), .clear(grant1), .outcom(req1));

  // Grant1 logic - Grant 1's request unless 1 is active or requesting
  VMWS_AND3 gr1and (.OUT(gr1), .IN1(req1), .IN2(grant0_), .IN3(req0_));
  VMWS_DFF_RN grant1reg (.D(gr1), .CLK(vclock), .Q(grant1));
  VMWS_NOT gr1inv (.OUT(grant1_), .IN(grant1));

  // Request 0 RW_ storage and decode
  VMWS_DFFENP req0rw_ (.D(rw_0), .CLK(vclock), .ENA(request0), .Q(req_rw_0));
  VMWS_AND2 r0and (.OUT(r0), .IN1(req_rw_0), .IN2(grant0));
  VMWS_NOT w0inv (.OUT(req_wr_0), .IN(req_rw_0));
  VMWS_AND2 w0and (.OUT(w0), .IN1(req_wr_0), .IN2(grant0));

  VMWS_DFF_RN w0del (.D(w0), .CLK(vclock), .Q(w0delay));
  VMWS_OR2 wee0 (.OUT(WEE0), .IN1(w0), .IN2(w0delay));

  // Request 1 RW_ storage and decode
  VMWS_DFFENP req1rw_ (.D(rw_1), .CLK(vclock), .ENA(request1), .Q(req_rw_1));
  VMWS_AND2 r1and (.OUT(r1), .IN1(req_rw_1), .IN2(grant1));
  VMWS_NOT w1inv (.OUT(req_wr_1), .IN(req_rw_1));
  VMWS_AND2 w1and (.OUT(w1), .IN1(req_wr_1), .IN2(grant1));

  VMWS_DFF_RN w1del (.D(w1), .CLK(vclock), .Q(w1delay));
  VMWS_OR2 wee1 (.OUT(WEE1), .IN1(w1), .IN2(w1delay));

  // OE
  VMWS_OR2 oe_or (.OUT(memOE), .IN1(r0), .IN2(r1));

  // Initialization
`ifdef VMWSYNLIB
`else
  initial
    begin
    force grant0 = 1'b1;
    force grant1 = 1'b1;

    // Force grant0 and grant1 until request0 and request1 are defined
    // Then give two more clock ticks for the registers to become defined

    @(posedge vclock) #1
    while ((request0 === 1'bx) || (request1 == 1'bx))
      @(posedge vclock);
    @(posedge vclock);
    @(posedge vclock);


    release grant0;
    release grant1;
    end
`endif

endmodule


// Active0 is high for one cycle on the grant cycle
// Active1 is high the cycle after
// Active0 is used for pipelined control signals, (outmux selects, enables, etc.)
// Active1 is used for non-pipelined control signals, (inbuf ld enables)

module VMWS_MEM_FIFO_DECODER(vclock, request, grant, active0, active1);

  input vclock, request, grant;
  output active0, active1;

  VMWS_RS_SYNC reqreg (.clk(vclock), .set(request), .clear(grant), .outseq(req));

  VMWS_AND2 and0 (.OUT(active0), .IN1(grant), .IN2(req));
  VMWS_DFF_RN active1reg (.D(active0), .CLK(vclock), .Q(active1));

endmodule

//
// flop, latch user-defined primitives for simulation
//

`ifdef VMWSYNLIB
`else

primitive VMWS_PRIM_DFF  (Q, D, CLK, CLR, PR);

    output Q;
    reg    Q; 
    input  D, CLK, CLR, PR;

`ifdef VMW_INIT_STATE
    initial Q = 1'b0;
`endif

    // FUNCTION : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH ACTIVE HIGH
    //            ASYNCHRONOUS SET AND CLEAR. ( Q OUTPUT UDP ).

    table
 
    //  D   CLK    CLR PR   :   Qt  :   Qt+1

        1   (01)    0   0   :   ?   :   1;  // clocked data
        1   (01)    0   x   :   ?   :   1;  // pessimism

        1    ?      0   x   :   1   :   1;  // pessimism

        0    0      0   x   :   1   :   1;  // pessimism
        0    x      0 (?x)  :   1   :   1;  // pessimism
        0    1      0 (?x)  :   1   :   1;  // pessimism

        x    0      0   x   :   1   :   1;  // pessimism
        x    x      0 (?x)  :   1   :   1;  // pessimism
        x    1      0 (?x)  :   1   :   1;  // pessimism

        0   (01)    0   0   :   ?   :   0;  // clocked data
        0   (01)    x   0   :   ?   :   0;  // pessimism
 
        0    ?      x   0   :   0   :   0;  // pessimism

        1    0      x   0   :   0   :   0;  // pessimism
        1    x    (?x)  0   :   0   :   0;  // pessimism
        1    1    (?x)  0   :   0   :   0;  // pessimism

        x    0      x   0   :   0   :   0;  // pessimism
        x    x    (?x)  0   :   0   :   0;  // pessimism
        x    1    (?x)  0   :   0   :   0;  // pessimism

        1   (x1)    0   0   :   1   :   1;  // reducing pessimism
        0   (x1)    0   0   :   0   :   0;
        1   (0x)    0   0   :   1   :   1;
        0   (0x)    0   0   :   0   :   0;

        ?   ?       1   0   :   ?   :   0;  // asynchronous clear

        ?   ?       0   1   :   ?   :   1;  // asynchronous set

        ?   (?0)    0   0   :   ?   :   -;  // ignore falling clock
        ?   (1x)    0   0   :   ?   :   -;  // ignore falling clock
        *    ?      ?   ?   :   ?   :   -;  // ignore data edges 

        ?   ?     (?0)  0   :   ?   :   -;  // ignore the edges on 
        ?   ?       ?  (?0) :   ?   :   -;  //       set and clear 

        ?   1       x   0   :   x   :   0;  // optimistic asynchronous clear
        ?   0       x   0   :   x   :   0;  // optimistic asynchronous clear
        ?   1       0   x   :   x   :   1;  // optimistic asynchronous set
        ?   0       0   x   :   x   :   1;  // optimistic asynchronous set

    endtable

endprimitive

primitive VMWS_PRIM_DFFE (Q, ENA, D, CLK, CLR, PR);
    input D;
    input CLR;
    input PR;
    input CLK;
    input ENA;
    output Q; reg Q;

`ifdef VMW_INIT_STATE
    initial Q = 1'b0;
`endif

    table
 
    //  ENA  D   CLK    CLR PR   :   Qt  :   Qt+1

        (01) ?    ?      0   0   :   ?   :   -;  // pessimism
         1   1   (01)    0   0   :   ?   :   1;  // clocked data
         1   1   (01)    0   x   :   ?   :   1;  // pessimism

         1   1    ?      0   x   :   1   :   1;  // pessimism

         1   0    0      0   x   :   1   :   1;  // pessimism
         1   0    x      0 (?x)  :   1   :   1;  // pessimism
         1   0    1      0 (?x)  :   1   :   1;  // pessimism

         1   x    0      0   x   :   1   :   1;  // pessimism
         1   x    x      0 (?x)  :   1   :   1;  // pessimism
         1   x    1      0 (?x)  :   1   :   1;  // pessimism

         1   0   (01)    0   0   :   ?   :   0;  // clocked data
         1   0   (01)    x   0   :   ?   :   0;  // pessimism
 
         1   0    ?      x   0   :   0   :   0;  // pessimism

         1   1    0      x   0   :   0   :   0;  // pessimism
         1   1    x    (?x)  0   :   0   :   0;  // pessimism
         1   1    1    (?x)  0   :   0   :   0;  // pessimism

         1   x    0      x   0   :   0   :   0;  // pessimism
         1   x    x    (?x)  0   :   0   :   0;  // pessimism
         1   x    1    (?x)  0   :   0   :   0;  // pessimism

         1   1   (x1)    0   0   :   1   :   1;  // reducing pessimism
         1   0   (x1)    0   0   :   0   :   0;
         1   1   (0x)    0   0   :   1   :   1;
         1   0   (0x)    0   0   :   0   :   0;

         ?   ?   ?       1   0   :   ?   :   0;  // asynchronous clear

         ?   ?   ?       0   1   :   ?   :   1;  // asynchronous set

         ?   ?   (?0)    0   0   :   ?   :   -;  // ignore falling clock
         ?   ?   (1x)    0   0   :   ?   :   -;  // ignore falling clock
         ?   *    ?      ?   ?   :   ?   :   -;  // ignore data edges 
         *   ?    ?      ?   ?   :   ?   :   -;  // ignore CE edges 

         1   ?   ?     (?0)  0   :   ?   :   -;  // ignore the edges on 
         1   ?   ?       ?  (?1) :   ?   :   -;  //       set and clear 

`ifdef VMW_INIT_STATE
         ?   ?   x       0   0   :   ?   :   0;  // mask init-trashing CE edges
         0   ?   b       0   0   :   ?   :   -;  // CE disabled
`else
         0   ?   ?       0   0   :   ?   :   -;  // CE disabled
`endif
         ?   ?   1       x   0   :   x   :   0;  // optimistic asynchronous clear
         ?   ?   0       x   0   :   x   :   0;  // optimistic asynchronous clear
         ?   ?   1       0   x   :   x   :   1;  // optimistic asynchronous set
         ?   ?   0       0   x   :   x   :   1;  // optimistic asynchronous set
    endtable

endprimitive

primitive VMWS_PRIM_LATCH  (Q, ENA, D, CLR, PR);
    input  D;
    input  CLR;
    input  PR;
    input  ENA;
    output Q; reg Q;

`ifdef VMW_INIT_STATE
    initial Q = 1'b0;
`endif

    table
 
    // ENA    D   CLR PR    Q   Q+
         0    ?    0   0  : ? : -;
         1    0    0   0  : ? : 0;
         1    1    0   0  : ? : 1;

         ?    ?    1   0  : ? : 0;  // asynchronous clear
         ?    ?    0   1  : ? : 1;  // asynchronous set
         0    ?    x   0  : x : 0;  // optimistic asynchronous clear
         0    ?    0   x  : x : 1;  // optimistic asynchronous set
    endtable

endprimitive

`endif // `ifdef VMWSYNLIB `else

`ifdef VMW_NO_LIBNAMES
`noremove_netnames
`noremove_gatenames
`endif

/* End of library vmw_synthprim.v */
