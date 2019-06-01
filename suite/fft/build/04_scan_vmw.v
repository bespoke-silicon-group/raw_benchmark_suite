
module NORMALIZE_SIZE2 ( a, b );
input  [2:0] a;
output [2:0] b;
    wire n182, n183;
    VMW_AO22 U22 ( .A(a[1]), .B(n182), .C(a[1]), .D(a[0]), .Z(b[1]) );
    VMW_INV U26 ( .A(a[2]), .Z(n183) );
    VMW_NOR3 U23 ( .A(a[0]), .B(a[1]), .C(n183), .Z(b[2]) );
    VMW_XNOR2 U24 ( .A(n182), .B(a[0]), .Z(b[0]) );
    VMW_OAI21 U25 ( .A(a[0]), .B(a[1]), .C(a[2]), .Z(n182) );
endmodule


module ADD_NN_SIZE2 ( a, b, c );
input  [2:0] a;
input  [2:0] b;
output [2:0] c;
    wire \arr[2] , \sum[1] , n60, \arr[0] , n56, n58, n57, n59;
    NORMALIZE_SIZE2 norm ( .a({\arr[2] , \sum[1] , \arr[0] }), .b(c) );
    VMW_AO22 U6 ( .A(n60), .B(b[1]), .C(a[1]), .D(n56), .Z(n59) );
    VMW_NAND2 U7 ( .A(a[0]), .B(b[0]), .Z(n58) );
    VMW_AO21 U8 ( .A(n56), .B(\sum[1] ), .C(n60), .Z(n57) );
    VMW_INV U9 ( .A(a[1]), .Z(n60) );
    VMW_OAI21 U2 ( .A(\sum[1] ), .B(n56), .C(n57), .Z(\arr[2] ) );
    VMW_XOR2 U5 ( .A(a[0]), .B(b[0]), .Z(\arr[0] ) );
    VMW_XNOR2 U3 ( .A(n58), .B(n59), .Z(\sum[1] ) );
    VMW_INV U4 ( .A(b[1]), .Z(n56) );
endmodule


module ADD_MINUS_1_SIZE2 ( a, b );
input  [2:0] a;
output [2:0] b;
    wire n164, n165;
    VMW_NAND2 U20 ( .A(n164), .B(n165), .Z(b[1]) );
    VMW_NAND2 U21 ( .A(n165), .B(a[0]), .Z(b[0]) );
    VMW_NOR3 U22 ( .A(n164), .B(a[2]), .C(a[0]), .Z(b[2]) );
    VMW_XOR2 U23 ( .A(a[0]), .B(a[1]), .Z(n164) );
    VMW_INV U24 ( .A(a[2]), .Z(n165) );
endmodule


module ADD_SIZE2 ( a, b, c );
input  [2:0] a;
input  [2:0] b;
output [2:0] c;
    wire \sum1[2] , \sum2[1] , \sum1[0] , \sum1[1] , \sum3[2] , \sum3[1] , n90, 
        n91, \sum3[0] , \sum2[2] , n93, n92, n89, \sum2[0] ;
    ADD_NN_SIZE2 add_nn ( .a(a), .b(b), .c({\sum1[2] , \sum1[1] , \sum1[0] })
         );
    ADD_MINUS_1_SIZE2 am2 ( .a(b), .b({\sum3[2] , \sum3[1] , \sum3[0] }) );
    VMW_NOR2 U20 ( .A(n89), .B(a[2]), .Z(n93) );
    VMW_NOR2 U21 ( .A(b[2]), .B(a[2]), .Z(n89) );
    VMW_AO21 U17 ( .A(\sum1[2] ), .B(n89), .C(n90), .Z(c[2]) );
    VMW_AO22 U22 ( .A(\sum3[2] ), .B(a[2]), .C(\sum2[2] ), .D(n93), .Z(n90) );
    VMW_AO21 U18 ( .A(\sum1[1] ), .B(n89), .C(n91), .Z(c[1]) );
    VMW_AO21 U19 ( .A(\sum1[0] ), .B(n89), .C(n92), .Z(c[0]) );
    VMW_AO22 U23 ( .A(\sum3[1] ), .B(a[2]), .C(\sum2[1] ), .D(n93), .Z(n91) );
    VMW_AO22 U24 ( .A(\sum3[0] ), .B(a[2]), .C(\sum2[0] ), .D(n93), .Z(n92) );
    ADD_MINUS_1_SIZE2 am1 ( .a(a), .b({\sum2[2] , \sum2[1] , \sum2[0] }) );
endmodule


module NEGATE_SIZE2 ( a, b );
input  [2:0] a;
output [2:0] b;
    wire n168, n169;
    VMW_NOR2 U27 ( .A(n168), .B(a[2]), .Z(b[1]) );
    VMW_AO21 U28 ( .A(n169), .B(a[1]), .C(a[2]), .Z(b[0]) );
    VMW_NOR3 U29 ( .A(a[2]), .B(a[1]), .C(n169), .Z(b[2]) );
    VMW_INV U30 ( .A(a[0]), .Z(n169) );
    VMW_INV U31 ( .A(a[1]), .Z(n168) );
endmodule


module SHIFT_UP_SIZE2_s5 ( a, c );
input  [2:0] a;
output [2:0] c;
    wire \sum1[2] , Logic0, \nb2[1] , \sum1[1] , \sum1[0] , \nb2[2] , \nb2[0] ;
    ADD_SIZE2 add2 ( .a({\sum1[2] , \sum1[1] , \sum1[0] }), .b({Logic0, Logic0, 
        Logic0}), .c(c) );
    NEGATE_SIZE2 negate ( .a({Logic0, Logic0, Logic0}), .b({\nb2[2] , \nb2[1] , 
        \nb2[0] }) );
    ADD_SIZE2 add1 ( .a({Logic0, Logic0, Logic0}), .b({\nb2[2] , \nb2[1] , 
        \nb2[0] }), .c({\sum1[2] , \sum1[1] , \sum1[0] }) );
    VMW_PULLDOWN U10 ( .Z(Logic0) );
endmodule


module COMBINATIONAL_SIZE2_s5 ( a, b, x, y );
input  [2:0] a;
output [2:0] y;
input  [2:0] b;
output [2:0] x;
    wire \t2[0] , \b[0] , \t2[1] , \t1[2] , \a[2]1 , \b[2] , \t1[0] , \t2[2] , 
        \t1[1] , \a[1]1 , \b[1] , \a[0]1 ;
    assign \a[2]1  = a[2];
    assign \a[1]1  = a[1];
    assign \a[0]1  = a[0];
    assign \b[2]  = b[2];
    assign \b[1]  = b[1];
    assign \b[0]  = b[0];
    assign x[2] = \a[2]1 ;
    assign x[1] = \a[1]1 ;
    assign x[0] = \a[0]1 ;
    assign y[2] = \b[2] ;
    assign y[1] = \b[1] ;
    assign y[0] = \b[0] ;
    ADD_SIZE2 add2 ( .a({\a[2]1 , \a[1]1 , \a[0]1 }), .b({\t2[2] , \t2[1] , 
        \t2[0] }) );
    ADD_SIZE2 add1 ( .a({\a[2]1 , \a[1]1 , \a[0]1 }), .b({\t1[2] , \t1[1] , 
        \t1[0] }) );
    SHIFT_UP_SIZE2_s5 shift ( .a({\b[2] , \b[1] , \b[0] }), .c({\t1[2] , 
        \t1[1] , \t1[0] }) );
    NEGATE_SIZE2 neg ( .a({\t1[2] , \t1[1] , \t1[0] }), .b({\t2[2] , \t2[1] , 
        \t2[0] }) );
endmodule


module FFT_Node_SIZE2_IDWIDTH1_s5_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, Idl, Idr, Ids, Enable, inleft, 
    inright, outleft, outright );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Idl;
input  [0:0] Ids;
output [2:0] outleft;
input  [1:0] ScanIn;
input  [0:0] Idr;
input  [2:0] inleft;
input  [2:0] inright;
output [1:0] ScanOut;
output [2:0] outright;
input  Clk, Reset, RD, WR, ScanEnable, Enable;
    wire \outleft[1] , n406, \comleft[0] , n414, \comleft[2] , \comright[1] , 
        n408, n413, n412, \outleft[0] , n409, n407, n417, n405, n415, n402, 
        n410, n411, \comleft[1] , \comright[0] , n403, \comright[2] , n404, 
        n416;
    assign ScanOut[1] = \outleft[1] ;
    assign ScanOut[0] = \outleft[0] ;
    assign outleft[1] = \outleft[1] ;
    assign outleft[0] = \outleft[0] ;
    VMW_AO22 U54 ( .A(ScanIn[0]), .B(n402), .C(n409), .D(n403), .Z(n412) );
    VMW_FD \outright_reg[0]  ( .D(n417), .CP(Clk), .Q(outright[0]) );
    VMW_AO22 U53 ( .A(n402), .B(outright[1]), .C(n403), .D(n408), .Z(n413) );
    VMW_AO22 U61 ( .A(outright[2]), .B(n411), .C(\comright[2] ), .D(Enable), 
        .Z(n406) );
    VMW_FD \outleft_reg[0]  ( .D(n414), .CP(Clk), .Q(\outleft[0] ) );
    VMW_FD \outleft_reg[2]  ( .D(n412), .CP(Clk), .Q(outleft[2]) );
    VMW_FD \outright_reg[2]  ( .D(n415), .CP(Clk), .Q(outright[2]) );
    VMW_AO22 U49 ( .A(n402), .B(outleft[2]), .C(n403), .D(n404), .Z(n417) );
    VMW_AO22 U52 ( .A(n402), .B(outright[0]), .C(n403), .D(n407), .Z(n414) );
    VMW_NOR2 U55 ( .A(ScanEnable), .B(Reset), .Z(n403) );
    VMW_AO22 U60 ( .A(\outleft[0] ), .B(n411), .C(\comleft[0] ), .D(Enable), 
        .Z(n407) );
    COMBINATIONAL_SIZE2_s5 com ( .a(inleft), .b(inright), .x({\comleft[2] , 
        \comleft[1] , \comleft[0] }), .y({\comright[2] , \comright[1] , 
        \comright[0] }) );
    VMW_AO22 U57 ( .A(outright[1]), .B(n411), .C(\comright[1] ), .D(Enable), 
        .Z(n405) );
    VMW_AO22 U62 ( .A(outleft[2]), .B(n411), .C(\comleft[2] ), .D(Enable), .Z(
        n409) );
    VMW_AO22 U50 ( .A(n402), .B(outright[2]), .C(n403), .D(n405), .Z(n416) );
    VMW_AO22 U59 ( .A(\outleft[1] ), .B(n411), .C(\comleft[1] ), .D(Enable), 
        .Z(n408) );
    VMW_AO22 U51 ( .A(ScanIn[1]), .B(n402), .C(n406), .D(n403), .Z(n415) );
    VMW_AO22 U58 ( .A(outright[0]), .B(n411), .C(\comright[0] ), .D(Enable), 
        .Z(n404) );
    VMW_INV U64 ( .A(Reset), .Z(n410) );
    VMW_AND2 U56 ( .A(ScanEnable), .B(n410), .Z(n402) );
    VMW_FD \outleft_reg[1]  ( .D(n413), .CP(Clk), .Q(\outleft[1] ) );
    VMW_INV U63 ( .A(Enable), .Z(n411) );
    VMW_FD \outright_reg[1]  ( .D(n416), .CP(Clk), .Q(outright[1]) );
endmodule


module SHIFT_UP_SIZE2_s0 ( a, c );
input  [2:0] a;
output [2:0] c;
    wire \a[2] , \a[1] , \sum1[2] , \nb2[1] , \b1[1] , \sum1[0] , \a[0] , 
        \sum1[1] , n178, \nb2[2] , Logic01, \b1[2] , \b1[0] , \nb2[0] ;
    assign \a[2]  = a[2];
    assign \a[1]  = a[1];
    assign \a[0]  = a[0];
    assign c[2] = \a[2] ;
    assign c[1] = \a[1] ;
    assign c[0] = \a[0] ;
    ADD_SIZE2 add2 ( .a({\sum1[2] , \sum1[1] , \sum1[0] }), .b({Logic01, 
        Logic01, Logic01}) );
    VMW_PULLDOWN U13 ( .Z(\b1[2] ) );
    VMW_PULLDOWN U14 ( .Z(Logic01) );
    VMW_AND2 U15 ( .A(\a[1] ), .B(n178), .Z(\b1[1] ) );
    NEGATE_SIZE2 negate ( .a({Logic01, Logic01, Logic01}), .b({\nb2[2] , 
        \nb2[1] , \nb2[0] }) );
    ADD_SIZE2 add1 ( .a({\b1[2] , \b1[1] , \b1[0] }), .b({\nb2[2] , \nb2[1] , 
        \nb2[0] }), .c({\sum1[2] , \sum1[1] , \sum1[0] }) );
    VMW_INV U17 ( .A(\a[2] ), .Z(n178) );
    VMW_AND2 U16 ( .A(\a[0] ), .B(n178), .Z(\b1[0] ) );
endmodule


module COMBINATIONAL_SIZE2_s0 ( a, b, x, y );
input  [2:0] a;
output [2:0] y;
input  [2:0] b;
output [2:0] x;
    wire \t2[1] , \t1[2] , \t4[0] , \t1[0] , \t3[1] , n166, \t3[0] , \t4[1] , 
        \t2[2] , \t2[0] , \t1[1] , n165;
    ADD_SIZE2 add2 ( .a(a), .b({\t2[2] , \t2[1] , \t2[0] }), .c({y[2], \t4[1] , 
        \t4[0] }) );
    VMW_AND2 U21 ( .A(\t3[0] ), .B(n165), .Z(x[0]) );
    ADD_SIZE2 add1 ( .a(a), .b({\t1[2] , \t1[1] , \t1[0] }), .c({x[2], \t3[1] , 
        \t3[0] }) );
    VMW_AND2 U20 ( .A(\t3[1] ), .B(n165), .Z(x[1]) );
    VMW_AND2 U22 ( .A(\t4[1] ), .B(n166), .Z(y[1]) );
    SHIFT_UP_SIZE2_s0 shift ( .a(b), .c({\t1[2] , \t1[1] , \t1[0] }) );
    VMW_INV U25 ( .A(x[2]), .Z(n165) );
    NEGATE_SIZE2 neg ( .a({\t1[2] , \t1[1] , \t1[0] }), .b({\t2[2] , \t2[1] , 
        \t2[0] }) );
    VMW_AND2 U23 ( .A(\t4[0] ), .B(n166), .Z(y[0]) );
    VMW_INV U24 ( .A(y[2]), .Z(n166) );
endmodule


module FFT_Node_SIZE2_IDWIDTH1_s0_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, Idl, Idr, Ids, Enable, inleft, 
    inright, outleft, outright );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Idl;
input  [0:0] Ids;
output [2:0] outleft;
input  [1:0] ScanIn;
input  [0:0] Idr;
input  [2:0] inleft;
input  [2:0] inright;
output [1:0] ScanOut;
output [2:0] outright;
input  Clk, Reset, RD, WR, ScanEnable, Enable;
    wire \outleft[1] , n406, \comleft[0] , n414, \comleft[2] , \comright[1] , 
        n408, n413, n412, \outleft[0] , n409, n407, n417, n405, n415, n402, 
        n410, n411, \comleft[1] , \comright[0] , n403, \comright[2] , n404, 
        n416;
    assign ScanOut[1] = \outleft[1] ;
    assign ScanOut[0] = \outleft[0] ;
    assign outleft[1] = \outleft[1] ;
    assign outleft[0] = \outleft[0] ;
    VMW_AO22 U54 ( .A(ScanIn[0]), .B(n402), .C(n409), .D(n403), .Z(n412) );
    VMW_FD \outright_reg[0]  ( .D(n417), .CP(Clk), .Q(outright[0]) );
    VMW_AO22 U53 ( .A(n402), .B(outright[1]), .C(n403), .D(n408), .Z(n413) );
    VMW_AO22 U61 ( .A(outright[2]), .B(n411), .C(\comright[2] ), .D(Enable), 
        .Z(n406) );
    VMW_FD \outleft_reg[0]  ( .D(n414), .CP(Clk), .Q(\outleft[0] ) );
    VMW_FD \outleft_reg[2]  ( .D(n412), .CP(Clk), .Q(outleft[2]) );
    VMW_FD \outright_reg[2]  ( .D(n415), .CP(Clk), .Q(outright[2]) );
    VMW_AO22 U49 ( .A(n402), .B(outleft[2]), .C(n403), .D(n404), .Z(n417) );
    VMW_AO22 U52 ( .A(n402), .B(outright[0]), .C(n403), .D(n407), .Z(n414) );
    VMW_NOR2 U55 ( .A(ScanEnable), .B(Reset), .Z(n403) );
    VMW_AO22 U60 ( .A(\outleft[0] ), .B(n411), .C(\comleft[0] ), .D(Enable), 
        .Z(n407) );
    COMBINATIONAL_SIZE2_s0 com ( .a(inleft), .b(inright), .x({\comleft[2] , 
        \comleft[1] , \comleft[0] }), .y({\comright[2] , \comright[1] , 
        \comright[0] }) );
    VMW_AO22 U57 ( .A(outright[1]), .B(n411), .C(\comright[1] ), .D(Enable), 
        .Z(n405) );
    VMW_AO22 U62 ( .A(outleft[2]), .B(n411), .C(\comleft[2] ), .D(Enable), .Z(
        n409) );
    VMW_AO22 U50 ( .A(n402), .B(outright[2]), .C(n403), .D(n405), .Z(n416) );
    VMW_AO22 U59 ( .A(\outleft[1] ), .B(n411), .C(\comleft[1] ), .D(Enable), 
        .Z(n408) );
    VMW_AO22 U51 ( .A(ScanIn[1]), .B(n402), .C(n406), .D(n403), .Z(n415) );
    VMW_AO22 U58 ( .A(outright[0]), .B(n411), .C(\comright[0] ), .D(Enable), 
        .Z(n404) );
    VMW_INV U64 ( .A(Reset), .Z(n410) );
    VMW_AND2 U56 ( .A(ScanEnable), .B(n410), .Z(n402) );
    VMW_FD \outleft_reg[1]  ( .D(n413), .CP(Clk), .Q(\outleft[1] ) );
    VMW_INV U63 ( .A(Enable), .Z(n411) );
    VMW_FD \outright_reg[1]  ( .D(n416), .CP(Clk), .Q(outright[1]) );
endmodule


module SHIFT_UP_SIZE2_s1 ( a, c );
input  [2:0] a;
output [2:0] c;
    wire \sum1[2] , Logic0, \nb2[1] , \b1[1] , \sum1[1] , \sum1[0] , n179, 
        \nb2[2] , \nb2[0] , \b1[2] , \b1[0] ;
    ADD_SIZE2 add2 ( .a({\sum1[2] , \sum1[1] , \sum1[0] }), .b({Logic0, Logic0, 
        Logic0}), .c(c) );
    VMW_PULLDOWN U13 ( .Z(\b1[0] ) );
    VMW_PULLDOWN U14 ( .Z(\b1[2] ) );
    NEGATE_SIZE2 negate ( .a({Logic0, Logic0, Logic0}), .b({\nb2[2] , \nb2[1] , 
        \nb2[0] }) );
    ADD_SIZE2 add1 ( .a({\b1[2] , \b1[1] , \b1[0] }), .b({\nb2[2] , \nb2[1] , 
        \nb2[0] }), .c({\sum1[2] , \sum1[1] , \sum1[0] }) );
    VMW_PULLDOWN U15 ( .Z(Logic0) );
    VMW_INV U17 ( .A(a[0]), .Z(n179) );
    VMW_NOR2 U16 ( .A(n179), .B(a[2]), .Z(\b1[1] ) );
endmodule


module COMBINATIONAL_SIZE2_s1 ( a, b, x, y );
input  [2:0] a;
output [2:0] y;
input  [2:0] b;
output [2:0] x;
    wire \t2[1] , \t1[2] , \t4[0] , \t1[0] , \t3[1] , n166, \t3[0] , \t4[1] , 
        \t2[2] , \t2[0] , \t1[1] , n165;
    ADD_SIZE2 add2 ( .a(a), .b({\t2[2] , \t2[1] , \t2[0] }), .c({y[2], \t4[1] , 
        \t4[0] }) );
    VMW_AND2 U21 ( .A(\t3[0] ), .B(n165), .Z(x[0]) );
    ADD_SIZE2 add1 ( .a(a), .b({\t1[2] , \t1[1] , \t1[0] }), .c({x[2], \t3[1] , 
        \t3[0] }) );
    VMW_AND2 U20 ( .A(\t3[1] ), .B(n165), .Z(x[1]) );
    VMW_AND2 U22 ( .A(\t4[1] ), .B(n166), .Z(y[1]) );
    SHIFT_UP_SIZE2_s1 shift ( .a(b), .c({\t1[2] , \t1[1] , \t1[0] }) );
    VMW_INV U25 ( .A(x[2]), .Z(n165) );
    NEGATE_SIZE2 neg ( .a({\t1[2] , \t1[1] , \t1[0] }), .b({\t2[2] , \t2[1] , 
        \t2[0] }) );
    VMW_AND2 U23 ( .A(\t4[0] ), .B(n166), .Z(y[0]) );
    VMW_INV U24 ( .A(y[2]), .Z(n166) );
endmodule


module FFT_Node_SIZE2_IDWIDTH1_s1_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, Idl, Idr, Ids, Enable, inleft, 
    inright, outleft, outright );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Idl;
input  [0:0] Ids;
output [2:0] outleft;
input  [1:0] ScanIn;
input  [0:0] Idr;
input  [2:0] inleft;
input  [2:0] inright;
output [1:0] ScanOut;
output [2:0] outright;
input  Clk, Reset, RD, WR, ScanEnable, Enable;
    wire \outleft[1] , n406, \comleft[0] , n414, \comleft[2] , \comright[1] , 
        n408, n413, n412, \outleft[0] , n409, n407, n417, n405, n415, n402, 
        n410, n411, \comleft[1] , \comright[0] , n403, \comright[2] , n404, 
        n416;
    assign ScanOut[1] = \outleft[1] ;
    assign ScanOut[0] = \outleft[0] ;
    assign outleft[1] = \outleft[1] ;
    assign outleft[0] = \outleft[0] ;
    VMW_AO22 U54 ( .A(ScanIn[0]), .B(n402), .C(n409), .D(n403), .Z(n412) );
    VMW_FD \outright_reg[0]  ( .D(n417), .CP(Clk), .Q(outright[0]) );
    VMW_AO22 U53 ( .A(n402), .B(outright[1]), .C(n403), .D(n408), .Z(n413) );
    VMW_AO22 U61 ( .A(outright[2]), .B(n411), .C(\comright[2] ), .D(Enable), 
        .Z(n406) );
    VMW_FD \outleft_reg[0]  ( .D(n414), .CP(Clk), .Q(\outleft[0] ) );
    VMW_FD \outleft_reg[2]  ( .D(n412), .CP(Clk), .Q(outleft[2]) );
    VMW_FD \outright_reg[2]  ( .D(n415), .CP(Clk), .Q(outright[2]) );
    VMW_AO22 U49 ( .A(n402), .B(outleft[2]), .C(n403), .D(n404), .Z(n417) );
    VMW_AO22 U52 ( .A(n402), .B(outright[0]), .C(n403), .D(n407), .Z(n414) );
    VMW_NOR2 U55 ( .A(ScanEnable), .B(Reset), .Z(n403) );
    VMW_AO22 U60 ( .A(\outleft[0] ), .B(n411), .C(\comleft[0] ), .D(Enable), 
        .Z(n407) );
    COMBINATIONAL_SIZE2_s1 com ( .a(inleft), .b(inright), .x({\comleft[2] , 
        \comleft[1] , \comleft[0] }), .y({\comright[2] , \comright[1] , 
        \comright[0] }) );
    VMW_AO22 U57 ( .A(outright[1]), .B(n411), .C(\comright[1] ), .D(Enable), 
        .Z(n405) );
    VMW_AO22 U62 ( .A(outleft[2]), .B(n411), .C(\comleft[2] ), .D(Enable), .Z(
        n409) );
    VMW_AO22 U50 ( .A(n402), .B(outright[2]), .C(n403), .D(n405), .Z(n416) );
    VMW_AO22 U59 ( .A(\outleft[1] ), .B(n411), .C(\comleft[1] ), .D(Enable), 
        .Z(n408) );
    VMW_AO22 U51 ( .A(ScanIn[1]), .B(n402), .C(n406), .D(n403), .Z(n415) );
    VMW_AO22 U58 ( .A(outright[0]), .B(n411), .C(\comright[0] ), .D(Enable), 
        .Z(n404) );
    VMW_INV U64 ( .A(Reset), .Z(n410) );
    VMW_AND2 U56 ( .A(ScanEnable), .B(n410), .Z(n402) );
    VMW_FD \outleft_reg[1]  ( .D(n413), .CP(Clk), .Q(\outleft[1] ) );
    VMW_INV U63 ( .A(Enable), .Z(n411) );
    VMW_FD \outright_reg[1]  ( .D(n416), .CP(Clk), .Q(outright[1]) );
endmodule


module FFT_Control_SIZE2_IDWIDTH1_SCAN1_DW01_dec_32_0 ( A, SUM );
input  [31:0] A;
output [31:0] SUM;
    wire n20, n15, n32, n29, n9, n47, n7, n12, n40, n35, n27, n49, n13, n34, 
        n41, n6, n26, n48, n21, n8, n46, n28, n33, n14, n38, n23, n16, n31, 
        n43, n44, n36, n11, n24, n18, n10, n37, n42, n5, n19, n25, n22, n39, 
        n45, n17, n30;
    VMW_INV U3 ( .A(A[0]), .Z(SUM[0]) );
    VMW_OAI21 U5 ( .A(n8), .B(n9), .C(n10), .Z(SUM[20]) );
    VMW_OAI21 U6 ( .A(n11), .B(n12), .C(n13), .Z(SUM[2]) );
    VMW_AO21 U14 ( .A(n25), .B(A[17]), .C(n14), .Z(SUM[17]) );
    VMW_AO21 U21 ( .A(n33), .B(A[29]), .C(n34), .Z(SUM[29]) );
    VMW_NOR2 U54 ( .A(n10), .B(A[21]), .Z(n41) );
    VMW_INV U73 ( .A(A[4]), .Z(n35) );
    VMW_INV U68 ( .A(A[2]), .Z(n12) );
    VMW_AO21 U28 ( .A(n36), .B(A[5]), .C(n43), .Z(SUM[5]) );
    VMW_NOR2 U33 ( .A(A[30]), .B(n49), .Z(n48) );
    VMW_OAI21 U7 ( .A(n14), .B(n15), .C(n16), .Z(SUM[18]) );
    VMW_AO21 U8 ( .A(n17), .B(A[25]), .C(n18), .Z(SUM[25]) );
    VMW_AO21 U13 ( .A(n13), .B(A[3]), .C(n24), .Z(SUM[3]) );
    VMW_NOR2 U34 ( .A(A[1]), .B(A[0]), .Z(n11) );
    VMW_NAND2 U41 ( .A(n39), .B(n46), .Z(n30) );
    VMW_NOR2 U46 ( .A(n7), .B(A[13]), .Z(n22) );
    VMW_NAND2 U61 ( .A(n47), .B(n45), .Z(n33) );
    VMW_INV U66 ( .A(A[12]), .Z(n6) );
    VMW_OAI21 U26 ( .A(n41), .B(n42), .C(n28), .Z(SUM[22]) );
    VMW_NOR2 U48 ( .A(n19), .B(A[15]), .Z(n20) );
    VMW_AO21 U9 ( .A(n19), .B(A[15]), .C(n20), .Z(SUM[15]) );
    VMW_AO21 U12 ( .A(A[0]), .B(A[1]), .C(n11), .Z(SUM[1]) );
    VMW_NAND2 U35 ( .A(n11), .B(n12), .Z(n13) );
    VMW_NAND2 U53 ( .A(n9), .B(n8), .Z(n10) );
    VMW_INV U74 ( .A(A[16]), .Z(n37) );
    VMW_AO21 U27 ( .A(n10), .B(A[21]), .C(n41), .Z(SUM[21]) );
    VMW_NOR2 U40 ( .A(A[7]), .B(n38), .Z(n39) );
    VMW_NOR2 U52 ( .A(n16), .B(A[19]), .Z(n8) );
    VMW_INV U67 ( .A(A[20]), .Z(n9) );
    VMW_INV U75 ( .A(A[10]), .Z(n40) );
    VMW_OAI21 U20 ( .A(n29), .B(n32), .C(n17), .Z(SUM[24]) );
    VMW_NAND2 U49 ( .A(n37), .B(n20), .Z(n25) );
    VMW_INV U69 ( .A(A[18]), .Z(n15) );
    VMW_OAI21 U29 ( .A(n43), .B(n44), .C(n38), .Z(SUM[6]) );
    VMW_NAND2 U47 ( .A(n23), .B(n22), .Z(n19) );
    VMW_NAND2 U55 ( .A(n42), .B(n41), .Z(n28) );
    VMW_INV U72 ( .A(A[24]), .Z(n32) );
    VMW_NOR2 U60 ( .A(n27), .B(A[27]), .Z(n45) );
    VMW_OAI21 U15 ( .A(n18), .B(n26), .C(n27), .Z(SUM[26]) );
    VMW_AO21 U17 ( .A(n28), .B(A[23]), .C(n29), .Z(SUM[23]) );
    VMW_OAI21 U22 ( .A(n24), .B(n35), .C(n36), .Z(SUM[4]) );
    VMW_OAI21 U32 ( .A(n45), .B(n47), .C(n33), .Z(SUM[28]) );
    VMW_NAND2 U39 ( .A(n43), .B(n44), .Z(n38) );
    VMW_NAND2 U57 ( .A(n32), .B(n29), .Z(n17) );
    VMW_INV U70 ( .A(A[14]), .Z(n23) );
    VMW_AO21 U30 ( .A(n27), .B(A[27]), .C(n45), .Z(SUM[27]) );
    VMW_INV U79 ( .A(A[28]), .Z(n47) );
    VMW_AO21 U10 ( .A(n21), .B(A[11]), .C(n5), .Z(SUM[11]) );
    VMW_NOR2 U42 ( .A(n30), .B(A[9]), .Z(n31) );
    VMW_NAND2 U45 ( .A(n6), .B(n5), .Z(n7) );
    VMW_OR2 U62 ( .A(n33), .B(A[29]), .Z(n49) );
    VMW_INV U65 ( .A(n49), .Z(n34) );
    VMW_OAI21 U11 ( .A(n22), .B(n23), .C(n19), .Z(SUM[14]) );
    VMW_AO21 U19 ( .A(n30), .B(A[9]), .C(n31), .Z(SUM[9]) );
    VMW_OAI21 U25 ( .A(n31), .B(n40), .C(n21), .Z(SUM[10]) );
    VMW_NAND2 U37 ( .A(n24), .B(n35), .Z(n36) );
    VMW_NAND2 U59 ( .A(n26), .B(n18), .Z(n27) );
    VMW_NOR2 U50 ( .A(n25), .B(A[17]), .Z(n14) );
    VMW_INV U77 ( .A(A[6]), .Z(n44) );
    VMW_NOR2 U58 ( .A(n17), .B(A[25]), .Z(n18) );
    VMW_NOR2 U36 ( .A(n13), .B(A[3]), .Z(n24) );
    VMW_OAI21 U4 ( .A(n5), .B(n6), .C(n7), .Z(SUM[12]) );
    VMW_AO21 U18 ( .A(n7), .B(A[13]), .C(n22), .Z(SUM[13]) );
    VMW_NAND2 U43 ( .A(n40), .B(n31), .Z(n21) );
    VMW_MUX2I U64 ( .A(n49), .B(n34), .S(A[30]), .Z(SUM[30]) );
    VMW_NAND2 U51 ( .A(n15), .B(n14), .Z(n16) );
    VMW_INV U76 ( .A(A[22]), .Z(n42) );
    VMW_OAI21 U23 ( .A(n20), .B(n37), .C(n25), .Z(SUM[16]) );
    VMW_AO21 U24 ( .A(n38), .B(A[7]), .C(n39), .Z(SUM[7]) );
    VMW_NOR2 U38 ( .A(n36), .B(A[5]), .Z(n43) );
    VMW_NOR2 U44 ( .A(n21), .B(A[11]), .Z(n5) );
    VMW_NOR2 U56 ( .A(n28), .B(A[23]), .Z(n29) );
    VMW_INV U71 ( .A(A[26]), .Z(n26) );
    VMW_XOR2 U63 ( .A(A[31]), .B(n48), .Z(SUM[31]) );
    VMW_AO21 U16 ( .A(n16), .B(A[19]), .C(n8), .Z(SUM[19]) );
    VMW_OAI21 U31 ( .A(n39), .B(n46), .C(n30), .Z(SUM[8]) );
    VMW_INV U78 ( .A(A[8]), .Z(n46) );
endmodule


module FFT_Control_SIZE2_IDWIDTH1_SCAN1 ( Clk, Reset, RD, WR, Addr, DataIn, 
    DataOut, ScanIn, ScanOut, ScanEnable, ScanId, Id, Enable );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [0:0] Id;
input  [1:0] ScanIn;
output [1:0] ScanOut;
input  [0:0] ScanId;
input  Clk, Reset, RD, WR;
output ScanEnable, Enable;
    wire \count241[28] , n330, n317, \count[17] , \count[24] , \count[2] , 
        \DataIn[0] , n362, \count241[12] , \count241[21] , n345, n370, n339, 
        \count[20] , \count[13] , \count[6] , n357, \count241[16] , 
        \count241[25] , n295, n305, n322, n292, \count[29] , \count[30] , n325, 
        \count241[14] , \count241[27] , \count[18] , n302, n350, \n239[1] , 
        n289, \count[11] , \count[4] , \count[22] , n319, n365, \count241[10] , 
        \count241[23] , n342, \count[9] , n359, \count[15] , \count[0] , 
        \count[26] , \count241[19] , n310, n337, \count241[1] , n351, n318, 
        n293, n324, n303, \count241[8] , n364, n336, n311, \count241[5] , n358, 
        n343, \count241[7] , n363, n344, n316, n294, n331, n323, n304, 
        \ScanReg[0] , n356, \count241[3] , n338, n333, n314, n361, n346, 
        \ScanReg[1] , \count241[2] , n328, n354, n368, \count241[6] , n296, 
        n321, n306, n291, n301, \count241[4] , n326, n353, n348, \count241[0] , 
        n366, n308, n298, n341, \count241[9] , n334, n313, \count241[11] , 
        \count241[22] , \count[8] , n352, \count[14] , \count[1] , n349, 
        \count[27] , n290, \count241[18] , \count241[15] , \count241[26] , 
        n335, n327, n300, n312, \count[19] , n340, n367, \DataIn[1] , 
        \count[5] , \count[10] , \count[23] , n299, n309, n360, n347, 
        \count[7] , \count[12] , n329, \count[21] , \count241[17] , 
        \count241[24] , n332, \count[28] , n315, \count[31] , n369, 
        \count241[29] , n320, \count241[30] , n297, n307, \count[3] , 
        \count[16] , \count[25] , n355, \count241[20] , \count241[13] ;
    tri \DataOut[27]1 , \DataOut[14]1 , \DataOut[26]1 , \DataOut[15]1 , 
        \DataOut[31] , \DataOut[18]1 , \DataOut[0]1 , \DataOut[19]1 , 
        \DataOut[1]1 , \DataOut[23]1 , \DataOut[22]1 , \DataOut[11]1 , 
        \DataOut[10]1 , \DataOut[9]1 , \DataOut[8]1 , \DataOut[5]1 , 
        \DataOut[4]1 , \DataOut[21]1 , \DataOut[20]1 , \DataOut[13]1 , 
        \DataOut[12]1 , \DataOut[7]1 , \DataOut[6]1 , \DataOut[25]1 , 
        \DataOut[16]1 , \DataOut[24]1 , \DataOut[17]1 , \DataOut[29]1 , 
        \DataOut[30]1 , \DataOut[2]1 , \DataOut[28]1 , \DataOut[3]1 ;
    assign \DataIn[1]  = DataIn[1];
    assign \DataIn[0]  = DataIn[0];
    assign DataOut[31] = \DataOut[31] ;
    assign DataOut[30] = \DataOut[30]1 ;
    assign DataOut[29] = \DataOut[29]1 ;
    assign DataOut[28] = \DataOut[28]1 ;
    assign DataOut[27] = \DataOut[27]1 ;
    assign DataOut[26] = \DataOut[26]1 ;
    assign DataOut[25] = \DataOut[25]1 ;
    assign DataOut[24] = \DataOut[24]1 ;
    assign DataOut[23] = \DataOut[23]1 ;
    assign DataOut[22] = \DataOut[22]1 ;
    assign DataOut[21] = \DataOut[21]1 ;
    assign DataOut[20] = \DataOut[20]1 ;
    assign DataOut[19] = \DataOut[19]1 ;
    assign DataOut[18] = \DataOut[18]1 ;
    assign DataOut[17] = \DataOut[17]1 ;
    assign DataOut[16] = \DataOut[16]1 ;
    assign DataOut[15] = \DataOut[15]1 ;
    assign DataOut[14] = \DataOut[14]1 ;
    assign DataOut[13] = \DataOut[13]1 ;
    assign DataOut[12] = \DataOut[12]1 ;
    assign DataOut[11] = \DataOut[11]1 ;
    assign DataOut[10] = \DataOut[10]1 ;
    assign DataOut[9] = \DataOut[9]1 ;
    assign DataOut[8] = \DataOut[8]1 ;
    assign DataOut[7] = \DataOut[7]1 ;
    assign DataOut[6] = \DataOut[6]1 ;
    assign DataOut[5] = \DataOut[5]1 ;
    assign DataOut[4] = \DataOut[4]1 ;
    assign DataOut[3] = \DataOut[3]1 ;
    assign DataOut[2] = \DataOut[2]1 ;
    assign DataOut[1] = \DataOut[1]1 ;
    assign DataOut[0] = \DataOut[0]1 ;
    assign ScanOut[1] = \DataIn[1] ;
    assign ScanOut[0] = \DataIn[0] ;
    VMW_AO22 U54 ( .A(DataIn[8]), .B(n295), .C(\count241[8] ), .D(n296), .Z(
        n362) );
    VMW_AO22 U73 ( .A(DataIn[27]), .B(n295), .C(\count241[27] ), .D(n296), .Z(
        n343) );
    VMW_XNOR2 U113 ( .A(Addr[0]), .B(ScanId), .Z(n301) );
    VMW_BUFIZ U134 ( .A(n312), .E(n311), .Z(\DataOut[4]1 ) );
    VMW_AO22 U68 ( .A(DataIn[22]), .B(n295), .C(\count241[22] ), .D(n296), .Z(
        n348) );
    VMW_AND2 U96 ( .A(n297), .B(\count[31] ), .Z(n319) );
    VMW_AND2 U108 ( .A(n297), .B(\count[23] ), .Z(n306) );
    VMW_BUFIZ U141 ( .A(n319), .E(n311), .Z(\DataOut[31] ) );
    VMW_FD \count_reg[6]  ( .D(n364), .CP(Clk), .Q(\count[6] ) );
    VMW_AO22 U46 ( .A(\DataIn[0] ), .B(n295), .C(\count241[0] ), .D(n296), .Z(
        n370) );
    VMW_AO22 U61 ( .A(DataIn[15]), .B(n295), .C(\count241[15] ), .D(n296), .Z(
        n355) );
    VMW_AND2 U84 ( .A(n297), .B(\count[5] ), .Z(n331) );
    VMW_BUFIZ U148 ( .A(n326), .E(n311), .Z(\DataOut[20]1 ) );
    VMW_BUFIZ U153 ( .A(n331), .E(n311), .Z(\DataOut[5]1 ) );
    VMW_FD \count_reg[2]  ( .D(n368), .CP(Clk), .Q(\count[2] ) );
    VMW_FD \ScanReg_reg[1]  ( .D(ScanIn[1]), .CP(Clk), .Q(\ScanReg[1] ) );
    VMW_AND2 U101 ( .A(n297), .B(\count[14] ), .Z(n314) );
    VMW_INV U126 ( .A(n289), .Z(Enable) );
    VMW_AO22 U48 ( .A(DataIn[2]), .B(n295), .C(\count241[2] ), .D(n296), .Z(
        n368) );
    VMW_AO22 U66 ( .A(DataIn[20]), .B(n295), .C(\count241[20] ), .D(n296), .Z(
        n350) );
    VMW_AND2 U106 ( .A(n297), .B(\count[10] ), .Z(n308) );
    VMW_NOR4 U121 ( .A(\count[12] ), .B(\count[13] ), .C(\count[14] ), .D(
        \count[15] ), .Z(n293) );
    VMW_AND2 U83 ( .A(n297), .B(\count[26] ), .Z(n332) );
    VMW_FD \count_reg[0]  ( .D(n370), .CP(Clk), .Q(\count[0] ) );
    VMW_AND2 U98 ( .A(n297), .B(\count[12] ), .Z(n317) );
    VMW_INV U128 ( .A(n300), .Z(ScanEnable) );
    VMW_BUFIZ U154 ( .A(n332), .E(n311), .Z(\DataOut[26]1 ) );
    VMW_FD \count_reg[9]  ( .D(n361), .CP(Clk), .Q(\count[9] ) );
    VMW_FD \count_reg[4]  ( .D(n366), .CP(Clk), .Q(\count[4] ) );
    FFT_Control_SIZE2_IDWIDTH1_SCAN1_DW01_dec_32_0 sub_183 ( .A({\count[31] , 
        \count[30] , \count[29] , \count[28] , \count[27] , \count[26] , 
        \count[25] , \count[24] , \count[23] , \count[22] , \count[21] , 
        \count[20] , \count[19] , \count[18] , \count[17] , \count[16] , 
        \count[15] , \count[14] , \count[13] , \count[12] , \count[11] , 
        \count[10] , \count[9] , \count[8] , \count[7] , \count[6] , 
        \count[5] , \count[4] , \count[3] , \count[2] , \count[1] , \count[0] 
        }), .SUM({\n239[1] , \count241[30] , \count241[29] , \count241[28] , 
        \count241[27] , \count241[26] , \count241[25] , \count241[24] , 
        \count241[23] , \count241[22] , \count241[21] , \count241[20] , 
        \count241[19] , \count241[18] , \count241[17] , \count241[16] , 
        \count241[15] , \count241[14] , \count241[13] , \count241[12] , 
        \count241[11] , \count241[10] , \count241[9] , \count241[8] , 
        \count241[7] , \count241[6] , \count241[5] , \count241[4] , 
        \count241[3] , \count241[2] , \count241[1] , \count241[0] }) );
    VMW_AO22 U53 ( .A(DataIn[7]), .B(n295), .C(\count241[7] ), .D(n296), .Z(
        n363) );
    VMW_AND2 U91 ( .A(n297), .B(\count[30] ), .Z(n324) );
    VMW_BUFIZ U146 ( .A(n324), .E(n311), .Z(\DataOut[30]1 ) );
    VMW_AO22 U74 ( .A(DataIn[28]), .B(n295), .C(\count241[28] ), .D(n296), .Z(
        n342) );
    VMW_AO22 U114 ( .A(\ScanReg[1] ), .B(n298), .C(\count[1] ), .D(n297), .Z(
        n337) );
    VMW_BUFIZ U133 ( .A(n310), .E(n311), .Z(\DataOut[9]1 ) );
    VMW_AND2 U99 ( .A(n297), .B(\count[16] ), .Z(n316) );
    VMW_BUFIZ U155 ( .A(n333), .E(n311), .Z(\DataOut[15]1 ) );
    VMW_FD \count_reg[22]  ( .D(n348), .CP(Clk), .Q(\count[22] ) );
    VMW_FD \count_reg[11]  ( .D(n359), .CP(Clk), .Q(\count[11] ) );
    VMW_AO22 U47 ( .A(\DataIn[1] ), .B(n295), .C(\count241[1] ), .D(n296), .Z(
        n369) );
    VMW_AO22 U49 ( .A(DataIn[3]), .B(n295), .C(\count241[3] ), .D(n296), .Z(
        n367) );
    VMW_AO22 U52 ( .A(DataIn[6]), .B(n295), .C(\count241[6] ), .D(n296), .Z(
        n364) );
    VMW_AO22 U67 ( .A(DataIn[21]), .B(n295), .C(\count241[21] ), .D(n296), .Z(
        n349) );
    VMW_AND2 U82 ( .A(n297), .B(\count[15] ), .Z(n333) );
    VMW_FD \count_reg[18]  ( .D(n352), .CP(Clk), .Q(\count[18] ) );
    VMW_AND2 U107 ( .A(n297), .B(\count[19] ), .Z(n307) );
    VMW_AND4 U120 ( .A(n305), .B(n304), .C(n303), .D(n302), .Z(n294) );
    VMW_AO22 U75 ( .A(DataIn[29]), .B(n295), .C(\count241[29] ), .D(n296), .Z(
        n341) );
    VMW_AO22 U115 ( .A(\ScanReg[0] ), .B(n298), .C(\count[0] ), .D(n297), .Z(
        n309) );
    VMW_BUFIZ U132 ( .A(n309), .E(n311), .Z(\DataOut[0]1 ) );
    VMW_FD \count_reg[15]  ( .D(n355), .CP(Clk), .Q(\count[15] ) );
    VMW_FD \count_reg[26]  ( .D(n344), .CP(Clk), .Q(\count[26] ) );
    VMW_AND2 U90 ( .A(n297), .B(\count[29] ), .Z(n325) );
    VMW_BUFIZ U129 ( .A(n306), .E(n311), .Z(\DataOut[23]1 ) );
    VMW_BUFIZ U147 ( .A(n325), .E(n311), .Z(\DataOut[29]1 ) );
    VMW_BUFIZ U160 ( .A(n338), .E(n311), .Z(\DataOut[8]1 ) );
    VMW_AO22 U55 ( .A(DataIn[9]), .B(n295), .C(\count241[9] ), .D(n296), .Z(
        n361) );
    VMW_AO22 U69 ( .A(DataIn[23]), .B(n295), .C(\count241[23] ), .D(n296), .Z(
        n347) );
    VMW_XNOR2 U109 ( .A(Addr[0]), .B(Id), .Z(n297) );
    VMW_AO22 U72 ( .A(DataIn[26]), .B(n295), .C(\count241[26] ), .D(n296), .Z(
        n344) );
    VMW_AND2 U97 ( .A(n297), .B(\count[6] ), .Z(n318) );
    VMW_BUFIZ U140 ( .A(n318), .E(n311), .Z(\DataOut[6]1 ) );
    VMW_FD \count_reg[17]  ( .D(n353), .CP(Clk), .Q(\count[17] ) );
    VMW_OAI21 U112 ( .A(RD), .B(WR), .C(n301), .Z(n300) );
    VMW_FD \count_reg[24]  ( .D(n346), .CP(Clk), .Q(\count[24] ) );
    VMW_BUFIZ U135 ( .A(n313), .E(n311), .Z(\DataOut[27]1 ) );
    VMW_AO22 U60 ( .A(DataIn[14]), .B(n295), .C(\count241[14] ), .D(n296), .Z(
        n356) );
    VMW_AND2 U100 ( .A(n297), .B(\count[25] ), .Z(n315) );
    VMW_INV U127 ( .A(WR), .Z(n299) );
    VMW_AND2 U85 ( .A(n297), .B(\count[7] ), .Z(n330) );
    VMW_BUFIZ U149 ( .A(n327), .E(n311), .Z(\DataOut[3]1 ) );
    VMW_FD \count_reg[30]  ( .D(n340), .CP(Clk), .Q(\count[30] ) );
    VMW_FD \count_reg[29]  ( .D(n341), .CP(Clk), .Q(\count[29] ) );
    VMW_BUFIZ U152 ( .A(n330), .E(n311), .Z(\DataOut[7]1 ) );
    VMW_FD \count_reg[20]  ( .D(n350), .CP(Clk), .Q(\count[20] ) );
    VMW_FD \count_reg[13]  ( .D(n357), .CP(Clk), .Q(\count[13] ) );
    VMW_AND5 U45 ( .A(n290), .B(n291), .C(n292), .D(n293), .E(n294), .Z(n289)
         );
    VMW_AO22 U57 ( .A(DataIn[11]), .B(n295), .C(\count241[11] ), .D(n296), .Z(
        n359) );
    VMW_BUFIZ U137 ( .A(n315), .E(n311), .Z(\DataOut[25]1 ) );
    VMW_AO22 U70 ( .A(DataIn[24]), .B(n295), .C(\count241[24] ), .D(n296), .Z(
        n346) );
    VMW_AND2 U79 ( .A(n297), .B(\count[11] ), .Z(n336) );
    VMW_AND2 U95 ( .A(n297), .B(\count[21] ), .Z(n320) );
    VMW_AOI211 U110 ( .A(n297), .B(WR), .C(n289), .D(Reset), .Z(n296) );
    VMW_BUFIZ U159 ( .A(n337), .E(n311), .Z(\DataOut[1]1 ) );
    VMW_NOR4 U119 ( .A(\count[16] ), .B(\count[17] ), .C(\count[18] ), .D(
        \count[19] ), .Z(n305) );
    VMW_BUFIZ U142 ( .A(n320), .E(n311), .Z(\DataOut[21]1 ) );
    VMW_FD \count_reg[31]  ( .D(n339), .CP(Clk), .Q(\count[31] ) );
    VMW_FD \count_reg[28]  ( .D(n342), .CP(Clk), .Q(\count[28] ) );
    VMW_FD \count_reg[21]  ( .D(n349), .CP(Clk), .Q(\count[21] ) );
    VMW_FD \count_reg[12]  ( .D(n358), .CP(Clk), .Q(\count[12] ) );
    VMW_AND2 U87 ( .A(n297), .B(\count[24] ), .Z(n328) );
    VMW_BUFIZ U150 ( .A(n328), .E(n311), .Z(\DataOut[24]1 ) );
    VMW_INV U125 ( .A(n297), .Z(n298) );
    VMW_AO22 U50 ( .A(DataIn[4]), .B(n295), .C(\count241[4] ), .D(n296), .Z(
        n366) );
    VMW_AO22 U59 ( .A(DataIn[13]), .B(n295), .C(\count241[13] ), .D(n296), .Z(
        n357) );
    VMW_AO22 U62 ( .A(DataIn[16]), .B(n295), .C(\count241[16] ), .D(n296), .Z(
        n354) );
    VMW_AO22 U65 ( .A(DataIn[19]), .B(n295), .C(\count241[19] ), .D(n296), .Z(
        n351) );
    VMW_AND2 U102 ( .A(n297), .B(\count[27] ), .Z(n313) );
    VMW_FD \count_reg[25]  ( .D(n345), .CP(Clk), .Q(\count[25] ) );
    VMW_FD \count_reg[16]  ( .D(n354), .CP(Clk), .Q(\count[16] ) );
    VMW_AO21 U105 ( .A(RD), .B(ScanEnable), .C(n297), .Z(n311) );
    VMW_AND2 U80 ( .A(n297), .B(\count[22] ), .Z(n335) );
    VMW_NOR4 U122 ( .A(\count[8] ), .B(\count[9] ), .C(\count[10] ), .D(
        \count[11] ), .Z(n292) );
    VMW_FD \count_reg[14]  ( .D(n356), .CP(Clk), .Q(\count[14] ) );
    VMW_FD \count_reg[27]  ( .D(n343), .CP(Clk), .Q(\count[27] ) );
    VMW_BUFIZ U139 ( .A(n317), .E(n311), .Z(\DataOut[12]1 ) );
    VMW_BUFIZ U157 ( .A(n335), .E(n311), .Z(\DataOut[22]1 ) );
    VMW_AO22 U77 ( .A(DataIn[31]), .B(n295), .C(\n239[1] ), .D(n296), .Z(n339)
         );
    VMW_AND2 U89 ( .A(n297), .B(\count[20] ), .Z(n326) );
    VMW_AND2 U92 ( .A(n297), .B(\count[13] ), .Z(n323) );
    VMW_BUFIZ U145 ( .A(n323), .E(n311), .Z(\DataOut[13]1 ) );
    VMW_FD \count_reg[23]  ( .D(n347), .CP(Clk), .Q(\count[23] ) );
    VMW_FD \count_reg[10]  ( .D(n360), .CP(Clk), .Q(\count[10] ) );
    VMW_NOR4 U117 ( .A(\count[24] ), .B(\count[25] ), .C(\count[26] ), .D(
        \count[27] ), .Z(n303) );
    VMW_FD \count_reg[19]  ( .D(n351), .CP(Clk), .Q(\count[19] ) );
    VMW_AO22 U51 ( .A(DataIn[5]), .B(n295), .C(\count241[5] ), .D(n296), .Z(
        n365) );
    VMW_AO22 U58 ( .A(DataIn[12]), .B(n295), .C(\count241[12] ), .D(n296), .Z(
        n358) );
    VMW_BUFIZ U130 ( .A(n307), .E(n311), .Z(\DataOut[19]1 ) );
    VMW_BUFIZ U138 ( .A(n316), .E(n311), .Z(\DataOut[16]1 ) );
    VMW_FD \count_reg[5]  ( .D(n365), .CP(Clk), .Q(\count[5] ) );
    VMW_AO22 U64 ( .A(DataIn[18]), .B(n295), .C(\count241[18] ), .D(n296), .Z(
        n352) );
    VMW_AND2 U81 ( .A(n297), .B(\count[18] ), .Z(n334) );
    VMW_BUFIZ U156 ( .A(n334), .E(n311), .Z(\DataOut[18]1 ) );
    VMW_AND2 U104 ( .A(n297), .B(\count[9] ), .Z(n310) );
    VMW_AO22 U76 ( .A(DataIn[30]), .B(n295), .C(\count241[30] ), .D(n296), .Z(
        n340) );
    VMW_NOR4 U116 ( .A(\count[28] ), .B(\count[29] ), .C(\count[30] ), .D(
        \count[31] ), .Z(n302) );
    VMW_NOR4 U123 ( .A(\count[4] ), .B(\count[5] ), .C(\count[6] ), .D(
        \count[7] ), .Z(n291) );
    VMW_AO22 U56 ( .A(DataIn[10]), .B(n295), .C(\count241[10] ), .D(n296), .Z(
        n360) );
    VMW_AND2 U88 ( .A(n297), .B(\count[3] ), .Z(n327) );
    VMW_AND2 U93 ( .A(n297), .B(\count[2] ), .Z(n322) );
    VMW_BUFIZ U131 ( .A(n308), .E(n311), .Z(\DataOut[10]1 ) );
    VMW_FD \count_reg[1]  ( .D(n369), .CP(Clk), .Q(\count[1] ) );
    VMW_AND2 U94 ( .A(n297), .B(\count[28] ), .Z(n321) );
    VMW_BUFIZ U143 ( .A(n321), .E(n311), .Z(\DataOut[28]1 ) );
    VMW_BUFIZ U144 ( .A(n322), .E(n311), .Z(\DataOut[2]1 ) );
    VMW_FD \count_reg[8]  ( .D(n362), .CP(Clk), .Q(\count[8] ) );
    VMW_BUFIZ U158 ( .A(n336), .E(n311), .Z(\DataOut[11]1 ) );
    VMW_FD \count_reg[3]  ( .D(n367), .CP(Clk), .Q(\count[3] ) );
    VMW_BUFIZ U136 ( .A(n314), .E(n311), .Z(\DataOut[14]1 ) );
    VMW_FD \ScanReg_reg[0]  ( .D(ScanIn[0]), .CP(Clk), .Q(\ScanReg[0] ) );
    VMW_AO22 U63 ( .A(DataIn[17]), .B(n295), .C(\count241[17] ), .D(n296), .Z(
        n353) );
    VMW_AO22 U71 ( .A(DataIn[25]), .B(n295), .C(\count241[25] ), .D(n296), .Z(
        n345) );
    VMW_NOR3 U111 ( .A(n298), .B(Reset), .C(n299), .Z(n295) );
    VMW_NOR4 U124 ( .A(\count[0] ), .B(\count[1] ), .C(\count[2] ), .D(
        \count[3] ), .Z(n290) );
    VMW_AND2 U78 ( .A(n297), .B(\count[8] ), .Z(n338) );
    VMW_AND2 U86 ( .A(n297), .B(\count[17] ), .Z(n329) );
    VMW_AND2 U103 ( .A(n297), .B(\count[4] ), .Z(n312) );
    VMW_NOR4 U118 ( .A(\count[20] ), .B(\count[21] ), .C(\count[22] ), .D(
        \count[23] ), .Z(n304) );
    VMW_BUFIZ U151 ( .A(n329), .E(n311), .Z(\DataOut[17]1 ) );
    VMW_FD \count_reg[7]  ( .D(n363), .CP(Clk), .Q(\count[7] ) );
endmodule


module main ( Clk, Reset, RD, WR, Addr, DataIn, DataOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  Clk, Reset, RD, WR;
    wire \nRightOut_4[1] , \ScanEnable[0] , \nRightOut_1[1] , \ScanLink2[0] , 
        \nRightOut_2[2] , \nLeftOut_0[1] , \ScanLink1[1] , \nRightOut_2[0] , 
        \nLeftOut_3[0] , \nLeftOut_3[2] , \nLeftOut_5[1] , \ScanLink4[1] , 
        \ScanLink0[1] , \nLeftOut_1[1] , \nRightOut_3[0] , \nLeftOut_2[2] , 
        \nLeftOut_4[1] , \nRightOut_5[1] , \nRightOut_0[1] , \nRightOut_3[2] , 
        \ScanLink3[0] , \nLeftOut_2[0] , \nRightOut_0[0] , \nLeftOut_1[2] , 
        \nLeftOut_2[1] , \ScanLink3[1] , \nLeftOut_4[2] , \nRightOut_5[0] , 
        \nLeftOut_4[0] , \nRightOut_5[2] , \nRightOut_0[2] , \nLeftOut_1[0] , 
        \nRightOut_3[1] , \ScanLink0[0] , \ScanLink4[0] , \nRightOut_4[2] , 
        \nLeftOut_5[0] , \nLeftOut_0[0] , \ScanLink1[0] , \nRightOut_1[2] , 
        \nRightOut_2[1] , \nEnable[0] , \nLeftOut_0[2] , \nLeftOut_3[1] , 
        \nRightOut_1[0] , \ScanLink2[1] , \nRightOut_4[0] , \nLeftOut_5[2] ;
    FFT_Node_SIZE2_IDWIDTH1_s0_SCAN1 node_4 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        1'b0, 1'b0}), .ScanEnable(1'b0), .Idl(1'b0), .Idr(1'b0), .Ids(1'b0), 
        .Enable(\nEnable[0] ), .inleft({\nLeftOut_2[2] , \nLeftOut_2[1] , 
        \nLeftOut_2[0] }), .inright({\nLeftOut_3[2] , \nLeftOut_3[1] , 
        \nLeftOut_3[0] }), .outleft({\nLeftOut_4[2] , \nLeftOut_4[1] , 
        \nLeftOut_4[0] }), .outright({\nRightOut_4[2] , \nRightOut_4[1] , 
        \nRightOut_4[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s5_SCAN1 node_0 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        \ScanLink0[1] , \ScanLink0[0] }), .ScanOut({\ScanLink1[1] , 
        \ScanLink1[0] }), .ScanEnable(\ScanEnable[0] ), .Idl(1'b0), .Idr(1'b0), 
        .Ids(1'b0), .Enable(\nEnable[0] ), .inleft({\nLeftOut_0[2] , 
        \nLeftOut_0[1] , \nLeftOut_0[0] }), .inright({\nRightOut_0[2] , 
        \nRightOut_0[1] , \nRightOut_0[0] }), .outleft({\nLeftOut_0[2] , 
        \nLeftOut_0[1] , \nLeftOut_0[0] }), .outright({\nRightOut_0[2] , 
        \nRightOut_0[1] , \nRightOut_0[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s0_SCAN1 node_2 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        1'b0, 1'b0}), .ScanEnable(1'b0), .Idl(1'b0), .Idr(1'b0), .Ids(1'b0), 
        .Enable(\nEnable[0] ), .inleft({\nLeftOut_0[2] , \nLeftOut_0[1] , 
        \nLeftOut_0[0] }), .inright({\nRightOut_0[2] , \nRightOut_0[1] , 
        \nRightOut_0[0] }), .outleft({\nLeftOut_2[2] , \nLeftOut_2[1] , 
        \nLeftOut_2[0] }), .outright({\nRightOut_2[2] , \nRightOut_2[1] , 
        \nRightOut_2[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s0_SCAN1 node_3 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        1'b0, 1'b0}), .ScanEnable(1'b0), .Idl(1'b0), .Idr(1'b0), .Ids(1'b0), 
        .Enable(\nEnable[0] ), .inleft({\nLeftOut_1[2] , \nLeftOut_1[1] , 
        \nLeftOut_1[0] }), .inright({\nRightOut_1[2] , \nRightOut_1[1] , 
        \nRightOut_1[0] }), .outleft({\nLeftOut_3[2] , \nLeftOut_3[1] , 
        \nLeftOut_3[0] }), .outright({\nRightOut_3[2] , \nRightOut_3[1] , 
        \nRightOut_3[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s1_SCAN1 node_5 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        1'b0, 1'b0}), .ScanEnable(1'b0), .Idl(1'b0), .Idr(1'b0), .Ids(1'b0), 
        .Enable(\nEnable[0] ), .inleft({\nRightOut_2[2] , \nRightOut_2[1] , 
        \nRightOut_2[0] }), .inright({\nRightOut_3[2] , \nRightOut_3[1] , 
        \nRightOut_3[0] }), .outleft({\nLeftOut_5[2] , \nLeftOut_5[1] , 
        \nLeftOut_5[0] }), .outright({\nRightOut_5[2] , \nRightOut_5[1] , 
        \nRightOut_5[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s5_SCAN1 node_7 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        \ScanLink3[1] , \ScanLink3[0] }), .ScanOut({\ScanLink4[1] , 
        \ScanLink4[0] }), .ScanEnable(\ScanEnable[0] ), .Idl(1'b0), .Idr(1'b0), 
        .Ids(1'b0), .Enable(\nEnable[0] ), .inleft({\nRightOut_4[2] , 
        \nRightOut_4[1] , \nRightOut_4[0] }), .inright({\nRightOut_5[2] , 
        \nRightOut_5[1] , \nRightOut_5[0] }) );
    FFT_Control_SIZE2_IDWIDTH1_SCAN1 node_Control ( .Clk(Clk), .Reset(Reset), 
        .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), 
        .ScanIn({\ScanLink4[1] , \ScanLink4[0] }), .ScanOut({\ScanLink0[1] , 
        \ScanLink0[0] }), .ScanEnable(\ScanEnable[0] ), .ScanId(1'b1), .Id(
        1'b0), .Enable(\nEnable[0] ) );
    FFT_Node_SIZE2_IDWIDTH1_s5_SCAN1 node_1 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        \ScanLink1[1] , \ScanLink1[0] }), .ScanOut({\ScanLink2[1] , 
        \ScanLink2[0] }), .ScanEnable(\ScanEnable[0] ), .Idl(1'b0), .Idr(1'b0), 
        .Ids(1'b0), .Enable(\nEnable[0] ), .inleft({\nLeftOut_1[2] , 
        \nLeftOut_1[1] , \nLeftOut_1[0] }), .inright({\nRightOut_1[2] , 
        \nRightOut_1[1] , \nRightOut_1[0] }), .outleft({\nLeftOut_1[2] , 
        \nLeftOut_1[1] , \nLeftOut_1[0] }), .outright({\nRightOut_1[2] , 
        \nRightOut_1[1] , \nRightOut_1[0] }) );
    FFT_Node_SIZE2_IDWIDTH1_s5_SCAN1 node_6 ( .Clk(Clk), .Reset(Reset), .RD(RD
        ), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .ScanIn({
        \ScanLink2[1] , \ScanLink2[0] }), .ScanOut({\ScanLink3[1] , 
        \ScanLink3[0] }), .ScanEnable(\ScanEnable[0] ), .Idl(1'b0), .Idr(1'b0), 
        .Ids(1'b0), .Enable(\nEnable[0] ), .inleft({\nLeftOut_4[2] , 
        \nLeftOut_4[1] , \nLeftOut_4[0] }), .inright({\nLeftOut_5[2] , 
        \nLeftOut_5[1] , \nLeftOut_5[0] }) );
endmodule

