import py_compile, subprocess
i = 5
s = 'import py_compile, subprocess\ni = %(i)d\ns = %(s)r\nif not __file__.endswith("Sully.py"):\n    i -= 1\nif i >= 0:\n    open(f"Sully_{i}.py", "w").write(s %% {"i": i, "s": s})\n    py_compile.compile(f"Sully_{i}.py", cfile=f"Sully_{i}.pyc")\n    subprocess.run(["python3", f"Sully_{i}.pyc"])\n'
if not __file__.endswith("Sully.py"):
    i -= 1
if i >= 0:
    open(f"Sully_{i}.py", "w").write(s % {"i": i, "s": s})
    py_compile.compile(f"Sully_{i}.py", cfile=f"Sully_{i}.pyc")
    subprocess.run(["python3", f"Sully_{i}.pyc"])
