#!/usr/bin/env python
"""Step 3 helper: for each nav-hit module, print in-closure flag, matched decls,
and the theorem statement lines (first line of each matched decl) for reading."""
import os, re, json

REPO = r"C:/Users/ellio/phys-lean"
OUT = os.path.dirname(os.path.abspath(__file__))
hits = json.load(open(os.path.join(OUT, "nav_hits.json")))
closure = set(open(os.path.join(OUT, "closure.txt")).read().split())

for mod in sorted(hits):
    if "._" in mod:
        continue
    p = os.path.join(REPO, mod.replace(".", os.sep) + ".lean")
    with open(p, encoding="utf-8", errors="replace") as fh:
        lines = fh.read().splitlines()
    print("=" * 80)
    print(mod, "| in_closure:", mod in closure, "| module_name_hit:", hits[mod]["module_name_hit"])
    names = set(hits[mod]["decls"])
    for i, ln in enumerate(lines):
        m = re.match(r"^\s*(?:private\s+|protected\s+|noncomputable\s+)*(theorem|lemma|def|abbrev)\s+([A-Za-z0-9_.'«»]+)", ln)
        if m and m.group(2) in names:
            # print statement: this line + following until ':=' or blank-ish cap 6 lines
            chunk = []
            for j in range(i, min(i + 8, len(lines))):
                chunk.append(lines[j])
                if ":=" in lines[j] or lines[j].rstrip().endswith(":= by"):
                    break
            print("  L%d: %s" % (i + 1, "\n       ".join(chunk)))
