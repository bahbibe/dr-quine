# a single comment
B = lambda: (f := open("Grace_kid.py", "w"), f.write(s % s), f.close())
A = lambda x: x
MAIN = A(B)
s = '# a single comment\nB = lambda: (f := open("Grace_kid.py", "w"), f.write(s %% s), f.close())\nA = lambda x: x\nMAIN = A(B)\ns = %r\nMAIN()\n'
MAIN()
