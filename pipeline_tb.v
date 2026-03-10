module pipeline_tb;

reg clk;
reg reset;

pipeline_processor uut(
    .clk(clk),
    .reset(reset)
);

// Clock
always #5 clk = ~clk;


initial
begin
clk = 0;
reset = 1;

#20 reset = 0;


// Register initialization
uut.register_file[0] = 0;
uut.register_file[1] = 10;
uut.register_file[2] = 5;
uut.register_file[3] = 0;
uut.register_file[4] = 0;
uut.register_file[5] = 0;


// Data memory
uut.data_memory[3] = 20;


// Instruction Memory
// ADD R3 = R1 + R2
uut.instruction_memory[0] = 16'b0001_0011_0001_0010;

// SUB R4 = R1 - R2
uut.instruction_memory[1] = 16'b0010_0100_0001_0010;

// LOAD R5 = MEM[3]
uut.instruction_memory[2] = 16'b0011_0101_0000_0011;


// Remaining instructions = 0
uut.instruction_memory[3] = 16'b0;
uut.instruction_memory[4] = 16'b0;

end


// Monitor values
initial
begin
$monitor("Time=%0t | R3=%0d | R4=%0d | R5=%0d",
          $time,
          uut.register_file[3],
          uut.register_file[4],
          uut.register_file[5]);
end


initial
begin
#200;

$display("\nFINAL RESULTS");
$display("R3 = %d", uut.register_file[3]);
$display("R4 = %d", uut.register_file[4]);
$display("R5 = %d", uut.register_file[5]);

$finish;

end

endmodule
