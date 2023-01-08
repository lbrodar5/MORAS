# IDEJA
# 1. Iz asemblerske datoteke izbaciti sve razmake i komentare. Sjetite
#    se kako komentari u hack asembleru mogu biti jednolinijski i
#    viselinijski.
# 2. Sve simbole i varijable pretvoriti u numericke adrese (brojevi
#    linija ili adrese u memoriji).
# 3. Parsirati naredbe (A i C-instrukcije).

import string
import random

def id_generator(size=10, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


class Parser:
    from parseLines import _parse_lines, _parse_line
    from parseSymbs import _init_symbols, _parse_symbols, _parse_labels, _parse_variables
    from parseComms import _init_comms, _parse_command, _parse_commands
    
    def __init__(self, filename):
        # Otvaramo input asemblersku datoteku.
        try:
            self._file = open(filename + ".asm", "r")
        except:
            Parser._error("File", -1, "Cannot open source file")
            return

        # Linije iz input datoteke upisujuemo u ovu listu.
        self._lines = []

        self._swp_id = id_generator()
        self._swp_num = 0

        self._while_id = id_generator()
        self._while_num = 0
        self._while_nums = []
        
        # Citamo input datoteku.
        try:
            self._read_lines()
        except:
            Parser._error("File", -1, "Cannot read source file.")
            return

        # Pogreske prilikom parsiranja.
        self._flag = True # Ukoliko je flag postavljen na False, parsiranje je neuspjesno.
        self._line = -1   # lokacija (broj linije) na kojoj se pogreska nalazi.
        self._errm = ""   # Poruka koja opisuje pogresku.
        
        # oznake
        self._labels = {}
        self._variables = {}

        # Parsiramo linije izvornog koda.
        self._parse_lines()
        if self._flag == False:
            Parser._error("PL", self._line, self._errm)
            return
            
        self._parse_symbols()
        if self._flag == False:
            Parser._error("SYM", self._line, self._errm)
            return
            
        self._parse_commands()
        if self._flag == False:
            Parser._error("COM", self._line, self._errm)
            return
            
        # Na kraju parsiranja strojni kod upisujemo u ".hack" datoteku.
        try:
            self._outfile = open(filename + ".hack", "w")
        except:
            Parser._error("File", -1, "Cannot open output file")
            return

        try:
            self._write_file()
        except:
            Parser._error("File", -1, "Cannot write to output file")
            return          

    # Funkcija koja cita input datoteku te svaki redak sprema u listu uredjenih
    # trojki kojima su koordinate
    #   1. originalna linija iz datoteke
    #   2. broj linije u parsiranoj datoteci (u pocetku isti kao 3.)
    #   3. broj linije u originalnoj datoteci
    def _read_lines(self):
        n = 0
        for line in self._file:
            br=0
            plines = []

            while line[br] == " ":
                br += 1
            if line[br] == "$":
                end = line[br+1:br+4]
                whil = line[br+1:br+6]
                mv = line[br+1:br+3]
     
                if end == "END":
                    num = self._while_nums.pop()
                    start = "WHILE_START_"+self._while_id+str(num)
                    end = "WHILE_END_"+self._while_id+str(num)
                    plines = [
                        "@"+start,
                        "0;JMP",
                        "("+end +")"
                    ]
                
                elif(whil == "WHILE"):
                    plines = line[br+1:].split("(")
                    plines[1] = plines[1].split(")")
                    A="@"+ plines[1][0]
                    start = "WHILE_START_"+self._while_id+str(self._while_num)
                    end = "WHILE_END_"+self._while_id+str(self._while_num)
                    self._while_nums.append(self._while_num)
                    self._while_num += 1
                    plines = [
                        "("+start+")",
                        A,
                        "D=M;",
                        "@"+ end,
                        "D;JLE"
                    ]

                    
                elif mv == "MV":
                    plines = line[br+1:].split(",")
                    plines[0] =plines[0].split("(")
                    plines[1] = plines[1].split(")")
                    A="@"+plines[0][1]
                    B="@"+plines[1][0]
                    plines = [
                        A,
                        "D=M;",
                        B,
                        "M=D;"
                        ]

                elif end == "SWP":
                    plines = line[br+1:].split(",")
                    plines[0] =plines[0].split("(")
                    plines[1] = plines[1].split(")")
                    A="@"+plines[0][1]
                    B="@"+plines[1][0]
                    temp = "@temp_pls_nemoj_koristiti_ovaj_label_" + self._swp_id + str(self._swp_num)
                    self._swp_num += 1
                    plines = [
                        A,
                        "D=M;",
                        temp,
                        "M=D;",
                        B,
                        "D=M;",
                        A,
                        "M=D;",
                        temp,
                        "D=M;",
                        B,
                        "M=D;"
                        ]

                elif end == "SUM":
                    plines = line[br+1:].split(",")
                    plines[0] =plines[0].split("(")
                    plines[2] = plines[2].split(")")
                    A="@"+plines[0][1]
                    B="@"+plines[1][0]
                    D="@"+plines[2][0]
                    plines = [
                        A,
                        "D=M;",
                        B,
                        "D=D+M;",
                        D,
                        "M=D;"
                    ]
                
                for i in plines:
                    self._lines.append((i+" ",n,n))
                    n += 1

            else:
                self._lines.append((line, n, n))
                n += 1



    # Funkcija upisuje parsirane linije u output ".hack" datoteku.
    def _write_file(self):
        for (line, p, o) in self._lines:
            self._outfile.write(line)
            if (line[-1] != "\n"):
                self._outfile.write("\n")

    # Funkcija iterira procitanim linijama i na svaku primjenjuje funkciju
    # "func". Funkcija "func" vraća string koji odgovara vrijednosti parsirane
    # linije.
    #
    # Primjer:
    # ("@END", 4, 4) postaje ("@3", 3, 4)
    #
    # Ukoliko je duljina vracene linije 0, tu liniju brisemo. Takodjer, svaka
    # funkcija "func" mora se brinuti o pogreskama na koje moze naici (npr.
    # viselinijski komentari koji nisu zatvoreni ili pogresna naredba M=B+1).
    def _iter_lines(self, func):
        newlines = []
        i = 0
        for (line, p, o) in self._lines:
            newline = func(line, i, o)
            if (self._flag == False):
                break
            if (len(newline) > 0):
                newlines.append((newline, i, o))
                i += 1
        self._lines = newlines
        
    @staticmethod
    def _error(src, line, msg):
        if len(src) > 0 and line > -1:
            print("[" + src + ", " + str(line) + "] " + msg)
        elif len(src) > 0:
            print("[" + src + "] " + msg)
        else:
            print(msg)  


if __name__ == "__main__":
    Parser("test")
