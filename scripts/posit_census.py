#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
posit_census.py — D7: THE POSIT CENSUS (owner-commissioned gate).

THE THREAT MODEL (the owner's "def as hidden axiom" concern, made mechanical):
A `def P : Prop := ...` can never CREATE truth — the kernel demands a proof
before P is ever used as a fact (verified live: Test A/B in the def-vs-axiom
audit). The ONE real exploit is VACUITY: an UNSATISFIABLE Prop-valued def
(e.g. `def IsUnicorn n := n < n`) lets every theorem of the form
`(h : IsUnicorn n) → C` be proved axiom-clean while claiming nothing.

THE DEFENSE, ENFORCED HERE: every Prop-valued `def`/`abbrev` in the trunk
(Phys/Foundation/, Phys/Cascade/) must carry an INHABITATION WITNESS in-tree:
a theorem whose CONCLUSION (not a hypothesis binder) applies the predicate to
a concrete object — proving the class is non-empty, so hypotheses in that
predicate are dischargeable and downstream theorems have real instances.

Mechanics (comment-stripped source only; prose can neither create nor satisfy):
  1. collect Prop-valued def/abbrev names in the trunk dirs;
  2. collect every theorem/lemma/instance declaration in ALL of Phys/;
  3. split each declaration's statement into binders vs conclusion at the
     first depth-0 colon; a witness = predicate name occurring in a CONCLUSION.
     (Occurrences inside `(h : P x)` binders are consumers, not witnesses —
     they are exactly the "owed" form and do NOT count.)
Exit 0 iff every trunk posit-shaped def has a witness. Pure verifier.
"""
import os, re, sys

REPO = os.environ.get('REPO', os.path.expanduser('~/phys-lean'))
TRUNK_DIRS = ['Phys/Foundation', 'Phys/Cascade']
SCAN_DIRS = ['Phys']
# Allowlist for genuinely-negative predicates whose POINT is emptiness/failure,
# each requiring instead a proved *characterization* theorem named here.
ALLOW = {}

def strip_comments(s):
    s = re.sub(r'/-.*?-/', '', s, flags=re.S)
    return re.sub(r'--[^\n]*', '', s)

def lean_files(root, subdirs):
    for sub in subdirs:
        for dp, _, fs in os.walk(os.path.join(root, sub)):
            for f in fs:
                if f.endswith('.lean') and not f.startswith('._'):
                    yield os.path.join(dp, f)

# ---- pass 1: Prop-valued defs/abbrevs in the trunk ----
DEF_RX = re.compile(
    r'^(?:noncomputable\s+)?(?:def|abbrev)\s+([A-Za-z_][A-Za-z0-9_\'.]*)'
    r'((?:\s*(?:\{[^{}]*\}|\[[^\[\]]*\]|\([^()]*\)))*)\s*:\s*Prop\s*(?::=|where)',
    re.M)

posits = {}   # name -> (file, line)
for path in lean_files(REPO, TRUNK_DIRS):
    src = strip_comments(open(path, encoding='utf-8', errors='ignore').read())
    for m in DEF_RX.finditer(src):
        name = m.group(1).split('.')[-1]
        line = src[:m.start()].count('\n') + 1
        posits[name] = (os.path.relpath(path, REPO), line)

# ---- pass 2: theorem conclusions across the whole tree ----
DECL_RX = re.compile(r'^(?:protected\s+)?(?:theorem|lemma|instance)\s', re.M)

def conclusions(src):
    """Yield the conclusion text of each theorem/lemma/instance declaration."""
    for m in DECL_RX.finditer(src):
        i = m.end()
        depth = 0
        j = i
        colon = -1
        n = len(src)
        while j < n:
            c = src[j]
            if c in '({[':
                depth += 1
            elif c in ')}]':
                depth -= 1
            elif c == ':' and depth == 0:
                if j + 1 < n and src[j+1] == '=':
                    break  # := before any depth-0 colon (defaulted instance)
                colon = j
                break
            elif src.startswith('\n\n', j):
                break
            j += 1
        if colon < 0:
            continue
        # conclusion runs from the depth-0 colon to the := or end of statement
        k = colon + 1
        depth = 0
        while k < n - 1:
            c = src[k]
            if c in '({[':
                depth += 1
            elif c in ')}]':
                depth -= 1
            elif depth == 0 and src.startswith(':=', k):
                break
            elif depth == 0 and src.startswith('\n\n', k):
                break
            k += 1
        yield src[colon + 1:k]

witnessed = set()
for path in lean_files(REPO, SCAN_DIRS):
    src = strip_comments(open(path, encoding='utf-8', errors='ignore').read())
    hits = [p for p in posits if p not in witnessed and re.search(r'\b' + re.escape(p) + r'\b', src)]
    if not hits:
        continue
    for conc in conclusions(src):
        for p in hits:
            if p in witnessed:
                continue
            if re.search(r'\b' + re.escape(p) + r'\b', conc):
                witnessed.add(p)

# ---- verdict ----
missing = {p: loc for p, loc in posits.items() if p not in witnessed and p not in ALLOW}
print(f'── D7: posit census — {len(posits)} Prop-valued trunk def(s)/abbrev(s) ──')
for p in sorted(posits):
    loc = posits[p]
    mark = 'ok: witnessed' if p in witnessed else ('ok: allowlisted (' + ALLOW[p] + ')' if p in ALLOW else 'MISSING WITNESS')
    print(f'  {mark:>18}  {p}  ({loc[0]}:{loc[1]})')
if missing:
    print('GATE FAILING (D7): Prop-valued trunk def(s) with NO inhabitation-witness theorem:')
    for p, loc in sorted(missing.items()):
        print(f'  {p}  ({loc[0]}:{loc[1]}) — add `theorem <name>_witness : {p} <concrete>` (or equivalent conclusion-position use)')
    sys.exit(1)
print('ok: every trunk posit-shaped def is inhabited by theorem')
sys.exit(0)
