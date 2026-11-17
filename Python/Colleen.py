# outside
s = '# outside\ns = %r\ndef p():\n    print(s %% s, end="")\ndef main():\n    # inside\n    p()\nmain()\n'
def p():
    print(s % s, end="")
def main():
    # inside
    p()
main()
