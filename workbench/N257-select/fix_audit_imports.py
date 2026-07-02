#!/usr/bin/env python3
# Relocate all misplaced mid-file `import` lines in Audits/AxiomAudit.lean up into the
# header import block. Latent bug since N234 (commit 64ea97d): imports scattered after
# #print axioms commands, which Lean forbids. Touches NO proof and NO olean — repairs
# only the audit driver so the FULL audit can elaborate past line 5912.
import sys

path = "Audits/AxiomAudit.lean"
with open(path, "r") as f:
    text = f.read()

# Preserve exact newline structure: work on lines, keep trailing newline behaviour.
had_trailing_nl = text.endswith("\n")
lines = text.split("\n")
if had_trailing_nl:
    # last element is "" from the trailing newline; drop it, re-add at join
    assert lines[-1] == ""
    lines = lines[:-1]

# Verify preamble boundary (lines 1-8 = index 0-7), line 9 (index 8) first import.
assert lines[7].strip() == "-/", f"line 8 not end of preamble: {lines[7]!r}"
assert lines[8].startswith("import "), f"line 9 not first import: {lines[8]!r}"

preamble = lines[:8]        # lines 1-8
body_all = lines[8:]        # line 9 onward

imports = []
seen = set()
body_no_imports = []
for ln in body_all:
    if ln.startswith("import "):
        if ln not in seen:
            seen.add(ln)
            imports.append(ln)
    else:
        body_no_imports.append(ln)

new_lines = preamble + imports + body_no_imports

# --- sanity checks ---
first_print_idx = next(i for i, l in enumerate(new_lines) if l.startswith("#print axioms"))
strays = [i for i, l in enumerate(new_lines) if l.startswith("import ") and i > first_print_idx]
assert not strays, f"still stray imports at {strays}"
import_block = new_lines[8:8 + len(imports)]
assert all(l.startswith("import ") for l in import_block), "import block not contiguous"

# no #print lines lost
orig_prints = sum(1 for l in lines if l.startswith("#print axioms"))
new_prints = sum(1 for l in new_lines if l.startswith("#print axioms"))
assert orig_prints == new_prints, f"lost #print lines: {orig_prints} -> {new_prints}"

new_text = "\n".join(new_lines)
if had_trailing_nl:
    new_text += "\n"

with open(path, "w") as f:
    f.write(new_text)

print(f"preamble lines:        {len(preamble)}")
print(f"imports relocated:     {len(imports)} (unique, order-preserved)")
print(f"body lines (stripped): {len(body_no_imports)}")
print(f"#print axioms lines:   {orig_prints} -> {new_prints} (preserved)")
print(f"first #print at index: {first_print_idx}  stray imports after: {len(strays)}")
print(f"new total lines:       {len(new_lines)}")
print("OK: all imports now contiguous in header; wrote AxiomAudit.lean")
