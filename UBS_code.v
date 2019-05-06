//UNIVERSAL BARREL SHIFTER CODE
//LOGICAL SHIFT LEFT/RIGHT, ROTATE LEFT/RIGHT BY 1,2,3 OR 4 PLACES
//ARITHMETIC SHIFT LEFT/RIGHT BY 0,1,2 OR 3 PLACES

module ubs(q,a,sel,clk,rst);
output reg[7:0] q;
input [7:0] a;
input [4:0] sel;
input clk;
input rst;

always@(posedge clk)
begin
	if(rst)
	begin
	q<=8'b0;
	end
end

always@(posedge clk)
begin
	if(!rst)
	begin
	case(sel)
	(00000||10000): begin q <= {a[6],a[5],a[4],a[3],a[2],a[1],a[0],1'b0}; $display("Here");end //Logical shift left or Arithmetic shift left by 1
	(00001||10001): begin q <= {a[5],a[4],a[3],a[2],a[1],a[0],2'b00}; end  //by 2 
	(00010||10010): begin q <= {a[4],a[3],a[2],a[1],a[0],3'b000}; end //by 3 
	(00011||10011): begin q <= {a[3],a[2],a[1],a[0],4'b0000}; end //by 4

	00100: begin q <= {1'b0,a[7],a[6],a[5],a[4],a[3],a[2],a[1]}; end //Logical Shift Right by 1
	00101: begin q <= {2'b00,a[7],a[6],a[5],a[4],a[3],a[2]}; end //by 2
	00110: begin q <= {3'b000,a[7],a[6],a[5],a[4],a[3]}; end //by 3
	00111: begin q <= {4'b0000,a[7],a[6],a[5],a[4]}; end //by 4

	01000: begin q <= {a[6],a[5],a[4],a[3],a[2],a[1],a[0],a[7]}; end //Logical Rotate left by 1
	01001: begin q <= {a[5],a[4],a[3],a[2],a[1],a[0],a[7],a[6]}; end //by 2
	01010: begin q <= {a[4],a[3],a[2],a[1],a[0],a[7],a[6],a[5]}; end //by 3
	01011: begin q <= {a[3],a[2],a[1],a[0],a[7],a[6],a[5],a[4]}; end //by 4

	01100: begin q <= {a[0],a[7],a[6],a[5],a[4],a[3],a[2],a[1]}; end //Logical Rotate Right by 1
	01101: begin q <= {a[1],a[0],a[7],a[6],a[5],a[4],a[3],a[2]}; end //by 2
	01110: begin q <= {a[2],a[1],a[0],a[7],a[6],a[5],a[4],a[3]}; end //by 3
	01111: begin q <= {a[3],a[2],a[1],a[0],a[7],a[6],a[5],a[4]}; end //by 4

	10100: begin q <= {a[7],a[7],a[6],a[5],a[4],a[3],a[2],a[1]}; end //Arithmetic Shift Right by 1
	10101: begin q <= {a[7],a[7],a[7],a[6],a[5],a[4],a[3],a[2]}; end //by 2
	10110: begin q <= {a[7],a[7],a[7],a[7],a[6],a[5],a[4],a[3]}; end //by 3
	10111: begin q <= {a[7],a[7],a[7],a[7],a[7],a[6],a[5],a[4]}; end //by 4
	endcase
	end

	else if(rst)
	begin 
		q = 8'b0;
	end
end
endmodule 