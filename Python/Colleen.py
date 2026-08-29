# Out
s = '# Out\ns = %r\ndef p(t):\n    print(t %% t, end="")\ndef main():\n    # In\n    p(s)\nif __name__ == \'__main__\':\n    main()\n'
def p(t):
    print(t % t, end="")
def main():
    # In
    p(s)
if __name__ == '__main__':
    main()
