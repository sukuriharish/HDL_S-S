`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 18:51:17
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder( output carry,sum, input a,b, cin

    );
  wire c,t1,t2,t3,t4;
   assign t1=a^b;
   assign sum=t1^cin;
   assign t3=t1&cin;
   assign t2=a&b;
   assign  t4=cin&t1;
   assign carry=t2|t4;
endmodule
