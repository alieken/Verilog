//: version "2.0-b10"

//: property encoding = "iso8859-1"

//: property locale = "en"

//: property prefix = "_GG"

//: property title = "proje.v"

//: property timingViolationMode = 2

//: property initTime = "0 ns"



`timescale 1ns/1ns



//: /netlistBegin main

module main;    //: root_module

reg w6;    //: /sn:0 {0}(103,157)(380,157){1}

reg w3;    //: /sn:0 {0}(65,212)(238,212)(238,173)(380,173){1}

reg w1;    //: /sn:0 {0}(228,359)(310,359)(310,205)(380,205){1}

reg w2;    //: /sn:0 {0}(88,277)(269,277)(269,189)(380,189){1}

wire w4;    //: /sn:0 {0}(190,40)(365,40)(365,141)(380,141){1}

wire w5;    //: /sn:0 {0}(741,71)(741,141)(553,141){1}

//: enddecls



  //: SWITCH g4 (w2) @(71,277) /sn:0 /w:[ 0 ] /st:1 /dn:1

  //: SWITCH g3 (w3) @(48,212) /sn:0 /w:[ 0 ] /st:1 /dn:1

  _GGCLOCK_P100_0_50 g2 (.Z(w4));   //: @(177,40) /sn:0 /w:[ 0 ] /omega:100 /phi:0 /duty:50

  //: SWITCH g1 (w6) @(86,157) /sn:0 /w:[ 0 ] /st:0 /dn:1

  //: LED g6 (w5) @(741,64) /sn:0 /w:[ 0 ] /type:0

  //: SWITCH g5 (w1) @(211,359) /sn:0 /w:[ 0 ] /st:1 /dn:1

  deneme g0 (.clk(w4), .reset(w6), .direksiyon(w3), .emniyet_k(w2), .goz(w1), .sonuc(w5));   //: @(381, 125) /sz:(171, 112) /sn:0 /p:[ Li0>1 Li1>1 Li2>1 Li3>1 Li4>1 Ro0<1 ]



endmodule

//: /netlistEnd



//: /hdlBegin deneme

//: interface  /sz:(171, 112) /bd:[ Li0>goz(80/112) Li1>emniyet_k(64/112) Li2>direksiyon(48/112) Li3>reset(32/112) Li4>clk(16/112) Ro0<sonuc(16/112) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1

//: enddecls

module deneme(clk,reset,direksiyon,emniyet_k,goz);

  input clk,reset,direksiyon,emniyet_k,goz;

  output reg sonuc;

  reg [1:0] state;

  parameter S0 = 2'b00;

  parameter S1 = 2'b01;

  

  always@(posedge clk)

    begin

      if(reset==0)

        begin

          reset<=1;

          direksiyon<=1;

          emniyet_k<=1;

          goz<=1;

          state<=S0;

        end

      

    end

  

  always@(*)

    begin

      case(state)

        S0:

          begin

            sonuc<=1;

            if(direksiyon==0 && emniyet_k==0 && goz==0)

              begin

                state<=S1;

              end

          end  

        S1:

          begin

            sonuc<=0;

            if(direksiyon!=0 || emniyet_k!=0 || goz!=0)

              begin

                state<=S0;

              end

          end       

      endcase

    end

endmodule

//: /hdlEnd





`timescale 1ns/1ns



