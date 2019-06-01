
module IntMatMul_Control_pVectorSize4_pWordSize8_pScan1_DW01_cmp2_15_0 ( A, B, 
    LEQ, TC, LT_LE, GE_GT );
input  [14:0] A;
input  [14:0] B;
input  LEQ, TC;
output LT_LE, GE_GT;
    wire n15, n16, n17;
    VMW_NOR5 U3 ( .A(n15), .B(n16), .C(A[8]), .D(A[10]), .E(A[9]), .Z(LT_LE)
         );
    VMW_OR3 U5 ( .A(A[7]), .B(A[6]), .C(A[5]), .Z(n17) );
    VMW_OR4 U6 ( .A(A[4]), .B(A[3]), .C(A[2]), .D(n17), .Z(n15) );
    VMW_OR4 U4 ( .A(A[12]), .B(A[11]), .C(A[14]), .D(A[13]), .Z(n16) );
endmodule


module IntMatMul_Control_pVectorSize4_pWordSize8_pScan1 ( Clk, Reset, RD, WR, 
    Addr, DataIn, DataOut, vectorInput, matrixInput, cOutput );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
output [31:0] vectorInput;
input  [31:0] cOutput;
output [127:0] matrixInput;
input  Clk, Reset, RD, WR;
    wire n4466, n4604, n4534, n4513, n4483, n4598, n4623, n4508, n4498, n4583, 
        n4638, n4656, n4671, n4541, n4566, \holder[0] , n4663, n4553, n4644, 
        n4574, n4591, Logic11, n4686, \holder[4] , n4501, n4616, n4526, n4474, 
        n4491, n4678, n4631, n4548, n4473, n4658, n4568, \holder[6] , n4636, 
        n4488, n4506, n4496, n4521, n4611, n4681, n4596, n4468, n4664, n4643, 
        n4573, n4554, n4676, n4561, n4651, n4546, n4514, n4584, \holder[2] , 
        n4618, n4624, n4528, n4484, n4603, n4533, n4688, n4469, n4665, n4642, 
        n4572, n4555, n4680, n4597, n4507, n4637, n4520, n4497, n4515, n4472, 
        n4610, n4659, n4569, n4485, n4625, n4532, n4602, n4689, n4692, n4585, 
        n4619, n4529, n4560, n4650, n4677, n4547, n4540, n4657, n4670, n4567, 
        n4509, n4582, n4639, n4512, n4499, n4605, n4535, n4467, n4482, n4622, 
        n4599, n4500, n4475, n4679, n4549, n4617, n4527, n4490, n4630, n4590, 
        n4687, n4510, n4465, n4662, n4552, n4575, n4645, n4669, n4559, n4480, 
        n4620, n4607, n4537, n4655, n4580, n4672, n4565, n4542, n4647, n4577, 
        n4660, n4550, n4685, n4519, n4489, n4592, n4629, n4502, n4492, n4632, 
        n4470, n4477, n164, n4615, n4525, n4589, n4505, n4522, n4612, n4635, 
        n4495, n4682, n4595, n4609, n4667, n4539, n4557, n4570, n4640, n4479, 
        n4675, n4652, n4562, n4545, n4587, n4690, n4530, n4600, n4517, n4487, 
        n4627, n4649, n4579, n4666, n4556, n4571, n4641, \holder[3] , n4594, 
        n4683, n4523, n4608, n4538, n4504, n4494, n4613, n4634, n4471, n4463, 
        n4578, n4648, n4601, n4531, \holder[7] , n4626, n4516, n4486, n4586, 
        n4478, n4691, n4674, n4653, n4544, n4563, n4654, n4673, n4564, n4543, 
        n4621, n4511, Logic01, n4581, n4481, \holder[5] , n4464, n4668, n4606, 
        n4536, n4558, n4476, n4503, n4518, n4493, n4614, n4633, n4524, n4588, 
        n4593, n4684, n4628, n4646, n4576, n4661, n4551, \holder[1] ;
    tri \DataOut[31] , \DataOut[27]1 , \DataOut[14]1 , \DataOut[26]1 , 
        \DataOut[15]1 , \DataOut[18]1 , \DataOut[0]1 , \DataOut[19]1 , 
        \DataOut[1]1 , \DataOut[23]1 , \DataOut[22]1 , \DataOut[11]1 , 
        \DataOut[10]1 , \DataOut[9]1 , \DataOut[8]1 , \DataOut[5]1 , 
        \DataOut[4]1 , \DataOut[21]1 , \DataOut[20]1 , \DataOut[13]1 , 
        \DataOut[12]1 , \DataOut[7]1 , \DataOut[6]1 , \DataOut[25]1 , 
        \DataOut[16]1 , \DataOut[24]1 , \DataOut[17]1 , \DataOut[29]1 , 
        \DataOut[30]1 , \DataOut[2]1 , \DataOut[28]1 , \DataOut[3]1 ;
    wire UNCONNECTED_1 , UNCONNECTED_2 ;
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
    VMW_PULLDOWN U223 ( .Z(n4504) );
    VMW_FD \matrixInput_reg[3]  ( .D(n4648), .CP(Clk), .Q(matrixInput[3]) );
    VMW_PULLDOWN U238 ( .Z(n4519) );
    VMW_AND2 U256 ( .A(n4491), .B(n4493), .Z(n4492) );
    VMW_AO22 U338 ( .A(matrixInput[67]), .B(n4499), .C(matrixInput[59]), .D(
        n4490), .Z(n4592) );
    VMW_AO22 U394 ( .A(DataIn[3]), .B(n4499), .C(matrixInput[123]), .D(n4490), 
        .Z(n4528) );
    VMW_AO22 U415 ( .A(matrixInput[112]), .B(n4499), .C(matrixInput[104]), .D(
        n4490), .Z(n4547) );
    VMW_AO22 U432 ( .A(\holder[2] ), .B(n4488), .C(cOutput[26]), .D(n4497), 
        .Z(n4480) );
    VMW_AO22 U356 ( .A(matrixInput[50]), .B(n4499), .C(matrixInput[42]), .D(
        n4490), .Z(n4609) );
    VMW_AO22 U371 ( .A(matrixInput[37]), .B(n4499), .C(matrixInput[29]), .D(
        n4490), .Z(n4622) );
    VMW_FD \matrixInput_reg[11]  ( .D(n4640), .CP(Clk), .Q(matrixInput[11]) );
    VMW_FD \matrixInput_reg[22]  ( .D(n4629), .CP(Clk), .Q(matrixInput[22]) );
    VMW_INV U447 ( .A(n4476), .Z(n4688) );
    VMW_FD \matrixInput_reg[102]  ( .D(n4549), .CP(Clk), .Q(matrixInput[102])
         );
    VMW_FD \vectorInput_reg[5]  ( .D(n4678), .CP(Clk), .Q(vectorInput[5]) );
    VMW_AO22 U271 ( .A(DataIn[5]), .B(n4498), .C(vectorInput[29]), .D(n4489), 
        .Z(n4654) );
    VMW_AO22 U294 ( .A(matrixInput[107]), .B(n4499), .C(matrixInput[99]), .D(
        n4490), .Z(n4552) );
    VMW_AO22 U304 ( .A(matrixInput[16]), .B(n4499), .C(matrixInput[8]), .D(
        n4490), .Z(n4643) );
    VMW_BUFIZ U460 ( .A(n4507), .E(RD), .Z(\DataOut[16]1 ) );
    VMW_FD \matrixInput_reg[121]  ( .D(n4530), .CP(Clk), .Q(matrixInput[121])
         );
    VMW_FD \matrixInput_reg[32]  ( .D(n4619), .CP(Clk), .Q(matrixInput[32]) );
    VMW_FD \matrixInput_reg[18]  ( .D(n4633), .CP(Clk), .Q(matrixInput[18]) );
    VMW_FD \matrixInput_reg[112]  ( .D(n4539), .CP(Clk), .Q(matrixInput[112])
         );
    VMW_AO22 U323 ( .A(matrixInput[80]), .B(n4499), .C(matrixInput[72]), .D(
        n4490), .Z(n4579) );
    VMW_AO22 U429 ( .A(cOutput[11]), .B(n4496), .C(cOutput[3]), .D(n4492), .Z(
        n4478) );
    VMW_FD \vectorInput_reg[1]  ( .D(n4682), .CP(Clk), .Q(vectorInput[1]) );
    VMW_PULLDOWN U224 ( .Z(n4505) );
    VMW_PULLDOWN U231 ( .Z(n4512) );
    VMW_PULLUP U244 ( .Z(Logic11) );
    VMW_AO22 U286 ( .A(vectorInput[23]), .B(n4498), .C(vectorInput[15]), .D(
        n4489), .Z(n4668) );
    VMW_FD \matrixInput_reg[106]  ( .D(n4545), .CP(Clk), .Q(matrixInput[106])
         );
    VMW_AO22 U316 ( .A(matrixInput[87]), .B(n4499), .C(matrixInput[79]), .D(
        n4490), .Z(n4572) );
    VMW_AO22 U331 ( .A(matrixInput[73]), .B(n4499), .C(matrixInput[65]), .D(
        n4490), .Z(n4586) );
    VMW_FD \matrixInput_reg[26]  ( .D(n4625), .CP(Clk), .Q(matrixInput[26]) );
    VMW_FD \matrixInput_reg[15]  ( .D(n4636), .CP(Clk), .Q(matrixInput[15]) );
    VMW_AO22 U378 ( .A(matrixInput[30]), .B(n4499), .C(matrixInput[22]), .D(
        n4490), .Z(n4629) );
    VMW_AO22 U263 ( .A(vectorInput[15]), .B(n4498), .C(vectorInput[7]), .D(
        n4489), .Z(n4676) );
    VMW_BUFIZ U455 ( .A(\holder[0] ), .E(RD), .Z(\DataOut[0]1 ) );
    VMW_BUFIZ U472 ( .A(n4517), .E(RD), .Z(\DataOut[24]1 ) );
    VMW_AO22 U278 ( .A(vectorInput[30]), .B(n4498), .C(vectorInput[22]), .D(
        n4489), .Z(n4661) );
    VMW_BUFIZ U469 ( .A(n4514), .E(RD), .Z(\DataOut[29]1 ) );
    VMW_FD \matrixInput_reg[7]  ( .D(n4644), .CP(Clk), .Q(matrixInput[7]) );
    VMW_AO22 U344 ( .A(matrixInput[61]), .B(n4499), .C(matrixInput[53]), .D(
        n4490), .Z(n4598) );
    VMW_AO22 U363 ( .A(matrixInput[44]), .B(n4499), .C(matrixInput[36]), .D(
        n4490), .Z(n4615) );
    VMW_AO22 U420 ( .A(matrixInput[8]), .B(n4499), .C(matrixInput[0]), .D(
        n4490), .Z(n4651) );
    VMW_FD \matrixInput_reg[125]  ( .D(n4526), .CP(Clk), .Q(matrixInput[125])
         );
    VMW_FD \matrixInput_reg[116]  ( .D(n4535), .CP(Clk), .Q(matrixInput[116])
         );
    VMW_FD \matrixInput_reg[36]  ( .D(n4615), .CP(Clk), .Q(matrixInput[36]) );
    VMW_FD \vectorInput_reg[8]  ( .D(n4675), .CP(Clk), .Q(vectorInput[8]) );
    VMW_PULLDOWN U236 ( .Z(n4517) );
    VMW_AO22 U381 ( .A(matrixInput[9]), .B(n4499), .C(matrixInput[1]), .D(
        n4490), .Z(n4650) );
    VMW_AO22 U386 ( .A(matrixInput[23]), .B(n4499), .C(matrixInput[15]), .D(
        n4490), .Z(n4636) );
    VMW_AO22 U407 ( .A(matrixInput[119]), .B(n4499), .C(matrixInput[111]), .D(
        n4490), .Z(n4540) );
    VMW_FD \matrixInput_reg[127]  ( .D(n4524), .CP(Clk), .Q(matrixInput[127])
         );
    VMW_FD \matrixInput_reg[114]  ( .D(n4537), .CP(Clk), .Q(matrixInput[114])
         );
    VMW_AO22 U400 ( .A(matrixInput[126]), .B(n4499), .C(matrixInput[118]), .D(
        n4490), .Z(n4533) );
    VMW_FD \matrixInput_reg[34]  ( .D(n4617), .CP(Clk), .Q(matrixInput[34]) );
    VMW_PULLDOWN U243 ( .Z(n4692) );
    VMW_AND2 U258 ( .A(n4494), .B(n4493), .Z(n4496) );
    VMW_AO22 U427 ( .A(cOutput[12]), .B(n4496), .C(cOutput[4]), .D(n4492), .Z(
        n4475) );
    VMW_INV U449 ( .A(n4482), .Z(n4690) );
    VMW_AO22 U264 ( .A(vectorInput[14]), .B(n4498), .C(vectorInput[6]), .D(
        n4489), .Z(n4677) );
    VMW_AO22 U343 ( .A(matrixInput[62]), .B(n4499), .C(matrixInput[54]), .D(
        n4490), .Z(n4597) );
    VMW_AO22 U358 ( .A(matrixInput[48]), .B(n4499), .C(matrixInput[40]), .D(
        n4490), .Z(n4611) );
    VMW_AO22 U364 ( .A(matrixInput[43]), .B(n4499), .C(matrixInput[35]), .D(
        n4490), .Z(n4616) );
    VMW_BUFIZ U452 ( .A(n4501), .E(RD), .Z(\DataOut[23]1 ) );
    VMW_BUFIZ U475 ( .A(n4519), .E(RD), .Z(\DataOut[15]1 ) );
    VMW_FD \matrixInput_reg[5]  ( .D(n4646), .CP(Clk), .Q(matrixInput[5]) );
    VMW_AOI211 U251 ( .A(cOutput[18]), .B(n4464), .C(n4480), .D(n4481), .Z(
        n4479) );
    VMW_AO22 U276 ( .A(DataIn[0]), .B(n4498), .C(vectorInput[24]), .D(n4489), 
        .Z(n4659) );
    VMW_AO22 U281 ( .A(vectorInput[9]), .B(n4498), .C(vectorInput[1]), .D(
        n4489), .Z(n4682) );
    VMW_AO22 U311 ( .A(matrixInput[91]), .B(n4499), .C(matrixInput[83]), .D(
        n4490), .Z(n4568) );
    VMW_AO22 U336 ( .A(matrixInput[68]), .B(n4499), .C(matrixInput[60]), .D(
        n4490), .Z(n4591) );
    VMW_FD \matrixInput_reg[104]  ( .D(n4547), .CP(Clk), .Q(matrixInput[104])
         );
    VMW_FD \vectorInput_reg[3]  ( .D(n4680), .CP(Clk), .Q(vectorInput[3]) );
    VMW_FD \matrixInput_reg[17]  ( .D(n4634), .CP(Clk), .Q(matrixInput[17]) );
    VMW_AO22 U293 ( .A(matrixInput[17]), .B(n4499), .C(matrixInput[9]), .D(
        n4490), .Z(n4642) );
    VMW_AO22 U324 ( .A(matrixInput[79]), .B(n4499), .C(matrixInput[71]), .D(
        n4490), .Z(n4580) );
    VMW_FD \matrixInput_reg[24]  ( .D(n4627), .CP(Clk), .Q(matrixInput[24]) );
    VMW_FD \matrixInput_reg[8]  ( .D(n4643), .CP(Clk), .Q(matrixInput[8]) );
    IntMatMul_Control_pVectorSize4_pWordSize8_pScan1_DW01_cmp2_15_0 lt_130 ( 
        .A({Addr[14], Addr[13], Addr[12], Addr[11], Addr[10], Addr[9], Addr[8], 
        Addr[7], Addr[6], Addr[5], Addr[4], Addr[3], Addr[2], UNCONNECTED_1, 
        UNCONNECTED_2}), .B({Logic01, Logic01, Logic01, Logic01, Logic01, 
        Logic01, Logic01, Logic01, Logic01, Logic01, Logic01, Logic01, Logic11, 
        Logic01, Logic01}), .LEQ(n4692), .TC(n4692), .LT_LE(n164) );
    VMW_AO22 U303 ( .A(matrixInput[98]), .B(n4499), .C(matrixInput[90]), .D(
        n4490), .Z(n4561) );
    VMW_AO22 U388 ( .A(matrixInput[21]), .B(n4499), .C(matrixInput[13]), .D(
        n4490), .Z(n4638) );
    VMW_BUFIZ U482 ( .A(n4523), .E(RD), .Z(\DataOut[8]1 ) );
    VMW_AO22 U409 ( .A(matrixInput[18]), .B(n4499), .C(matrixInput[10]), .D(
        n4490), .Z(n4641) );
    VMW_BUFIZ U467 ( .A(n4512), .E(RD), .Z(\DataOut[13]1 ) );
    VMW_FD \matrixInput_reg[30]  ( .D(n4621), .CP(Clk), .Q(matrixInput[30]) );
    VMW_FD \matrixInput_reg[29]  ( .D(n4622), .CP(Clk), .Q(matrixInput[29]) );
    VMW_AO22 U351 ( .A(matrixInput[55]), .B(n4499), .C(matrixInput[47]), .D(
        n4490), .Z(n4604) );
    VMW_INV U440 ( .A(n4490), .Z(n4499) );
    VMW_FD \matrixInput_reg[123]  ( .D(n4528), .CP(Clk), .Q(matrixInput[123])
         );
    VMW_FD \matrixInput_reg[110]  ( .D(n4541), .CP(Clk), .Q(matrixInput[110])
         );
    VMW_FD \matrixInput_reg[109]  ( .D(n4542), .CP(Clk), .Q(matrixInput[109])
         );
    VMW_FD \matrixInput_reg[39]  ( .D(n4612), .CP(Clk), .Q(matrixInput[39]) );
    VMW_FD \matrixInput_reg[13]  ( .D(n4638), .CP(Clk), .Q(matrixInput[13]) );
    VMW_FD \matrixInput_reg[20]  ( .D(n4631), .CP(Clk), .Q(matrixInput[20]) );
    VMW_AO22 U376 ( .A(matrixInput[32]), .B(n4499), .C(matrixInput[24]), .D(
        n4490), .Z(n4627) );
    VMW_AO22 U393 ( .A(DataIn[4]), .B(n4499), .C(matrixInput[124]), .D(n4490), 
        .Z(n4527) );
    VMW_FD \matrixInput_reg[119]  ( .D(n4532), .CP(Clk), .Q(matrixInput[119])
         );
    VMW_FD \matrixInput_reg[100]  ( .D(n4551), .CP(Clk), .Q(matrixInput[100])
         );
    VMW_FD \vectorInput_reg[7]  ( .D(n4676), .CP(Clk), .Q(vectorInput[7]) );
    VMW_AO22 U412 ( .A(matrixInput[115]), .B(n4499), .C(matrixInput[107]), .D(
        n4490), .Z(n4544) );
    VMW_AO22 U435 ( .A(cOutput[8]), .B(n4496), .C(cOutput[0]), .D(n4492), .Z(
        n4487) );
    VMW_FD \matrixInput_reg[1]  ( .D(n4650), .CP(Clk), .Q(matrixInput[1]) );
    VMW_PULLDOWN U242 ( .Z(n4523) );
    VMW_AO22 U265 ( .A(vectorInput[13]), .B(n4498), .C(vectorInput[5]), .D(
        n4489), .Z(n4678) );
    VMW_AO22 U280 ( .A(vectorInput[28]), .B(n4498), .C(vectorInput[20]), .D(
        n4489), .Z(n4663) );
    VMW_AO22 U288 ( .A(vectorInput[21]), .B(n4498), .C(vectorInput[13]), .D(
        n4489), .Z(n4670) );
    VMW_AO22 U318 ( .A(matrixInput[85]), .B(n4499), .C(matrixInput[77]), .D(
        n4490), .Z(n4574) );
    VMW_AO22 U337 ( .A(matrixInput[13]), .B(n4499), .C(matrixInput[5]), .D(
        n4490), .Z(n4646) );
    VMW_FD \matrixInput_reg[76]  ( .D(n4575), .CP(Clk), .Q(matrixInput[76]) );
    VMW_AO22 U310 ( .A(matrixInput[92]), .B(n4499), .C(matrixInput[84]), .D(
        n4490), .Z(n4567) );
    VMW_AO22 U359 ( .A(matrixInput[11]), .B(n4499), .C(matrixInput[3]), .D(
        n4490), .Z(n4648) );
    VMW_FD \matrixInput_reg[45]  ( .D(n4606), .CP(Clk), .Q(matrixInput[45]) );
    VMW_BUFIZ U474 ( .A(\holder[3] ), .E(RD), .Z(\DataOut[3]1 ) );
    VMW_FD \vectorInput_reg[27]  ( .D(n4656), .CP(Clk), .Q(vectorInput[27]) );
    VMW_FD \matrixInput_reg[97]  ( .D(n4554), .CP(Clk), .Q(matrixInput[97]) );
    VMW_FD \vectorInput_reg[14]  ( .D(n4669), .CP(Clk), .Q(vectorInput[14]) );
    VMW_BUFIZ U453 ( .A(n4502), .E(RD), .Z(\DataOut[19]1 ) );
    VMW_FD \holder_reg[1]  ( .D(n4690), .CP(Clk), .Q(\holder[1] ) );
    VMW_PULLDOWN U219 ( .Z(n4500) );
    VMW_PULLDOWN U225 ( .Z(n4506) );
    VMW_PULLDOWN U237 ( .Z(n4518) );
    VMW_AND2 U259 ( .A(Addr[1]), .B(n4491), .Z(n4464) );
    VMW_AO22 U342 ( .A(matrixInput[63]), .B(n4499), .C(matrixInput[55]), .D(
        n4490), .Z(n4596) );
    VMW_INV U448 ( .A(n4479), .Z(n4689) );
    VMW_AO22 U365 ( .A(matrixInput[42]), .B(n4499), .C(matrixInput[34]), .D(
        n4490), .Z(n4617) );
    VMW_FD \matrixInput_reg[87]  ( .D(n4564), .CP(Clk), .Q(matrixInput[87]) );
    VMW_AO22 U380 ( .A(matrixInput[28]), .B(n4499), .C(matrixInput[20]), .D(
        n4490), .Z(n4631) );
    VMW_AO22 U401 ( .A(matrixInput[125]), .B(n4499), .C(matrixInput[117]), .D(
        n4490), .Z(n4534) );
    VMW_AO22 U426 ( .A(\holder[5] ), .B(n4488), .C(cOutput[29]), .D(n4497), 
        .Z(n4471) );
    VMW_FD \matrixInput_reg[66]  ( .D(n4585), .CP(Clk), .Q(matrixInput[66]) );
    VMW_FD \matrixInput_reg[55]  ( .D(n4596), .CP(Clk), .Q(matrixInput[55]) );
    VMW_AO22 U392 ( .A(DataIn[5]), .B(n4499), .C(matrixInput[125]), .D(n4490), 
        .Z(n4526) );
    VMW_AO22 U413 ( .A(matrixInput[114]), .B(n4499), .C(matrixInput[106]), .D(
        n4490), .Z(n4545) );
    VMW_FD \matrixInput_reg[93]  ( .D(n4558), .CP(Clk), .Q(matrixInput[93]) );
    VMW_FD \vectorInput_reg[23]  ( .D(n4660), .CP(Clk), .Q(vectorInput[23]) );
    VMW_FD \vectorInput_reg[10]  ( .D(n4673), .CP(Clk), .Q(vectorInput[10]) );
    VMW_AOI211 U250 ( .A(cOutput[19]), .B(n4464), .C(n4477), .D(n4478), .Z(
        n4476) );
    VMW_AO22 U277 ( .A(vectorInput[31]), .B(n4498), .C(vectorInput[23]), .D(
        n4489), .Z(n4660) );
    VMW_AO22 U289 ( .A(vectorInput[20]), .B(n4498), .C(vectorInput[12]), .D(
        n4489), .Z(n4671) );
    VMW_AO22 U319 ( .A(matrixInput[84]), .B(n4499), .C(matrixInput[76]), .D(
        n4490), .Z(n4575) );
    VMW_AO22 U434 ( .A(\holder[1] ), .B(n4488), .C(cOutput[25]), .D(n4497), 
        .Z(n4483) );
    VMW_AO22 U350 ( .A(matrixInput[56]), .B(n4499), .C(matrixInput[48]), .D(
        n4490), .Z(n4603) );
    VMW_FD \matrixInput_reg[72]  ( .D(n4579), .CP(Clk), .Q(matrixInput[72]) );
    VMW_FD \matrixInput_reg[58]  ( .D(n4593), .CP(Clk), .Q(matrixInput[58]) );
    VMW_FD \matrixInput_reg[41]  ( .D(n4610), .CP(Clk), .Q(matrixInput[41]) );
    VMW_AO22 U377 ( .A(matrixInput[31]), .B(n4499), .C(matrixInput[23]), .D(
        n4490), .Z(n4628) );
    VMW_INV U441 ( .A(Addr[0]), .Z(n4495) );
    VMW_BUFIZ U466 ( .A(\holder[2] ), .E(RD), .Z(\DataOut[2]1 ) );
    VMW_FD \matrixInput_reg[51]  ( .D(n4600), .CP(Clk), .Q(matrixInput[51]) );
    VMW_FD \matrixInput_reg[48]  ( .D(n4603), .CP(Clk), .Q(matrixInput[48]) );
    VMW_AO22 U292 ( .A(vectorInput[8]), .B(n4498), .C(vectorInput[0]), .D(
        n4489), .Z(n4683) );
    VMW_AO22 U302 ( .A(matrixInput[99]), .B(n4499), .C(matrixInput[91]), .D(
        n4490), .Z(n4560) );
    VMW_AO22 U325 ( .A(matrixInput[78]), .B(n4499), .C(matrixInput[70]), .D(
        n4490), .Z(n4581) );
    VMW_FD \matrixInput_reg[62]  ( .D(n4589), .CP(Clk), .Q(matrixInput[62]) );
    VMW_FD \vectorInput_reg[19]  ( .D(n4664), .CP(Clk), .Q(vectorInput[19]) );
    VMW_FD \matrixInput_reg[83]  ( .D(n4568), .CP(Clk), .Q(matrixInput[83]) );
    VMW_AO22 U389 ( .A(matrixInput[20]), .B(n4499), .C(matrixInput[12]), .D(
        n4490), .Z(n4639) );
    VMW_AO22 U408 ( .A(matrixInput[118]), .B(n4499), .C(matrixInput[110]), .D(
        n4490), .Z(n4541) );
    VMW_FD \holder_reg[5]  ( .D(n4686), .CP(Clk), .Q(\holder[5] ) );
    VMW_PULLDOWN U222 ( .Z(n4503) );
    VMW_PULLDOWN U239 ( .Z(n4520) );
    VMW_AO22 U295 ( .A(matrixInput[106]), .B(n4499), .C(matrixInput[98]), .D(
        n4490), .Z(n4553) );
    VMW_AO22 U305 ( .A(matrixInput[97]), .B(n4499), .C(matrixInput[89]), .D(
        n4490), .Z(n4562) );
    VMW_AO22 U322 ( .A(matrixInput[81]), .B(n4499), .C(matrixInput[73]), .D(
        n4490), .Z(n4578) );
    VMW_FD \vectorInput_reg[31]  ( .D(n4652), .CP(Clk), .Q(vectorInput[31]) );
    VMW_FD \vectorInput_reg[28]  ( .D(n4655), .CP(Clk), .Q(vectorInput[28]) );
    VMW_AO22 U428 ( .A(\holder[4] ), .B(n4488), .C(cOutput[28]), .D(n4497), 
        .Z(n4474) );
    VMW_FD \matrixInput_reg[98]  ( .D(n4553), .CP(Clk), .Q(matrixInput[98]) );
    VMW_FD \matrixInput_reg[81]  ( .D(n4570), .CP(Clk), .Q(matrixInput[81]) );
    VMW_FD \holder_reg[7]  ( .D(n4684), .CP(Clk), .Q(\holder[7] ) );
    VMW_NOR2 U257 ( .A(n4495), .B(n4488), .Z(n4494) );
    VMW_AO22 U270 ( .A(vectorInput[10]), .B(n4498), .C(vectorInput[2]), .D(
        n4489), .Z(n4681) );
    VMW_INV U446 ( .A(n4473), .Z(n4687) );
    VMW_BUFIZ U461 ( .A(n4508), .E(RD), .Z(\DataOut[31] ) );
    VMW_AO22 U357 ( .A(matrixInput[49]), .B(n4499), .C(matrixInput[41]), .D(
        n4490), .Z(n4610) );
    VMW_AO22 U370 ( .A(matrixInput[10]), .B(n4499), .C(matrixInput[2]), .D(
        n4490), .Z(n4649) );
    VMW_FD \matrixInput_reg[79]  ( .D(n4572), .CP(Clk), .Q(matrixInput[79]) );
    VMW_FD \matrixInput_reg[60]  ( .D(n4591), .CP(Clk), .Q(matrixInput[60]) );
    VMW_FD \matrixInput_reg[53]  ( .D(n4598), .CP(Clk), .Q(matrixInput[53]) );
    VMW_FD \matrixInput_reg[70]  ( .D(n4581), .CP(Clk), .Q(matrixInput[70]) );
    VMW_FD \matrixInput_reg[69]  ( .D(n4582), .CP(Clk), .Q(matrixInput[69]) );
    VMW_FD \matrixInput_reg[43]  ( .D(n4608), .CP(Clk), .Q(matrixInput[43]) );
    VMW_AO22 U433 ( .A(cOutput[9]), .B(n4496), .C(cOutput[1]), .D(n4492), .Z(
        n4484) );
    VMW_FD \matrixInput_reg[91]  ( .D(n4560), .CP(Clk), .Q(matrixInput[91]) );
    VMW_FD \matrixInput_reg[88]  ( .D(n4563), .CP(Clk), .Q(matrixInput[88]) );
    VMW_PULLDOWN U230 ( .Z(n4511) );
    VMW_AO22 U339 ( .A(matrixInput[66]), .B(n4499), .C(matrixInput[58]), .D(
        n4490), .Z(n4593) );
    VMW_AO22 U395 ( .A(DataIn[2]), .B(n4499), .C(matrixInput[122]), .D(n4490), 
        .Z(n4529) );
    VMW_FD \vectorInput_reg[21]  ( .D(n4662), .CP(Clk), .Q(vectorInput[21]) );
    VMW_AO22 U414 ( .A(matrixInput[113]), .B(n4499), .C(matrixInput[105]), .D(
        n4490), .Z(n4546) );
    VMW_FD \vectorInput_reg[12]  ( .D(n4671), .CP(Clk), .Q(vectorInput[12]) );
    VMW_FD \matrixInput_reg[57]  ( .D(n4594), .CP(Clk), .Q(matrixInput[57]) );
    VMW_PULLDOWN U245 ( .Z(Logic01) );
    VMW_AO22 U279 ( .A(vectorInput[29]), .B(n4498), .C(vectorInput[21]), .D(
        n4489), .Z(n4662) );
    VMW_AO22 U387 ( .A(matrixInput[22]), .B(n4499), .C(matrixInput[14]), .D(
        n4490), .Z(n4637) );
    VMW_AO22 U421 ( .A(cOutput[15]), .B(n4496), .C(cOutput[7]), .D(n4492), .Z(
        n4466) );
    VMW_FD \matrixInput_reg[64]  ( .D(n4587), .CP(Clk), .Q(matrixInput[64]) );
    VMW_AO22 U406 ( .A(matrixInput[120]), .B(n4499), .C(matrixInput[112]), .D(
        n4490), .Z(n4539) );
    VMW_FD \holder_reg[3]  ( .D(n4688), .CP(Clk), .Q(\holder[3] ) );
    VMW_AO22 U345 ( .A(matrixInput[60]), .B(n4499), .C(matrixInput[52]), .D(
        n4490), .Z(n4599) );
    VMW_AO22 U362 ( .A(matrixInput[45]), .B(n4499), .C(matrixInput[37]), .D(
        n4490), .Z(n4614) );
    VMW_BUFIZ U468 ( .A(n4513), .E(RD), .Z(\DataOut[30]1 ) );
    VMW_FD \matrixInput_reg[85]  ( .D(n4566), .CP(Clk), .Q(matrixInput[85]) );
    VMW_AO22 U379 ( .A(matrixInput[29]), .B(n4499), .C(matrixInput[21]), .D(
        n4490), .Z(n4630) );
    VMW_BUFIZ U454 ( .A(n4503), .E(RD), .Z(\DataOut[10]1 ) );
    VMW_FD \vectorInput_reg[25]  ( .D(n4658), .CP(Clk), .Q(vectorInput[25]) );
    VMW_FD \vectorInput_reg[16]  ( .D(n4667), .CP(Clk), .Q(vectorInput[16]) );
    VMW_AO22 U262 ( .A(vectorInput[16]), .B(n4498), .C(vectorInput[8]), .D(
        n4489), .Z(n4675) );
    VMW_BUFIZ U473 ( .A(n4518), .E(RD), .Z(\DataOut[17]1 ) );
    VMW_FD \matrixInput_reg[95]  ( .D(n4556), .CP(Clk), .Q(matrixInput[95]) );
    VMW_PULLDOWN U220 ( .Z(n4501) );
    VMW_AO22 U287 ( .A(vectorInput[22]), .B(n4498), .C(vectorInput[14]), .D(
        n4489), .Z(n4669) );
    VMW_AO22 U317 ( .A(matrixInput[86]), .B(n4499), .C(matrixInput[78]), .D(
        n4490), .Z(n4573) );
    VMW_AO22 U330 ( .A(matrixInput[74]), .B(n4499), .C(matrixInput[66]), .D(
        n4490), .Z(n4585) );
    VMW_FD \matrixInput_reg[74]  ( .D(n4577), .CP(Clk), .Q(matrixInput[74]) );
    VMW_FD \matrixInput_reg[47]  ( .D(n4604), .CP(Clk), .Q(matrixInput[47]) );
    VMW_AO22 U397 ( .A(DataIn[0]), .B(n4499), .C(matrixInput[120]), .D(n4490), 
        .Z(n4531) );
    VMW_AO22 U416 ( .A(matrixInput[111]), .B(n4499), .C(matrixInput[103]), .D(
        n4490), .Z(n4548) );
    VMW_AO22 U431 ( .A(cOutput[10]), .B(n4496), .C(cOutput[2]), .D(n4492), .Z(
        n4481) );
    VMW_FD \matrixInput_reg[56]  ( .D(n4595), .CP(Clk), .Q(matrixInput[56]) );
    VMW_PULLDOWN U221 ( .Z(n4502) );
    VMW_PULLDOWN U226 ( .Z(n4507) );
    VMW_PULLDOWN U227 ( .Z(n4508) );
    VMW_PULLDOWN U229 ( .Z(n4510) );
    VMW_NOR2 U255 ( .A(Addr[0]), .B(n4488), .Z(n4491) );
    VMW_AO22 U269 ( .A(DataIn[6]), .B(n4498), .C(vectorInput[30]), .D(n4489), 
        .Z(n4653) );
    VMW_BUFIZ U478 ( .A(n4520), .E(RD), .Z(\DataOut[22]1 ) );
    VMW_FD \matrixInput_reg[65]  ( .D(n4586), .CP(Clk), .Q(matrixInput[65]) );
    VMW_FD \holder_reg[2]  ( .D(n4689), .CP(Clk), .Q(\holder[2] ) );
    VMW_AO22 U272 ( .A(DataIn[4]), .B(n4498), .C(vectorInput[28]), .D(n4489), 
        .Z(n4655) );
    VMW_AO22 U355 ( .A(matrixInput[51]), .B(n4499), .C(matrixInput[43]), .D(
        n4490), .Z(n4608) );
    VMW_AO22 U369 ( .A(matrixInput[38]), .B(n4499), .C(matrixInput[30]), .D(
        n4490), .Z(n4621) );
    VMW_AO22 U372 ( .A(matrixInput[36]), .B(n4499), .C(matrixInput[28]), .D(
        n4490), .Z(n4623) );
    VMW_FD \matrixInput_reg[84]  ( .D(n4567), .CP(Clk), .Q(matrixInput[84]) );
    VMW_BUFIZ U463 ( .A(n4510), .E(RD), .Z(\DataOut[12]1 ) );
    VMW_FD \matrixInput_reg[94]  ( .D(n4557), .CP(Clk), .Q(matrixInput[94]) );
    VMW_FD \vectorInput_reg[24]  ( .D(n4659), .CP(Clk), .Q(vectorInput[24]) );
    VMW_AO22 U285 ( .A(vectorInput[24]), .B(n4498), .C(vectorInput[16]), .D(
        n4489), .Z(n4667) );
    VMW_AO22 U297 ( .A(matrixInput[104]), .B(n4499), .C(matrixInput[96]), .D(
        n4490), .Z(n4555) );
    VMW_AO22 U320 ( .A(matrixInput[83]), .B(n4499), .C(matrixInput[75]), .D(
        n4490), .Z(n4576) );
    VMW_INV U444 ( .A(n4467), .Z(n4685) );
    VMW_FD \matrixInput_reg[75]  ( .D(n4576), .CP(Clk), .Q(matrixInput[75]) );
    VMW_FD \vectorInput_reg[17]  ( .D(n4666), .CP(Clk), .Q(vectorInput[17]) );
    VMW_FD \matrixInput_reg[46]  ( .D(n4605), .CP(Clk), .Q(matrixInput[46]) );
    VMW_AO22 U307 ( .A(matrixInput[95]), .B(n4499), .C(matrixInput[87]), .D(
        n4490), .Z(n4564) );
    VMW_AO22 U315 ( .A(matrixInput[15]), .B(n4499), .C(matrixInput[7]), .D(
        n4490), .Z(n4644) );
    VMW_AO22 U332 ( .A(matrixInput[72]), .B(n4499), .C(matrixInput[64]), .D(
        n4490), .Z(n4587) );
    VMW_FD \matrixInput_reg[99]  ( .D(n4552), .CP(Clk), .Q(matrixInput[99]) );
    VMW_FD \matrixInput_reg[80]  ( .D(n4571), .CP(Clk), .Q(matrixInput[80]) );
    VMW_FD \vectorInput_reg[30]  ( .D(n4653), .CP(Clk), .Q(vectorInput[30]) );
    VMW_FD \vectorInput_reg[29]  ( .D(n4654), .CP(Clk), .Q(vectorInput[29]) );
    VMW_FD \holder_reg[6]  ( .D(n4685), .CP(Clk), .Q(\holder[6] ) );
    VMW_PULLDOWN U232 ( .Z(n4513) );
    VMW_AOI211 U247 ( .A(cOutput[22]), .B(n4464), .C(n4468), .D(n4469), .Z(
        n4467) );
    VMW_AND2 U260 ( .A(Addr[1]), .B(n4494), .Z(n4497) );
    VMW_NAND3 U438 ( .A(WR), .B(n4493), .C(Addr[0]), .Z(n4489) );
    VMW_BUFIZ U456 ( .A(n4504), .E(RD), .Z(\DataOut[14]1 ) );
    VMW_BUFIZ U471 ( .A(n4516), .E(RD), .Z(\DataOut[26]1 ) );
    VMW_FD \matrixInput_reg[78]  ( .D(n4573), .CP(Clk), .Q(matrixInput[78]) );
    VMW_FD \matrixInput_reg[52]  ( .D(n4599), .CP(Clk), .Q(matrixInput[52]) );
    VMW_FD \matrixInput_reg[61]  ( .D(n4590), .CP(Clk), .Q(matrixInput[61]) );
    VMW_AO22 U347 ( .A(matrixInput[58]), .B(n4499), .C(matrixInput[50]), .D(
        n4490), .Z(n4601) );
    VMW_AO22 U360 ( .A(matrixInput[47]), .B(n4499), .C(matrixInput[39]), .D(
        n4490), .Z(n4612) );
    VMW_FD \matrixInput_reg[71]  ( .D(n4580), .CP(Clk), .Q(matrixInput[71]) );
    VMW_FD \matrixInput_reg[68]  ( .D(n4583), .CP(Clk), .Q(matrixInput[68]) );
    VMW_AO22 U385 ( .A(matrixInput[24]), .B(n4499), .C(matrixInput[16]), .D(
        n4490), .Z(n4635) );
    VMW_FD \matrixInput_reg[42]  ( .D(n4609), .CP(Clk), .Q(matrixInput[42]) );
    VMW_FD \vectorInput_reg[20]  ( .D(n4663), .CP(Clk), .Q(vectorInput[20]) );
    VMW_FD \vectorInput_reg[13]  ( .D(n4670), .CP(Clk), .Q(vectorInput[13]) );
    VMW_AO22 U404 ( .A(matrixInput[122]), .B(n4499), .C(matrixInput[114]), .D(
        n4490), .Z(n4537) );
    VMW_PULLDOWN U235 ( .Z(n4516) );
    VMW_AO22 U329 ( .A(matrixInput[75]), .B(n4499), .C(matrixInput[67]), .D(
        n4490), .Z(n4584) );
    VMW_AO22 U423 ( .A(cOutput[14]), .B(n4496), .C(cOutput[6]), .D(n4492), .Z(
        n4469) );
    VMW_FD \matrixInput_reg[90]  ( .D(n4561), .CP(Clk), .Q(matrixInput[90]) );
    VMW_FD \matrixInput_reg[89]  ( .D(n4562), .CP(Clk), .Q(matrixInput[89]) );
    VMW_AO22 U424 ( .A(\holder[6] ), .B(n4488), .C(cOutput[30]), .D(n4497), 
        .Z(n4468) );
    VMW_FD \vectorInput_reg[22]  ( .D(n4661), .CP(Clk), .Q(vectorInput[22]) );
    VMW_PULLDOWN U240 ( .Z(n4521) );
    VMW_AO22 U299 ( .A(matrixInput[102]), .B(n4499), .C(matrixInput[94]), .D(
        n4490), .Z(n4557) );
    VMW_AO22 U382 ( .A(matrixInput[27]), .B(n4499), .C(matrixInput[19]), .D(
        n4490), .Z(n4632) );
    VMW_AO22 U403 ( .A(matrixInput[123]), .B(n4499), .C(matrixInput[115]), .D(
        n4490), .Z(n4536) );
    VMW_FD \matrixInput_reg[92]  ( .D(n4559), .CP(Clk), .Q(matrixInput[92]) );
    VMW_FD \vectorInput_reg[11]  ( .D(n4672), .CP(Clk), .Q(vectorInput[11]) );
    VMW_AO22 U309 ( .A(matrixInput[93]), .B(n4499), .C(matrixInput[85]), .D(
        n4490), .Z(n4566) );
    VMW_AO22 U340 ( .A(matrixInput[65]), .B(n4499), .C(matrixInput[57]), .D(
        n4490), .Z(n4594) );
    VMW_AO22 U367 ( .A(matrixInput[40]), .B(n4499), .C(matrixInput[32]), .D(
        n4490), .Z(n4619) );
    VMW_FD \matrixInput_reg[73]  ( .D(n4578), .CP(Clk), .Q(matrixInput[73]) );
    VMW_FD \matrixInput_reg[59]  ( .D(n4592), .CP(Clk), .Q(matrixInput[59]) );
    VMW_FD \matrixInput_reg[40]  ( .D(n4611), .CP(Clk), .Q(matrixInput[40]) );
    VMW_FD \matrixInput_reg[50]  ( .D(n4601), .CP(Clk), .Q(matrixInput[50]) );
    VMW_FD \matrixInput_reg[49]  ( .D(n4602), .CP(Clk), .Q(matrixInput[49]) );
    VMW_AOI211 U249 ( .A(cOutput[20]), .B(n4464), .C(n4474), .D(n4475), .Z(
        n4473) );
    VMW_AOI211 U252 ( .A(cOutput[17]), .B(n4464), .C(n4483), .D(n4484), .Z(
        n4482) );
    VMW_AO22 U267 ( .A(vectorInput[11]), .B(n4498), .C(vectorInput[3]), .D(
        n4489), .Z(n4680) );
    VMW_BUFIZ U451 ( .A(n4500), .E(RD), .Z(\DataOut[27]1 ) );
    VMW_BUFIZ U476 ( .A(\holder[7] ), .E(RD), .Z(\DataOut[7]1 ) );
    VMW_FD \matrixInput_reg[63]  ( .D(n4588), .CP(Clk), .Q(matrixInput[63]) );
    VMW_AO22 U282 ( .A(vectorInput[27]), .B(n4498), .C(vectorInput[19]), .D(
        n4489), .Z(n4664) );
    VMW_AO22 U290 ( .A(vectorInput[19]), .B(n4498), .C(vectorInput[11]), .D(
        n4489), .Z(n4672) );
    VMW_AO22 U300 ( .A(matrixInput[101]), .B(n4499), .C(matrixInput[93]), .D(
        n4490), .Z(n4558) );
    VMW_AO22 U312 ( .A(matrixInput[90]), .B(n4499), .C(matrixInput[82]), .D(
        n4490), .Z(n4569) );
    VMW_AO22 U335 ( .A(matrixInput[69]), .B(n4499), .C(matrixInput[61]), .D(
        n4490), .Z(n4590) );
    VMW_FD \matrixInput_reg[82]  ( .D(n4569), .CP(Clk), .Q(matrixInput[82]) );
    VMW_AO22 U399 ( .A(matrixInput[127]), .B(n4499), .C(matrixInput[119]), .D(
        n4490), .Z(n4532) );
    VMW_AO22 U418 ( .A(matrixInput[109]), .B(n4499), .C(matrixInput[101]), .D(
        n4490), .Z(n4550) );
    VMW_FD \vectorInput_reg[18]  ( .D(n4665), .CP(Clk), .Q(vectorInput[18]) );
    VMW_FD \holder_reg[4]  ( .D(n4687), .CP(Clk), .Q(\holder[4] ) );
    VMW_BUFIZ U481 ( .A(\holder[1] ), .E(RD), .Z(\DataOut[1]1 ) );
    VMW_FD \matrixInput_reg[77]  ( .D(n4574), .CP(Clk), .Q(matrixInput[77]) );
    VMW_AO22 U327 ( .A(matrixInput[77]), .B(n4499), .C(matrixInput[69]), .D(
        n4490), .Z(n4582) );
    VMW_FD \matrixInput_reg[44]  ( .D(n4607), .CP(Clk), .Q(matrixInput[44]) );
    VMW_AO22 U349 ( .A(matrixInput[57]), .B(n4499), .C(matrixInput[49]), .D(
        n4490), .Z(n4602) );
    VMW_INV U443 ( .A(n4463), .Z(n4684) );
    VMW_AO22 U275 ( .A(DataIn[1]), .B(n4498), .C(vectorInput[25]), .D(n4489), 
        .Z(n4658) );
    VMW_FD \matrixInput_reg[96]  ( .D(n4555), .CP(Clk), .Q(matrixInput[96]) );
    VMW_FD \vectorInput_reg[26]  ( .D(n4657), .CP(Clk), .Q(vectorInput[26]) );
    VMW_FD \vectorInput_reg[15]  ( .D(n4668), .CP(Clk), .Q(vectorInput[15]) );
    VMW_BUFIZ U458 ( .A(\holder[4] ), .E(RD), .Z(\DataOut[4]1 ) );
    VMW_BUFIZ U464 ( .A(\holder[6] ), .E(RD), .Z(\DataOut[6]1 ) );
    VMW_FD \holder_reg[0]  ( .D(n4691), .CP(Clk), .Q(\holder[0] ) );
    VMW_AO22 U352 ( .A(matrixInput[54]), .B(n4499), .C(matrixInput[46]), .D(
        n4490), .Z(n4605) );
    VMW_AO22 U375 ( .A(matrixInput[33]), .B(n4499), .C(matrixInput[25]), .D(
        n4490), .Z(n4626) );
    VMW_FD \matrixInput_reg[86]  ( .D(n4565), .CP(Clk), .Q(matrixInput[86]) );
    VMW_PULLDOWN U234 ( .Z(n4515) );
    VMW_PULLDOWN U241 ( .Z(n4522) );
    VMW_AO22 U283 ( .A(vectorInput[26]), .B(n4498), .C(vectorInput[18]), .D(
        n4489), .Z(n4665) );
    VMW_AO22 U313 ( .A(matrixInput[89]), .B(n4499), .C(matrixInput[81]), .D(
        n4490), .Z(n4570) );
    VMW_AO22 U390 ( .A(DataIn[7]), .B(n4499), .C(matrixInput[127]), .D(n4490), 
        .Z(n4524) );
    VMW_AO22 U411 ( .A(matrixInput[116]), .B(n4499), .C(matrixInput[108]), .D(
        n4490), .Z(n4543) );
    VMW_AO22 U436 ( .A(\holder[0] ), .B(n4488), .C(cOutput[24]), .D(n4497), 
        .Z(n4486) );
    VMW_FD \matrixInput_reg[67]  ( .D(n4584), .CP(Clk), .Q(matrixInput[67]) );
    VMW_FD \matrixInput_reg[54]  ( .D(n4597), .CP(Clk), .Q(matrixInput[54]) );
    VMW_AO22 U334 ( .A(matrixInput[70]), .B(n4499), .C(matrixInput[62]), .D(
        n4490), .Z(n4589) );
    VMW_FD \matrixInput_reg[9]  ( .D(n4642), .CP(Clk), .Q(matrixInput[9]) );
    VMW_AO22 U398 ( .A(matrixInput[19]), .B(n4499), .C(matrixInput[11]), .D(
        n4490), .Z(n4640) );
    VMW_AO22 U419 ( .A(matrixInput[108]), .B(n4499), .C(matrixInput[100]), .D(
        n4490), .Z(n4551) );
    VMW_INV U450 ( .A(n4485), .Z(n4691) );
    VMW_FD \matrixInput_reg[31]  ( .D(n4620), .CP(Clk), .Q(matrixInput[31]) );
    VMW_FD \matrixInput_reg[28]  ( .D(n4623), .CP(Clk), .Q(matrixInput[28]) );
    VMW_AO22 U266 ( .A(vectorInput[12]), .B(n4498), .C(vectorInput[4]), .D(
        n4489), .Z(n4679) );
    VMW_AO22 U341 ( .A(matrixInput[64]), .B(n4499), .C(matrixInput[56]), .D(
        n4490), .Z(n4595) );
    VMW_AO22 U366 ( .A(matrixInput[41]), .B(n4499), .C(matrixInput[33]), .D(
        n4490), .Z(n4618) );
    VMW_BUFIZ U477 ( .A(\holder[5] ), .E(RD), .Z(\DataOut[5]1 ) );
    VMW_FD \matrixInput_reg[122]  ( .D(n4529), .CP(Clk), .Q(matrixInput[122])
         );
    VMW_FD \matrixInput_reg[111]  ( .D(n4540), .CP(Clk), .Q(matrixInput[111])
         );
    VMW_FD \matrixInput_reg[108]  ( .D(n4543), .CP(Clk), .Q(matrixInput[108])
         );
    VMW_FD \matrixInput_reg[38]  ( .D(n4613), .CP(Clk), .Q(matrixInput[38]) );
    VMW_FD \matrixInput_reg[21]  ( .D(n4630), .CP(Clk), .Q(matrixInput[21]) );
    VMW_FD \matrixInput_reg[12]  ( .D(n4639), .CP(Clk), .Q(matrixInput[12]) );
    VMW_FD \matrixInput_reg[118]  ( .D(n4533), .CP(Clk), .Q(matrixInput[118])
         );
    VMW_FD \matrixInput_reg[101]  ( .D(n4550), .CP(Clk), .Q(matrixInput[101])
         );
    VMW_FD \vectorInput_reg[6]  ( .D(n4677), .CP(Clk), .Q(vectorInput[6]) );
    VMW_AO22 U298 ( .A(matrixInput[103]), .B(n4499), .C(matrixInput[95]), .D(
        n4490), .Z(n4556) );
    VMW_AO22 U308 ( .A(matrixInput[94]), .B(n4499), .C(matrixInput[86]), .D(
        n4490), .Z(n4565) );
    VMW_AO22 U383 ( .A(matrixInput[26]), .B(n4499), .C(matrixInput[18]), .D(
        n4490), .Z(n4633) );
    VMW_AO22 U425 ( .A(cOutput[13]), .B(n4496), .C(cOutput[5]), .D(n4492), .Z(
        n4472) );
    VMW_FD \matrixInput_reg[0]  ( .D(n4651), .CP(Clk), .Q(matrixInput[0]) );
    VMW_AO22 U402 ( .A(matrixInput[124]), .B(n4499), .C(matrixInput[116]), .D(
        n4490), .Z(n4535) );
    VMW_NAND3 U437 ( .A(n4493), .B(n4495), .C(WR), .Z(n4490) );
    VMW_FD \matrixInput_reg[126]  ( .D(n4525), .CP(Clk), .Q(matrixInput[126])
         );
    VMW_FD \matrixInput_reg[115]  ( .D(n4536), .CP(Clk), .Q(matrixInput[115])
         );
    VMW_AOI211 U248 ( .A(cOutput[21]), .B(n4464), .C(n4471), .D(n4472), .Z(
        n4470) );
    VMW_AO22 U391 ( .A(DataIn[6]), .B(n4499), .C(matrixInput[126]), .D(n4490), 
        .Z(n4525) );
    VMW_AO22 U410 ( .A(matrixInput[117]), .B(n4499), .C(matrixInput[109]), .D(
        n4490), .Z(n4542) );
    VMW_FD \matrixInput_reg[35]  ( .D(n4616), .CP(Clk), .Q(matrixInput[35]) );
    VMW_AOI211 U253 ( .A(cOutput[16]), .B(n4464), .C(n4486), .D(n4487), .Z(
        n4485) );
    VMW_AO22 U348 ( .A(matrixInput[12]), .B(n4499), .C(matrixInput[4]), .D(
        n4490), .Z(n4647) );
    VMW_AO22 U353 ( .A(matrixInput[53]), .B(n4499), .C(matrixInput[45]), .D(
        n4490), .Z(n4606) );
    VMW_AO22 U374 ( .A(matrixInput[34]), .B(n4499), .C(matrixInput[26]), .D(
        n4490), .Z(n4625) );
    VMW_BUFIZ U459 ( .A(n4506), .E(RD), .Z(\DataOut[25]1 ) );
    VMW_NAND4 U254 ( .A(RD), .B(n164), .C(n4489), .D(n4490), .Z(n4488) );
    VMW_AO22 U273 ( .A(DataIn[3]), .B(n4498), .C(vectorInput[27]), .D(n4489), 
        .Z(n4656) );
    VMW_AO22 U274 ( .A(DataIn[2]), .B(n4498), .C(vectorInput[26]), .D(n4489), 
        .Z(n4657) );
    VMW_INV U442 ( .A(Addr[1]), .Z(n4493) );
    VMW_BUFIZ U465 ( .A(n4511), .E(RD), .Z(\DataOut[28]1 ) );
    VMW_FD \matrixInput_reg[4]  ( .D(n4647), .CP(Clk), .Q(matrixInput[4]) );
    VMW_AO22 U291 ( .A(vectorInput[18]), .B(n4498), .C(vectorInput[10]), .D(
        n4489), .Z(n4673) );
    VMW_FD \matrixInput_reg[105]  ( .D(n4546), .CP(Clk), .Q(matrixInput[105])
         );
    VMW_FD \matrixInput_reg[16]  ( .D(n4635), .CP(Clk), .Q(matrixInput[16]) );
    VMW_FD \vectorInput_reg[2]  ( .D(n4681), .CP(Clk), .Q(vectorInput[2]) );
    VMW_AO22 U296 ( .A(matrixInput[105]), .B(n4499), .C(matrixInput[97]), .D(
        n4490), .Z(n4554) );
    VMW_AO22 U301 ( .A(matrixInput[100]), .B(n4499), .C(matrixInput[92]), .D(
        n4490), .Z(n4559) );
    VMW_AO22 U306 ( .A(matrixInput[96]), .B(n4499), .C(matrixInput[88]), .D(
        n4490), .Z(n4563) );
    VMW_AO22 U321 ( .A(matrixInput[82]), .B(n4499), .C(matrixInput[74]), .D(
        n4490), .Z(n4577) );
    VMW_AO22 U326 ( .A(matrixInput[14]), .B(n4499), .C(matrixInput[6]), .D(
        n4490), .Z(n4645) );
    VMW_BUFIZ U480 ( .A(n4522), .E(RD), .Z(\DataOut[11]1 ) );
    VMW_FD \matrixInput_reg[25]  ( .D(n4626), .CP(Clk), .Q(matrixInput[25]) );
    VMW_FD \matrixInput_reg[107]  ( .D(n4544), .CP(Clk), .Q(matrixInput[107])
         );
    VMW_FD \matrixInput_reg[27]  ( .D(n4624), .CP(Clk), .Q(matrixInput[27]) );
    VMW_FD \matrixInput_reg[14]  ( .D(n4637), .CP(Clk), .Q(matrixInput[14]) );
    VMW_FD \vectorInput_reg[0]  ( .D(n4683), .CP(Clk), .Q(vectorInput[0]) );
    VMW_AO22 U368 ( .A(matrixInput[39]), .B(n4499), .C(matrixInput[31]), .D(
        n4490), .Z(n4620) );
    VMW_FD \matrixInput_reg[6]  ( .D(n4645), .CP(Clk), .Q(matrixInput[6]) );
    VMW_INV U445 ( .A(n4470), .Z(n4686) );
    VMW_BUFIZ U462 ( .A(n4509), .E(RD), .Z(\DataOut[21]1 ) );
    VMW_AO22 U268 ( .A(DataIn[7]), .B(n4498), .C(vectorInput[31]), .D(n4489), 
        .Z(n4652) );
    VMW_AO22 U354 ( .A(matrixInput[52]), .B(n4499), .C(matrixInput[44]), .D(
        n4490), .Z(n4607) );
    VMW_BUFIZ U479 ( .A(n4521), .E(RD), .Z(\DataOut[18]1 ) );
    VMW_AO22 U373 ( .A(matrixInput[35]), .B(n4499), .C(matrixInput[27]), .D(
        n4490), .Z(n4624) );
    VMW_AO22 U396 ( .A(DataIn[1]), .B(n4499), .C(matrixInput[121]), .D(n4490), 
        .Z(n4530) );
    VMW_AO22 U417 ( .A(matrixInput[110]), .B(n4499), .C(matrixInput[102]), .D(
        n4490), .Z(n4549) );
    VMW_FD \matrixInput_reg[124]  ( .D(n4527), .CP(Clk), .Q(matrixInput[124])
         );
    VMW_FD \vectorInput_reg[9]  ( .D(n4674), .CP(Clk), .Q(vectorInput[9]) );
    VMW_FD \matrixInput_reg[117]  ( .D(n4534), .CP(Clk), .Q(matrixInput[117])
         );
    VMW_FD \matrixInput_reg[37]  ( .D(n4614), .CP(Clk), .Q(matrixInput[37]) );
    VMW_PULLDOWN U228 ( .Z(n4509) );
    VMW_PULLDOWN U233 ( .Z(n4514) );
    VMW_AO22 U384 ( .A(matrixInput[25]), .B(n4499), .C(matrixInput[17]), .D(
        n4490), .Z(n4634) );
    VMW_AO22 U405 ( .A(matrixInput[121]), .B(n4499), .C(matrixInput[113]), .D(
        n4490), .Z(n4538) );
    VMW_AO22 U430 ( .A(\holder[3] ), .B(n4488), .C(cOutput[27]), .D(n4497), 
        .Z(n4477) );
    VMW_AO22 U422 ( .A(\holder[7] ), .B(n4488), .C(cOutput[31]), .D(n4497), 
        .Z(n4465) );
    VMW_AOI211 U246 ( .A(cOutput[23]), .B(n4464), .C(n4465), .D(n4466), .Z(
        n4463) );
    VMW_AO22 U261 ( .A(vectorInput[17]), .B(n4498), .C(vectorInput[9]), .D(
        n4489), .Z(n4674) );
    VMW_AO22 U328 ( .A(matrixInput[76]), .B(n4499), .C(matrixInput[68]), .D(
        n4490), .Z(n4583) );
    VMW_FD \matrixInput_reg[2]  ( .D(n4649), .CP(Clk), .Q(matrixInput[2]) );
    VMW_AO22 U346 ( .A(matrixInput[59]), .B(n4499), .C(matrixInput[51]), .D(
        n4490), .Z(n4600) );
    VMW_AO22 U361 ( .A(matrixInput[46]), .B(n4499), .C(matrixInput[38]), .D(
        n4490), .Z(n4613) );
    VMW_FD \matrixInput_reg[10]  ( .D(n4641), .CP(Clk), .Q(matrixInput[10]) );
    VMW_BUFIZ U470 ( .A(n4515), .E(RD), .Z(\DataOut[20]1 ) );
    VMW_FD \matrixInput_reg[103]  ( .D(n4548), .CP(Clk), .Q(matrixInput[103])
         );
    VMW_FD \matrixInput_reg[23]  ( .D(n4628), .CP(Clk), .Q(matrixInput[23]) );
    VMW_FD \vectorInput_reg[4]  ( .D(n4679), .CP(Clk), .Q(vectorInput[4]) );
    VMW_FD \matrixInput_reg[33]  ( .D(n4618), .CP(Clk), .Q(matrixInput[33]) );
    VMW_FD \matrixInput_reg[19]  ( .D(n4632), .CP(Clk), .Q(matrixInput[19]) );
    VMW_AO22 U284 ( .A(vectorInput[25]), .B(n4498), .C(vectorInput[17]), .D(
        n4489), .Z(n4666) );
    VMW_AO22 U333 ( .A(matrixInput[71]), .B(n4499), .C(matrixInput[63]), .D(
        n4490), .Z(n4588) );
    VMW_BUFIZ U457 ( .A(n4505), .E(RD), .Z(\DataOut[9]1 ) );
    VMW_FD \matrixInput_reg[120]  ( .D(n4531), .CP(Clk), .Q(matrixInput[120])
         );
    VMW_FD \matrixInput_reg[113]  ( .D(n4538), .CP(Clk), .Q(matrixInput[113])
         );
    VMW_AO22 U314 ( .A(matrixInput[88]), .B(n4499), .C(matrixInput[80]), .D(
        n4490), .Z(n4571) );
    VMW_INV U439 ( .A(n4489), .Z(n4498) );
endmodule


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_2 ( A, B, CI, SUM, 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_3 ( A, B, CI, SUM, 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_3 ( A, B, TC, 
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
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_3 FS ( .A({\A1[13] , 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_1 ( A, B, CI, SUM, 
    CO );
input  [7:0] A;
input  [7:0] B;
output [7:0] SUM;
input  CI;
output CO;
    wire n2, \carry[4] , \carry[2] , \carry[6] , \carry[7] , \carry[3] , 
        \carry[1] , \carry[5] ;
    VMW_PULLDOWN U1 ( .Z(n2) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(B[1]), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_FADD U1_0 ( .CI(n2), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_2 ( A, B, CI, SUM, 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_2 ( A, B, TC, 
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
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_2 FS ( .A({\A1[13] , 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_1 ( A, B, CI, SUM, 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_1 ( A, B, TC, 
    PRODUCT );
input  [7:0] A;
input  [7:0] B;
output [15:0] PRODUCT;
input  TC;
    wire n43, n44, n46, n47, \A2[1] , \A1[13] , \A2[5] , \SUMB[1][4] , 
        \CARRYB[2][1] , \SUMB[5][2] , \ab[2][4] , \CARRYB[3][2] , \SUMB[4][1] , 
        \ab[3][3] , \ab[2][0] , \A1[2] , n48, lsb_0, \A2[3] , \ab[6][0] , 
        \ab[2][2] , \A1[0] , \SUMB[1][6] , \ab[1][3] , \SUMB[1][2] , 
        \ab[3][1] , \CARRYB[3][0] , \SUMB[4][3] , \A1[4] , \CARRYB[2][3] , 
        \ab[4][2] , \ab[5][1] , \SUMB[3][4] , \ab[0][4] , \CARRYB[1][2] , 
        \SUMB[2][3] , \CARRYB[5][0] , \SUMB[6][1] , \ab[0][6] , \ab[1][5] , 
        \CARRYB[1][0] , \SUMB[2][1] , \SUMB[3][2] , \CARRYB[1][4] , \ab[4][0] , 
        \CARRYB[4][1] , \SUMB[2][5] , \ab[0][2] , \ab[0][7] , \CARRYB[1][5] , 
        \ab[1][1] , \ab[4][1] , \ab[0][3] , \SUMB[2][4] , \ab[1][0] , 
        \ab[5][2] , \CARRYB[1][1] , \SUMB[3][3] , \ab[1][4] , \CARRYB[4][0] , 
        n45, \A2[2] , \A2[6] , \ab[1][6] , \SUMB[3][1] , \ab[0][5] , 
        \CARRYB[4][2] , \SUMB[1][3] , \CARRYB[1][3] , \CARRYB[5][1] , 
        \ab[1][2] , \SUMB[2][2] , \ab[0][1] , \ab[4][3] , \ab[5][0] , 
        \SUMB[4][2] , \CARRYB[3][1] , \ab[3][4] , \SUMB[5][1] , \CARRYB[6][0] , 
        \CARRYB[2][2] , \A1[5] , \ab[6][1] , \ab[2][3] , \SUMB[1][5] , \A1[1] , 
        \ab[3][0] , \CARRYB[2][4] , \ab[7][0] , \ab[2][1] , \ab[3][2] , 
        \A1[3] , \A2[4] , \SUMB[1][1] , \CARRYB[2][0] , \ab[2][5] , 
        \CARRYB[3][3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 , 
	UNCONNECTED_17 , UNCONNECTED_18 , UNCONNECTED_19 , UNCONNECTED_20 , 
	UNCONNECTED_21 , UNCONNECTED_22 ;
    VMW_PULLDOWN U3 ( .Z(n43) );
    VMW_PULLDOWN U5 ( .Z(n45) );
    VMW_PULLDOWN U6 ( .Z(n46) );
    VMW_PULLDOWN U14 ( .Z(\A2[1] ) );
    VMW_FADD S0_4 ( .CI(n44), .A(\ab[0][5] ), .B(\ab[1][4] ), .S(\SUMB[1][4] ), 
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
    VMW_PULLDOWN U7 ( .Z(n47) );
    VMW_PULLDOWN U8 ( .Z(n48) );
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
    VMW_FADD S0_3 ( .CI(n45), .A(\ab[0][4] ), .B(\ab[1][3] ), .S(\SUMB[1][3] ), 
        .CO(\CARRYB[1][3] ) );
    VMW_AND2 U35 ( .A(A[4]), .B(B[2]), .Z(\ab[4][2] ) );
    VMW_AND2 U53 ( .A(A[0]), .B(B[1]), .Z(\ab[0][1] ) );
    VMW_FADD S2_2_5 ( .CI(\SUMB[1][6] ), .A(\ab[2][5] ), .B(\CARRYB[1][5] ), 
        .S(\SUMB[2][5] ) );
    VMW_FADD S0_2 ( .CI(n46), .A(\ab[0][3] ), .B(\ab[1][2] ), .S(\SUMB[1][2] ), 
        .CO(\CARRYB[1][2] ) );
    VMW_AND2 U40 ( .A(A[4]), .B(B[1]), .Z(\ab[4][1] ) );
    VMW_AND2 U52 ( .A(A[1]), .B(B[1]), .Z(\ab[1][1] ) );
    VMW_FADD S2_2_4 ( .CI(\SUMB[1][5] ), .A(\ab[2][4] ), .B(\CARRYB[1][4] ), 
        .S(\SUMB[2][4] ), .CO(\CARRYB[2][4] ) );
    VMW_AND2 U27 ( .A(A[0]), .B(B[2]), .Z(\ab[0][2] ) );
    VMW_FADD S0_5 ( .CI(n43), .A(\ab[0][6] ), .B(\ab[1][5] ), .S(\SUMB[1][5] ), 
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
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_1 FS ( .A({\A1[13] , 
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
    VMW_FADD S0_0 ( .CI(n48), .A(\ab[0][1] ), .B(\ab[1][0] ), .S(PRODUCT[1]), 
        .CO(\CARRYB[1][0] ) );
    VMW_AND2 U19 ( .A(A[0]), .B(B[3]), .Z(\ab[0][3] ) );
    VMW_AND2 U25 ( .A(A[0]), .B(B[7]), .Z(\ab[0][7] ) );
    VMW_AND2 U37 ( .A(B[5]), .B(A[2]), .Z(\ab[2][5] ) );
    VMW_AND2 U50 ( .A(B[4]), .B(A[3]), .Z(\ab[3][4] ) );
    VMW_AND2 U36 ( .A(A[1]), .B(B[2]), .Z(\ab[1][2] ) );
    VMW_PULLDOWN U4 ( .Z(n44) );
    VMW_FADD S0_1 ( .CI(n47), .A(\ab[0][2] ), .B(\ab[1][1] ), .S(\SUMB[1][1] ), 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_0 ( A, B, CI, SUM, 
    CO );
input  [7:0] A;
input  [7:0] B;
output [7:0] SUM;
input  CI;
output CO;
    wire n3, \carry[4] , \carry[2] , \carry[6] , \carry[7] , \carry[3] , 
        \carry[1] , \carry[5] ;
    VMW_PULLDOWN U1 ( .Z(n3) );
    VMW_FADD U1_1 ( .CI(\carry[1] ), .A(A[1]), .B(B[1]), .S(SUM[1]), .CO(
        \carry[2] ) );
    VMW_FADD U1_0 ( .CI(n3), .A(A[0]), .B(B[0]), .S(SUM[0]), .CO(\carry[1] )
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_0 ( A, B, CI, SUM, 
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


module VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_0 ( A, B, TC, 
    PRODUCT );
input  [7:0] A;
input  [7:0] B;
output [15:0] PRODUCT;
input  TC;
    wire n49, \A2[3] , \A2[1] , \A1[13] , \A2[5] , \SUMB[1][4] , 
        \CARRYB[2][1] , \SUMB[5][2] , \ab[2][4] , \CARRYB[3][2] , \SUMB[4][1] , 
        \ab[3][3] , \ab[2][0] , \A1[2] , \ab[6][0] , \ab[2][2] , \A1[0] , 
        \SUMB[1][6] , \ab[3][1] , \CARRYB[3][0] , \SUMB[4][3] , n50, n51, n52, 
        \SUMB[1][2] , \CARRYB[2][3] , n53, \ab[1][3] , \A1[4] , \ab[4][2] , 
        \ab[5][1] , \SUMB[3][4] , n54, lsb_0, \ab[0][6] , \ab[0][4] , 
        \CARRYB[1][2] , \SUMB[2][3] , \CARRYB[5][0] , \SUMB[6][1] , 
        \CARRYB[1][0] , \SUMB[2][1] , \ab[0][7] , \ab[1][5] , \SUMB[3][2] , 
        \CARRYB[1][5] , \CARRYB[1][4] , \ab[4][0] , \CARRYB[4][1] , 
        \SUMB[2][5] , \ab[0][2] , \ab[1][1] , \ab[4][1] , \ab[0][3] , 
        \SUMB[2][4] , \ab[1][0] , \ab[5][2] , \ab[1][6] , \ab[1][4] , 
        \CARRYB[1][1] , \SUMB[3][3] , \SUMB[3][1] , \CARRYB[4][0] , \ab[0][5] , 
        \CARRYB[4][2] , \CARRYB[1][3] , \CARRYB[5][1] , \ab[1][2] , 
        \SUMB[2][2] , \ab[4][3] , \ab[5][0] , \A2[6] , \SUMB[1][3] , 
        \ab[0][1] , \SUMB[4][2] , \CARRYB[3][1] , \ab[3][4] , \SUMB[5][1] , 
        \CARRYB[6][0] , \CARRYB[2][2] , \A1[5] , \A2[4] , \A2[2] , \ab[6][1] , 
        \ab[2][3] , \SUMB[1][5] , \A1[1] , \ab[3][0] , \CARRYB[2][4] , 
        \ab[7][0] , \ab[2][1] , \ab[3][2] , \A1[3] , \SUMB[1][1] , 
        \CARRYB[2][0] , \ab[2][5] , \CARRYB[3][3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 , 
	UNCONNECTED_17 , UNCONNECTED_18 , UNCONNECTED_19 , UNCONNECTED_20 , 
	UNCONNECTED_21 , UNCONNECTED_22 ;
    VMW_PULLDOWN U3 ( .Z(n49) );
    VMW_PULLDOWN U5 ( .Z(n51) );
    VMW_PULLDOWN U6 ( .Z(n52) );
    VMW_PULLDOWN U14 ( .Z(\A2[1] ) );
    VMW_FADD S0_4 ( .CI(n50), .A(\ab[0][5] ), .B(\ab[1][4] ), .S(\SUMB[1][4] ), 
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
    VMW_PULLDOWN U7 ( .Z(n53) );
    VMW_PULLDOWN U8 ( .Z(n54) );
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
    VMW_FADD S0_3 ( .CI(n51), .A(\ab[0][4] ), .B(\ab[1][3] ), .S(\SUMB[1][3] ), 
        .CO(\CARRYB[1][3] ) );
    VMW_AND2 U35 ( .A(A[4]), .B(B[2]), .Z(\ab[4][2] ) );
    VMW_AND2 U53 ( .A(A[0]), .B(B[1]), .Z(\ab[0][1] ) );
    VMW_FADD S2_2_5 ( .CI(\SUMB[1][6] ), .A(\ab[2][5] ), .B(\CARRYB[1][5] ), 
        .S(\SUMB[2][5] ) );
    VMW_FADD S0_2 ( .CI(n52), .A(\ab[0][3] ), .B(\ab[1][2] ), .S(\SUMB[1][2] ), 
        .CO(\CARRYB[1][2] ) );
    VMW_AND2 U40 ( .A(A[4]), .B(B[1]), .Z(\ab[4][1] ) );
    VMW_AND2 U52 ( .A(A[1]), .B(B[1]), .Z(\ab[1][1] ) );
    VMW_FADD S2_2_4 ( .CI(\SUMB[1][5] ), .A(\ab[2][4] ), .B(\CARRYB[1][4] ), 
        .S(\SUMB[2][4] ), .CO(\CARRYB[2][4] ) );
    VMW_AND2 U27 ( .A(A[0]), .B(B[2]), .Z(\ab[0][2] ) );
    VMW_FADD S0_5 ( .CI(n49), .A(\ab[0][6] ), .B(\ab[1][5] ), .S(\SUMB[1][5] ), 
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
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_14_0 FS ( .A({\A1[13] , 
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
    VMW_FADD S0_0 ( .CI(n54), .A(\ab[0][1] ), .B(\ab[1][0] ), .S(PRODUCT[1]), 
        .CO(\CARRYB[1][0] ) );
    VMW_AND2 U19 ( .A(A[0]), .B(B[3]), .Z(\ab[0][3] ) );
    VMW_AND2 U25 ( .A(A[0]), .B(B[7]), .Z(\ab[0][7] ) );
    VMW_AND2 U37 ( .A(B[5]), .B(A[2]), .Z(\ab[2][5] ) );
    VMW_AND2 U50 ( .A(B[4]), .B(A[3]), .Z(\ab[3][4] ) );
    VMW_AND2 U36 ( .A(A[1]), .B(B[2]), .Z(\ab[1][2] ) );
    VMW_PULLDOWN U4 ( .Z(n50) );
    VMW_FADD S0_1 ( .CI(n53), .A(\ab[0][2] ), .B(\ab[1][1] ), .S(\SUMB[1][1] ), 
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


module VectorDotProduct_pVectorSize4_pWordSize8 ( Clk, Reset, RD, WR, Addr, 
    DataIn, DataOut, vectorAInput, vectorBInput, cOutput );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  [31:0] vectorAInput;
output [7:0] cOutput;
input  [31:0] vectorBInput;
input  Clk, Reset, RD, WR;
    wire n468, \result60[1] , n466, \n374[6] , \result60[5] , \result285[2] , 
        \result285[6] , \n374[2] , n470, n467, \result60[7] , \result285[4] , 
        \result285[0] , \result60[3] , \n374[4] , \n286[2] , \result196[1] , 
        \n197[4] , \n106[3] , n469, \result196[5] , \n286[6] , \n106[7] , 
        \result196[7] , \n286[4] , \result196[3] , \n106[5] , \n197[2] , 
        \n106[8] , \n197[6] , \n286[8] , \n106[1] , n464, n465, \result196[6] , 
        \result196[2] , \n197[7] , \n286[1] , \n286[5] , \result196[4] , 
        \n106[4] , \n197[3] , \n286[7] , \n106[6] , \n197[1] , \result196[0] , 
        \n286[3] , \n197[8] , \n197[5] , \result285[1] , \n106[2] , \n374[5] , 
        \result60[2] , \n374[1] , \result60[6] , \result285[5] , \result60[4] , 
        \n374[8] , \result285[7] , \result60[0] , \n374[3] , \n374[7] , 
        \result285[3] ;
    wire UNCONNECTED_1 , UNCONNECTED_2 , UNCONNECTED_3 , UNCONNECTED_4 , 
	UNCONNECTED_5 , UNCONNECTED_6 , UNCONNECTED_7 , UNCONNECTED_8 , 
	UNCONNECTED_9 , UNCONNECTED_10 , UNCONNECTED_11 , UNCONNECTED_12 , 
	UNCONNECTED_13 , UNCONNECTED_14 , UNCONNECTED_15 , UNCONNECTED_16 , 
	UNCONNECTED_17 , UNCONNECTED_18 , UNCONNECTED_19 , UNCONNECTED_20 , 
	UNCONNECTED_21 , UNCONNECTED_22 , UNCONNECTED_23 , UNCONNECTED_24 , 
	UNCONNECTED_25 , UNCONNECTED_26 , UNCONNECTED_27 , UNCONNECTED_28 , 
	UNCONNECTED_29 , UNCONNECTED_30 , UNCONNECTED_31 , UNCONNECTED_32 ;
    VMW_PULLDOWN U12 ( .Z(n468) );
    VMW_PULLDOWN U13 ( .Z(n466) );
    VMW_PULLDOWN U14 ( .Z(n470) );
    VMW_FD \cOutput_reg[6]  ( .D(\result60[6] ), .CP(Clk), .Q(cOutput[6]) );
    VMW_FD \cOutput_reg[2]  ( .D(\result60[2] ), .CP(Clk), .Q(cOutput[2]) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_0 add_48_1 ( .A({
        \n106[1] , \n106[2] , \n106[3] , \n106[4] , \n106[5] , \n106[6] , 
        \n106[7] , \n106[8] }), .B({\n197[1] , \n197[2] , \n197[3] , \n197[4] , 
        \n197[5] , \n197[6] , \n197[7] , \n197[8] }), .CI(n465), .SUM({
        \result196[7] , \result196[6] , \result196[5] , \result196[4] , 
        \result196[3] , \result196[2] , \result196[1] , \result196[0] }) );
    VMW_FD \cOutput_reg[4]  ( .D(\result60[4] ), .CP(Clk), .Q(cOutput[4]) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_2 mul_48_1 ( .A(
        vectorAInput[15:8]), .B(vectorBInput[15:8]), .TC(n467), .PRODUCT({
        UNCONNECTED_1, UNCONNECTED_2, UNCONNECTED_3, UNCONNECTED_4, 
        UNCONNECTED_5, UNCONNECTED_6, UNCONNECTED_7, UNCONNECTED_8, \n197[1] , 
        \n197[2] , \n197[3] , \n197[4] , \n197[5] , \n197[6] , \n197[7] , 
        \n197[8] }) );
    VMW_FD \cOutput_reg[0]  ( .D(\result60[0] ), .CP(Clk), .Q(cOutput[0]) );
    VMW_PULLDOWN U15 ( .Z(n464) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_3 mul_48 ( .A(
        vectorAInput[7:0]), .B(vectorBInput[7:0]), .TC(n469), .PRODUCT({
        UNCONNECTED_9, UNCONNECTED_10, UNCONNECTED_11, UNCONNECTED_12, 
        UNCONNECTED_13, UNCONNECTED_14, UNCONNECTED_15, UNCONNECTED_16, 
        \n106[1] , \n106[2] , \n106[3] , \n106[4] , \n106[5] , \n106[6] , 
        \n106[7] , \n106[8] }) );
    VMW_PULLDOWN U16 ( .Z(n465) );
    VMW_PULLDOWN U17 ( .Z(n467) );
    VMW_PULLDOWN U18 ( .Z(n469) );
    VMW_FD \cOutput_reg[1]  ( .D(\result60[1] ), .CP(Clk), .Q(cOutput[1]) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_2 add_48_2 ( .A({
        \result196[7] , \result196[6] , \result196[5] , \result196[4] , 
        \result196[3] , \result196[2] , \result196[1] , \result196[0] }), .B({
        \n286[1] , \n286[2] , \n286[3] , \n286[4] , \n286[5] , \n286[6] , 
        \n286[7] , \n286[8] }), .CI(n470), .SUM({\result285[7] , 
        \result285[6] , \result285[5] , \result285[4] , \result285[3] , 
        \result285[2] , \result285[1] , \result285[0] }) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_1 mul_48_3 ( .A(
        vectorAInput[31:24]), .B(vectorBInput[31:24]), .TC(n466), .PRODUCT({
        UNCONNECTED_17, UNCONNECTED_18, UNCONNECTED_19, UNCONNECTED_20, 
        UNCONNECTED_21, UNCONNECTED_22, UNCONNECTED_23, UNCONNECTED_24, 
        \n374[1] , \n374[2] , \n374[3] , \n374[4] , \n374[5] , \n374[6] , 
        \n374[7] , \n374[8] }) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW02_mult_8_8_0 mul_48_2 ( .A(
        vectorAInput[23:16]), .B(vectorBInput[23:16]), .TC(n464), .PRODUCT({
        UNCONNECTED_25, UNCONNECTED_26, UNCONNECTED_27, UNCONNECTED_28, 
        UNCONNECTED_29, UNCONNECTED_30, UNCONNECTED_31, UNCONNECTED_32, 
        \n286[1] , \n286[2] , \n286[3] , \n286[4] , \n286[5] , \n286[6] , 
        \n286[7] , \n286[8] }) );
    VMW_FD \cOutput_reg[7]  ( .D(\result60[7] ), .CP(Clk), .Q(cOutput[7]) );
    VMW_FD \cOutput_reg[5]  ( .D(\result60[5] ), .CP(Clk), .Q(cOutput[5]) );
    VMW_FD \cOutput_reg[3]  ( .D(\result60[3] ), .CP(Clk), .Q(cOutput[3]) );
    VectorDotProduct_pVectorSize4_pWordSize8_DW01_add_8_1 add_48_3 ( .A({
        \result285[7] , \result285[6] , \result285[5] , \result285[4] , 
        \result285[3] , \result285[2] , \result285[1] , \result285[0] }), .B({
        \n374[1] , \n374[2] , \n374[3] , \n374[4] , \n374[5] , \n374[6] , 
        \n374[7] , \n374[8] }), .CI(n468), .SUM({\result60[7] , \result60[6] , 
        \result60[5] , \result60[4] , \result60[3] , \result60[2] , 
        \result60[1] , \result60[0] }) );
endmodule


module main ( Clk, Reset, RD, WR, Addr, DataIn, DataOut );
input  [14:0] Addr;
input  [31:0] DataIn;
output [31:0] DataOut;
input  Clk, Reset, RD, WR;
    wire \matrixInput[53] , \matrixInput[98] , \matrixInput[79] , 
        \matrixInput[60] , \matrixInput[81] , \matrixInput[91] , 
        \matrixInput[88] , \matrixInput[70] , \matrixInput[69] , 
        \matrixInput[43] , \cOutput[6] , \matrixInput[85] , \matrixInput[57] , 
        \matrixInput[64] , \matrixInput[74] , \cOutput[2] , \matrixInput[47] , 
        \matrixInput[97] , \matrixInput[95] , \matrixInput[76] , \cOutput[0] , 
        \matrixInput[45] , \cOutput[9] , \matrixInput[55] , \matrixInput[66] , 
        \matrixInput[87] , \matrixInput[72] , \matrixInput[58] , 
        \matrixInput[41] , \matrixInput[93] , \cOutput[4] , \matrixInput[83] , 
        \matrixInput[51] , \matrixInput[48] , \matrixInput[62] , 
        \matrixInput[122] , \matrixInput[111] , \matrixInput[108] , 
        \cOutput[19] , \vectorInput[3] , \matrixInput[34] , \matrixInput[7] , 
        \matrixInput[24] , \matrixInput[17] , \cOutput[23] , \cOutput[10] , 
        \vectorInput[26] , \vectorInput[15] , \matrixInput[118] , 
        \matrixInput[101] , \matrixInput[30] , \matrixInput[29] , 
        \matrixInput[3] , \vectorInput[22] , \vectorInput[18] , 
        \matrixInput[126] , \matrixInput[115] , \vectorInput[11] , 
        \matrixInput[105] , \cOutput[27] , \vectorInput[7] , \matrixInput[13] , 
        \cOutput[14] , \matrixInput[39] , \matrixInput[20] , \cOutput[25] , 
        \vectorInput[5] , \matrixInput[22] , \matrixInput[11] , \cOutput[16] , 
        \matrixInput[8] , \vectorInput[20] , \vectorInput[13] , 
        \matrixInput[107] , \vectorInput[30] , \vectorInput[29] , 
        \matrixInput[124] , \matrixInput[117] , \matrixInput[32] , 
        \matrixInput[1] , \matrixInput[18] , \vectorInput[24] , 
        \vectorInput[17] , \matrixInput[103] , \vectorInput[1] , 
        \matrixInput[15] , \matrixInput[26] , \cOutput[21] , \cOutput[12] , 
        \cOutput[31] , \cOutput[28] , \vectorInput[8] , \matrixInput[120] , 
        \matrixInput[113] , \matrixInput[36] , \matrixInput[5] , 
        \vectorInput[25] , \vectorInput[16] , \matrixInput[102] , 
        \cOutput[20] , \vectorInput[9] , \vectorInput[0] , \matrixInput[27] , 
        \matrixInput[14] , \cOutput[13] , \matrixInput[37] , \matrixInput[4] , 
        \matrixInput[121] , \matrixInput[112] , \cOutput[30] , \cOutput[29] , 
        \vectorInput[4] , \matrixInput[10] , \matrixInput[23] , 
        \matrixInput[9] , \cOutput[24] , \cOutput[17] , \vectorInput[21] , 
        \vectorInput[12] , \matrixInput[106] , \vectorInput[31] , 
        \vectorInput[28] , \matrixInput[116] , \matrixInput[125] , 
        \matrixInput[33] , \matrixInput[0] , \matrixInput[19] , 
        \matrixInput[31] , \matrixInput[28] , \matrixInput[2] , 
        \vectorInput[23] , \vectorInput[19] , \matrixInput[114] , 
        \vectorInput[10] , \matrixInput[127] , \matrixInput[104] , 
        \matrixInput[12] , \vectorInput[6] , \matrixInput[38] , 
        \matrixInput[21] , \cOutput[26] , \cOutput[15] , \matrixInput[123] , 
        \matrixInput[110] , \matrixInput[109] , \matrixInput[35] , 
        \matrixInput[6] , \cOutput[18] , \cOutput[22] , \vectorInput[27] , 
        \vectorInput[14] , \vectorInput[2] , \matrixInput[16] , \cOutput[11] , 
        \matrixInput[25] , \matrixInput[119] , \matrixInput[100] , 
        \matrixInput[73] , \matrixInput[59] , \matrixInput[40] , 
        \matrixInput[92] , \cOutput[5] , \matrixInput[82] , \matrixInput[50] , 
        \matrixInput[49] , \matrixInput[96] , \matrixInput[63] , \cOutput[1] , 
        \matrixInput[77] , \matrixInput[44] , \matrixInput[54] , \cOutput[8] , 
        \matrixInput[67] , \matrixInput[86] , \matrixInput[84] , 
        \matrixInput[56] , \matrixInput[65] , \cOutput[3] , \matrixInput[75] , 
        \matrixInput[46] , \matrixInput[94] , \matrixInput[52] , 
        \matrixInput[78] , \matrixInput[61] , \matrixInput[99] , 
        \matrixInput[80] , \matrixInput[90] , \matrixInput[89] , 
        \matrixInput[71] , \matrixInput[68] , \matrixInput[42] , \cOutput[7] ;
    IntMatMul_Control_pVectorSize4_pWordSize8_pScan1 U_IntMatMul_Control ( 
        .Clk(Clk), .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(
        DataIn), .DataOut(DataOut), .vectorInput({\vectorInput[31] , 
        \vectorInput[30] , \vectorInput[29] , \vectorInput[28] , 
        \vectorInput[27] , \vectorInput[26] , \vectorInput[25] , 
        \vectorInput[24] , \vectorInput[23] , \vectorInput[22] , 
        \vectorInput[21] , \vectorInput[20] , \vectorInput[19] , 
        \vectorInput[18] , \vectorInput[17] , \vectorInput[16] , 
        \vectorInput[15] , \vectorInput[14] , \vectorInput[13] , 
        \vectorInput[12] , \vectorInput[11] , \vectorInput[10] , 
        \vectorInput[9] , \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , 
        \vectorInput[5] , \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , 
        \vectorInput[1] , \vectorInput[0] }), .matrixInput({\matrixInput[127] , 
        \matrixInput[126] , \matrixInput[125] , \matrixInput[124] , 
        \matrixInput[123] , \matrixInput[122] , \matrixInput[121] , 
        \matrixInput[120] , \matrixInput[119] , \matrixInput[118] , 
        \matrixInput[117] , \matrixInput[116] , \matrixInput[115] , 
        \matrixInput[114] , \matrixInput[113] , \matrixInput[112] , 
        \matrixInput[111] , \matrixInput[110] , \matrixInput[109] , 
        \matrixInput[108] , \matrixInput[107] , \matrixInput[106] , 
        \matrixInput[105] , \matrixInput[104] , \matrixInput[103] , 
        \matrixInput[102] , \matrixInput[101] , \matrixInput[100] , 
        \matrixInput[99] , \matrixInput[98] , \matrixInput[97] , 
        \matrixInput[96] , \matrixInput[95] , \matrixInput[94] , 
        \matrixInput[93] , \matrixInput[92] , \matrixInput[91] , 
        \matrixInput[90] , \matrixInput[89] , \matrixInput[88] , 
        \matrixInput[87] , \matrixInput[86] , \matrixInput[85] , 
        \matrixInput[84] , \matrixInput[83] , \matrixInput[82] , 
        \matrixInput[81] , \matrixInput[80] , \matrixInput[79] , 
        \matrixInput[78] , \matrixInput[77] , \matrixInput[76] , 
        \matrixInput[75] , \matrixInput[74] , \matrixInput[73] , 
        \matrixInput[72] , \matrixInput[71] , \matrixInput[70] , 
        \matrixInput[69] , \matrixInput[68] , \matrixInput[67] , 
        \matrixInput[66] , \matrixInput[65] , \matrixInput[64] , 
        \matrixInput[63] , \matrixInput[62] , \matrixInput[61] , 
        \matrixInput[60] , \matrixInput[59] , \matrixInput[58] , 
        \matrixInput[57] , \matrixInput[56] , \matrixInput[55] , 
        \matrixInput[54] , \matrixInput[53] , \matrixInput[52] , 
        \matrixInput[51] , \matrixInput[50] , \matrixInput[49] , 
        \matrixInput[48] , \matrixInput[47] , \matrixInput[46] , 
        \matrixInput[45] , \matrixInput[44] , \matrixInput[43] , 
        \matrixInput[42] , \matrixInput[41] , \matrixInput[40] , 
        \matrixInput[39] , \matrixInput[38] , \matrixInput[37] , 
        \matrixInput[36] , \matrixInput[35] , \matrixInput[34] , 
        \matrixInput[33] , \matrixInput[32] , \matrixInput[31] , 
        \matrixInput[30] , \matrixInput[29] , \matrixInput[28] , 
        \matrixInput[27] , \matrixInput[26] , \matrixInput[25] , 
        \matrixInput[24] , \matrixInput[23] , \matrixInput[22] , 
        \matrixInput[21] , \matrixInput[20] , \matrixInput[19] , 
        \matrixInput[18] , \matrixInput[17] , \matrixInput[16] , 
        \matrixInput[15] , \matrixInput[14] , \matrixInput[13] , 
        \matrixInput[12] , \matrixInput[11] , \matrixInput[10] , 
        \matrixInput[9] , \matrixInput[8] , \matrixInput[7] , \matrixInput[6] , 
        \matrixInput[5] , \matrixInput[4] , \matrixInput[3] , \matrixInput[2] , 
        \matrixInput[1] , \matrixInput[0] }), .cOutput({\cOutput[31] , 
        \cOutput[30] , \cOutput[29] , \cOutput[28] , \cOutput[27] , 
        \cOutput[26] , \cOutput[25] , \cOutput[24] , \cOutput[23] , 
        \cOutput[22] , \cOutput[21] , \cOutput[20] , \cOutput[19] , 
        \cOutput[18] , \cOutput[17] , \cOutput[16] , \cOutput[15] , 
        \cOutput[14] , \cOutput[13] , \cOutput[12] , \cOutput[11] , 
        \cOutput[10] , \cOutput[9] , \cOutput[8] , \cOutput[7] , \cOutput[6] , 
        \cOutput[5] , \cOutput[4] , \cOutput[3] , \cOutput[2] , \cOutput[1] , 
        \cOutput[0] }) );
    VectorDotProduct_pVectorSize4_pWordSize8 VectorDotProduct_1 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[31] , \vectorInput[30] , 
        \vectorInput[29] , \vectorInput[28] , \vectorInput[27] , 
        \vectorInput[26] , \vectorInput[25] , \vectorInput[24] , 
        \vectorInput[23] , \vectorInput[22] , \vectorInput[21] , 
        \vectorInput[20] , \vectorInput[19] , \vectorInput[18] , 
        \vectorInput[17] , \vectorInput[16] , \vectorInput[15] , 
        \vectorInput[14] , \vectorInput[13] , \vectorInput[12] , 
        \vectorInput[11] , \vectorInput[10] , \vectorInput[9] , 
        \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , 
        \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , 
        \vectorInput[0] }), .vectorBInput({\matrixInput[63] , 
        \matrixInput[62] , \matrixInput[61] , \matrixInput[60] , 
        \matrixInput[59] , \matrixInput[58] , \matrixInput[57] , 
        \matrixInput[56] , \matrixInput[55] , \matrixInput[54] , 
        \matrixInput[53] , \matrixInput[52] , \matrixInput[51] , 
        \matrixInput[50] , \matrixInput[49] , \matrixInput[48] , 
        \matrixInput[47] , \matrixInput[46] , \matrixInput[45] , 
        \matrixInput[44] , \matrixInput[43] , \matrixInput[42] , 
        \matrixInput[41] , \matrixInput[40] , \matrixInput[39] , 
        \matrixInput[38] , \matrixInput[37] , \matrixInput[36] , 
        \matrixInput[35] , \matrixInput[34] , \matrixInput[33] , 
        \matrixInput[32] }), .cOutput({\cOutput[15] , \cOutput[14] , 
        \cOutput[13] , \cOutput[12] , \cOutput[11] , \cOutput[10] , 
        \cOutput[9] , \cOutput[8] }) );
    VectorDotProduct_pVectorSize4_pWordSize8 VectorDotProduct_2 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[31] , \vectorInput[30] , 
        \vectorInput[29] , \vectorInput[28] , \vectorInput[27] , 
        \vectorInput[26] , \vectorInput[25] , \vectorInput[24] , 
        \vectorInput[23] , \vectorInput[22] , \vectorInput[21] , 
        \vectorInput[20] , \vectorInput[19] , \vectorInput[18] , 
        \vectorInput[17] , \vectorInput[16] , \vectorInput[15] , 
        \vectorInput[14] , \vectorInput[13] , \vectorInput[12] , 
        \vectorInput[11] , \vectorInput[10] , \vectorInput[9] , 
        \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , 
        \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , 
        \vectorInput[0] }), .vectorBInput({\matrixInput[95] , 
        \matrixInput[94] , \matrixInput[93] , \matrixInput[92] , 
        \matrixInput[91] , \matrixInput[90] , \matrixInput[89] , 
        \matrixInput[88] , \matrixInput[87] , \matrixInput[86] , 
        \matrixInput[85] , \matrixInput[84] , \matrixInput[83] , 
        \matrixInput[82] , \matrixInput[81] , \matrixInput[80] , 
        \matrixInput[79] , \matrixInput[78] , \matrixInput[77] , 
        \matrixInput[76] , \matrixInput[75] , \matrixInput[74] , 
        \matrixInput[73] , \matrixInput[72] , \matrixInput[71] , 
        \matrixInput[70] , \matrixInput[69] , \matrixInput[68] , 
        \matrixInput[67] , \matrixInput[66] , \matrixInput[65] , 
        \matrixInput[64] }), .cOutput({\cOutput[23] , \cOutput[22] , 
        \cOutput[21] , \cOutput[20] , \cOutput[19] , \cOutput[18] , 
        \cOutput[17] , \cOutput[16] }) );
    VectorDotProduct_pVectorSize4_pWordSize8 VectorDotProduct_3 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[31] , \vectorInput[30] , 
        \vectorInput[29] , \vectorInput[28] , \vectorInput[27] , 
        \vectorInput[26] , \vectorInput[25] , \vectorInput[24] , 
        \vectorInput[23] , \vectorInput[22] , \vectorInput[21] , 
        \vectorInput[20] , \vectorInput[19] , \vectorInput[18] , 
        \vectorInput[17] , \vectorInput[16] , \vectorInput[15] , 
        \vectorInput[14] , \vectorInput[13] , \vectorInput[12] , 
        \vectorInput[11] , \vectorInput[10] , \vectorInput[9] , 
        \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , 
        \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , 
        \vectorInput[0] }), .vectorBInput({\matrixInput[127] , 
        \matrixInput[126] , \matrixInput[125] , \matrixInput[124] , 
        \matrixInput[123] , \matrixInput[122] , \matrixInput[121] , 
        \matrixInput[120] , \matrixInput[119] , \matrixInput[118] , 
        \matrixInput[117] , \matrixInput[116] , \matrixInput[115] , 
        \matrixInput[114] , \matrixInput[113] , \matrixInput[112] , 
        \matrixInput[111] , \matrixInput[110] , \matrixInput[109] , 
        \matrixInput[108] , \matrixInput[107] , \matrixInput[106] , 
        \matrixInput[105] , \matrixInput[104] , \matrixInput[103] , 
        \matrixInput[102] , \matrixInput[101] , \matrixInput[100] , 
        \matrixInput[99] , \matrixInput[98] , \matrixInput[97] , 
        \matrixInput[96] }), .cOutput({\cOutput[31] , \cOutput[30] , 
        \cOutput[29] , \cOutput[28] , \cOutput[27] , \cOutput[26] , 
        \cOutput[25] , \cOutput[24] }) );
    VectorDotProduct_pVectorSize4_pWordSize8 VectorDotProduct_0 ( .Clk(Clk), 
        .Reset(Reset), .RD(RD), .WR(WR), .Addr(Addr), .DataIn(DataIn), 
        .DataOut(DataOut), .vectorAInput({\vectorInput[31] , \vectorInput[30] , 
        \vectorInput[29] , \vectorInput[28] , \vectorInput[27] , 
        \vectorInput[26] , \vectorInput[25] , \vectorInput[24] , 
        \vectorInput[23] , \vectorInput[22] , \vectorInput[21] , 
        \vectorInput[20] , \vectorInput[19] , \vectorInput[18] , 
        \vectorInput[17] , \vectorInput[16] , \vectorInput[15] , 
        \vectorInput[14] , \vectorInput[13] , \vectorInput[12] , 
        \vectorInput[11] , \vectorInput[10] , \vectorInput[9] , 
        \vectorInput[8] , \vectorInput[7] , \vectorInput[6] , \vectorInput[5] , 
        \vectorInput[4] , \vectorInput[3] , \vectorInput[2] , \vectorInput[1] , 
        \vectorInput[0] }), .vectorBInput({\matrixInput[31] , 
        \matrixInput[30] , \matrixInput[29] , \matrixInput[28] , 
        \matrixInput[27] , \matrixInput[26] , \matrixInput[25] , 
        \matrixInput[24] , \matrixInput[23] , \matrixInput[22] , 
        \matrixInput[21] , \matrixInput[20] , \matrixInput[19] , 
        \matrixInput[18] , \matrixInput[17] , \matrixInput[16] , 
        \matrixInput[15] , \matrixInput[14] , \matrixInput[13] , 
        \matrixInput[12] , \matrixInput[11] , \matrixInput[10] , 
        \matrixInput[9] , \matrixInput[8] , \matrixInput[7] , \matrixInput[6] , 
        \matrixInput[5] , \matrixInput[4] , \matrixInput[3] , \matrixInput[2] , 
        \matrixInput[1] , \matrixInput[0] }), .cOutput({\cOutput[7] , 
        \cOutput[6] , \cOutput[5] , \cOutput[4] , \cOutput[3] , \cOutput[2] , 
        \cOutput[1] , \cOutput[0] }) );
endmodule

