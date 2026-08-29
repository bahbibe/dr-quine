import py_compile, subprocess
i = 5  # i = 5
s = 'import py_compile, subprocess\ni = %(n)d  # i = %(n)d\ns = %(s)r\nn = i - 1\nopen(f"Sully_{n}.py", "w").write(s %% {"n": n, "s": s})\npy_compile.compile(f"Sully_{n}.py", cfile=f"Sully_{n}.pyc")\nif n >= 0:\n    subprocess.run(["python3", f"Sully_{n}.pyc"])\n'
n = i - 1
open(f"Sully_{n}.py", "w").write(s % {"n": n, "s": s})
py_compile.compile(f"Sully_{n}.py", cfile=f"Sully_{n}.pyc")
if n >= 0:
    subprocess.run(["python3", f"Sully_{n}.pyc"])
