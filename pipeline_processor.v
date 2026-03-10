module pipeline_processor(
    input clk,
    input reset
);

// Program Counter
reg [3:0] PC;

// Memories
reg [15:0] instruction_memory [0:15];
reg [15:0] data_memory [0:15];
reg [15:0] register_file [0:7];

// Pipeline registers
reg [15:0] IF_ID_instruction;

reg [3:0] ID_EX_opcode;
reg [3:0] ID_EX_rd;
reg [15:0] ID_EX_A;
reg [15:0] ID_EX_B;
reg [3:0] ID_EX_addr;

reg [15:0] EX_WB_result;
reg [3:0] EX_WB_rd;
reg [3:0] EX_WB_opcode;


// ================= IF STAGE =================
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        PC <= 0;
        IF_ID_instruction <= 0;
    end
    else
    begin
        IF_ID_instruction <= instruction_memory[PC];
        PC <= PC + 1;
    end
end


// ================= ID STAGE =================
always @(posedge clk)
begin
    ID_EX_opcode <= IF_ID_instruction[15:12];
    ID_EX_rd     <= IF_ID_instruction[11:8];

    ID_EX_A      <= register_file[IF_ID_instruction[7:4]];
    ID_EX_B      <= register_file[IF_ID_instruction[3:0]];

    ID_EX_addr   <= IF_ID_instruction[3:0];
end


// ================= EX STAGE =================
always @(posedge clk)
begin
    case(ID_EX_opcode)

        4'b0001: EX_WB_result <= ID_EX_A + ID_EX_B;  // ADD

        4'b0010: EX_WB_result <= ID_EX_A - ID_EX_B;  // SUB

        4'b0011: EX_WB_result <= data_memory[ID_EX_addr]; // LOAD

        default: EX_WB_result <= 0;

    endcase

    EX_WB_rd <= ID_EX_rd;
    EX_WB_opcode <= ID_EX_opcode;
end


// ================= WB STAGE =================
always @(posedge clk)
begin
    if(EX_WB_opcode == 4'b0001 ||
       EX_WB_opcode == 4'b0010 ||
       EX_WB_opcode == 4'b0011)
    begin
        register_file[EX_WB_rd] <= EX_WB_result;
    end
end

endmodule
