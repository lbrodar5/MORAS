@SCREEN
D=A;
@POS
M=D;

@BR
M=0;

(LOOPSTART)
	@24576
	D=M;
	
	@48
	D=D-A;
	@NULA
	D;JEQ
	
	@24063
	D=A;
	@POS
	D=D-M
	@LOOPSTART
	D;JLE
	
	@24576
	D=M;

	@49
	D=D-A;
	@JEDAN
	D;JEQ
	
	@24576
	D=M;

	@50
	D=D-A;
	@DVA
	D;JEQ
	
	@24576
	D=M;

	@51
	D=D-A;
	@TRI
	D;JEQ
	
	@24576
	D=M;

	@52
	D=D-A;
	@CETIRI
	D;JEQ
	
	@24576
	D=M;

	@53
	D=D-A;
	@PET
	D;JEQ

@LOOPSTART
0;JMP


(NEXTCOL)
@512
D=A;
@POS
M=M-D;
M=M+1;
@BR
M=M+1;
@LOOPSTART
0;JMP

(NEXTROW)
@POS
M=M+1;
@BR
M=0;
@LOOPSTART
0;JMP

(NULA)
@24576
M=0;

@BR
D=M;
@DELROW
D;JEQ

@POS
M=M-1;

@BR
M=M-1;

(CON)

@i
M=0;
(LOOP0START)
	@POS
	A=M;
	M=0;
	@32
	D=A;
	@POS
	M=M+D;
@i
M=M+1;
D=M;
@16
D=A-D;
@LOOP0START
D;JGT

@512
D=A;
@POS
M=M-D;


@LOOPSTART
0;JMP


(DELROW)
@SCREEN
D=A;
@POS
D=D-M;
@LOOPSTART
D;JEQ

@31
D=A;
@BR
M=D;

@512
D=A;
@POS
M=M-1;
M=M-D;
@CON
0;JMP

(JEDAN)
@24576
M=0;

@32
D=A;
@POS
M=M+D;

@32
D=A;
@POS
M=M+D;

@i
M=0;
(LOOP1START)
	@3584
	D=A;
	@POS
	A=M;
	M=D;
	@32
	D=A;
	@POS
	M=M+D;
@i
M=M+1;
D=M;
@14
D=A-D;
@LOOP1START
D;JGT

@BR
D=M;
@31
D=A-D;
@NEXTROW
D;JEQ
@NEXTCOL
0;JMP


(DVA)
@24576
M=0;

@32
D=A;
@POS
M=M+D;

@32 //1
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;
@32 //2
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;
@32 //3
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //4
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //5
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //6
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //7
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //8
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //9
D=A;
@POS
M=M+D;
@1792
D=A;
@POS
A=M;
M=D;
@32 //10
D=A;
@POS
M=M+D;
@1792
D=A;
@POS
A=M;
M=D;
@32 //11
D=A;
@POS
M=M+D;
@224
D=A;
@POS
A=M;
M=D;
@32 //12
D=A;
@POS
M=M+D;
@224
D=A;
@POS
A=M;
M=D;
@32 //13
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;
@32 //14
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;

@32
D=A;
@POS
M=M+D;

@BR
D=M;
@31
D=A-D;
@NEXTROW
D;JEQ
@NEXTCOL
0;JMP

(TRI)
@24576
M=0;

@32
D=A;
@POS
M=M+D;

@32 //1
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;
@32 //2
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;
@32 //3
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //4
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //5
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //6
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //7
D=A;
@POS
M=M+D;
@1792
D=A;
@POS
A=M;
M=D;
@32 //8
D=A;
@POS
M=M+D;
@1792
D=A;
@POS
A=M;
M=D;
@32 //9
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //10
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //11
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //12
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //13
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;
@32 //14
D=A;
@POS
M=M+D;
@2016
D=A;
@POS
A=M;
M=D;

@32
D=A;
@POS
M=M+D;

@BR
D=M;
@31
D=A-D;
@NEXTROW
D;JEQ
@NEXTCOL
0;JMP

(CETIRI)
@24576
M=0;

@32
D=A;
@POS
M=M+D;

@32 //1
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //2
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //3
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //4
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //5
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //6
D=A;
@POS
M=M+D;
@14364
D=A;
@POS
A=M;
M=D;
@32 //7
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;
@32 //8
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;
@32 //9
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //10
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //11
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //12
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //13
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //14
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;

@32
D=A;
@POS
M=M+D;

@BR
D=M;
@31
D=A-D;
@NEXTROW
D;JEQ
@NEXTCOL
0;JMP

(PET)
@24576
M=0;

@32
D=A;
@POS
M=M+D;

@32 //1
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;
@32 //2
D=A;
@POS
M=M+D;
@16380
D=A;
@POS
A=M;
M=D;
@32 //3
D=A;
@POS
M=M+D;
@28
D=A;
@POS
A=M;
M=D;
@32 //4
D=A;
@POS
M=M+D;
@28
D=A;
@POS
A=M;
M=D;
@32 //5
D=A;
@POS
M=M+D;
@28
D=A;
@POS
A=M;
M=D;
@32 //6
D=A;
@POS
M=M+D;
@28
D=A;
@POS
A=M;
M=D;
@32 //7
D=A;
@POS
M=M+D;
@2044
D=A;
@POS
A=M;
M=D;
@32 //8
D=A;
@POS
M=M+D;
@2044
D=A;
@POS
A=M;
M=D;
@32 //9
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //10
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //11
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //12
D=A;
@POS
M=M+D;
@14336
D=A;
@POS
A=M;
M=D;
@32 //13
D=A;
@POS
M=M+D;
@2044
D=A;
@POS
A=M;
M=D;
@32 //14
D=A;
@POS
M=M+D;
@2044
D=A;
@POS
A=M;
M=D;

@32
D=A;
@POS
M=M+D;

@BR
D=M;
@31
D=A-D;
@NEXTROW
D;JEQ
@NEXTCOL
0;JMP