`timescale 1ns / 1ps

module Debugger (

		input clock,

		input [31:0] cpu_if_pc,
		input [31:0] cpu_if_nextPc,
		input [31:0] cpu_if_instruction,
		input [31:0] cpu_id_instruction,
		input [32 * 32 - 1 : 0] cpu_id_registers,
		input [31:0] cpu_ex_instruction,
		input [31:0] cpu_ex_aluInputA,
		input [31:0] cpu_ex_aluInputB,
		input [31:0] cpu_ex_aluOutput,
		input [31:0] cpu_mem_instruction,
		input [31:0] cpu_mem_memoryAddress,
		input [31:0] cpu_mem_memoryReadData,
		input cpu_mem_shouldWriteMemory,
		input [31:0] cpu_mem_memoryWriteData,
		input [31:0] cpu_wb_instruction,
		input cpu_wb_shouldWriteRegister,
		input [4:0] cpu_wb_registerWriteAddress,
		input [31:0] cpu_wb_registerWriteData,

		output reg [11:0] terminalAddress = 0,
		output shouldWriteTerminal,
		output reg [7:0] terminalWriteData = 0
	);

	localparam TERMINAL_ADDRESS_MAX = 2399;

	assign shouldWriteTerminal = 1;

	wire [11:0] nextTerminalAddress = terminalAddress < TERMINAL_ADDRESS_MAX ? terminalAddress + 1'b1 : 0;

	wire [31:0] disassemblerInput =
			nextTerminalAddress >= 170 && nextTerminalAddress < 202 ? cpu_if_instruction
			: nextTerminalAddress >= 410 && nextTerminalAddress < 442 ? cpu_id_instruction
			: nextTerminalAddress >= 1210 && nextTerminalAddress < 1242 ? cpu_ex_instruction
			: nextTerminalAddress >= 1531 && nextTerminalAddress < 1563 ? cpu_mem_instruction
			: nextTerminalAddress >= 1850 && nextTerminalAddress < 1882 ? cpu_wb_instruction
			: 32'hFFFFFFFF;
	wire [32 * 8 - 1 : 0] disassemblerOutput;
	Disassembler disassembler (
		.instruction(disassemblerInput[31:0]),
		.text(disassemblerOutput[32 * 8 - 1 : 0])
	);

	// XST doesn't accept {cpu_id_registers[32 * 32 - 1 : 31 * 32]}[31 - 4 * (nextTerminalAddress - 560) -: 4]
	wire [31:0] cpu_id_register0 = cpu_id_registers[1 * 32 - 1 : 0 * 32];
	wire [31:0] cpu_id_register1 = cpu_id_registers[2 * 32 - 1 : 1 * 32];
	wire [31:0] cpu_id_register2 = cpu_id_registers[3 * 32 - 1 : 2 * 32];
	wire [31:0] cpu_id_register3 = cpu_id_registers[4 * 32 - 1 : 3 * 32];
	wire [31:0] cpu_id_register4 = cpu_id_registers[5 * 32 - 1 : 4 * 32];
	wire [31:0] cpu_id_register5 = cpu_id_registers[6 * 32 - 1 : 5 * 32];
	wire [31:0] cpu_id_register6 = cpu_id_registers[7 * 32 - 1 : 6 * 32];
	wire [31:0] cpu_id_register7 = cpu_id_registers[8 * 32 - 1 : 7 * 32];
	wire [31:0] cpu_id_register8 = cpu_id_registers[9 * 32 - 1 : 8 * 32];
	wire [31:0] cpu_id_register9 = cpu_id_registers[10 * 32 - 1 : 9 * 32];
	wire [31:0] cpu_id_register10 = cpu_id_registers[11 * 32 - 1 : 10 * 32];
	wire [31:0] cpu_id_register11 = cpu_id_registers[12 * 32 - 1 : 11 * 32];
	wire [31:0] cpu_id_register12 = cpu_id_registers[13 * 32 - 1 : 12 * 32];
	wire [31:0] cpu_id_register13 = cpu_id_registers[14 * 32 - 1 : 13 * 32];
	wire [31:0] cpu_id_register14 = cpu_id_registers[15 * 32 - 1 : 14 * 32];
	wire [31:0] cpu_id_register15 = cpu_id_registers[16 * 32 - 1 : 15 * 32];
	wire [31:0] cpu_id_register16 = cpu_id_registers[17 * 32 - 1 : 16 * 32];
	wire [31:0] cpu_id_register17 = cpu_id_registers[18 * 32 - 1 : 17 * 32];
	wire [31:0] cpu_id_register18 = cpu_id_registers[19 * 32 - 1 : 18 * 32];
	wire [31:0] cpu_id_register19 = cpu_id_registers[20 * 32 - 1 : 19 * 32];
	wire [31:0] cpu_id_register20 = cpu_id_registers[21 * 32 - 1 : 20 * 32];
	wire [31:0] cpu_id_register21 = cpu_id_registers[22 * 32 - 1 : 21 * 32];
	wire [31:0] cpu_id_register22 = cpu_id_registers[23 * 32 - 1 : 22 * 32];
	wire [31:0] cpu_id_register23 = cpu_id_registers[24 * 32 - 1 : 23 * 32];
	wire [31:0] cpu_id_register24 = cpu_id_registers[25 * 32 - 1 : 24 * 32];
	wire [31:0] cpu_id_register25 = cpu_id_registers[26 * 32 - 1 : 25 * 32];
	wire [31:0] cpu_id_register26 = cpu_id_registers[27 * 32 - 1 : 26 * 32];
	wire [31:0] cpu_id_register27 = cpu_id_registers[28 * 32 - 1 : 27 * 32];
	wire [31:0] cpu_id_register28 = cpu_id_registers[29 * 32 - 1 : 28 * 32];
	wire [31:0] cpu_id_register29 = cpu_id_registers[30 * 32 - 1 : 29 * 32];
	wire [31:0] cpu_id_register30 = cpu_id_registers[31 * 32 - 1 : 30 * 32];
	wire [31:0] cpu_id_register31 = cpu_id_registers[32 * 32 - 1 : 31 * 32];

	wire [3:0] hexCharacterInput =
			nextTerminalAddress >= 246 && nextTerminalAddress < 254 ? cpu_if_pc[31 - 4 * (nextTerminalAddress - 246) -: 4]
			: nextTerminalAddress >= 291 && nextTerminalAddress < 299 ? cpu_if_nextPc[31 - 4 * (nextTerminalAddress - 291) -: 4]
			: nextTerminalAddress >= 562 && nextTerminalAddress < 570 ? cpu_id_register0[31 - 4 * (nextTerminalAddress - 562) -: 4]
			: nextTerminalAddress >= 579 && nextTerminalAddress < 587 ? cpu_id_register1[31 - 4 * (nextTerminalAddress - 579) -: 4]
			: nextTerminalAddress >= 596 && nextTerminalAddress < 604 ? cpu_id_register2[31 - 4 * (nextTerminalAddress - 596) -: 4]
			: nextTerminalAddress >= 613 && nextTerminalAddress < 621 ? cpu_id_register3[31 - 4 * (nextTerminalAddress - 613) -: 4]
			: nextTerminalAddress >= 630 && nextTerminalAddress < 638 ? cpu_id_register4[31 - 4 * (nextTerminalAddress - 630) -: 4]
			: nextTerminalAddress >= 642 && nextTerminalAddress < 650 ? cpu_id_register5[31 - 4 * (nextTerminalAddress - 642) -: 4]
			: nextTerminalAddress >= 659 && nextTerminalAddress < 667 ? cpu_id_register6[31 - 4 * (nextTerminalAddress - 659) -: 4]
			: nextTerminalAddress >= 676 && nextTerminalAddress < 684 ? cpu_id_register7[31 - 4 * (nextTerminalAddress - 676) -: 4]
			: nextTerminalAddress >= 693 && nextTerminalAddress < 701 ? cpu_id_register8[31 - 4 * (nextTerminalAddress - 693) -: 4]
			: nextTerminalAddress >= 710 && nextTerminalAddress < 718 ? cpu_id_register9[31 - 4 * (nextTerminalAddress - 710) -: 4]
			: nextTerminalAddress >= 722 && nextTerminalAddress < 730 ? cpu_id_register10[31 - 4 * (nextTerminalAddress - 722) -: 4]
			: nextTerminalAddress >= 739 && nextTerminalAddress < 747 ? cpu_id_register11[31 - 4 * (nextTerminalAddress - 739) -: 4]
			: nextTerminalAddress >= 756 && nextTerminalAddress < 764 ? cpu_id_register12[31 - 4 * (nextTerminalAddress - 756) -: 4]
			: nextTerminalAddress >= 773 && nextTerminalAddress < 781 ? cpu_id_register13[31 - 4 * (nextTerminalAddress - 773) -: 4]
			: nextTerminalAddress >= 790 && nextTerminalAddress < 798 ? cpu_id_register14[31 - 4 * (nextTerminalAddress - 790) -: 4]
			: nextTerminalAddress >= 802 && nextTerminalAddress < 810 ? cpu_id_register15[31 - 4 * (nextTerminalAddress - 802) -: 4]
			: nextTerminalAddress >= 819 && nextTerminalAddress < 827 ? cpu_id_register16[31 - 4 * (nextTerminalAddress - 819) -: 4]
			: nextTerminalAddress >= 836 && nextTerminalAddress < 844 ? cpu_id_register17[31 - 4 * (nextTerminalAddress - 836) -: 4]
			: nextTerminalAddress >= 853 && nextTerminalAddress < 861 ? cpu_id_register18[31 - 4 * (nextTerminalAddress - 853) -: 4]
			: nextTerminalAddress >= 870 && nextTerminalAddress < 878 ? cpu_id_register19[31 - 4 * (nextTerminalAddress - 870) -: 4]
			: nextTerminalAddress >= 882 && nextTerminalAddress < 890 ? cpu_id_register20[31 - 4 * (nextTerminalAddress - 882) -: 4]
			: nextTerminalAddress >= 899 && nextTerminalAddress < 907 ? cpu_id_register21[31 - 4 * (nextTerminalAddress - 899) -: 4]
			: nextTerminalAddress >= 916 && nextTerminalAddress < 924 ? cpu_id_register22[31 - 4 * (nextTerminalAddress - 916) -: 4]
			: nextTerminalAddress >= 933 && nextTerminalAddress < 941 ? cpu_id_register23[31 - 4 * (nextTerminalAddress - 933) -: 4]
			: nextTerminalAddress >= 950 && nextTerminalAddress < 958 ? cpu_id_register24[31 - 4 * (nextTerminalAddress - 950) -: 4]
			: nextTerminalAddress >= 962 && nextTerminalAddress < 970 ? cpu_id_register25[31 - 4 * (nextTerminalAddress - 962) -: 4]
			: nextTerminalAddress >= 979 && nextTerminalAddress < 987 ? cpu_id_register26[31 - 4 * (nextTerminalAddress - 979) -: 4]
			: nextTerminalAddress >= 996 && nextTerminalAddress < 1004 ? cpu_id_register27[31 - 4 * (nextTerminalAddress - 996) -: 4]
			: nextTerminalAddress >= 1013 && nextTerminalAddress < 1021 ? cpu_id_register28[31 - 4 * (nextTerminalAddress - 1013) -: 4]
			: nextTerminalAddress >= 1030 && nextTerminalAddress < 1038 ? cpu_id_register29[31 - 4 * (nextTerminalAddress - 1030) -: 4]
			: nextTerminalAddress >= 1042 && nextTerminalAddress < 1050 ? cpu_id_register30[31 - 4 * (nextTerminalAddress - 1042) -: 4]
			: nextTerminalAddress >= 1059 && nextTerminalAddress < 1067 ? cpu_id_register31[31 - 4 * (nextTerminalAddress - 1059) -: 4]
			: nextTerminalAddress >= 1295 && nextTerminalAddress < 1303 ? cpu_ex_aluInputA[31 - 4 * (nextTerminalAddress - 1295) -: 4]
			: nextTerminalAddress >= 1335 && nextTerminalAddress < 1343 ? cpu_ex_aluInputB[31 - 4 * (nextTerminalAddress - 1335) -: 4]
			: nextTerminalAddress >= 1374 && nextTerminalAddress < 1382 ? cpu_ex_aluOutput[31 - 4 * (nextTerminalAddress - 1374) -: 4]
			: nextTerminalAddress >= 1618 && nextTerminalAddress < 1626 ? cpu_mem_memoryAddress[31 - 4 * (nextTerminalAddress - 1618) -: 4]
			: nextTerminalAddress >= 1660 && nextTerminalAddress < 1668 ? cpu_mem_memoryReadData[31 - 4 * (nextTerminalAddress - 1660) -: 4]
			: nextTerminalAddress >= 1741 && nextTerminalAddress < 1749 ? cpu_mem_memoryWriteData[31 - 4 * (nextTerminalAddress - 1741) -: 4]
			: nextTerminalAddress >= 1986 && nextTerminalAddress < 1988 ? cpu_wb_registerWriteAddress[7 - 4 * (nextTerminalAddress - 1986) -: 4]
			: nextTerminalAddress >= 2023 && nextTerminalAddress < 2031 ? cpu_wb_registerWriteData[31 - 4 * (nextTerminalAddress - 2023) -: 4]
			: 4'hFF;
	wire [7:0] hexCharacterOutput;
	HexCharacterConverter hexCharacterConverter (
		.hex(hexCharacterInput[3:0]),
		.character(hexCharacterOutput[7:0])
	);

	wire booleanTextInput =
			nextTerminalAddress >= 1702 && nextTerminalAddress < 1707 ? cpu_mem_shouldWriteMemory
			: nextTerminalAddress >= 1944 && nextTerminalAddress < 1949 ? cpu_wb_shouldWriteRegister
			: 1'b1;
	wire [5 * 8 - 1 : 0] booleanTextOutput;
	BooleanTextConverter booleanTextConverter (
		.boolean(booleanTextInput),
		.text(booleanTextOutput[5 * 8 - 1 : 0])
	);

	wire [11:0] backgroundAddress = nextTerminalAddress;
	wire [7:0] backgroundCharacter;
	Background background (
		.a(backgroundAddress[11:0]),
		.spo(backgroundCharacter[7:0])
	);

	always @(posedge clock) begin

		terminalAddress <= nextTerminalAddress;

		terminalWriteData <=
				nextTerminalAddress >= 170 && nextTerminalAddress < 202 ? disassemblerOutput[255 - 8 * (nextTerminalAddress - 170) -: 8]
				: nextTerminalAddress >= 246 && nextTerminalAddress < 254 ? hexCharacterOutput
				: nextTerminalAddress >= 291 && nextTerminalAddress < 299 ? hexCharacterOutput
				: nextTerminalAddress >= 410 && nextTerminalAddress < 442 ? disassemblerOutput[255 - 8 * (nextTerminalAddress - 410) -: 8]
				: nextTerminalAddress >= 562 && nextTerminalAddress < 570 ? hexCharacterOutput
				: nextTerminalAddress >= 579 && nextTerminalAddress < 587 ? hexCharacterOutput
				: nextTerminalAddress >= 596 && nextTerminalAddress < 604 ? hexCharacterOutput
				: nextTerminalAddress >= 613 && nextTerminalAddress < 621 ? hexCharacterOutput
				: nextTerminalAddress >= 630 && nextTerminalAddress < 638 ? hexCharacterOutput
				: nextTerminalAddress >= 642 && nextTerminalAddress < 650 ? hexCharacterOutput
				: nextTerminalAddress >= 659 && nextTerminalAddress < 667 ? hexCharacterOutput
				: nextTerminalAddress >= 676 && nextTerminalAddress < 684 ? hexCharacterOutput
				: nextTerminalAddress >= 693 && nextTerminalAddress < 701 ? hexCharacterOutput
				: nextTerminalAddress >= 710 && nextTerminalAddress < 718 ? hexCharacterOutput
				: nextTerminalAddress >= 722 && nextTerminalAddress < 730 ? hexCharacterOutput
				: nextTerminalAddress >= 739 && nextTerminalAddress < 747 ? hexCharacterOutput
				: nextTerminalAddress >= 756 && nextTerminalAddress < 764 ? hexCharacterOutput
				: nextTerminalAddress >= 773 && nextTerminalAddress < 781 ? hexCharacterOutput
				: nextTerminalAddress >= 790 && nextTerminalAddress < 798 ? hexCharacterOutput
				: nextTerminalAddress >= 802 && nextTerminalAddress < 810 ? hexCharacterOutput
				: nextTerminalAddress >= 819 && nextTerminalAddress < 827 ? hexCharacterOutput
				: nextTerminalAddress >= 836 && nextTerminalAddress < 844 ? hexCharacterOutput
				: nextTerminalAddress >= 853 && nextTerminalAddress < 861 ? hexCharacterOutput
				: nextTerminalAddress >= 870 && nextTerminalAddress < 878 ? hexCharacterOutput
				: nextTerminalAddress >= 882 && nextTerminalAddress < 890 ? hexCharacterOutput
				: nextTerminalAddress >= 899 && nextTerminalAddress < 907 ? hexCharacterOutput
				: nextTerminalAddress >= 916 && nextTerminalAddress < 924 ? hexCharacterOutput
				: nextTerminalAddress >= 933 && nextTerminalAddress < 941 ? hexCharacterOutput
				: nextTerminalAddress >= 950 && nextTerminalAddress < 958 ? hexCharacterOutput
				: nextTerminalAddress >= 962 && nextTerminalAddress < 970 ? hexCharacterOutput
				: nextTerminalAddress >= 979 && nextTerminalAddress < 987 ? hexCharacterOutput
				: nextTerminalAddress >= 996 && nextTerminalAddress < 1004 ? hexCharacterOutput
				: nextTerminalAddress >= 1013 && nextTerminalAddress < 1021 ? hexCharacterOutput
				: nextTerminalAddress >= 1030 && nextTerminalAddress < 1038 ? hexCharacterOutput
				: nextTerminalAddress >= 1042 && nextTerminalAddress < 1050 ? hexCharacterOutput
				: nextTerminalAddress >= 1059 && nextTerminalAddress < 1067 ? hexCharacterOutput
				: nextTerminalAddress >= 1210 && nextTerminalAddress < 1242 ? disassemblerOutput[255 - 8 * (nextTerminalAddress - 1210) -: 8]
				: nextTerminalAddress >= 1295 && nextTerminalAddress < 1303 ? hexCharacterOutput
				: nextTerminalAddress >= 1335 && nextTerminalAddress < 1343 ? hexCharacterOutput
				: nextTerminalAddress >= 1374 && nextTerminalAddress < 1382 ? hexCharacterOutput
				: nextTerminalAddress >= 1531 && nextTerminalAddress < 1563 ? disassemblerOutput[255 - 8 * (nextTerminalAddress - 1531) -: 8]
				: nextTerminalAddress >= 1618 && nextTerminalAddress < 1626 ? hexCharacterOutput
				: nextTerminalAddress >= 1660 && nextTerminalAddress < 1668 ? hexCharacterOutput
				: nextTerminalAddress >= 1702 && nextTerminalAddress < 1707 ? booleanTextOutput[39 - 8 * (nextTerminalAddress - 1702) -: 8]
				: nextTerminalAddress >= 1741 && nextTerminalAddress < 1749 ? hexCharacterOutput
				: nextTerminalAddress >= 1850 && nextTerminalAddress < 1882 ? disassemblerOutput[255 - 8 * (nextTerminalAddress - 1850) -: 8]
				: nextTerminalAddress >= 1944 && nextTerminalAddress < 1949 ? booleanTextOutput[39 - 8 * (nextTerminalAddress - 1944) -: 8]
				: nextTerminalAddress >= 1986 && nextTerminalAddress < 1988 ? hexCharacterOutput
				: nextTerminalAddress >= 2023 && nextTerminalAddress < 2031 ? hexCharacterOutput
				: backgroundCharacter;
	end
endmodule
