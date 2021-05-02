`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 11:57:47 AM
// Design Name: 
// Module Name: vm_2lut
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


module vm_2lut(xr1,xr2,xr3,xr4,xi1,xi2,xi3,xi4,ar1,ar2,ar3,ar4,ai1,ai2,ai3,ai4,clk,yr,yi);
input clk;
input [7:0]xr1,xr2,xr3,xr4,xi1,xi2,xi3,xi4;
input [31:0]ar1,ar2,ar3,ar4,ai1,ai2,ai3,ai4;
output reg [31:0]yr,yi;
wire [7:0]n1,n2,n3,n4,n5,n6,n7,n8;
reg [31:0]lout1,lout2;
reg [31:0]ACC_shift,ACC,y1,y2,ac2,ac2shf;
reg w,check=1'b1;
reg [2:0]i,j;
initial
begin 
   ACC=0;ACC_shift=0;i=0;ac2=0;ac2shf=0;j=0;
end 
assign {n1,n2,n3,n4,n5,n6,n7,n8}=(check)?{xr1,xr2,xr3,xr4,xi1,xi2,xi3,xi4}:{xi1,xi2,xi3,xi4,xr1,xr2,xr3,xr4};
always@(posedge clk)
    begin  
        case({n1[i],n2[i],n3[i],n4[i]})
           0:lout1=0;
           1:lout1=ar4;
           2:lout1=ar3;
           3:lout1= ar4+ar3;
           4:lout1=ar2;
           5:lout1=ar2+ar4;
           6:lout1=ar2+ar3;
           7:lout1=ar2+ar3+ar4;
           8:lout1=ar1;
           9:lout1=ar1+ar4;
           10:lout1=ar1+ar3;
           11:lout1=ar1+ar3+ar4;
           12:lout1=ar1+ar2;
           13:lout1=ar1+ar2+ar4;
           14:lout1=ar1+ar2+ar3;
           15:lout1=ar1+ar2+ar3+ar4;
       endcase
       if(i==7)
        begin
          ACC=(ACC_shift)-lout1;
          y1=ACC;
          check<=(~check);
          i=0;ACC=0;ACC_shift=0;
          end
        else if(i<7)
        begin
         ACC=(ACC_shift)+lout1;
         w=ACC[31];
         ACC_shift=(ACC>>1);
         ACC_shift[31]=w;
         i=i+1;
         end
       end
always@(posedge clk)
        begin  
        case({n5[j],n6[j],n7[j],n8[j]})
                  0:lout2=0;
                  1:lout2=ai4;
                  2:lout2=ai3;
                  3:lout2= ai4+ai3;
                  4:lout2=ai2;
                  5:lout2=ai2+ai4;
                  6:lout2=ai2+ai3;
                  7:lout2=ai2+ai3+ai4;
                  8:lout2=ai1;
                  9:lout2=ai1+ai4;
                  10:lout2=ai1+ai3;
                  11:lout2=ai1+ai3+ai4;
                  12:lout2=ai1+ai2;
                  13:lout2=ai1+ai2+ai4;
                  14:lout2=ai1+ai2+ai3;
                  15:lout2=ai1+ai2+ai3+ai4;
              endcase
              if(j==7)
               begin
                 ac2=(ac2shf)-lout2;
                 y2=ac2;
                 j=0;ac2=0;ac2shf=0;
                 end
               else if(j<7)
               begin
                ac2=(ac2shf)+lout2;
                w=ac2[31];
                ac2shf=(ac2>>1);
                ac2shf[31]=w;
                j=j+1;
                end
              end
always @(y1 or y2 or check)
{yr,yi}=check?{32'd0,(y1+y2)}:{(y1-y2),32'd0};
endmodule


