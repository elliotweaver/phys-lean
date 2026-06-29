import io

path = "/Users/elliotweaver/phys-lean/docs/LEDGER.md"
rowpath = "/Users/elliotweaver/phys-lean/workbench/N176-spectral-tpow/ledger_row.txt"
with io.open(rowpath, encoding="utf-8") as f:
    row = f.read().rstrip("\n")

with io.open(path, encoding="utf-8") as f:
    lines = f.readlines()

idx = None
for i, ln in enumerate(lines):
    if ln.startswith("| N175 "):
        idx = i
        break
assert idx is not None, "N175 row not found"
lines.insert(idx + 1, row + "\n")
with io.open(path, "w", encoding="utf-8") as f:
    f.writelines(lines)
print("Inserted N176 row after line %d (N175 row)" % (idx + 1))
print("Check new row prefix:", lines[idx + 1][:60])
