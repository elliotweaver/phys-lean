#!/usr/bin/env python
"""Step 2: navigation scan. Grep whole repo Phys/ for modules whose names or
theorem/def names match the PREREG pattern list. Collect (module, decl) hits.
Names are navigation only, never evidence."""
import os, re, json

REPO = r"C:/Users/ellio/phys-lean"
OUT = os.path.dirname(os.path.abspath(__file__))

PAT = re.compile(
    r"corrected|overcount|rederived|reattest|audit|discharged|resolved|"
    r"recomposition|activeSpan|active_span|seam|double.?count|one_cause|"
    r"superseded|defect|drop|lockstep", re.I)

decl_re = re.compile(
    r"^\s*(?:private\s+|protected\s+|noncomputable\s+)*"
    r"(theorem|lemma|def|abbrev|example)\s+([A-Za-z0-9_.'«»]+)", re.M)

mod2path = {}
for root, dirs, files in os.walk(os.path.join(REPO, "Phys")):
    for f in files:
        if f.endswith(".lean"):
            p = os.path.join(root, f)
            rel = os.path.relpath(p, REPO)
            mod2path[rel[:-5].replace(os.sep, ".")] = p

hits = {}  # module -> {"module_name_hit": bool, "decls": [names]}
for mod, p in sorted(mod2path.items()):
    with open(p, encoding="utf-8", errors="replace") as fh:
        text = fh.read()
    decls = decl_re.findall(text)
    matched = [name for kind, name in decls if PAT.search(name)]
    name_hit = bool(PAT.search(mod))
    if name_hit or matched:
        hits[mod] = {"module_name_hit": name_hit, "decls": matched,
                     "n_decls_total": len(decls)}

with open(os.path.join(OUT, "nav_hits.json"), "w") as f:
    json.dump(hits, f, indent=1)

print("modules with hits:", len(hits))
mods_namehit = [m for m in hits if hits[m]["module_name_hit"]]
print("module-name hits:", len(mods_namehit))
for m in sorted(hits):
    h = hits[m]
    tag = "*MOD*" if h["module_name_hit"] else "     "
    print(tag, m, "|", len(h["decls"]), "decl hits")
