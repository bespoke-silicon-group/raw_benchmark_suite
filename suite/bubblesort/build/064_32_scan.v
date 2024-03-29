`include "main_header.v"
wire [31:0] wRegInA0;
wire [31:0] wRegInB0;
wire [31:0] wAIn0;
wire [31:0] wBIn0;
wire [31:0] wRegInA1;
wire [31:0] wRegInB1;
wire [31:0] wAIn1;
wire [31:0] wBIn1;
wire [31:0] wRegInA2;
wire [31:0] wRegInB2;
wire [31:0] wAIn2;
wire [31:0] wBIn2;
wire [31:0] wRegInA3;
wire [31:0] wRegInB3;
wire [31:0] wAIn3;
wire [31:0] wBIn3;
wire [31:0] wRegInA4;
wire [31:0] wRegInB4;
wire [31:0] wAIn4;
wire [31:0] wBIn4;
wire [31:0] wRegInA5;
wire [31:0] wRegInB5;
wire [31:0] wAIn5;
wire [31:0] wBIn5;
wire [31:0] wRegInA6;
wire [31:0] wRegInB6;
wire [31:0] wAIn6;
wire [31:0] wBIn6;
wire [31:0] wRegInA7;
wire [31:0] wRegInB7;
wire [31:0] wAIn7;
wire [31:0] wBIn7;
wire [31:0] wRegInA8;
wire [31:0] wRegInB8;
wire [31:0] wAIn8;
wire [31:0] wBIn8;
wire [31:0] wRegInA9;
wire [31:0] wRegInB9;
wire [31:0] wAIn9;
wire [31:0] wBIn9;
wire [31:0] wRegInA10;
wire [31:0] wRegInB10;
wire [31:0] wAIn10;
wire [31:0] wBIn10;
wire [31:0] wRegInA11;
wire [31:0] wRegInB11;
wire [31:0] wAIn11;
wire [31:0] wBIn11;
wire [31:0] wRegInA12;
wire [31:0] wRegInB12;
wire [31:0] wAIn12;
wire [31:0] wBIn12;
wire [31:0] wRegInA13;
wire [31:0] wRegInB13;
wire [31:0] wAIn13;
wire [31:0] wBIn13;
wire [31:0] wRegInA14;
wire [31:0] wRegInB14;
wire [31:0] wAIn14;
wire [31:0] wBIn14;
wire [31:0] wRegInA15;
wire [31:0] wRegInB15;
wire [31:0] wAIn15;
wire [31:0] wBIn15;
wire [31:0] wRegInA16;
wire [31:0] wRegInB16;
wire [31:0] wAIn16;
wire [31:0] wBIn16;
wire [31:0] wRegInA17;
wire [31:0] wRegInB17;
wire [31:0] wAIn17;
wire [31:0] wBIn17;
wire [31:0] wRegInA18;
wire [31:0] wRegInB18;
wire [31:0] wAIn18;
wire [31:0] wBIn18;
wire [31:0] wRegInA19;
wire [31:0] wRegInB19;
wire [31:0] wAIn19;
wire [31:0] wBIn19;
wire [31:0] wRegInA20;
wire [31:0] wRegInB20;
wire [31:0] wAIn20;
wire [31:0] wBIn20;
wire [31:0] wRegInA21;
wire [31:0] wRegInB21;
wire [31:0] wAIn21;
wire [31:0] wBIn21;
wire [31:0] wRegInA22;
wire [31:0] wRegInB22;
wire [31:0] wAIn22;
wire [31:0] wBIn22;
wire [31:0] wRegInA23;
wire [31:0] wRegInB23;
wire [31:0] wAIn23;
wire [31:0] wBIn23;
wire [31:0] wRegInA24;
wire [31:0] wRegInB24;
wire [31:0] wAIn24;
wire [31:0] wBIn24;
wire [31:0] wRegInA25;
wire [31:0] wRegInB25;
wire [31:0] wAIn25;
wire [31:0] wBIn25;
wire [31:0] wRegInA26;
wire [31:0] wRegInB26;
wire [31:0] wAIn26;
wire [31:0] wBIn26;
wire [31:0] wRegInA27;
wire [31:0] wRegInB27;
wire [31:0] wAIn27;
wire [31:0] wBIn27;
wire [31:0] wRegInA28;
wire [31:0] wRegInB28;
wire [31:0] wAIn28;
wire [31:0] wBIn28;
wire [31:0] wRegInA29;
wire [31:0] wRegInB29;
wire [31:0] wAIn29;
wire [31:0] wBIn29;
wire [31:0] wRegInA30;
wire [31:0] wRegInB30;
wire [31:0] wAIn30;
wire [31:0] wBIn30;
wire [31:0] wRegInA31;
wire [31:0] wRegInB31;
wire [31:0] wAIn31;
wire [31:0] wBIn31;
wire [31:0] wAMid0;
wire [31:0] wBMid0;
wire [31:0] wAMid1;
wire [31:0] wBMid1;
wire [31:0] wAMid2;
wire [31:0] wBMid2;
wire [31:0] wAMid3;
wire [31:0] wBMid3;
wire [31:0] wAMid4;
wire [31:0] wBMid4;
wire [31:0] wAMid5;
wire [31:0] wBMid5;
wire [31:0] wAMid6;
wire [31:0] wBMid6;
wire [31:0] wAMid7;
wire [31:0] wBMid7;
wire [31:0] wAMid8;
wire [31:0] wBMid8;
wire [31:0] wAMid9;
wire [31:0] wBMid9;
wire [31:0] wAMid10;
wire [31:0] wBMid10;
wire [31:0] wAMid11;
wire [31:0] wBMid11;
wire [31:0] wAMid12;
wire [31:0] wBMid12;
wire [31:0] wAMid13;
wire [31:0] wBMid13;
wire [31:0] wAMid14;
wire [31:0] wBMid14;
wire [31:0] wAMid15;
wire [31:0] wBMid15;
wire [31:0] wAMid16;
wire [31:0] wBMid16;
wire [31:0] wAMid17;
wire [31:0] wBMid17;
wire [31:0] wAMid18;
wire [31:0] wBMid18;
wire [31:0] wAMid19;
wire [31:0] wBMid19;
wire [31:0] wAMid20;
wire [31:0] wBMid20;
wire [31:0] wAMid21;
wire [31:0] wBMid21;
wire [31:0] wAMid22;
wire [31:0] wBMid22;
wire [31:0] wAMid23;
wire [31:0] wBMid23;
wire [31:0] wAMid24;
wire [31:0] wBMid24;
wire [31:0] wAMid25;
wire [31:0] wBMid25;
wire [31:0] wAMid26;
wire [31:0] wBMid26;
wire [31:0] wAMid27;
wire [31:0] wBMid27;
wire [31:0] wAMid28;
wire [31:0] wBMid28;
wire [31:0] wAMid29;
wire [31:0] wBMid29;
wire [31:0] wAMid30;
wire [31:0] wBMid30;
wire [0:0] wEnable;
wire [0:0] ScanEnable;
wire [31:0] ScanLink0;
wire [31:0] ScanLink1;
wire [31:0] ScanLink2;
wire [31:0] ScanLink3;
wire [31:0] ScanLink4;
wire [31:0] ScanLink5;
wire [31:0] ScanLink6;
wire [31:0] ScanLink7;
wire [31:0] ScanLink8;
wire [31:0] ScanLink9;
wire [31:0] ScanLink10;
wire [31:0] ScanLink11;
wire [31:0] ScanLink12;
wire [31:0] ScanLink13;
wire [31:0] ScanLink14;
wire [31:0] ScanLink15;
wire [31:0] ScanLink16;
wire [31:0] ScanLink17;
wire [31:0] ScanLink18;
wire [31:0] ScanLink19;
wire [31:0] ScanLink20;
wire [31:0] ScanLink21;
wire [31:0] ScanLink22;
wire [31:0] ScanLink23;
wire [31:0] ScanLink24;
wire [31:0] ScanLink25;
wire [31:0] ScanLink26;
wire [31:0] ScanLink27;
wire [31:0] ScanLink28;
wire [31:0] ScanLink29;
wire [31:0] ScanLink30;
wire [31:0] ScanLink31;
wire [31:0] ScanLink32;
wire [31:0] ScanLink33;
wire [31:0] ScanLink34;
wire [31:0] ScanLink35;
wire [31:0] ScanLink36;
wire [31:0] ScanLink37;
wire [31:0] ScanLink38;
wire [31:0] ScanLink39;
wire [31:0] ScanLink40;
wire [31:0] ScanLink41;
wire [31:0] ScanLink42;
wire [31:0] ScanLink43;
wire [31:0] ScanLink44;
wire [31:0] ScanLink45;
wire [31:0] ScanLink46;
wire [31:0] ScanLink47;
wire [31:0] ScanLink48;
wire [31:0] ScanLink49;
wire [31:0] ScanLink50;
wire [31:0] ScanLink51;
wire [31:0] ScanLink52;
wire [31:0] ScanLink53;
wire [31:0] ScanLink54;
wire [31:0] ScanLink55;
wire [31:0] ScanLink56;
wire [31:0] ScanLink57;
wire [31:0] ScanLink58;
wire [31:0] ScanLink59;
wire [31:0] ScanLink60;
wire [31:0] ScanLink61;
wire [31:0] ScanLink62;
wire [31:0] ScanLink63;
wire [31:0] ScanLink64;
BubbleSort_Node #( 32 ) BSN1_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn0), .BIn(wBIn0), .HiOut(wRegInA0), .LoOut(wAMid0) );
BubbleSort_Node #( 32 ) BSN1_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn1), .BIn(wBIn1), .HiOut(wBMid0), .LoOut(wAMid1) );
BubbleSort_Node #( 32 ) BSN1_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn2), .BIn(wBIn2), .HiOut(wBMid1), .LoOut(wAMid2) );
BubbleSort_Node #( 32 ) BSN1_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn3), .BIn(wBIn3), .HiOut(wBMid2), .LoOut(wAMid3) );
BubbleSort_Node #( 32 ) BSN1_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn4), .BIn(wBIn4), .HiOut(wBMid3), .LoOut(wAMid4) );
BubbleSort_Node #( 32 ) BSN1_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn5), .BIn(wBIn5), .HiOut(wBMid4), .LoOut(wAMid5) );
BubbleSort_Node #( 32 ) BSN1_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn6), .BIn(wBIn6), .HiOut(wBMid5), .LoOut(wAMid6) );
BubbleSort_Node #( 32 ) BSN1_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn7), .BIn(wBIn7), .HiOut(wBMid6), .LoOut(wAMid7) );
BubbleSort_Node #( 32 ) BSN1_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn8), .BIn(wBIn8), .HiOut(wBMid7), .LoOut(wAMid8) );
BubbleSort_Node #( 32 ) BSN1_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn9), .BIn(wBIn9), .HiOut(wBMid8), .LoOut(wAMid9) );
BubbleSort_Node #( 32 ) BSN1_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn10), .BIn(wBIn10), .HiOut(wBMid9), .LoOut(wAMid10) );
BubbleSort_Node #( 32 ) BSN1_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn11), .BIn(wBIn11), .HiOut(wBMid10), .LoOut(wAMid11) );
BubbleSort_Node #( 32 ) BSN1_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn12), .BIn(wBIn12), .HiOut(wBMid11), .LoOut(wAMid12) );
BubbleSort_Node #( 32 ) BSN1_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn13), .BIn(wBIn13), .HiOut(wBMid12), .LoOut(wAMid13) );
BubbleSort_Node #( 32 ) BSN1_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn14), .BIn(wBIn14), .HiOut(wBMid13), .LoOut(wAMid14) );
BubbleSort_Node #( 32 ) BSN1_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn15), .BIn(wBIn15), .HiOut(wBMid14), .LoOut(wAMid15) );
BubbleSort_Node #( 32 ) BSN1_16 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn16), .BIn(wBIn16), .HiOut(wBMid15), .LoOut(wAMid16) );
BubbleSort_Node #( 32 ) BSN1_17 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn17), .BIn(wBIn17), .HiOut(wBMid16), .LoOut(wAMid17) );
BubbleSort_Node #( 32 ) BSN1_18 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn18), .BIn(wBIn18), .HiOut(wBMid17), .LoOut(wAMid18) );
BubbleSort_Node #( 32 ) BSN1_19 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn19), .BIn(wBIn19), .HiOut(wBMid18), .LoOut(wAMid19) );
BubbleSort_Node #( 32 ) BSN1_20 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn20), .BIn(wBIn20), .HiOut(wBMid19), .LoOut(wAMid20) );
BubbleSort_Node #( 32 ) BSN1_21 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn21), .BIn(wBIn21), .HiOut(wBMid20), .LoOut(wAMid21) );
BubbleSort_Node #( 32 ) BSN1_22 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn22), .BIn(wBIn22), .HiOut(wBMid21), .LoOut(wAMid22) );
BubbleSort_Node #( 32 ) BSN1_23 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn23), .BIn(wBIn23), .HiOut(wBMid22), .LoOut(wAMid23) );
BubbleSort_Node #( 32 ) BSN1_24 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn24), .BIn(wBIn24), .HiOut(wBMid23), .LoOut(wAMid24) );
BubbleSort_Node #( 32 ) BSN1_25 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn25), .BIn(wBIn25), .HiOut(wBMid24), .LoOut(wAMid25) );
BubbleSort_Node #( 32 ) BSN1_26 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn26), .BIn(wBIn26), .HiOut(wBMid25), .LoOut(wAMid26) );
BubbleSort_Node #( 32 ) BSN1_27 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn27), .BIn(wBIn27), .HiOut(wBMid26), .LoOut(wAMid27) );
BubbleSort_Node #( 32 ) BSN1_28 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn28), .BIn(wBIn28), .HiOut(wBMid27), .LoOut(wAMid28) );
BubbleSort_Node #( 32 ) BSN1_29 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn29), .BIn(wBIn29), .HiOut(wBMid28), .LoOut(wAMid29) );
BubbleSort_Node #( 32 ) BSN1_30 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn30), .BIn(wBIn30), .HiOut(wBMid29), .LoOut(wAMid30) );
BubbleSort_Node #( 32 ) BSN1_31 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAIn31), .BIn(wBIn31), .HiOut(wBMid30), .LoOut(wRegInB31) );
BubbleSort_Node #( 32 ) BSN2_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid0), .BIn(wBMid0), .HiOut(wRegInB0), .LoOut(wRegInA1) );
BubbleSort_Node #( 32 ) BSN2_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid1), .BIn(wBMid1), .HiOut(wRegInB1), .LoOut(wRegInA2) );
BubbleSort_Node #( 32 ) BSN2_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid2), .BIn(wBMid2), .HiOut(wRegInB2), .LoOut(wRegInA3) );
BubbleSort_Node #( 32 ) BSN2_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid3), .BIn(wBMid3), .HiOut(wRegInB3), .LoOut(wRegInA4) );
BubbleSort_Node #( 32 ) BSN2_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid4), .BIn(wBMid4), .HiOut(wRegInB4), .LoOut(wRegInA5) );
BubbleSort_Node #( 32 ) BSN2_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid5), .BIn(wBMid5), .HiOut(wRegInB5), .LoOut(wRegInA6) );
BubbleSort_Node #( 32 ) BSN2_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid6), .BIn(wBMid6), .HiOut(wRegInB6), .LoOut(wRegInA7) );
BubbleSort_Node #( 32 ) BSN2_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid7), .BIn(wBMid7), .HiOut(wRegInB7), .LoOut(wRegInA8) );
BubbleSort_Node #( 32 ) BSN2_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid8), .BIn(wBMid8), .HiOut(wRegInB8), .LoOut(wRegInA9) );
BubbleSort_Node #( 32 ) BSN2_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid9), .BIn(wBMid9), .HiOut(wRegInB9), .LoOut(wRegInA10) );
BubbleSort_Node #( 32 ) BSN2_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid10), .BIn(wBMid10), .HiOut(wRegInB10), .LoOut(wRegInA11) );
BubbleSort_Node #( 32 ) BSN2_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid11), .BIn(wBMid11), .HiOut(wRegInB11), .LoOut(wRegInA12) );
BubbleSort_Node #( 32 ) BSN2_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid12), .BIn(wBMid12), .HiOut(wRegInB12), .LoOut(wRegInA13) );
BubbleSort_Node #( 32 ) BSN2_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid13), .BIn(wBMid13), .HiOut(wRegInB13), .LoOut(wRegInA14) );
BubbleSort_Node #( 32 ) BSN2_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid14), .BIn(wBMid14), .HiOut(wRegInB14), .LoOut(wRegInA15) );
BubbleSort_Node #( 32 ) BSN2_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid15), .BIn(wBMid15), .HiOut(wRegInB15), .LoOut(wRegInA16) );
BubbleSort_Node #( 32 ) BSN2_16 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid16), .BIn(wBMid16), .HiOut(wRegInB16), .LoOut(wRegInA17) );
BubbleSort_Node #( 32 ) BSN2_17 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid17), .BIn(wBMid17), .HiOut(wRegInB17), .LoOut(wRegInA18) );
BubbleSort_Node #( 32 ) BSN2_18 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid18), .BIn(wBMid18), .HiOut(wRegInB18), .LoOut(wRegInA19) );
BubbleSort_Node #( 32 ) BSN2_19 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid19), .BIn(wBMid19), .HiOut(wRegInB19), .LoOut(wRegInA20) );
BubbleSort_Node #( 32 ) BSN2_20 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid20), .BIn(wBMid20), .HiOut(wRegInB20), .LoOut(wRegInA21) );
BubbleSort_Node #( 32 ) BSN2_21 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid21), .BIn(wBMid21), .HiOut(wRegInB21), .LoOut(wRegInA22) );
BubbleSort_Node #( 32 ) BSN2_22 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid22), .BIn(wBMid22), .HiOut(wRegInB22), .LoOut(wRegInA23) );
BubbleSort_Node #( 32 ) BSN2_23 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid23), .BIn(wBMid23), .HiOut(wRegInB23), .LoOut(wRegInA24) );
BubbleSort_Node #( 32 ) BSN2_24 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid24), .BIn(wBMid24), .HiOut(wRegInB24), .LoOut(wRegInA25) );
BubbleSort_Node #( 32 ) BSN2_25 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid25), .BIn(wBMid25), .HiOut(wRegInB25), .LoOut(wRegInA26) );
BubbleSort_Node #( 32 ) BSN2_26 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid26), .BIn(wBMid26), .HiOut(wRegInB26), .LoOut(wRegInA27) );
BubbleSort_Node #( 32 ) BSN2_27 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid27), .BIn(wBMid27), .HiOut(wRegInB27), .LoOut(wRegInA28) );
BubbleSort_Node #( 32 ) BSN2_28 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid28), .BIn(wBMid28), .HiOut(wRegInB28), .LoOut(wRegInA29) );
BubbleSort_Node #( 32 ) BSN2_29 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid29), .BIn(wBMid29), .HiOut(wRegInB29), .LoOut(wRegInA30) );
BubbleSort_Node #( 32 ) BSN2_30 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .AIn(wAMid30), .BIn(wBMid30), .HiOut(wRegInB30), .LoOut(wRegInA31) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_63 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA0), .Out(wAIn0), .ScanIn(ScanLink64), .ScanOut(ScanLink63), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_62 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB0), .Out(wBIn0), .ScanIn(ScanLink63), .ScanOut(ScanLink62), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_61 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA1), .Out(wAIn1), .ScanIn(ScanLink62), .ScanOut(ScanLink61), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_60 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB1), .Out(wBIn1), .ScanIn(ScanLink61), .ScanOut(ScanLink60), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_59 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA2), .Out(wAIn2), .ScanIn(ScanLink60), .ScanOut(ScanLink59), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_58 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB2), .Out(wBIn2), .ScanIn(ScanLink59), .ScanOut(ScanLink58), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_57 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA3), .Out(wAIn3), .ScanIn(ScanLink58), .ScanOut(ScanLink57), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_56 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB3), .Out(wBIn3), .ScanIn(ScanLink57), .ScanOut(ScanLink56), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_55 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA4), .Out(wAIn4), .ScanIn(ScanLink56), .ScanOut(ScanLink55), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_54 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB4), .Out(wBIn4), .ScanIn(ScanLink55), .ScanOut(ScanLink54), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_53 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA5), .Out(wAIn5), .ScanIn(ScanLink54), .ScanOut(ScanLink53), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_52 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB5), .Out(wBIn5), .ScanIn(ScanLink53), .ScanOut(ScanLink52), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_51 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA6), .Out(wAIn6), .ScanIn(ScanLink52), .ScanOut(ScanLink51), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_50 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB6), .Out(wBIn6), .ScanIn(ScanLink51), .ScanOut(ScanLink50), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_49 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA7), .Out(wAIn7), .ScanIn(ScanLink50), .ScanOut(ScanLink49), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_48 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB7), .Out(wBIn7), .ScanIn(ScanLink49), .ScanOut(ScanLink48), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_47 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA8), .Out(wAIn8), .ScanIn(ScanLink48), .ScanOut(ScanLink47), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_46 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB8), .Out(wBIn8), .ScanIn(ScanLink47), .ScanOut(ScanLink46), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_45 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA9), .Out(wAIn9), .ScanIn(ScanLink46), .ScanOut(ScanLink45), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_44 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB9), .Out(wBIn9), .ScanIn(ScanLink45), .ScanOut(ScanLink44), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_43 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA10), .Out(wAIn10), .ScanIn(ScanLink44), .ScanOut(ScanLink43), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_42 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB10), .Out(wBIn10), .ScanIn(ScanLink43), .ScanOut(ScanLink42), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_41 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA11), .Out(wAIn11), .ScanIn(ScanLink42), .ScanOut(ScanLink41), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_40 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB11), .Out(wBIn11), .ScanIn(ScanLink41), .ScanOut(ScanLink40), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_39 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA12), .Out(wAIn12), .ScanIn(ScanLink40), .ScanOut(ScanLink39), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_38 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB12), .Out(wBIn12), .ScanIn(ScanLink39), .ScanOut(ScanLink38), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_37 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA13), .Out(wAIn13), .ScanIn(ScanLink38), .ScanOut(ScanLink37), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_36 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB13), .Out(wBIn13), .ScanIn(ScanLink37), .ScanOut(ScanLink36), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_35 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA14), .Out(wAIn14), .ScanIn(ScanLink36), .ScanOut(ScanLink35), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_34 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB14), .Out(wBIn14), .ScanIn(ScanLink35), .ScanOut(ScanLink34), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_33 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA15), .Out(wAIn15), .ScanIn(ScanLink34), .ScanOut(ScanLink33), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_32 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB15), .Out(wBIn15), .ScanIn(ScanLink33), .ScanOut(ScanLink32), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_31 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA16), .Out(wAIn16), .ScanIn(ScanLink32), .ScanOut(ScanLink31), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_30 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB16), .Out(wBIn16), .ScanIn(ScanLink31), .ScanOut(ScanLink30), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_29 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA17), .Out(wAIn17), .ScanIn(ScanLink30), .ScanOut(ScanLink29), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_28 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB17), .Out(wBIn17), .ScanIn(ScanLink29), .ScanOut(ScanLink28), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_27 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA18), .Out(wAIn18), .ScanIn(ScanLink28), .ScanOut(ScanLink27), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_26 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB18), .Out(wBIn18), .ScanIn(ScanLink27), .ScanOut(ScanLink26), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_25 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA19), .Out(wAIn19), .ScanIn(ScanLink26), .ScanOut(ScanLink25), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_24 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB19), .Out(wBIn19), .ScanIn(ScanLink25), .ScanOut(ScanLink24), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_23 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA20), .Out(wAIn20), .ScanIn(ScanLink24), .ScanOut(ScanLink23), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_22 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB20), .Out(wBIn20), .ScanIn(ScanLink23), .ScanOut(ScanLink22), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_21 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA21), .Out(wAIn21), .ScanIn(ScanLink22), .ScanOut(ScanLink21), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_20 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB21), .Out(wBIn21), .ScanIn(ScanLink21), .ScanOut(ScanLink20), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_19 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA22), .Out(wAIn22), .ScanIn(ScanLink20), .ScanOut(ScanLink19), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_18 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB22), .Out(wBIn22), .ScanIn(ScanLink19), .ScanOut(ScanLink18), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_17 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA23), .Out(wAIn23), .ScanIn(ScanLink18), .ScanOut(ScanLink17), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_16 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB23), .Out(wBIn23), .ScanIn(ScanLink17), .ScanOut(ScanLink16), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_15 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA24), .Out(wAIn24), .ScanIn(ScanLink16), .ScanOut(ScanLink15), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_14 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB24), .Out(wBIn24), .ScanIn(ScanLink15), .ScanOut(ScanLink14), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_13 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA25), .Out(wAIn25), .ScanIn(ScanLink14), .ScanOut(ScanLink13), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_12 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB25), .Out(wBIn25), .ScanIn(ScanLink13), .ScanOut(ScanLink12), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_11 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA26), .Out(wAIn26), .ScanIn(ScanLink12), .ScanOut(ScanLink11), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_10 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB26), .Out(wBIn26), .ScanIn(ScanLink11), .ScanOut(ScanLink10), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_9 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA27), .Out(wAIn27), .ScanIn(ScanLink10), .ScanOut(ScanLink9), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_8 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB27), .Out(wBIn27), .ScanIn(ScanLink9), .ScanOut(ScanLink8), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_7 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA28), .Out(wAIn28), .ScanIn(ScanLink8), .ScanOut(ScanLink7), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_6 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB28), .Out(wBIn28), .ScanIn(ScanLink7), .ScanOut(ScanLink6), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_5 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA29), .Out(wAIn29), .ScanIn(ScanLink6), .ScanOut(ScanLink5), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_4 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB29), .Out(wBIn29), .ScanIn(ScanLink5), .ScanOut(ScanLink4), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_3 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA30), .Out(wAIn30), .ScanIn(ScanLink4), .ScanOut(ScanLink3), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_2 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB30), .Out(wBIn30), .ScanIn(ScanLink3), .ScanOut(ScanLink2), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_1 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInA31), .Out(wAIn31), .ScanIn(ScanLink2), .ScanOut(ScanLink1), .ScanEnable(ScanEnable) );
BubbleSort_Reg #( 32, 1, 1 ) U_BSR_0 ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd0), .Enable(wEnable), .In(wRegInB31), .Out(wBIn31), .ScanIn(ScanLink1), .ScanOut(ScanLink0), .ScanEnable(ScanEnable) );
BubbleSort_Control #( 6, 1, 32, 1 ) U_BSC ( .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), .DataOut(DataOut), .Id(1'd1), .Enable(wEnable), .ScanIn(ScanLink0), .ScanOut(ScanLink64), .ScanEnable(ScanEnable), .ScanId(1'd0) );
`include "main_trailer.v"
