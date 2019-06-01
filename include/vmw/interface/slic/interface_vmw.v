
module interface ( Clk, PBusResetN, PBusRDN, PBusWRN, PBusReadyN, Reset, RD, 
    WR );
input  Clk, PBusResetN, PBusRDN, PBusWRN;
output PBusReadyN, Reset, RD, WR;
    wire State123, State;
    VMW_AO21 U39 ( .A(PBusWRN), .B(PBusRDN), .C(State), .Z(PBusReadyN) );
    VMW_NOR2 U40 ( .A(PBusWRN), .B(State), .Z(WR) );
    VMW_INV U41 ( .A(PBusResetN), .Z(Reset) );
    VMW_NOR2 U42 ( .A(PBusRDN), .B(State), .Z(RD) );
    VMW_NOR2 U43 ( .A(Reset), .B(PBusReadyN), .Z(State123) );
    VMW_FD State_reg ( .D(State123), .CP(Clk), .Q(State) );
endmodule

