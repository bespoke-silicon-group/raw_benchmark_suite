// vmw_reference.v		$Revision: 1.1 $

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
// VMW reference library primitives, macros
//
// default is simulation models
// define VMWSYNLIB to enable prototypes for synthesis library definition
//

// Format:
//   All primitive names must be prefixed with "VMW_".  Non-primitive
//     macros can be constructed structurally from VMW primitives.
//     All primitives must have an accompanying simulation model
//     for functional verification.
//
// Behavior recognition:
//   Combinatorial primitives named AND, NAND, OR, NOR, INV and BUF
//     of any width are recognized as such.  XOR/XNORs do not
//     currently support clock behaviors; they will work correctly
//     outside of clock trees.
//
//   Flop primitives: recognized by terminal alias property
//     strings:  FlopQ, FlopD, FlopC (clk), FlopR (async reset),
//     FlopS (set), FlopE (clock enable).  C, R, S and E can be
//     inverted by suffixing with "_".
//
//   Latch primitives: recognized by terminal alias property
//     strings:  LatchQ, LatchD, LatchE (clk), LatchR (async reset),
//     LatchS (set).  E, R and S can be inverted by suffixing with "_".
//
//   Pads, internal drivers: recognized by terminal alias property
//     strings:  PadI (logical input), PadO, PadE (tristate enable).
//     O and E can be inverted by suffixing with "_".

`ifdef VMW_USER_TIMESCALE
`include "vmw.timescale"
`endif

`ifdef VMW_NO_LIBNAMES
//`remove_netnames
`remove_gatenames
`endif

// Buffer

macromodule VMW_BUF (Z, A);
//  function : "A";
    output Z;
    input A;

`ifdef VMWSYNLIB
`else
    buf (Z, A);
`endif
endmodule


// Inverter

macromodule VMW_INV (Z,A);
//  function : "A'"
    output Z;
    input  A;

`ifdef VMWSYNLIB
`else
    not (Z, A);
`endif
endmodule


// And Gates

macromodule VMW_AND2 (Z, A, B);
//  function : "(AB)";
    output Z;
    input A,B;

`ifdef VMWSYNLIB
`else
    and (Z, A, B);
`endif
endmodule

macromodule VMW_AND3 (Z, A, B, C);
//  function : "(ABC)";
    output  Z;
    input   A,B,C;

`ifdef VMWSYNLIB
`else
    and (Z, A, B, C);
`endif
endmodule

macromodule VMW_AND4 (Z,A,B,C,D);
//  function : "(ABCD)";
    output  Z;
    input   A,B,C,D;

`ifdef VMWSYNLIB
`else
    and (Z, A, B, C, D);
`endif
endmodule


macromodule VMW_AND5 (Z,A,B,C,D,E);
//  function : "(ABCDE)";
    output  Z;
    input   A,B,C,D,E;

`ifdef VMWSYNLIB
`else
    and (Z, A, B, C, D, E);
`endif
endmodule


// Nand Gates

macromodule VMW_NAND2 (Z, A, B);
//  function : "(AB)'"
    output Z;
    input A,B;

`ifdef VMWSYNLIB
`else
    nand (Z, A, B);
`endif
endmodule

macromodule VMW_NAND3 (Z, A,B,C);
//  function : "(ABC)'";
    output  Z;
    input   A,B,C;

`ifdef VMWSYNLIB
`else
    nand (Z, A, B, C);
`endif
endmodule

macromodule VMW_NAND4 (Z,A,B,C,D);
//  function : "(ABCD)'";
    output  Z;
    input   A,B,C,D;

`ifdef VMWSYNLIB
`else
    nand (Z, A, B, C, D);
`endif
endmodule

macromodule VMW_NAND5 (Z,A,B,C,D,E);
//  function : "(ABCDE)'";
    output  Z;
    input   A,B,C,D,E;

`ifdef VMWSYNLIB
`else
    nand (Z, A, B, C, D, E);
`endif
endmodule


// Or Gates

macromodule VMW_OR2 (Z, A, B);
//  function : "(A+B)";
    output Z;
    input A,B;

`ifdef VMWSYNLIB
`else
    or (Z, A, B);
`endif
endmodule

macromodule VMW_OR3 (Z,A,B,C);
//  function : "(A+B+C)";
    output  Z;
    input   A,B,C;

`ifdef VMWSYNLIB
`else
    or (Z, A, B, C);
`endif
endmodule

macromodule VMW_OR4 (Z,A,B,C,D);
//  function : "(A+B+C+D)";
    output  Z;
    input   A,B,C,D;

`ifdef VMWSYNLIB
`else
    or (Z, A, B, C, D);
`endif
endmodule

macromodule VMW_OR5 (Z,A,B,C,D,E);
//  function : "(A+B+C+D+E)";
    output  Z;
    input   A,B,C,D,E;

`ifdef VMWSYNLIB
`else
    or (Z, A, B, C, D, E);
`endif
endmodule


// Nor Gates

macromodule VMW_NOR2 (Z, A, B);
//  function : "(A+B)'";
    output Z;
    input A,B;

`ifdef VMWSYNLIB
`else
    nor (Z, A, B);
`endif
endmodule

macromodule VMW_NOR3 (Z,A,B,C);
//  function : "(A+B+C)'";
    output  Z;
    input   A,B,C;

`ifdef VMWSYNLIB
`else
    nor (Z, A, B, C);
`endif
endmodule

macromodule VMW_NOR4 (Z,A,B,C,D);
//  function : "(A+B+C+D)'";
    output  Z;
    input   A,B,C,D;

`ifdef VMWSYNLIB
`else
    nor (Z, A, B, C, D);
`endif
endmodule

macromodule VMW_NOR5 (Z, A, B, C, D, E);
//  function : "(A+B+C+D+E)'";
    output  Z;
    input   A, B, C, D, E;

`ifdef VMWSYNLIB
`else
    nor (Z, A, B, C, D, E);
`endif
endmodule


// Xor Gates

macromodule VMW_XOR2 (Z, A, B);
//  function : "(AB'+ A'B)";
    output  Z;
    input   A,B;

`ifdef VMWSYNLIB
`else
    xor (Z, A, B);
`endif
endmodule

macromodule VMW_XOR3( Z, A,B,C);
//  function : "(A'B'C+A'B C'+A B'C'+A B C)";
    output Z;
    input A,B,C;

`ifdef VMWSYNLIB
`else
    xor (Z, A, B, C);
`endif
endmodule

macromodule VMW_XOR4 (Z, A, B, C, D);
//  function : "((A B)+((C+D)'))'";
    output Z;
    input A,B,C,D;

`ifdef VMWSYNLIB
`else
    xor (Z, A, B, C, D);
`endif
endmodule


// Xnor Gates

macromodule VMW_XNOR2 (Z, A, B);
//  function : "(AB+A'B')";
    output Z;
    input  A,B;

`ifdef VMWSYNLIB
`else
    xnor (Z, A, B);
`endif
endmodule

macromodule VMW_XNOR3( Z, A,B,C);
//  function : "(A'B'C'+A'B C+A B'C+A B C')";
    output Z;
    input A, B, C;

`ifdef VMWSYNLIB
`else
    xnor (Z, A, B, C);
`endif
endmodule


macromodule VMW_XNOR4 (Z, A, B, C, D);
//  function : "((A+B)((C D)'))'";
    output Z;
    input A,B,C,D;

`ifdef VMWSYNLIB
`else
    xnor (Z, A, B, C, D);
`endif
endmodule


// And-Ors

macromodule VMW_AO21 (Z, A, B, C);
//  function : "((A B)+C)";
    output Z;
    input A,B,C;

`ifdef VMWSYNLIB
    VMW_AND2 g1(.Z(t), .A(A), .B(B));
    VMW_OR2 g2(.Z(Z), .A(t), .B(C));
`else
    and g1(t, A, B);
    or g2(Z, t, C);
`endif
endmodule

macromodule VMW_AO211 (Z, A, B, C, D);
//  function : "((A B)+C+D)";
    output Z;
    input A, B, C, D;

`ifdef VMWSYNLIB
    VMW_AND2 g1(.Z(t), .A(A), .B(B));
    VMW_OR3 g2(.Z(Z), .A(t), .B(C), .C(D));
`else
    and g1(t, A, B);
    or g2(Z, t, C, D);
`endif
endmodule

macromodule VMW_AO22 (Z, A, B, C, D);
//  function : "(A B+C D)";
    output Z;
    input  A, B, C, D; 

`ifdef VMWSYNLIB
    VMW_AND2 o1(.Z(t1), .A(A), .B(B));
    VMW_AND2 o2(.Z(t2), .A(C), .B(D));
    VMW_OR2 g1(.Z(Z), .A(t1), .B(t2));
`else
    and o1(t1, A, B);
    and o2(t2, C, D);
    or g1(Z, t1, t2);
`endif
endmodule

macromodule VMW_AO222 (Z, A, B, C, D, E,F);
//  function : "(A B+C D+E F)";
    output Z;
    input  A, B, C, D, E, F; 

`ifdef VMWSYNLIB
    VMW_AND2 o1(.Z(t1), .A(A), .B(B)),
             o2(.Z(t2), .A(C), .B(D)),
	     o3(.Z(t3), .A(E), .B(F));
    VMW_OR3 g1(.Z(Z), .A(t1), .B(t2), .C(t3));
`else
    and o1(t1, A, B),
        o2(t2, C, D),
	o3(t3, E, F);
    or g1(Z, t1, t2, t3);
`endif
endmodule


// And-Or Inverts

macromodule VMW_AOI21 (Z, A, B, C);
//  function : "((A B)+C)'";
    output Z;
    input A,B,C;

`ifdef VMWSYNLIB
    VMW_AND2 g1(.Z(t), .A(A), .B(B));
    VMW_NOR2 g2(.Z(Z), .A(t), .B(C));
`else
    and g1(t, A, B);
    nor g2(Z, t, C);
`endif
endmodule

macromodule VMW_AOI211 (Z, A, B, C, D);
//  function : "((A B)+C+D)'";
    output Z;
    input A, B, C, D;

`ifdef VMWSYNLIB
    VMW_AND2 g1(.Z(t), .A(A), .B(B));
    VMW_NOR3 g2(.Z(Z), .A(t), .B(C), .C(D));
`else
    and g1(t, A, B);
    nor g2(Z, t, C, D);
`endif
endmodule

macromodule VMW_AOI22 (Z, A, B, C, D);
//  function : "(A B+C D)'";
    output Z;
    input  A, B, C, D; 

`ifdef VMWSYNLIB
    VMW_AND2 o1(.Z(t1), .A(A), .B(B)),
             o2(.Z(t2), .A(C), .B(D));
    VMW_NOR2 g1(.Z(Z), .A(t1), .B(t2));
`else
    and o1(t1, A, B),
        o2(t2, C, D);
    nor g1(Z, t1, t2);
`endif
endmodule

module VMW_AOI222 (Z, A, B, C, D, E,F);
//  function : "(A B+C D+E F)'";
    output Z;
    input  A, B, C, D, E, F; 

    VMW_AND2 o1(.Z(t1), .A(C), .B(D)), o2(.Z(t2), .A(E), .B(F));
    VMW_AOI211 g1(.Z(Z), .A(A), .B(B), .C(t1), .D(t2));
endmodule

// Or-And
macromodule VMW_OA31 (Z, A, B, C, D);
//  function : "((A+B+C)D)";
    output Z;
    input A,B,C,D;

`ifdef VMWSYNLIB
    VMW_OR3 g1(.Z(t), .A(A), .B(B), .C(C));
    VMW_AND2 g2(.Z(Z), .A(t), .B(D));
`else
    or g1(t, A, B, C);
    and g2(Z, t, D);
`endif
endmodule


// Or-And Inverts

macromodule VMW_OAI21 (Z, A, B, C);
//  function : "((A+B)C)'";
    output Z;
    input A,B,C;

`ifdef VMWSYNLIB
    VMW_OR2 g1(.Z(t), .A(A), .B(B));
    VMW_NAND2 g2(.Z(Z), .A(t), .B(C));
`else
    or g1(t, A, B);
    nand g2(Z, t, C);
`endif
endmodule

macromodule VMW_OAI211 (Z, A, B, C, D);
//  function : "((A+B)C D)'";
    output Z;
    input A, B, C, D;

`ifdef VMWSYNLIB
    VMW_OR2 g1(.Z(t), .A(A), .B(B));
    VMW_NAND3 g2(.Z(Z), .A(t), .B(C), .C(D));
`else
    or g1(t, A, B);
    nand g2(Z, t, C, D);
`endif
endmodule

macromodule VMW_OAI22 (Z, A, B, C, D);
//  function : "((A+B)(C+D))'";
    output Z;
    input A,B,C,D;

`ifdef VMWSYNLIB
    VMW_OR2 o1(.Z(t1), .A(A), .B(B)),
            o2(.Z(t2), .A(C), .B(D));
    VMW_NAND2 g1(.Z(Z), .A(t1), .B(t2));
`else
    or o1(t1, A, B),
       o2(t2, C, D);
    nand g1(Z, t1, t2);
`endif
endmodule


// Multiplexors
 
// simulation udps are used to deal gracefully with undefined selects
`ifdef VMWSYNLIB
`else
primitive VMW_PRIM_MUX1 (Q, S, A, B);
    output Q; 
    input S, A, B;

    table
//      S  A  B    Q
        0  0  ?  : 0 ;
        0  1  ?  : 1 ;
        0  x  ?  : x ;
        1  ?  0  : 0 ;
        1  ?  1  : 1 ;
        1  ?  x  : x ;
        x  0  0  : 0 ; // reducing pessimism...
        x  1  1  : 1 ;

    endtable
endprimitive

primitive VMW_PRIM_MUX4 (Z, A, B, D0, D1, D2, D3);
    output Z;
    input A, B, D0, D1, D2, D3;
    
    table   
//      A  B  D0  D1  D2  D3   Z
        0  0  1   ?   ?   ?  : 1  ;
        0  0  0   ?   ?   ?  : 0  ;
        0  0  x   ?   ?   ?  : x  ;
        1  0  ?   1   ?   ?  : 1  ;
        1  0  ?   0   ?   ?  : 0  ;
        1  0  ?   x   ?   ?  : x  ;
        0  1  ?   ?   1   ?  : 1  ;
        0  1  ?   ?   0   ?  : 0  ;
        0  1  ?   ?   x   ?  : x  ;
        1  1  ?   ?   ?   1  : 1  ;
        1  1  ?   ?   ?   0  : 0  ;
        1  1  ?   ?   ?   x  : x  ;
        x  0  1   1   ?   ?  : 1  ; // reducing pessimism...
        x  0  0   0   ?   ?  : 0  ;
        x  1  ?   ?   1   1  : 1  ;
        x  1  ?   ?   0   0  : 0  ;
        0  x  1   ?   1   ?  : 1  ;
        0  x  0   ?   0   ?  : 0  ;
        1  x  ?   1   ?   1  : 1  ;
        1  x  ?   0   ?   0  : 0  ;
        x  x  0   0   0   0  : 0  ;
        x  x  1   1   1   1  : 1  ;
    endtable
endprimitive
`endif


macromodule VMW_MUX2 (Z, A, B, S);
//  function : "(S'A+S B)";
    output Z;
    input A, B, S;

`ifdef VMWSYNLIB
    VMW_INV g1(.Z(s_), .A(S));
    VMW_AO22 g2(.Z(Z), .A(A), .B(s_), .C(B), .D(S));
`else
    VMW_PRIM_MUX1 g1(Z, S, A, B);
`endif
endmodule

macromodule VMW_MUX2I (Z, A, B, S);
//  function : "(S'A'+S B')";
    output Z;
    input A, B, S;

`ifdef VMWSYNLIB
    VMW_INV g1(.Z(s_), .A(S));
    VMW_AOI22 g2(.Z(Z), .A(A), .B(s_), .C(B), .D(S));
`else
    not g1(Z, z_);
    VMW_PRIM_MUX1 g2(z_, S, A, B);
`endif
endmodule

macromodule VMW_MUX21L (Z, A, B, S, SN);
//  function : "( (A S' SN) + (B S SN') )'";
    output Z;
    input A, B, S, SN;

`ifdef VMWSYNLIB
    VMW_INV g1 (.Z(z1), .A(S));
    VMW_INV g2 (.Z(z2), .A(SN));
    VMW_NAND3 g3 (.Z(z3), .A(A), .B(z1), .C(SN));
    VMW_NAND3 g4 (.Z(z4), .A(B), .B(S), .C(z2));
    VMW_AND2 g5 (.Z(Z), .A(z3), .B(z4));
`else
    not g1 (z1, S);
    not g2 (z2, SN);
    nand g3 (z3, A, z1, SN);
    nand g4 (z4, B, S, z2);
    and g5 (Z, z3, z4);
`endif
endmodule

macromodule VMW_MUX4 ( Z, A, B, D0, D1, D2, D3);
//  function : "((D0 A'B')+(D1 A B')+(D2 A'B)+(D3 A B))";
    output Z;
    input  A, B, D0, D1, D2, D3;

`ifdef VMWSYNLIB
    VMW_INV g1 (.Z(z1), .A(A)),
            g2 (.Z(z2), .A(B));
    VMW_AND3 g3 (.Z(z3),.A(D0), .B(z1), .C(z2)),
             g4 (.Z(z4),.A(D1), .B(A), .C(z2)),
             g5 (.Z(z5),.A(D2), .B(z1), .C(B)),
             g6 (.Z(z6),.A(D3), .B(A), .C(B));
    VMW_OR4 g7 (.Z(Z),.A(z3), .B(z4), .C(z5), .D(z6));
`else
    VMW_PRIM_MUX4 u1( Z, A, B, D0, D1, D2, D3);
`endif
endmodule

macromodule VMW_OAI2222 (Z, A, B, C, D, E, F, G, H);
//  function : "((A+B)(C+D)(E+F)(G+H))'";
    output Z;
    input A, B, C, D, E, F, G, H;

`ifdef VMWSYNLIB
    VMW_OR2 g1 ( .Z(z1), .A(A), .B(B)),
        g2 ( .Z(z2), .A(C), .B(D)),
        g3 ( .Z(z3), .A(E), .B(F)),
        g4 ( .Z(z4), .A(G), .B(H));
    VMW_NAND4 g5 (.Z(Z), .A(z1), .B(z2), .C(z3), .D(z4));
`else
    or g1 ( z1, A, B),
       g2 ( z2, C, D),
       g3 ( z3, E, F),
       g4 ( z4, G, H);
    nand g5 (Z, z1, z2, z3, z4);
`endif
endmodule
    
macromodule VMW_DEC24L (Z0, Z1, Z2, Z3, A, B);
//  pin(Z0) 
//    function : "A B' + A' B + A B";
//
//  pin(Z1) 
//    function : "A' B' + A' B + A B";
//
//  pin(Z2) 
//    function : "A' B' + A B' + A B";
//  pin(Z3) {
//    function : "A' B' + A B' + A' B";

    output Z0, Z1, Z2, Z3;
    input A, B;

`ifdef VMWSYNLIB
    VMW_INV g1 (.Z(z1), .A(A));
    VMW_INV g2 (.Z(z2), .A(B));

    VMW_AND2 g3 (.Z(z3), .A(A), .B(z2));
    VMW_AND2 g4 (.Z(z4), .A(z1), .B(B));
    VMW_AND2 g5 (.Z(z5), .A(A), .B(B));
    VMW_AND2 g6 (.Z(z6), .A(z1), .B(z2));

    VMW_OR3  g7 (.Z(Z0), .A(z3), .B(z4), .C(z5));
    VMW_OR3  g8 (.Z(Z1), .A(z6), .B(z4), .C(z5));
    VMW_OR3  g9 (.Z(Z2), .A(z6), .B(z3), .C(z5));
    VMW_OR3  g10 (.Z(Z3), .A(z6), .B(z3), .C(z4));
`else
    not g1 (z1, A);
    not g2 (z2, B);

    and g3 (z3, A, z2);
    and g4 (z4, z1, B);
    and g5 (z5, A, B);
    and g6 (z6, z1, z2);

    or g7 (Z0, z3, z4, z5);
    or g8 (Z1, z6, z4, z5);
    or g9 (Z2, z6, z3, z5);
    or g10 (Z3, z6, z3, z4);
`endif
endmodule

module VMW_FADD ( S, CO, CI, A, B);
//  pin(S) {
//    direction : output;
//    function : "CI A' B' + CI' A B' + CI' A' B + CI A B";
//  }
//  pin(CO) {
//    direction : output;
//    function : "CI A B' + CI A' B + CI' A B + CI A B";

    output S, CO;
    input CI, A, B;

    VMW_AND2
	and1 (.Z(t1), .A(A), .B(B)),
        and2 (.Z(t2), .A(A), .B(CI)),
        and3 (.Z(t3), .A(CI), .B(B));

   VMW_OR3 or3 (.Z(CO), .A(t1), .B(t2), .C(t3));
   VMW_XOR3 xor3 (.Z(S), .A(A), .B(B), .C(CI));

endmodule

macromodule VMW_HADD (S, CO, A, B);
//  pin(S) {
//   direction : output;
//    function : "A' B +  A B'";
//  }
//  pin(CO) {
//    direction : output;
//    function : "A B";

    output S, CO;
    input A, B;

`ifdef VMWSYNLIB
    VMW_INV g1 ( .Z(E), .A(CO));
    VMW_AND2 g2 ( .Z(S), .A(F), .B(E)),
             g3 ( .Z(CO), .A(A), .B(B));
    VMW_OR2  g4 ( .Z(F), .A(A), .B(B));
`else
    not g1 ( E, CO);
    and g2 ( S, F, E),
        g3 ( CO, A, B);
    or  g4 ( F, A, B);
`endif
endmodule

    
// Flip-flops

// d-flop
macromodule VMW_FD
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC));
    output FlopQ;
    input FlopD, FlopC;

`else
(Q, D, CP);
    output Q;
    input D, CP;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule 

macromodule VMW_FD2 (Q, QN, D, CP);
    output Q, QN;
    input D, CP;

`ifdef VMWSYNLIB
    VMW_FD g1 (.Q(Q), .D(D), .CP(CP));
    VMW_INV g2 (.Z(QN), .A(Q));
`else
`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif
    not g2 (QN, Q);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule 

// d-flop w/clock enable
macromodule VMW_FDE
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .CE(FlopE));
    output FlopQ;
    input FlopD, FlopC, FlopE;

`else
(Q, D, CP, CE);
    output Q;
    input D, CP, CE;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFFE #(1.0) g1 (Q, CE, d, CP, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// negative-edge d-flop
macromodule VMW_FDN
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CPN(FlopC_));
    output FlopQ;
    input FlopD, FlopC_;

`else
(Q, D, CPN);
    output Q;
    input D, CPN;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, cp, 1'b0, 1'b0);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, cp, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif
    not g2 (cp, CPN);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// d-flop w/async preset
macromodule VMW_FDP
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .PRE(FlopS));
    output FlopQ;
    input FlopD, FlopC, FlopS;

`else
(Q, D, CP, PRE);
    output Q;
    input D, CP, PRE;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, PRE);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, 1'b0, PRE);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

//d-flop w/async preset & clear
macromodule VMW_FDPC
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .PRE(FlopS),.CLR(FlopR));
    output FlopQ;
    input FlopD, FlopC, FlopS, FlopR;

`else
(Q, D, CP, PRE, CLR);
    output Q;
    input D, CP, PRE, CLR;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, CLR, PRE);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, CLR, PRE);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// d-flop w/async preset w/Qbar
// macromodules w/multiple outputs cause crashes
macromodule VMW_FDP2 (Q, QN, D, CP, S);
    output Q, QN;
    input D, CP, S;

`ifdef VMWSYNLIB
    VMW_FDP g1 (.Q(Q), .D(D), .CP(CP), .PRE(S));
    VMW_INV g2 (.Z(QN), .A(Q));
`else
`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, 1'b0, S);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, 1'b0, S);
    buf #(1.0) g1a (d, D);
`endif
    not g2 (QN, Q);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule 

// d-flop w/clock enable, async preset
macromodule VMW_FDPE
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .CE(FlopE), .PRE(FlopS));
    output FlopQ;
    input FlopD, FlopC, FlopE, FlopS;

`else
(Q, D, CP, CE, PRE);
    output Q;
    input D, CP, CE, PRE;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, 1'b0, PRE);
`else
    VMWS_PRIM_DFFE #(1.0) g1 (Q, CE, d, CP, 1'b0, PRE);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// d-flop w/async clear
macromodule VMW_FDC
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .CLR(FlopR));
    output FlopQ;
    input FlopD, FlopC, FlopR;

`else
(Q, D, CP, CLR);
    output Q;
    input D, CP, CLR;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFF g1 (Q, D, CP, CLR, 1'b0);
`else
    VMWS_PRIM_DFF #(1.0) g1 (Q, d, CP, CLR, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// d-flop w/clock enable, async clear
macromodule VMW_FDCE
`ifdef VMWSYNLIB
(.Q(FlopQ), .D(FlopD), .CP(FlopC), .CE(FlopE), .CLR(FlopR));
    output FlopQ;
    input FlopD, FlopC, FlopE, FlopR;

`else
(Q, D, CP, CE, CLR);
    output Q;
    input D, CP, CE, CLR;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_DFFE g1 (Q, CE, D, CP, CLR, 1'b0);
`else
    VMWS_PRIM_DFFE #(1.0) g1 (Q, CE, d, CP, CLR, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule


// Latches

// positive-enable
macromodule VMW_LD
`ifdef VMWSYNLIB
(.Q(LatchQ), .D(LatchD), .G(LatchG));
    output LatchQ;
    input LatchD, LatchG;

`else
(Q, D, G);
    output Q;
    input D, G;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, G, d, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

macromodule VMW_LDP
`ifdef VMWSYNLIB
(.Q(LatchQ), .D(LatchD), .G(LatchG), .PRE(LatchS));
    output LatchQ;
    input LatchD, LatchG, LatchS;

`else
(Q, D, G, PRE);
    output Q;
    input D, G, PRE;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, PRE);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, G, d, 1'b0, PRE);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

macromodule VMW_LDC
`ifdef VMWSYNLIB
(.Q(LatchQ), .D(LatchD), .G(LatchG), .CLR(LatchR));
    output LatchQ;
    input LatchD, LatchG, LatchR;

`else
(Q, D, G, CLR);
    output Q;
    input D, G, CLR;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, G, D, CLR, 1'b0);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, G, d, CLR, 1'b0);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

macromodule VMW_LDPC
`ifdef VMWSYNLIB
(.Q(LatchQ), .D(LatchD), .G(LatchG), .CLR(LatchR), .PRE(LatchS));
    output LatchQ;
    input LatchD, LatchG, LatchR, LatchS;

`else
(Q, D, G, CLR, PRE);
    output Q;
    input D, G, CLR, PRE;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, G, D, CLR, PRE);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, G, d, CLR, PRE);
    buf #(1.0) g1a (d, D);
`endif

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

// negative-enable
macromodule VMW_LDN
`ifdef VMWSYNLIB
(.Q(LatchQ), .D(LatchD), .GN(LatchG_));
    output LatchQ;
    input  LatchD, LatchG_;

`else
(Q, D, GN);
    output Q;
    input  D, GN;

`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, g, d, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif
    not g2 (g, GN);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

macromodule VMW_LD2 (Q, QN, D, G);
    output Q, QN;
    input D, G;

`ifdef VMWSYNLIB
    VMW_LD g1(.Q(Q), .D(D), .G(G));
    VMW_INV g2(.Z(QN), .A(Q));
`else
`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, G, D, 1'b0, 1'b0);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, G, d, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif
    not g2(QN, Q);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule

macromodule VMW_LDN2(Q, QN, D, GN);
    output Q, QN;
    input D, GN;

`ifdef VMWSYNLIB
    VMW_LDN g1(.Q(Q), .D(D), .GN(GN));
    VMW_INV g2(.Z(QN), .A(Q));
`else
`ifdef VMW_ZERO_DELAY
    VMWS_PRIM_LATCH g1 (Q, g, D, 1'b0, 1'b0);
`else
    VMWS_PRIM_LATCH #(1.0) g1 (Q, g, d, 1'b0, 1'b0);
    buf #(1.0) g1a (d, D);
`endif
    not g2(g, GN);
    not g3(QN, Q);

`ifdef VMW_DUMP_STATE
    always @(Q) $display("%d: %m -> %b", $time, Q);
`endif

`endif
endmodule


// Pads

// internal tristate driver
macromodule VMW_BUFIZ
`ifdef VMWSYNLIB
(.Z(PadO), .E(PadE), .A(PadI));
    inout PadO;
    input PadE, PadI;
    
`else
(Z, E, A);
    inout Z;
    input E, A;

`ifdef VCS 
    // Chrono dislikes bufif
    assign Z = (E) ? A : 1'bz;
`else
    bufif1 (Z, A, E);
`endif
`endif
endmodule

// tristateable output pad
macromodule VMW_OBUFZ
`ifdef VMWSYNLIB
(.Z(PadO), .E(PadE), .A(PadI));
    inout PadO;
    input PadE, PadI;

`else
(Z, E, A);
    inout Z;
    input E, A;

`ifdef VCS    
    // Chrono dislikes bufif
    assign Z = (E) ? A : 1'bz;
`else
    bufif1 (Z, A, E);
`endif
`endif
endmodule

// input pad
macromodule VMW_IBUF
`ifdef VMWSYNLIB
(.Z(PadO), .A(PadI));
    output PadO;
    input PadI;

`else
(Z, A);
    output Z;
    input A;

`ifdef VMW_ZERO_DELAY
    buf (Z, A);
`else
    buf #(1.0) (Z, A);
`endif
`endif
endmodule


// output pad
macromodule VMW_OBUF
`ifdef VMWSYNLIB
(.Z(PadO), .A(PadI));
    output PadO;
    input PadI;

`else
(Z, A);
    output Z;
    input A;

    buf (Z, A);
`endif
endmodule


// pullup/pulldown: can be used on pads, internal tristate busses,
// and undriven nets to set default behavior

macromodule VMW_PULLUP
`ifdef VMWSYNLIB
(.Z(PullU));
    inout PullU;

`else
(Z);
    inout Z;

    pullup(Z);
`endif
endmodule

macromodule VMW_PULLDOWN
`ifdef VMWSYNLIB
(.Z(PullD));
    inout PullD;

`else
(Z);
    inout Z;

    pulldown(Z);
`endif
endmodule

// internal tristate bus state preserver

macromodule VMW_KEEPER
`ifdef VMWSYNLIB
(.Z(PullK));
    inout PullK;

`else
(Z);
    inout Z;

    trireg keeper;
    tran(Z, keeper);
`endif
endmodule

`ifdef VMW_NO_LIBNAMES
`noremove_netnames
`noremove_gatenames
`endif

/* End of library vmw_reference.v */
