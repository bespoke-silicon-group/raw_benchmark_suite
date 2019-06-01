
module IntMatMul_Control_pVectorSize2_pWordSize8_pScan1_DW01_cmp2_15_0 ( A, B, 
    LEQ, TC, LT_LE, GE_GT );
input  [14:0] A;
input  [14:0] B;
input  LEQ, TC;
output LT_LE, GE_GT;
    wire n15, n16, n17;
    VMW_NOR5 U3 ( .A(n15), .B(n16), .C(A[1]), .D(A[3]), .E(A[2]), .Z(LT_LE) );
    VMW_OR4 U5 ( .A(A[10]), .B(A[9]), .C(A[8]), .D(n17), .Z(n15) );
    VMW_OR4 U6 ( .A(A[5]), .B(A[4]), .C(A[7]), .D(A[6]), .Z(n16) );
    VMW_OR4 U4 ( .A(A[12]), .B(A[11]), .C(A[14]), .D(A[13]), .Z(n17) );
endmodule


module IntMatMul_Control_pVectorSize2_pWordSize8_pScan1 ( Clk, Reset, RD, WR, 
    Addr, DataIn, DataOut, vectorInput, matrixInput, cOutput );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
output [15:0] vectorInput;
input  [15:0] cOutput;
output [31:0] matrixInput;
input  Clk, Reset, RD, WR;
    wire n2556, n2516, n2531, n2578, n2544, \holder[0] , n2563, n2538, n2571, 
        Logic11, \holder[4] , n2504, n2523, n2524, n2493, n2494, n2503, 
        \holder[6] , n2554, \holder[7] , n2576, n2518, n2488, n2551, n2581, 
        \holder[2] , n2564, n2558, n2543, n2526, n2511, n2547, n2557, n2536, 
        n2519, n2489, n2577, n2550, n2510, n2525, n2492, n2502, n2537, n2559, 
        n2565, n2542, n2580, n2517, n2579, n2545, n2562, n2530, n2487, n2505, 
        n2522, n2495, n2570, n2539, n2515, n2532, n2560, n2529, n2572, n2555, 
        n2507, n164, n2569, n2497, n2520, n2527, n2490, n2500, n2575, n2552, 
        n2549, n2509, n2499, n2582, n2567, n2540, n2512, n2535, \holder[3] , 
        n2553, n2574, n2548, n2513, n2491, n2501, n2534, n2541, n2508, n2566, 
        n2584, n2583, n2498, n2528, Logic01, n2561, n2546, \holder[5] , n2506, 
        n2514, n2533, n2496, n2521, n2568, n2573, \holder[1] ;
    tri \DataOut[31] , \DataOut[27]1 , \DataOut[14]1 , \DataOut[26]1 , 
        \DataOut[15]1 , \DataOut[18]1 , \DataOut[0]1 , \DataOut[19]1 , 
        \DataOut[1]1 , \DataOut[23]1 , \DataOut[22]1 , \DataOut[11]1 , 
        \DataOut[10]1 , \DataOut[9]1 , \DataOut[8]1 , \DataOut[5]1 , 
        \DataOut[4]1 , \DataOut[21]1 , \DataOut[20]1 , \DataOut[13]1 , 
        \DataOut[12]1 , \DataOut[7]1 , \DataOut[6]1 , \DataOut[25]1 , 
        \DataOut[16]1 , \DataOut[24]1 , \DataOut[17]1 , \DataOut[29]1 , 
        \DataOut[30]1 , \DataOut[2]1 , \DataOut[28]1 , \DataOut[3]1 ;
    wire UNCONNECTED_1 ;
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
    VMW_PULLDOWN U198 ( .Z(n2507) );
    VMW_PULLDOWN U204 ( .Z(n2513) );
    VMW_AO21 U223 ( .A(\holder[1] ), .B(n2487), .C(n2489), .Z(n2582) );
    VMW_FD \matrixInput_reg[3]  ( .D(n2556), .CP(Clk), .Q(matrixInput[3]) );
    VMW_AO22 U238 ( .A(vectorInput[12]), .B(n2501), .C(vectorInput[4]), .D(
        n2496), .Z(n2571) );
    VMW_AO22 U256 ( .A(DataIn[7]), .B(n2502), .C(matrixInput[31]), .D(n2497), 
        .Z(n2528) );
    VMW_FD \matrixInput_reg[22]  ( .D(n2537), .CP(Clk), .Q(matrixInput[22]) );
    VMW_FD \matrixInput_reg[11]  ( .D(n2548), .CP(Clk), .Q(matrixInput[11]) );
    VMW_FD \vectorInput_reg[5]  ( .D(n2570), .CP(Clk), .Q(vectorInput[5]) );
    VMW_AO22 U271 ( .A(matrixInput[26]), .B(n2502), .C(matrixInput[18]), .D(
        n2497), .Z(n2541) );
    VMW_INV U294 ( .A(WR), .Z(n2503) );
    VMW_BUFIZ U304 ( .A(n2511), .E(RD), .Z(\DataOut[16]1 ) );
    VMW_FD \matrixInput_reg[18]  ( .D(n2541), .CP(Clk), .Q(matrixInput[18]) );
    VMW_BUFIZ U323 ( .A(n2525), .E(RD), .Z(\DataOut[18]1 ) );
    VMW_FD \vectorInput_reg[1]  ( .D(n2574), .CP(Clk), .Q(vectorInput[1]) );
    VMW_PULLDOWN U196 ( .Z(n2505) );
    VMW_PULLDOWN U211 ( .Z(n2520) );
    VMW_PULLDOWN U216 ( .Z(n2525) );
    VMW_NOR2 U231 ( .A(n2487), .B(Addr[0]), .Z(n2498) );
    VMW_AO22 U244 ( .A(DataIn[5]), .B(n2501), .C(vectorInput[13]), .D(n2496), 
        .Z(n2562) );
    VMW_AO22 U286 ( .A(cOutput[10]), .B(n2499), .C(cOutput[2]), .D(n2498), .Z(
        n2490) );
    VMW_BUFIZ U316 ( .A(n2521), .E(RD), .Z(\DataOut[24]1 ) );
    VMW_FD \matrixInput_reg[26]  ( .D(n2533), .CP(Clk), .Q(matrixInput[26]) );
    VMW_FD \matrixInput_reg[15]  ( .D(n2544), .CP(Clk), .Q(matrixInput[15]) );
    VMW_AO22 U263 ( .A(DataIn[1]), .B(n2502), .C(matrixInput[25]), .D(n2497), 
        .Z(n2534) );
    VMW_AO22 U278 ( .A(matrixInput[19]), .B(n2502), .C(matrixInput[11]), .D(
        n2497), .Z(n2548) );
    VMW_FD \matrixInput_reg[7]  ( .D(n2552), .CP(Clk), .Q(matrixInput[7]) );
    VMW_FD \vectorInput_reg[8]  ( .D(n2567), .CP(Clk), .Q(vectorInput[8]) );
    VMW_AO22 U236 ( .A(vectorInput[14]), .B(n2501), .C(vectorInput[6]), .D(
        n2496), .Z(n2569) );
    VMW_AO22 U243 ( .A(DataIn[6]), .B(n2501), .C(vectorInput[14]), .D(n2496), 
        .Z(n2561) );
    VMW_AO22 U258 ( .A(matrixInput[10]), .B(n2502), .C(matrixInput[2]), .D(
        n2497), .Z(n2557) );
    VMW_AO22 U264 ( .A(DataIn[0]), .B(n2502), .C(matrixInput[24]), .D(n2497), 
        .Z(n2535) );
    VMW_FD \matrixInput_reg[5]  ( .D(n2554), .CP(Clk), .Q(matrixInput[5]) );
    VMW_FD \vectorInput_reg[3]  ( .D(n2572), .CP(Clk), .Q(vectorInput[3]) );
    VMW_PULLDOWN U197 ( .Z(n2506) );
    VMW_PULLDOWN U203 ( .Z(n2512) );
    VMW_PULLDOWN U218 ( .Z(n2527) );
    VMW_AO22 U281 ( .A(cOutput[15]), .B(n2499), .C(cOutput[7]), .D(n2498), .Z(
        n2495) );
    VMW_BUFIZ U311 ( .A(n2516), .E(RD), .Z(\DataOut[13]1 ) );
    VMW_FD \matrixInput_reg[17]  ( .D(n2542), .CP(Clk), .Q(matrixInput[17]) );
    VMW_INV U293 ( .A(Addr[0]), .Z(n2500) );
    VMW_BUFIZ U324 ( .A(n2526), .E(RD), .Z(\DataOut[11]1 ) );
    VMW_FD \matrixInput_reg[24]  ( .D(n2535), .CP(Clk), .Q(matrixInput[24]) );
    VMW_FD \matrixInput_reg[8]  ( .D(n2551), .CP(Clk), .Q(matrixInput[8]) );
    IntMatMul_Control_pVectorSize2_pWordSize8_pScan1_DW01_cmp2_15_0 lt_130 ( 
        .A({Addr[14], Addr[13], Addr[12], Addr[11], Addr[10], Addr[9], Addr[8], 
        Addr[7], Addr[6], Addr[5], Addr[4], Addr[3], Addr[2], Addr[1], 
        UNCONNECTED_1}), .B({Logic01, Logic01, Logic01, Logic01, Logic01, 
        Logic01, Logic01, Logic01, Logic01, Logic01, Logic01, Logic01, Logic01, 
        Logic11, Logic01}), .LEQ(n2584), .TC(n2584), .LT_LE(n164) );
    VMW_BUFIZ U303 ( .A(n2510), .E(RD), .Z(\DataOut[25]1 ) );
    VMW_AO22 U251 ( .A(matrixInput[15]), .B(n2502), .C(matrixInput[7]), .D(
        n2497), .Z(n2552) );
    VMW_AO22 U276 ( .A(matrixInput[21]), .B(n2502), .C(matrixInput[13]), .D(
        n2497), .Z(n2546) );
    VMW_FD \matrixInput_reg[30]  ( .D(n2529), .CP(Clk), .Q(matrixInput[30]) );
    VMW_FD \matrixInput_reg[29]  ( .D(n2530), .CP(Clk), .Q(matrixInput[29]) );
    VMW_FD \matrixInput_reg[20]  ( .D(n2539), .CP(Clk), .Q(matrixInput[20]) );
    VMW_FD \matrixInput_reg[13]  ( .D(n2546), .CP(Clk), .Q(matrixInput[13]) );
    VMW_FD \vectorInput_reg[7]  ( .D(n2568), .CP(Clk), .Q(vectorInput[7]) );
    VMW_AO21 U224 ( .A(\holder[2] ), .B(n2487), .C(n2490), .Z(n2581) );
    VMW_FD \matrixInput_reg[1]  ( .D(n2558), .CP(Clk), .Q(matrixInput[1]) );
    VMW_AO22 U288 ( .A(cOutput[8]), .B(n2499), .C(cOutput[0]), .D(n2498), .Z(
        n2488) );
    VMW_BUFIZ U318 ( .A(\holder[3] ), .E(RD), .Z(\DataOut[3]1 ) );
    VMW_AO22 U242 ( .A(DataIn[7]), .B(n2501), .C(vectorInput[15]), .D(n2496), 
        .Z(n2560) );
    VMW_AO22 U265 ( .A(matrixInput[31]), .B(n2502), .C(matrixInput[23]), .D(
        n2497), .Z(n2536) );
    VMW_AO22 U280 ( .A(matrixInput[8]), .B(n2502), .C(matrixInput[0]), .D(
        n2497), .Z(n2559) );
    VMW_BUFIZ U310 ( .A(\holder[2] ), .E(RD), .Z(\DataOut[2]1 ) );
    VMW_FD \vectorInput_reg[14]  ( .D(n2561), .CP(Clk), .Q(vectorInput[14]) );
    VMW_FD \holder_reg[1]  ( .D(n2582), .CP(Clk), .Q(\holder[1] ) );
    VMW_PULLDOWN U199 ( .Z(n2508) );
    VMW_PULLDOWN U202 ( .Z(n2511) );
    VMW_PULLDOWN U210 ( .Z(n2519) );
    VMW_AO22 U259 ( .A(DataIn[5]), .B(n2502), .C(matrixInput[29]), .D(n2497), 
        .Z(n2530) );
    VMW_AO22 U237 ( .A(vectorInput[13]), .B(n2501), .C(vectorInput[5]), .D(
        n2496), .Z(n2570) );
    VMW_PULLDOWN U205 ( .Z(n2514) );
    VMW_PULLDOWN U219 ( .Z(n2584) );
    VMW_AO21 U225 ( .A(\holder[3] ), .B(n2487), .C(n2491), .Z(n2580) );
    VMW_FD \vectorInput_reg[10]  ( .D(n2565), .CP(Clk), .Q(vectorInput[10]) );
    VMW_AO22 U250 ( .A(matrixInput[16]), .B(n2502), .C(matrixInput[8]), .D(
        n2497), .Z(n2551) );
    VMW_AO22 U277 ( .A(matrixInput[20]), .B(n2502), .C(matrixInput[12]), .D(
        n2497), .Z(n2547) );
    VMW_OR3 U289 ( .A(Addr[1]), .B(Addr[0]), .C(n2503), .Z(n2497) );
    VMW_BUFIZ U319 ( .A(n2523), .E(RD), .Z(\DataOut[15]1 ) );
    VMW_INV U292 ( .A(n2497), .Z(n2502) );
    VMW_BUFIZ U302 ( .A(\holder[4] ), .E(RD), .Z(\DataOut[4]1 ) );
    VMW_BUFIZ U325 ( .A(\holder[1] ), .E(RD), .Z(\DataOut[1]1 ) );
    VMW_FD \holder_reg[5]  ( .D(n2578), .CP(Clk), .Q(\holder[5] ) );
    VMW_AO21 U222 ( .A(\holder[0] ), .B(n2487), .C(n2488), .Z(n2583) );
    VMW_AO22 U239 ( .A(vectorInput[11]), .B(n2501), .C(vectorInput[3]), .D(
        n2496), .Z(n2572) );
    VMW_BUFIZ U295 ( .A(n2504), .E(RD), .Z(\DataOut[27]1 ) );
    VMW_BUFIZ U305 ( .A(n2512), .E(RD), .Z(\DataOut[31] ) );
    VMW_BUFIZ U322 ( .A(n2524), .E(RD), .Z(\DataOut[22]1 ) );
    VMW_FD \holder_reg[7]  ( .D(n2576), .CP(Clk), .Q(\holder[7] ) );
    VMW_AO22 U257 ( .A(DataIn[6]), .B(n2502), .C(matrixInput[30]), .D(n2497), 
        .Z(n2529) );
    VMW_AO22 U270 ( .A(matrixInput[27]), .B(n2502), .C(matrixInput[19]), .D(
        n2497), .Z(n2540) );
    VMW_FD \vectorInput_reg[12]  ( .D(n2563), .CP(Clk), .Q(vectorInput[12]) );
    VMW_PULLDOWN U217 ( .Z(n2526) );
    VMW_NAND4 U230 ( .A(RD), .B(n164), .C(n2496), .D(n2497), .Z(n2487) );
    VMW_AO22 U245 ( .A(DataIn[4]), .B(n2501), .C(vectorInput[12]), .D(n2496), 
        .Z(n2563) );
    VMW_AO22 U279 ( .A(matrixInput[18]), .B(n2502), .C(matrixInput[10]), .D(
        n2497), .Z(n2549) );
    VMW_FD \holder_reg[3]  ( .D(n2580), .CP(Clk), .Q(\holder[3] ) );
    VMW_AO22 U262 ( .A(DataIn[2]), .B(n2502), .C(matrixInput[26]), .D(n2497), 
        .Z(n2533) );
    VMW_PULLDOWN U195 ( .Z(n2504) );
    VMW_PULLDOWN U207 ( .Z(n2516) );
    VMW_AO22 U287 ( .A(cOutput[9]), .B(n2499), .C(cOutput[1]), .D(n2498), .Z(
        n2489) );
    VMW_BUFIZ U317 ( .A(n2522), .E(RD), .Z(\DataOut[17]1 ) );
    VMW_PULLDOWN U212 ( .Z(n2521) );
    VMW_PULLDOWN U215 ( .Z(n2524) );
    VMW_PULLUP U220 ( .Z(Logic11) );
    VMW_AO21 U229 ( .A(\holder[7] ), .B(n2487), .C(n2495), .Z(n2576) );
    VMW_AO22 U255 ( .A(matrixInput[11]), .B(n2502), .C(matrixInput[3]), .D(
        n2497), .Z(n2556) );
    VMW_AO22 U269 ( .A(matrixInput[9]), .B(n2502), .C(matrixInput[1]), .D(
        n2497), .Z(n2558) );
    VMW_FD \holder_reg[2]  ( .D(n2581), .CP(Clk), .Q(\holder[2] ) );
    VMW_AO22 U272 ( .A(matrixInput[25]), .B(n2502), .C(matrixInput[17]), .D(
        n2497), .Z(n2542) );
    VMW_AO22 U285 ( .A(cOutput[11]), .B(n2499), .C(cOutput[3]), .D(n2498), .Z(
        n2491) );
    VMW_BUFIZ U297 ( .A(n2506), .E(RD), .Z(\DataOut[19]1 ) );
    VMW_BUFIZ U320 ( .A(\holder[7] ), .E(RD), .Z(\DataOut[7]1 ) );
    VMW_BUFIZ U307 ( .A(n2514), .E(RD), .Z(\DataOut[12]1 ) );
    VMW_BUFIZ U315 ( .A(n2520), .E(RD), .Z(\DataOut[26]1 ) );
    VMW_FD \holder_reg[6]  ( .D(n2577), .CP(Clk), .Q(\holder[6] ) );
    VMW_AO22 U247 ( .A(DataIn[2]), .B(n2501), .C(vectorInput[10]), .D(n2496), 
        .Z(n2565) );
    VMW_AO22 U260 ( .A(DataIn[4]), .B(n2502), .C(matrixInput[28]), .D(n2497), 
        .Z(n2531) );
    VMW_FD \vectorInput_reg[13]  ( .D(n2562), .CP(Clk), .Q(vectorInput[13]) );
    VMW_NOR2 U232 ( .A(n2487), .B(n2500), .Z(n2499) );
    VMW_AO22 U235 ( .A(vectorInput[15]), .B(n2501), .C(vectorInput[7]), .D(
        n2496), .Z(n2568) );
    VMW_FD \vectorInput_reg[11]  ( .D(n2564), .CP(Clk), .Q(vectorInput[11]) );
    VMW_AO22 U240 ( .A(vectorInput[10]), .B(n2501), .C(vectorInput[2]), .D(
        n2496), .Z(n2573) );
    VMW_BUFIZ U299 ( .A(\holder[0] ), .E(RD), .Z(\DataOut[0]1 ) );
    VMW_BUFIZ U309 ( .A(n2515), .E(RD), .Z(\DataOut[28]1 ) );
    VMW_AO22 U267 ( .A(matrixInput[29]), .B(n2502), .C(matrixInput[21]), .D(
        n2497), .Z(n2538) );
    VMW_AO22 U282 ( .A(cOutput[14]), .B(n2499), .C(cOutput[6]), .D(n2498), .Z(
        n2494) );
    VMW_BUFIZ U312 ( .A(n2517), .E(RD), .Z(\DataOut[30]1 ) );
    VMW_PULLDOWN U200 ( .Z(n2509) );
    VMW_PULLDOWN U209 ( .Z(n2518) );
    VMW_FD \holder_reg[4]  ( .D(n2579), .CP(Clk), .Q(\holder[4] ) );
    VMW_AO21 U227 ( .A(\holder[5] ), .B(n2487), .C(n2493), .Z(n2578) );
    VMW_AO22 U249 ( .A(matrixInput[17]), .B(n2502), .C(matrixInput[9]), .D(
        n2497), .Z(n2550) );
    VMW_AO22 U252 ( .A(matrixInput[14]), .B(n2502), .C(matrixInput[6]), .D(
        n2497), .Z(n2553) );
    VMW_OR3 U290 ( .A(n2503), .B(Addr[1]), .C(n2500), .Z(n2496) );
    VMW_BUFIZ U300 ( .A(n2508), .E(RD), .Z(\DataOut[14]1 ) );
    VMW_AO22 U275 ( .A(matrixInput[22]), .B(n2502), .C(matrixInput[14]), .D(
        n2497), .Z(n2545) );
    VMW_FD \vectorInput_reg[15]  ( .D(n2560), .CP(Clk), .Q(vectorInput[15]) );
    VMW_FD \holder_reg[0]  ( .D(n2583), .CP(Clk), .Q(\holder[0] ) );
    VMW_PULLDOWN U201 ( .Z(n2510) );
    VMW_PULLDOWN U208 ( .Z(n2517) );
    VMW_AO22 U283 ( .A(cOutput[13]), .B(n2499), .C(cOutput[5]), .D(n2498), .Z(
        n2493) );
    VMW_BUFIZ U313 ( .A(n2518), .E(RD), .Z(\DataOut[29]1 ) );
    VMW_FD \matrixInput_reg[9]  ( .D(n2550), .CP(Clk), .Q(matrixInput[9]) );
    VMW_PULLDOWN U213 ( .Z(n2522) );
    VMW_AO22 U234 ( .A(DataIn[0]), .B(n2501), .C(vectorInput[8]), .D(n2496), 
        .Z(n2567) );
    VMW_AO22 U241 ( .A(vectorInput[9]), .B(n2501), .C(vectorInput[1]), .D(
        n2496), .Z(n2574) );
    VMW_FD \matrixInput_reg[31]  ( .D(n2528), .CP(Clk), .Q(matrixInput[31]) );
    VMW_FD \matrixInput_reg[28]  ( .D(n2531), .CP(Clk), .Q(matrixInput[28]) );
    VMW_AO22 U266 ( .A(matrixInput[30]), .B(n2502), .C(matrixInput[22]), .D(
        n2497), .Z(n2537) );
    VMW_FD \matrixInput_reg[21]  ( .D(n2538), .CP(Clk), .Q(matrixInput[21]) );
    VMW_FD \matrixInput_reg[12]  ( .D(n2547), .CP(Clk), .Q(matrixInput[12]) );
    VMW_FD \vectorInput_reg[6]  ( .D(n2569), .CP(Clk), .Q(vectorInput[6]) );
    VMW_FD \matrixInput_reg[0]  ( .D(n2559), .CP(Clk), .Q(matrixInput[0]) );
    VMW_AO21 U226 ( .A(\holder[4] ), .B(n2487), .C(n2492), .Z(n2579) );
    VMW_BUFIZ U298 ( .A(n2507), .E(RD), .Z(\DataOut[10]1 ) );
    VMW_BUFIZ U308 ( .A(\holder[6] ), .E(RD), .Z(\DataOut[6]1 ) );
    VMW_PULLDOWN U206 ( .Z(n2515) );
    VMW_AO22 U248 ( .A(vectorInput[8]), .B(n2501), .C(vectorInput[0]), .D(
        n2496), .Z(n2575) );
    VMW_AO22 U253 ( .A(matrixInput[13]), .B(n2502), .C(matrixInput[5]), .D(
        n2497), .Z(n2554) );
    VMW_AO22 U254 ( .A(matrixInput[12]), .B(n2502), .C(matrixInput[4]), .D(
        n2497), .Z(n2555) );
    VMW_AO22 U273 ( .A(matrixInput[24]), .B(n2502), .C(matrixInput[16]), .D(
        n2497), .Z(n2543) );
    VMW_AO22 U274 ( .A(matrixInput[23]), .B(n2502), .C(matrixInput[15]), .D(
        n2497), .Z(n2544) );
    VMW_FD \matrixInput_reg[4]  ( .D(n2555), .CP(Clk), .Q(matrixInput[4]) );
    VMW_INV U291 ( .A(n2496), .Z(n2501) );
    VMW_FD \matrixInput_reg[16]  ( .D(n2543), .CP(Clk), .Q(matrixInput[16]) );
    VMW_FD \vectorInput_reg[2]  ( .D(n2573), .CP(Clk), .Q(vectorInput[2]) );
    VMW_BUFIZ U296 ( .A(n2505), .E(RD), .Z(\DataOut[23]1 ) );
    VMW_BUFIZ U301 ( .A(n2509), .E(RD), .Z(\DataOut[9]1 ) );
    VMW_BUFIZ U306 ( .A(n2513), .E(RD), .Z(\DataOut[21]1 ) );
    VMW_BUFIZ U321 ( .A(\holder[5] ), .E(RD), .Z(\DataOut[5]1 ) );
    VMW_BUFIZ U326 ( .A(n2527), .E(RD), .Z(\DataOut[8]1 ) );
    VMW_FD \matrixInput_reg[25]  ( .D(n2534), .CP(Clk), .Q(matrixInput[25]) );
    VMW_FD \matrixInput_reg[27]  ( .D(n2532), .CP(Clk), .Q(matrixInput[27]) );
    VMW_FD \matrixInput_reg[14]  ( .D(n2545), .CP(Clk), .Q(matrixInput[14]) );
    VMW_FD \vectorInput_reg[0]  ( .D(n2575), .CP(Clk), .Q(vectorInput[0]) );
    VMW_FD \matrixInput_reg[6]  ( .D(n2553), .CP(Clk), .Q(matrixInput[6]) );
    VMW_AO22 U268 ( .A(matrixInput[28]), .B(n2502), .C(matrixInput[20]), .D(
        n2497), .Z(n2539) );
    VMW_FD \vectorInput_reg[9]  ( .D(n2566), .CP(Clk), .Q(vectorInput[9]) );
    VMW_PULLDOWN U214 ( .Z(n2523) );
    VMW_PULLDOWN U221 ( .Z(Logic01) );
    VMW_AO21 U228 ( .A(\holder[6] ), .B(n2487), .C(n2494), .Z(n2577) );
    VMW_AO22 U233 ( .A(DataIn[1]), .B(n2501), .C(vectorInput[9]), .D(n2496), 
        .Z(n2566) );
    VMW_AO22 U246 ( .A(DataIn[3]), .B(n2501), .C(vectorInput[11]), .D(n2496), 
        .Z(n2564) );
    VMW_AO22 U261 ( .A(DataIn[3]), .B(n2502), .C(matrixInput[27]), .D(n2497), 
        .Z(n2532) );
    VMW_FD \matrixInput_reg[23]  ( .D(n2536), .CP(Clk), .Q(matrixInput[23]) );
    VMW_FD \matrixInput_reg[10]  ( .D(n2549), .CP(Clk), .Q(matrixInput[10]) );
    VMW_FD \matrixInput_reg[2]  ( .D(n2557), .CP(Clk), .Q(matrixInput[2]) );
    VMW_FD \vectorInput_reg[4]  ( .D(n2571), .CP(Clk), .Q(vectorInput[4]) );
    VMW_FD \matrixInput_reg[19]  ( .D(n2540), .CP(Clk), .Q(matrixInput[19]) );
    VMW_AO22 U284 ( .A(cOutput[12]), .B(n2499), .C(cOutput[4]), .D(n2498), .Z(
        n2492) );
    VMW_BUFIZ U314 ( .A(n2519), .E(RD), .Z(\DataOut[20]1 ) );
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_14_1 ( A, B, CI, SUM, 
    CO );
input  [13:0] A;
input  [13:0] B;
output [13:0] SUM;
input  CI;
output CO;
    wire \A[4] , \A[0] , \A[2] , \A[3] , \A[5] , \A[1] ;
    assign \A[5]  = A[5];
    assign \A[4]  = A[4];
    assign \A[3]  = A[3];
    assign \A[2]  = A[2];
    assign \A[1]  = A[1];
    assign \A[0]  = A[0];
    assign SUM[5] = \A[5] ;
    assign SUM[4] = \A[4] ;
    assign SUM[3] = \A[3] ;
    assign SUM[2] = \A[2] ;
    assign SUM[1] = \A[1] ;
    assign SUM[0] = \A[0] ;
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8_DW02_mult_8_8_1 ( A, B, TC, 
    PRODUCT );
input  [7:0] A;
input  [7:0] B;
output [15:0] PRODUCT;
input  TC;
    wire n31, n32, \A2[1] , \A1[13] , \A2[5] , \SUMB[1][4] , \CARRYB[2][1] , 
        \SUMB[5][2] , \ab[2][4] , \CARRYB[3][2] , \SUMB[4][1] , \ab[3][3] , 
        \A1[2] , n33, n34, n35, \A2[3] , \ab[2][0] , \ab[6][0] , \ab[2][2] , 
        \A1[0] , \SUMB[1][6] , \ab[1][3] , \SUMB[1][2] , \ab[3][1] , 
        \CARRYB[3][0] , \SUMB[4][3] , \A1[4] , \CARRYB[2][3] , \ab[5][1] , 
        \SUMB[3][4] , lsb_0, \ab[4][2] , \ab[0][6] , \ab[0][4] , 
        \CARRYB[1][2] , \SUMB[2][3] , \CARRYB[5][0] , \SUMB[6][1] , \ab[1][5] , 
        \CARRYB[1][0] , \SUMB[2][1] , \SUMB[3][2] , \CARRYB[1][4] , \ab[4][0] , 
        \CARRYB[4][1] , \SUMB[2][5] , \ab[0][2] , \ab[1][1] , \ab[0][7] , 
        \CARRYB[1][5] , \ab[4][1] , \ab[0][3] , \SUMB[2][4] , \ab[1][0] , 
        \ab[5][2] , n36, \ab[1][6] , \ab[1][4] , \CARRYB[1][1] , \SUMB[3][3] , 
        \SUMB[3][1] , \CARRYB[4][0] , \ab[0][5] , \CARRYB[4][2] , \A2[4] , 
        \A2[2] , \A2[6] , \SUMB[1][3] , \CARRYB[1][3] , \CARRYB[5][1] , 
        \ab[1][2] , \SUMB[2][2] , \ab[0][1] , \ab[4][3] , \ab[5][0] , 
        \SUMB[4][2] , \CARRYB[3][1] , \ab[3][4] , \SUMB[5][1] , \CARRYB[6][0] , 
        \CARRYB[2][2] , \A1[5] , \ab[6][1] , \ab[2][3] , \SUMB[1][5] , \A1[1] , 
        \ab[3][0] , \CARRYB[2][4] , \ab[7][0] , \ab[2][1] , \ab[3][2] , 
        \A1[3] , \SUMB[1][1] , \CARRYB[2][0] , \ab[2][5] , \CARRYB[3][3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 , 
	UNCONNECTED_17 , UNCONNECTED_18 , UNCONNECTED_19 , UNCONNECTED_20 , 
	UNCONNECTED_21 , UNCONNECTED_22 ;
    VMW_PULLDOWN U3 ( .Z(n31) );
    VMW_PULLDOWN U5 ( .Z(n33) );
    VMW_PULLDOWN U6 ( .Z(n34) );
    VMW_PULLDOWN U14 ( .Z(\A2[1] ) );
    VMW_FADD S0_4 ( .CI(n32), .A(\ab[0][5] ), .B(\ab[1][4] ), .S(\SUMB[1][4] ), 
        .CO(\CARRYB[1][4] ) );
    VMW_FADD S2_2_2 ( .CI(\SUMB[1][3] ), .A(\ab[2][2] ), .B(\CARRYB[1][2] ), 
        .S(\SUMB[2][2] ), .CO(\CARRYB[2][2] ) );
    VMW_AND2 U21 ( .A(A[1]), .B(B[3]), .Z(\ab[1][3] ) );
    VMW_FADD S2_3_2 ( .CI(\SUMB[2][3] ), .A(\ab[3][2] ), .B(\CARRYB[2][2] ), 
        .S(\SUMB[3][2] ), .CO(\CARRYB[3][2] ) );
    VMW_FADD S2_5_1 ( .CI(\SUMB[4][2] ), .A(\ab[5][1] ), .B(\CARRYB[4][1] ), 
        .S(\SUMB[5][1] ), .CO(\CARRYB[5][1] ) );
    VMW_AND2 U28 ( .A(A[0]), .B(B[5]), .Z(\ab[0][5] ) );
    VMW_AND2 U33 ( .A(B[0]), .B(A[7]), .Z(\ab[7][0] ) );
    VMW_PULLDOWN U7 ( .Z(n35) );
    VMW_PULLDOWN U8 ( .Z(n36) );
    VMW_PULLDOWN U13 ( .Z(\A2[3] ) );
    VMW_AND2 U34 ( .A(B[1]), .B(A[6]), .Z(\ab[6][1] ) );
    VMW_AND2 U41 ( .A(A[5]), .B(B[1]), .Z(\ab[5][1] ) );
    VMW_AND2 U46 ( .A(A[4]), .B(B[0]), .Z(\ab[4][0] ) );
    VMW_FADD S2_4_1 ( .CI(\SUMB[3][2] ), .A(\ab[4][1] ), .B(\CARRYB[3][1] ), 
        .S(\SUMB[4][1] ), .CO(\CARRYB[4][1] ) );
    VMW_FADD S1_6_0 ( .CI(\SUMB[5][1] ), .A(\ab[6][0] ), .B(\CARRYB[5][0] ), 
        .S(\A1[4] ), .CO(\CARRYB[6][0] ) );
    VMW_AND2 U26 ( .A(A[2]), .B(B[1]), .Z(\ab[2][1] ) );
    VMW_AND2 U48 ( .A(A[2]), .B(B[3]), .Z(\ab[2][3] ) );
    VMW_PULLDOWN U9 ( .Z(\A2[4] ) );
    VMW_PULLDOWN U12 ( .Z(lsb_0) );
    VMW_FADD S0_3 ( .CI(n33), .A(\ab[0][4] ), .B(\ab[1][3] ), .S(\SUMB[1][3] ), 
        .CO(\CARRYB[1][3] ) );
    VMW_AND2 U35 ( .A(A[4]), .B(B[2]), .Z(\ab[4][2] ) );
    VMW_AND2 U53 ( .A(A[0]), .B(B[1]), .Z(\ab[0][1] ) );
    VMW_FADD S2_2_5 ( .CI(\SUMB[1][6] ), .A(\ab[2][5] ), .B(\CARRYB[1][5] ), 
        .S(\SUMB[2][5] ) );
    VMW_FADD S0_2 ( .CI(n34), .A(\ab[0][3] ), .B(\ab[1][2] ), .S(\SUMB[1][2] ), 
        .CO(\CARRYB[1][2] ) );
    VMW_AND2 U40 ( .A(A[4]), .B(B[1]), .Z(\ab[4][1] ) );
    VMW_AND2 U52 ( .A(A[1]), .B(B[1]), .Z(\ab[1][1] ) );
    VMW_FADD S2_2_4 ( .CI(\SUMB[1][5] ), .A(\ab[2][4] ), .B(\CARRYB[1][4] ), 
        .S(\SUMB[2][4] ), .CO(\CARRYB[2][4] ) );
    VMW_AND2 U27 ( .A(A[0]), .B(B[2]), .Z(\ab[0][2] ) );
    VMW_FADD S0_5 ( .CI(n31), .A(\ab[0][6] ), .B(\ab[1][5] ), .S(\SUMB[1][5] ), 
        .CO(\CARRYB[1][5] ) );
    VMW_AND2 U20 ( .A(A[2]), .B(B[2]), .Z(\ab[2][2] ) );
    VMW_AND2 U49 ( .A(A[3]), .B(B[3]), .Z(\ab[3][3] ) );
    VMW_FADD S2_3_4 ( .CI(\SUMB[2][5] ), .A(\ab[3][4] ), .B(\CARRYB[2][4] ), 
        .S(\SUMB[3][4] ) );
    VMW_FADD S2_3_3 ( .CI(\SUMB[2][4] ), .A(\ab[3][3] ), .B(\CARRYB[2][3] ), 
        .S(\SUMB[3][3] ), .CO(\CARRYB[3][3] ) );
    VMW_AND2 U29 ( .A(A[1]), .B(B[5]), .Z(\ab[1][5] ) );
    VMW_AND2 U47 ( .A(A[5]), .B(B[0]), .Z(\ab[5][0] ) );
    VMW_FADD S2_2_3 ( .CI(\SUMB[1][4] ), .A(\ab[2][3] ), .B(\CARRYB[1][3] ), 
        .S(\SUMB[2][3] ), .CO(\CARRYB[2][3] ) );
    VMW_FADD S1_3_0 ( .CI(\SUMB[2][1] ), .A(\ab[3][0] ), .B(\CARRYB[2][0] ), 
        .S(\A1[1] ), .CO(\CARRYB[3][0] ) );
    VMW_PULLDOWN U15 ( .Z(\A1[13] ) );
    VMW_XOR2 U17 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Z(\SUMB[1][6] ) );
    VMW_AND2 U22 ( .A(A[1]), .B(B[4]), .Z(\ab[1][4] ) );
    VMW_AND2 U32 ( .A(A[3]), .B(B[0]), .Z(\ab[3][0] ) );
    VMW_AND2 U39 ( .A(A[1]), .B(B[0]), .Z(\ab[1][0] ) );
    VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_14_1 FS ( .A({\A1[13] , 
        UNCONNECTED_1, UNCONNECTED_2, UNCONNECTED_3, UNCONNECTED_4, 
        UNCONNECTED_5, UNCONNECTED_6, UNCONNECTED_7, \A1[5] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({UNCONNECTED_8, UNCONNECTED_9, 
        UNCONNECTED_10, UNCONNECTED_11, UNCONNECTED_12, UNCONNECTED_13, 
        UNCONNECTED_14, \A2[6] , \A2[5] , \A2[4] , \A2[3] , \A2[2] , \A2[1] , 
        lsb_0}), .CI(lsb_0), .SUM({UNCONNECTED_15, UNCONNECTED_16, 
        UNCONNECTED_17, UNCONNECTED_18, UNCONNECTED_19, UNCONNECTED_20, 
        UNCONNECTED_21, UNCONNECTED_22, PRODUCT[7], PRODUCT[6], PRODUCT[5], 
        PRODUCT[4], PRODUCT[3], PRODUCT[2]}) );
    VMW_FADD S1_2_0 ( .CI(\SUMB[1][1] ), .A(\ab[2][0] ), .B(\CARRYB[1][0] ), 
        .S(\A1[0] ), .CO(\CARRYB[2][0] ) );
    VMW_FADD S2_2_1 ( .CI(\SUMB[1][2] ), .A(\ab[2][1] ), .B(\CARRYB[1][1] ), 
        .S(\SUMB[2][1] ), .CO(\CARRYB[2][1] ) );
    VMW_AND2 U30 ( .A(A[4]), .B(B[3]), .Z(\ab[4][3] ) );
    VMW_FADD S2_3_1 ( .CI(\SUMB[2][2] ), .A(\ab[3][1] ), .B(\CARRYB[2][1] ), 
        .S(\SUMB[3][1] ), .CO(\CARRYB[3][1] ) );
    VMW_FADD S2_5_2 ( .CI(\SUMB[4][3] ), .A(\ab[5][2] ), .B(\CARRYB[4][2] ), 
        .S(\SUMB[5][2] ) );
    VMW_PULLDOWN U10 ( .Z(\A2[2] ) );
    VMW_AND2 U42 ( .A(A[5]), .B(B[2]), .Z(\ab[5][2] ) );
    VMW_AND2 U45 ( .A(A[3]), .B(B[2]), .Z(\ab[3][2] ) );
    VMW_FADD S2_4_2 ( .CI(\SUMB[3][3] ), .A(\ab[4][2] ), .B(\CARRYB[3][2] ), 
        .S(\SUMB[4][2] ), .CO(\CARRYB[4][2] ) );
    VMW_PULLDOWN U11 ( .Z(\A2[6] ) );
    VMW_FADD S0_0 ( .CI(n36), .A(\ab[0][1] ), .B(\ab[1][0] ), .S(PRODUCT[1]), 
        .CO(\CARRYB[1][0] ) );
    VMW_AND2 U19 ( .A(A[0]), .B(B[3]), .Z(\ab[0][3] ) );
    VMW_AND2 U25 ( .A(A[0]), .B(B[7]), .Z(\ab[0][7] ) );
    VMW_AND2 U37 ( .A(B[5]), .B(A[2]), .Z(\ab[2][5] ) );
    VMW_AND2 U50 ( .A(B[4]), .B(A[3]), .Z(\ab[3][4] ) );
    VMW_AND2 U36 ( .A(A[1]), .B(B[2]), .Z(\ab[1][2] ) );
    VMW_PULLDOWN U4 ( .Z(n32) );
    VMW_FADD S0_1 ( .CI(n35), .A(\ab[0][2] ), .B(\ab[1][1] ), .S(\SUMB[1][1] ), 
        .CO(\CARRYB[1][1] ) );
    VMW_AND2 U18 ( .A(A[6]), .B(B[0]), .Z(\ab[6][0] ) );
    VMW_AND2 U43 ( .A(A[0]), .B(B[6]), .Z(\ab[0][6] ) );
    VMW_AND2 U51 ( .A(A[2]), .B(B[4]), .Z(\ab[2][4] ) );
    VMW_AND2 U23 ( .A(A[0]), .B(B[4]), .Z(\ab[0][4] ) );
    VMW_AND2 U24 ( .A(A[3]), .B(B[1]), .Z(\ab[3][1] ) );
    VMW_FADD S1_4_0 ( .CI(\SUMB[3][1] ), .A(\ab[4][0] ), .B(\CARRYB[3][0] ), 
        .S(\A1[2] ), .CO(\CARRYB[4][0] ) );
    VMW_FADD S2_6_1 ( .CI(\SUMB[5][2] ), .A(\ab[6][1] ), .B(\CARRYB[5][1] ), 
        .S(\SUMB[6][1] ) );
    VMW_AND2 U38 ( .A(A[0]), .B(B[0]), .Z(PRODUCT[0]) );
    VMW_FADD S4_0 ( .CI(\SUMB[6][1] ), .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .S(
        \A1[5] ) );
    VMW_AND2 U44 ( .A(B[6]), .B(A[1]), .Z(\ab[1][6] ) );
    VMW_FADD S2_4_3 ( .CI(\SUMB[3][4] ), .A(\ab[4][3] ), .B(\CARRYB[3][3] ), 
        .S(\SUMB[4][3] ) );
    VMW_FADD S1_5_0 ( .CI(\SUMB[4][1] ), .A(\ab[5][0] ), .B(\CARRYB[4][0] ), 
        .S(\A1[3] ), .CO(\CARRYB[5][0] ) );
    VMW_PULLDOWN U16 ( .Z(\A2[5] ) );
    VMW_AND2 U31 ( .A(A[2]), .B(B[0]), .Z(\ab[2][0] ) );
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_14_0 ( A, B, CI, SUM, 
    CO );
input  [13:0] A;
input  [13:0] B;
output [13:0] SUM;
input  CI;
output CO;
    wire \A[4] , \A[0] , \A[2] , \A[3] , \A[5] , \A[1] ;
    assign \A[5]  = A[5];
    assign \A[4]  = A[4];
    assign \A[3]  = A[3];
    assign \A[2]  = A[2];
    assign \A[1]  = A[1];
    assign \A[0]  = A[0];
    assign SUM[5] = \A[5] ;
    assign SUM[4] = \A[4] ;
    assign SUM[3] = \A[3] ;
    assign SUM[2] = \A[2] ;
    assign SUM[1] = \A[1] ;
    assign SUM[0] = \A[0] ;
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8_DW02_mult_8_8_0 ( A, B, TC, 
    PRODUCT );
input  [7:0] A;
input  [7:0] B;
output [15:0] PRODUCT;
input  TC;
    wire n37, n38, n40, \A2[1] , \A1[13] , \A2[5] , \SUMB[1][4] , 
        \CARRYB[2][1] , \SUMB[5][2] , \ab[2][4] , \CARRYB[3][2] , \SUMB[4][1] , 
        \ab[3][3] , \ab[2][0] , \A1[2] , n41, \A2[3] , \ab[6][0] , \ab[2][2] , 
        \A1[0] , \SUMB[1][6] , \ab[1][3] , \SUMB[1][2] , \ab[3][1] , 
        \CARRYB[3][0] , \SUMB[4][3] , \A1[4] , \CARRYB[2][3] , \ab[4][2] , 
        \ab[5][1] , \SUMB[3][4] , lsb_0, \ab[0][6] , \ab[0][4] , 
        \CARRYB[1][2] , \SUMB[2][3] , \CARRYB[5][0] , \SUMB[6][1] , \ab[1][5] , 
        \CARRYB[1][0] , \SUMB[2][1] , \SUMB[3][2] , \CARRYB[1][5] , 
        \CARRYB[1][4] , \ab[4][0] , \CARRYB[4][1] , \SUMB[2][5] , \ab[0][2] , 
        \ab[1][1] , \ab[4][1] , \ab[0][3] , \SUMB[2][4] , \ab[0][7] , 
        \ab[1][0] , \ab[5][2] , \ab[1][6] , \ab[1][4] , \CARRYB[1][1] , 
        \SUMB[3][3] , \SUMB[3][1] , \CARRYB[4][0] , \ab[0][5] , \CARRYB[4][2] , 
        \CARRYB[1][3] , \CARRYB[5][1] , \ab[1][2] , \SUMB[2][2] , \ab[0][1] , 
        \ab[4][3] , \ab[5][0] , \SUMB[4][2] , \CARRYB[3][1] , n39, n42, 
        \SUMB[1][3] , \ab[3][4] , \SUMB[5][1] , \CARRYB[6][0] , \CARRYB[2][2] , 
        \A2[2] , \A2[6] , \A1[5] , \ab[6][1] , \ab[2][3] , \SUMB[1][5] , 
        \A1[1] , \ab[3][0] , \CARRYB[2][4] , \ab[7][0] , \ab[2][1] , 
        \ab[3][2] , \A1[3] , \A2[4] , \SUMB[1][1] , \CARRYB[2][0] , \ab[2][5] , 
        \CARRYB[3][3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 , 
	UNCONNECTED_17 , UNCONNECTED_18 , UNCONNECTED_19 , UNCONNECTED_20 , 
	UNCONNECTED_21 , UNCONNECTED_22 ;
    VMW_PULLDOWN U3 ( .Z(n37) );
    VMW_PULLDOWN U5 ( .Z(n39) );
    VMW_PULLDOWN U6 ( .Z(n40) );
    VMW_PULLDOWN U14 ( .Z(\A2[1] ) );
    VMW_FADD S0_4 ( .CI(n38), .A(\ab[0][5] ), .B(\ab[1][4] ), .S(\SUMB[1][4] ), 
        .CO(\CARRYB[1][4] ) );
    VMW_FADD S2_2_2 ( .CI(\SUMB[1][3] ), .A(\ab[2][2] ), .B(\CARRYB[1][2] ), 
        .S(\SUMB[2][2] ), .CO(\CARRYB[2][2] ) );
    VMW_AND2 U21 ( .A(A[1]), .B(B[3]), .Z(\ab[1][3] ) );
    VMW_FADD S2_3_2 ( .CI(\SUMB[2][3] ), .A(\ab[3][2] ), .B(\CARRYB[2][2] ), 
        .S(\SUMB[3][2] ), .CO(\CARRYB[3][2] ) );
    VMW_FADD S2_5_1 ( .CI(\SUMB[4][2] ), .A(\ab[5][1] ), .B(\CARRYB[4][1] ), 
        .S(\SUMB[5][1] ), .CO(\CARRYB[5][1] ) );
    VMW_AND2 U28 ( .A(A[0]), .B(B[5]), .Z(\ab[0][5] ) );
    VMW_AND2 U33 ( .A(B[0]), .B(A[7]), .Z(\ab[7][0] ) );
    VMW_PULLDOWN U7 ( .Z(n41) );
    VMW_PULLDOWN U8 ( .Z(n42) );
    VMW_PULLDOWN U13 ( .Z(\A2[3] ) );
    VMW_AND2 U34 ( .A(B[1]), .B(A[6]), .Z(\ab[6][1] ) );
    VMW_AND2 U41 ( .A(A[5]), .B(B[1]), .Z(\ab[5][1] ) );
    VMW_AND2 U46 ( .A(A[4]), .B(B[0]), .Z(\ab[4][0] ) );
    VMW_FADD S2_4_1 ( .CI(\SUMB[3][2] ), .A(\ab[4][1] ), .B(\CARRYB[3][1] ), 
        .S(\SUMB[4][1] ), .CO(\CARRYB[4][1] ) );
    VMW_FADD S1_6_0 ( .CI(\SUMB[5][1] ), .A(\ab[6][0] ), .B(\CARRYB[5][0] ), 
        .S(\A1[4] ), .CO(\CARRYB[6][0] ) );
    VMW_AND2 U26 ( .A(A[2]), .B(B[1]), .Z(\ab[2][1] ) );
    VMW_AND2 U48 ( .A(A[2]), .B(B[3]), .Z(\ab[2][3] ) );
    VMW_PULLDOWN U9 ( .Z(\A2[4] ) );
    VMW_PULLDOWN U12 ( .Z(lsb_0) );
    VMW_FADD S0_3 ( .CI(n39), .A(\ab[0][4] ), .B(\ab[1][3] ), .S(\SUMB[1][3] ), 
        .CO(\CARRYB[1][3] ) );
    VMW_AND2 U35 ( .A(A[4]), .B(B[2]), .Z(\ab[4][2] ) );
    VMW_AND2 U53 ( .A(A[0]), .B(B[1]), .Z(\ab[0][1] ) );
    VMW_FADD S2_2_5 ( .CI(\SUMB[1][6] ), .A(\ab[2][5] ), .B(\CARRYB[1][5] ), 
        .S(\SUMB[2][5] ) );
    VMW_FADD S0_2 ( .CI(n40), .A(\ab[0][3] ), .B(\ab[1][2] ), .S(\SUMB[1][2] ), 
        .CO(\CARRYB[1][2] ) );
    VMW_AND2 U40 ( .A(A[4]), .B(B[1]), .Z(\ab[4][1] ) );
    VMW_AND2 U52 ( .A(A[1]), .B(B[1]), .Z(\ab[1][1] ) );
    VMW_FADD S2_2_4 ( .CI(\SUMB[1][5] ), .A(\ab[2][4] ), .B(\CARRYB[1][4] ), 
        .S(\SUMB[2][4] ), .CO(\CARRYB[2][4] ) );
    VMW_AND2 U27 ( .A(A[0]), .B(B[2]), .Z(\ab[0][2] ) );
    VMW_FADD S0_5 ( .CI(n37), .A(\ab[0][6] ), .B(\ab[1][5] ), .S(\SUMB[1][5] ), 
        .CO(\CARRYB[1][5] ) );
    VMW_AND2 U20 ( .A(A[2]), .B(B[2]), .Z(\ab[2][2] ) );
    VMW_AND2 U49 ( .A(A[3]), .B(B[3]), .Z(\ab[3][3] ) );
    VMW_FADD S2_3_4 ( .CI(\SUMB[2][5] ), .A(\ab[3][4] ), .B(\CARRYB[2][4] ), 
        .S(\SUMB[3][4] ) );
    VMW_FADD S2_3_3 ( .CI(\SUMB[2][4] ), .A(\ab[3][3] ), .B(\CARRYB[2][3] ), 
        .S(\SUMB[3][3] ), .CO(\CARRYB[3][3] ) );
    VMW_AND2 U29 ( .A(A[1]), .B(B[5]), .Z(\ab[1][5] ) );
    VMW_AND2 U47 ( .A(A[5]), .B(B[0]), .Z(\ab[5][0] ) );
    VMW_FADD S2_2_3 ( .CI(\SUMB[1][4] ), .A(\ab[2][3] ), .B(\CARRYB[1][3] ), 
        .S(\SUMB[2][3] ), .CO(\CARRYB[2][3] ) );
    VMW_FADD S1_3_0 ( .CI(\SUMB[2][1] ), .A(\ab[3][0] ), .B(\CARRYB[2][0] ), 
        .S(\A1[1] ), .CO(\CARRYB[3][0] ) );
    VMW_PULLDOWN U15 ( .Z(\A1[13] ) );
    VMW_XOR2 U17 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Z(\SUMB[1][6] ) );
    VMW_AND2 U22 ( .A(A[1]), .B(B[4]), .Z(\ab[1][4] ) );
    VMW_AND2 U32 ( .A(A[3]), .B(B[0]), .Z(\ab[3][0] ) );
    VMW_AND2 U39 ( .A(A[1]), .B(B[0]), .Z(\ab[1][0] ) );
    VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_14_0 FS ( .A({\A1[13] , 
        UNCONNECTED_1, UNCONNECTED_2, UNCONNECTED_3, UNCONNECTED_4, 
        UNCONNECTED_5, UNCONNECTED_6, UNCONNECTED_7, \A1[5] , \A1[4] , \A1[3] , 
        \A1[2] , \A1[1] , \A1[0] }), .B({UNCONNECTED_8, UNCONNECTED_9, 
        UNCONNECTED_10, UNCONNECTED_11, UNCONNECTED_12, UNCONNECTED_13, 
        UNCONNECTED_14, \A2[6] , \A2[5] , \A2[4] , \A2[3] , \A2[2] , \A2[1] , 
        lsb_0}), .CI(lsb_0), .SUM({UNCONNECTED_15, UNCONNECTED_16, 
        UNCONNECTED_17, UNCONNECTED_18, UNCONNECTED_19, UNCONNECTED_20, 
        UNCONNECTED_21, UNCONNECTED_22, PRODUCT[7], PRODUCT[6], PRODUCT[5], 
        PRODUCT[4], PRODUCT[3], PRODUCT[2]}) );
    VMW_FADD S1_2_0 ( .CI(\SUMB[1][1] ), .A(\ab[2][0] ), .B(\CARRYB[1][0] ), 
        .S(\A1[0] ), .CO(\CARRYB[2][0] ) );
    VMW_FADD S2_2_1 ( .CI(\SUMB[1][2] ), .A(\ab[2][1] ), .B(\CARRYB[1][1] ), 
        .S(\SUMB[2][1] ), .CO(\CARRYB[2][1] ) );
    VMW_AND2 U30 ( .A(A[4]), .B(B[3]), .Z(\ab[4][3] ) );
    VMW_FADD S2_3_1 ( .CI(\SUMB[2][2] ), .A(\ab[3][1] ), .B(\CARRYB[2][1] ), 
        .S(\SUMB[3][1] ), .CO(\CARRYB[3][1] ) );
    VMW_FADD S2_5_2 ( .CI(\SUMB[4][3] ), .A(\ab[5][2] ), .B(\CARRYB[4][2] ), 
        .S(\SUMB[5][2] ) );
    VMW_PULLDOWN U10 ( .Z(\A2[2] ) );
    VMW_AND2 U42 ( .A(A[5]), .B(B[2]), .Z(\ab[5][2] ) );
    VMW_AND2 U45 ( .A(A[3]), .B(B[2]), .Z(\ab[3][2] ) );
    VMW_FADD S2_4_2 ( .CI(\SUMB[3][3] ), .A(\ab[4][2] ), .B(\CARRYB[3][2] ), 
        .S(\SUMB[4][2] ), .CO(\CARRYB[4][2] ) );
    VMW_PULLDOWN U11 ( .Z(\A2[6] ) );
    VMW_FADD S0_0 ( .CI(n42), .A(\ab[0][1] ), .B(\ab[1][0] ), .S(PRODUCT[1]), 
        .CO(\CARRYB[1][0] ) );
    VMW_AND2 U19 ( .A(A[0]), .B(B[3]), .Z(\ab[0][3] ) );
    VMW_AND2 U25 ( .A(A[0]), .B(B[7]), .Z(\ab[0][7] ) );
    VMW_AND2 U37 ( .A(B[5]), .B(A[2]), .Z(\ab[2][5] ) );
    VMW_AND2 U50 ( .A(B[4]), .B(A[3]), .Z(\ab[3][4] ) );
    VMW_AND2 U36 ( .A(A[1]), .B(B[2]), .Z(\ab[1][2] ) );
    VMW_PULLDOWN U4 ( .Z(n38) );
    VMW_FADD S0_1 ( .CI(n41), .A(\ab[0][2] ), .B(\ab[1][1] ), .S(\SUMB[1][1] ), 
        .CO(\CARRYB[1][1] ) );
    VMW_AND2 U18 ( .A(A[6]), .B(B[0]), .Z(\ab[6][0] ) );
    VMW_AND2 U43 ( .A(A[0]), .B(B[6]), .Z(\ab[0][6] ) );
    VMW_AND2 U51 ( .A(A[2]), .B(B[4]), .Z(\ab[2][4] ) );
    VMW_AND2 U23 ( .A(A[0]), .B(B[4]), .Z(\ab[0][4] ) );
    VMW_AND2 U24 ( .A(A[3]), .B(B[1]), .Z(\ab[3][1] ) );
    VMW_FADD S1_4_0 ( .CI(\SUMB[3][1] ), .A(\ab[4][0] ), .B(\CARRYB[3][0] ), 
        .S(\A1[2] ), .CO(\CARRYB[4][0] ) );
    VMW_FADD S2_6_1 ( .CI(\SUMB[5][2] ), .A(\ab[6][1] ), .B(\CARRYB[5][1] ), 
        .S(\SUMB[6][1] ) );
    VMW_AND2 U38 ( .A(A[0]), .B(B[0]), .Z(PRODUCT[0]) );
    VMW_FADD S4_0 ( .CI(\SUMB[6][1] ), .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .S(
        \A1[5] ) );
    VMW_AND2 U44 ( .A(B[6]), .B(A[1]), .Z(\ab[1][6] ) );
    VMW_FADD S2_4_3 ( .CI(\SUMB[3][4] ), .A(\ab[4][3] ), .B(\CARRYB[3][3] ), 
        .S(\SUMB[4][3] ) );
    VMW_FADD S1_5_0 ( .CI(\SUMB[4][1] ), .A(\ab[5][0] ), .B(\CARRYB[4][0] ), 
        .S(\A1[3] ), .CO(\CARRYB[5][0] ) );
    VMW_PULLDOWN U16 ( .Z(\A2[5] ) );
    VMW_AND2 U31 ( .A(A[2]), .B(B[0]), .Z(\ab[2][0] ) );
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_8_0 ( A, B, CI, SUM, 
    CO );
input  [7:0] A;
input  [7:0] B;
output [7:0] SUM;
input  CI;
output CO;
    wire n1, \carry[4] , \carry[2] , \carry[6] , \carry[7] , \carry[3] , 
        \carry[1] , \carry[5] ;
    VMW_PULLDOWN U1 ( .Z(n1) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(B[1]), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_FADD U1_0 ( .CI(n1), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
         );
    VMW_FADD U1_6 ( .CI(\carry[6] ), .A(A[6]), .B(B[6]), .S(SUM[6]), .CO(
        \carry[7] ) );
    VMW_FADD U1_7 ( .CI(\carry[7] ), .A(A[7]), .B(B[7]), .S(SUM[7]) );
    VMW_FADD U1_2 ( .CI(\carry[2] ), .A(A[2]), .B(B[2]), .S(SUM[2]), .CO(
        \carry[3] ) );
    VMW_FADD U1_3 ( .CI(\carry[3] ), .A(A[3]), .B(B[3]), .S(SUM[3]), .CO(
        \carry[4] ) );
    VMW_FADD U1_4 ( .CI(\carry[4] ), .A(A[4]), .B(B[4]), .S(SUM[4]), .CO(
        \carry[5] ) );
    VMW_FADD U1_5 ( .CI(\carry[5] ), .A(A[5]), .B(B[5]), .S(SUM[5]), .CO(
        \carry[6] ) );
endmodule


module VectorDotProduct_pVectorSize2_pWordSize8 ( Clk, Reset, RD, WR, Addr, 
    DataIn, DataOut, vectorAInput, vectorBInput, cOutput );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [15:0] vectorAInput;
output [7:0] cOutput;
input  [15:0] vectorBInput;
input  Clk, Reset, RD, WR;
    wire n286, n287, \result60[1] , n288, \result60[7] , \n196[2] , 
        \result60[5] , \n196[6] , \n196[4] , \result60[3] , \n106[3] , 
        \n106[7] , \n106[5] , \n106[1] , \n106[8] , \n106[4] , \n106[6] , 
        \n106[2] , \result60[2] , \n196[1] , \n196[8] , \n196[5] , 
        \result60[6] , \result60[4] , \result60[0] , \n196[7] , \n196[3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 ;
    VMW_PULLDOWN U8 ( .Z(n286) );
    VMW_FD \cOutput_reg[6]  ( .D(\result60[6] ), .CP(Clk), .Q(cOutput[6]) );
    VMW_FD \cOutput_reg[2]  ( .D(\result60[2] ), .CP(Clk), .Q(cOutput[2]) );
    VMW_FD \cOutput_reg[4]  ( .D(\result60[4] ), .CP(Clk), .Q(cOutput[4]) );
    VectorDotProduct_pVectorSize2_pWordSize8_DW02_mult_8_8_0 mul_48_1 ( .A(
        vectorAInput[15:8]), .B(vectorBInput[15:8]), .TC(n287), .PRODUCT({
        UNCONNECTED_1, UNCONNECTED_2, UNCONNECTED_3, UNCONNECTED_4, 
        UNCONNECTED_5, UNCONNECTED_6, UNCONNECTED_7, UNCONNECTED_8, \n196[1] , 
        \n196[2] , \n196[3] , \n196[4] , \n196[5] , \n196[6] , \n196[7] , 
        \n196[8] }) );
    VectorDotProduct_pVectorSize2_pWordSize8_DW01_add_8_0 add_48_1 ( .A({
        \n106[1] , \n106[2] , \n106[3] , \n106[4] , \n106[5] , \n106[6] , 
        \n106[7] , \n106[8] }), .B({\n196[1] , \n196[2] , \n196[3] , \n196[4] , 
        \n196[5] , \n196[6] , \n196[7] , \n196[8] }), .CI(n286), .SUM({
        \result60[7] , \result60[6] , \result60[5] , \result60[4] , 
        \result60[3] , \result60[2] , \result60[1] , \result60[0] }) );
    VMW_PULLDOWN U9 ( .Z(n287) );
    VMW_FD \cOutput_reg[0]  ( .D(\result60[0] ), .CP(Clk), .Q(cOutput[0]) );
    VectorDotProduct_pVectorSize2_pWordSize8_DW02_mult_8_8_1 mul_48 ( .A(
        vectorAInput[7:0]), .B(vectorBInput[7:0]), .TC(n288), .PRODUCT({
        UNCONNECTED_9, UNCONNECTED_10, UNCONNECTED_11, UNCONNECTED_12, 
        UNCONNECTED_13, UNCONNECTED_14, UNCONNECTED_15, UNCONNECTED_16, 
        \n106[1] , \n106[2] , \n106[3] , \n106[4] , \n106[5] , \n106[6] , 
        \n106[7] , \n106[8] }) );
    VMW_PULLDOWN U10 ( .Z(n288) );
    VMW_FD \cOutput_reg[7]  ( .D(\result60[7] ), .CP(Clk), .Q(cOutput[7]) );
    VMW_FD \cOutput_reg[5]  ( .D(\result60[5] ), .CP(Clk), .Q(cOutput[5]) );
    VMW_FD \cOutput_reg[1]  ( .D(\result60[1] ), .CP(Clk), .Q(cOutput[1]) );
    VMW_FD \cOutput_reg[3]  ( .D(\result60[3] ), .CP(Clk), .Q(cOutput[3]) );
endmodule


module main ( Clk, Reset, RD, WR, Addr, DataIn, DataOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  Clk, Reset, RD, WR;
    wire \cOutput[6] , \cOutput[2] , \cOutput[0] , \cOutput[9] , \cOutput[4] , 
        \vectorInput[3] , \matrixInput[24] , \matrixInput[17] , 
        \matrixInput[7] , \cOutput[10] , \vectorInput[15] , \matrixInput[30] , 
        \matrixInput[29] , \matrixInput[3] , \vectorInput[11] , 
        \vectorInput[7] , \matrixInput[13] , \cOutput[14] , \matrixInput[20] , 
        \vectorInput[5] , \matrixInput[22] , \matrixInput[11] , 
        \matrixInput[8] , \vectorInput[13] , \matrixInput[18] , 
        \matrixInput[1] , \vectorInput[1] , \matrixInput[15] , 
        \matrixInput[26] , \cOutput[12] , \vectorInput[8] , \matrixInput[5] , 
        \vectorInput[9] , \vectorInput[0] , \matrixInput[27] , 
        \matrixInput[14] , \cOutput[13] , \matrixInput[4] , \vectorInput[4] , 
        \matrixInput[10] , \matrixInput[23] , \matrixInput[9] , 
        \vectorInput[12] , \matrixInput[19] , \matrixInput[0] , 
        \matrixInput[31] , \matrixInput[28] , \matrixInput[2] , 
        \vectorInput[10] , \matrixInput[12] , \vectorInput[6] , 
        \matrixInput[21] , \cOutput[15] , \matrixInput[6] , \vectorInput[14] , 
        \vectorInput[2] , \matrixInput[16] , \cOutput[11] , \matrixInput[25] , 
        \cOutput[5] , \cOutput[1] , \cOutput[8] , \cOutput[3] , \cOutput[7] ;
    IntMatMul_Control_pVectorSize2_pWordSize8_pScan1 U_IntMatMul_Control ( 
        .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(
        DataIn), .DataOut(DataOut), .vectorInput({\vectorInput[15] , 
        \vectorInput[14] , \vectorInput[13] , \vectorInput[12] , 
        \vectorInput[11] , \vectorInput[10] , \vectorInput[9] , 
        \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , 
        \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , 
        \vectorInput[0] }), .matrixInput({\matrixInput[31] , \matrixInput[30] , 
        \matrixInput[29] , \matrixInput[28] , \matrixInput[27] , 
        \matrixInput[26] , \matrixInput[25] , \matrixInput[24] , 
        \matrixInput[23] , \matrixInput[22] , \matrixInput[21] , 
        \matrixInput[20] , \matrixInput[19] , \matrixInput[18] , 
        \matrixInput[17] , \matrixInput[16] , \matrixInput[15] , 
        \matrixInput[14] , \matrixInput[13] , \matrixInput[12] , 
        \matrixInput[11] , \matrixInput[10] , \matrixInput[9] , 
        \matrixInput[8] , \matrixInput[7] , \matrixInput[6] , \matrixInput[5] , 
        \matrixInput[4] , \matrixInput[3] , \matrixInput[2] , \matrixInput[1] , 
        \matrixInput[0] }), .cOutput({\cOutput[15] , \cOutput[14] , 
        \cOutput[13] , \cOutput[12] , \cOutput[11] , \cOutput[10] , 
        \cOutput[9] , \cOutput[8] , \cOutput[7] , \cOutput[6] , \cOutput[5] , 
        \cOutput[4] , \cOutput[3] , \cOutput[2] , \cOutput[1] , \cOutput[0] })
         );
    VectorDotProduct_pVectorSize2_pWordSize8 VectorDotProduct_1 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[15] , \vectorInput[14] , 
        \vectorInput[13] , \vectorInput[12] , \vectorInput[11] , 
        \vectorInput[10] , \vectorInput[9] , \vectorInput[8] , 
        \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , \vectorInput[4] , 
        \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , \vectorInput[0] 
        }), .vectorBInput({\matrixInput[31] , \matrixInput[30] , 
        \matrixInput[29] , \matrixInput[28] , \matrixInput[27] , 
        \matrixInput[26] , \matrixInput[25] , \matrixInput[24] , 
        \matrixInput[23] , \matrixInput[22] , \matrixInput[21] , 
        \matrixInput[20] , \matrixInput[19] , \matrixInput[18] , 
        \matrixInput[17] , \matrixInput[16] }), .cOutput({\cOutput[15] , 
        \cOutput[14] , \cOutput[13] , \cOutput[12] , \cOutput[11] , 
        \cOutput[10] , \cOutput[9] , \cOutput[8] }) );
    VectorDotProduct_pVectorSize2_pWordSize8 VectorDotProduct_0 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[15] , \vectorInput[14] , 
        \vectorInput[13] , \vectorInput[12] , \vectorInput[11] , 
        \vectorInput[10] , \vectorInput[9] , \vectorInput[8] , 
        \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , \vectorInput[4] , 
        \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , \vectorInput[0] 
        }), .vectorBInput({\matrixInput[15] , \matrixInput[14] , 
        \matrixInput[13] , \matrixInput[12] , \matrixInput[11] , 
        \matrixInput[10] , \matrixInput[9] , \matrixInput[8] , 
        \matrixInput[7] , \matrixInput[6] , \matrixInput[5] , \matrixInput[4] , 
        \matrixInput[3] , \matrixInput[2] , \matrixInput[1] , \matrixInput[0] 
        }), .cOutput({\cOutput[7] , \cOutput[6] , \cOutput[5] , \cOutput[4] , 
        \cOutput[3] , \cOutput[2] , \cOutput[1] , \cOutput[0] }) );
endmodule

