#!/usr/bin/env python
"""Step 1: build transitive import closure of the alpha production ancestors.
Roots: Phys.Algebra.MirrorFixedPoint, Phys.Algebra.AlphaLandingFinal.
Read-only over the repo; writes closure.txt + non_ancestors.txt in this dir.
"""
import os, re, json

REPO = r"C:/Users/ellio/phys-lean"
OUT = os.path.dirname(os.path.abspath(__file__))

# map module name -> file path
mod2path = {}
for root, dirs, files in os.walk(os.path.join(REPO, "Phys")):
    for f in files:
        if f.endswith(".lean"):
            p = os.path.join(root, f)
            rel = os.path.relpath(p, REPO)
            mod = rel[:-5].replace(os.sep, ".")
            mod2path[mod] = p

imp_re = re.compile(r"^import\s+(Phys\.[A-Za-z0-9_.]+)", re.M)

def imports_of(mod):
    p = mod2path.get(mod)
    if not p:
        return []
    with open(p, encoding="utf-8", errors="replace") as fh:
        return imp_re.findall(fh.read())

roots = ["Phys.Algebra.MirrorFixedPoint", "Phys.Algebra.AlphaLandingFinal"]
closure = set()
stack = list(roots)
missing = []
while stack:
    m = stack.pop()
    if m in closure:
        continue
    if m not in mod2path:
        missing.append(m)
        continue
    closure.add(m)
    stack.extend(imports_of(m))

all_mods = set(mod2path)
non = sorted(all_mods - closure)

with open(os.path.join(OUT, "closure.txt"), "w") as f:
    f.write("\n".join(sorted(closure)) + "\n")
with open(os.path.join(OUT, "non_ancestors.txt"), "w") as f:
    f.write("\n".join(non) + "\n")

# reverse edges: who imports whom (for consumer lookup later)
edges = {m: imports_of(m) for m in all_mods}
with open(os.path.join(OUT, "edges.json"), "w") as f:
    json.dump(edges, f)

print("total Phys modules:", len(all_mods))
print("closure size:", len(closure))
print("non-ancestors:", len(non))
print("missing imports:", missing)
