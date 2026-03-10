# PIPELINE-PROCESSOR-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: PICHHIKA SARVANI

*INTERN ID*: CTIS6955

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTHOSH KUMAR

## DESCRIPTION OF TASK

The task involved designing and simulating a basic pipelined processor using the Verilog Hardware Description Language (HDL). The objective of this project was to understand the concept of instruction pipelining and demonstrate how multiple instructions can be executed simultaneously by dividing the processor operation into several stages. The processor was implemented with a simple instruction set including arithmetic operations such as ADD, SUB, and a memory operation LOAD. The design focused on creating a functional processor architecture capable of executing instructions in a pipeline while demonstrating the behavior through simulation waveforms.

The processor architecture was divided into four major stages: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), and Write Back (WB). Each stage performs a specific task in the instruction processing cycle. In the Instruction Fetch stage, the processor retrieves the instruction from the instruction memory using a Program Counter (PC). The PC holds the address of the current instruction and increments after each clock cycle to fetch the next instruction. The fetched instruction is stored in a pipeline register (IF/ID register) so that it can be passed to the next stage in the following clock cycle.

In the Instruction Decode stage, the instruction fetched from memory is analyzed to determine the operation to be performed and the registers involved. The opcode and register fields are extracted from the instruction. The source registers are then read from the register file, and their corresponding values are forwarded to the next pipeline stage. These values and control signals are stored in another pipeline register (ID/EX register), which ensures proper synchronization between stages.

The Execute stage performs the actual computation. In this stage, the Arithmetic Logic Unit (ALU) carries out operations such as addition or subtraction based on the opcode decoded in the previous stage. For the LOAD instruction, the processor accesses the data memory to retrieve the required data. The result of the computation or memory access is then stored in the EX/WB pipeline register for the final stage.

The final stage is the Write Back stage. In this stage, the result produced by the Execute stage is written back into the destination register in the register file. This completes the execution of the instruction. Because the processor is pipelined, while one instruction is being written back, other instructions are simultaneously being decoded, executed, and fetched, thereby improving the overall throughput of the processor.

The design was implemented using Verilog modules, registers, and synchronous logic triggered by the clock signal. A testbench was created to simulate the processor operation and provide input instructions to verify functionality. Simulation was performed using a hardware simulation tool, and the waveform results were analyzed to confirm the correct operation of each pipeline stage. Signals such as the Program Counter, pipeline registers, ALU outputs, and register file contents were monitored during simulation.

The results demonstrated that the pipelined processor successfully executed multiple instructions in overlapping stages, validating the concept of instruction pipelining and improving execution efficiency compared to a non-pipelined architecture.

## OUTPUT

