#!/usr/bin/env python
"""
D8 — RECONCILIATION CENSUS (owner-commissioned after the base-gem episode, 2026-08-08).

THE FAILURE CLASS THIS KILLS: an audit module proves a CORRECTED/REFINED value for an
object a production module computes with, but — because audit modules import production
(the arrow points backward) — the correction never reaches the production graph. It sits
banked and true while the capstone consumes the stale value (the auditor's 'reverse-
provenance' finding: BaseNormalFormAudit's 7259/54 vs production's 2425/18, unreconciled
for 100+ nodes until N688).

THE MECHANICAL RULE: every theorem in Phys/ whose NAME matches a correction signature
(_corrected, overcount_, _rederived, _superseded, _drop_) must appear in
scripts/reconciliation_manifest.tsv with a RECONCILER — a module that either consumes it
into the production graph or adjudicates it (states at theorem level why production
stands). The manifest row is (theorem_name, source_module, reconciler_module, kind) with
kind in {CONSUMED, ADJUDICATED}. The check fails if:
  (a) a correction-signature theorem exists with no manifest row, or
  (b) a manifest row's reconciler module does not exist or never mentions the theorem's
      name or its source module.
An honest new correction therefore CANNOT be banked without either wiring it into
production or writing the adjudication node — the seam the auditor found can never
silently reopen.
"""
import os, re, sys, csv

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MANIFEST = os.path.join(REPO, 'scripts', 'reconciliation_manifest.tsv')

SIG = re.compile(r'^theorem\s+((?:\w+_)?(?:base_corrected\w*|overcount_\w+|\w*_rederived\w*|\w*_superseded\w*|base_drop_\w+|\w*corrected_vs_\w+))\b')

def module_of(path):
    rel = os.path.relpath(path, REPO).replace('\\', '/')
    return rel[:-5].replace('/', '.')

# 1. collect correction-signature theorems
found = {}  # name -> module
for root, dirs, files in os.walk(os.path.join(REPO, 'Phys')):
    dirs[:] = [d for d in dirs if not d.startswith('.')]
    for f in files:
        if not f.endswith('.lean') or f.startswith('._'):
            continue
        p = os.path.join(root, f)
        try:
            text = open(p, encoding='utf-8', errors='ignore').read()
        except OSError:
            continue
        for line in text.splitlines():
            m = SIG.match(line.strip())
            if m:
                found[m.group(1)] = module_of(p)

# 2. load manifest
rows = {}
if os.path.exists(MANIFEST):
    with open(MANIFEST, encoding='utf-8') as fh:
        for row in csv.reader(fh, delimiter='\t'):
            if not row or row[0].startswith('#') or len(row) < 4:
                continue
            rows[row[0].strip()] = (row[1].strip(), row[2].strip(), row[3].strip())

fails = []
# 3a. every found theorem has a row
for name, mod in sorted(found.items()):
    if name not in rows:
        fails.append(f"UNRECONCILED: theorem '{name}' ({mod}) has no reconciliation_manifest row")
        continue
    src, reconciler, kind = rows[name]
    rpath = os.path.join(REPO, reconciler.replace('.', os.sep) + '.lean')
    if not os.path.exists(rpath):
        fails.append(f"BAD ROW: '{name}' reconciler module {reconciler} does not exist")
        continue
    rtext = open(rpath, encoding='utf-8', errors='ignore').read()
    short_src = src.split('.')[-1]
    if name not in rtext and short_src not in rtext:
        fails.append(f"HOLLOW ROW: '{name}' reconciler {reconciler} never mentions '{name}' or '{short_src}'")

if fails:
    for f in fails:
        print(f)
    print(f"D8 FAILING: {len(fails)} unreconciled/bad row(s) of {len(found)} correction-signature theorems")
    sys.exit(1)
print(f"{len(found)} correction-signature theorems, all reconciled ({sum(1 for n in found if n in rows)} manifest rows verified)")
