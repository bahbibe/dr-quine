# Grace
F = "Grace_kid.py"
S = '# Grace\nF = "Grace_kid.py"\nS = %r\nMAIN = \'f = open(F, "w"); f.write(S %% S); f.close()\'\nexec(MAIN)\n'
MAIN = 'f = open(F, "w"); f.write(S % S); f.close()'
exec(MAIN)
