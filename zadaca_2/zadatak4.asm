
@SCREEN
D=A;
@POS
M=D;
@2053
D=A;
@POS
M=M+D;
@i
M=0;

(LOOPSTART)
	@POS
	A=M;
	M=1;
	@32
	D=A;
	@POS
	M=M+D;
@i
M=M+1;
D=M;
@128
D=A-D;
@LOOPSTART
D;JGT

@i
M=0;
(LOOP2START)
	@POS
	A=M;
	M=-1;
	@POS
	M=M+1;
@i
M=M+1;
D=M;
@8
D=A-D;
@LOOP2START
D;JGT

@BR
M=0;

@SCREEN
D=A;
@POS
M=D;
@2053
D=A;
@POS
M=M+D;

@CAL
M=1;

@i
M=0;
(LOOP3START)
	@CAL
	D=M;
	@POS
	A=M;
	M=M|D;
	@CAL
	D=M;
	M=M+D;
	@32
	D=A;
	@POS
	M=M+D;
	@BR
	M=M+1;
	D=M;
	@15
	D=D-A;
	@COR
	D;JGT
(CON)
@i
M=M+1;
D=M;
@128
D=A-D;
@LOOP3START
D;JGT

(END)
@END
0;JMP

(COR)
@POS
M=M+1;
@BR
M=0;
@CAL
M=1;
@CON
0;JMP