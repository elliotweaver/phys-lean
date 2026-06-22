#!/usr/bin/env python3
# run67: LINEARIZE the first-arg drop to isolate the minimal hard kernel.
# jdef is CUBIC in its first arg A and LINEAR in B. Write A = E + X:
#   jdef(E+X, B) = jdef(X,B) + L1 + L2 + jdef(E,B)
# where L1 = sum of monomials linear in E (deg-1 E, deg-2 X), L2 = quadratic in E (deg-1 X).
# We compute each piece in the FREE nonassoc model, then test which vanish under
# E-NUCLEARITY+CENTRALITY (E associates in all 3 slots AND commutes with everything).
# Whichever pieces survive = the minimal octonion-alternativity kernel of pieceB.
import sys
from collections import defaultdict, Counter
sys.setrecursionlimit(1000000)

def pmul(P, Q):
    r = defaultdict(int)
    for ta, ca in P.items():
        for tb, cb in Q.items():
            r[('*', ta, tb)] += ca * cb
    return {k: v for k, v in r.items() if v}
def padd(*Ps):
    r = defaultdict(int)
    for P in Ps:
        for k, v in P.items(): r[k] += v
    return {k: v for k, v in r.items() if v}
def pneg(P): return {k: -v for k, v in P.items()}
def jb(P, Q): return padd(pmul(P, Q), pmul(Q, P))
def jdef(A, B):
    AA = jb(A, A); return padd(jb(jb(A, B), AA), pneg(jb(A, jb(B, AA))))

def edeg(t):
    if isinstance(t, str): return 1 if t == 'E' else 0
    return edeg(t[1]) + edeg(t[2])

E = {'E': 1}; X = {'X': 1}; B = {'B': 1}
full = jdef(padd(E, X), B)
# split by E-degree
def by_edeg(P, d): return {t: c for t, c in P.items() if edeg(t) == d}
J0 = by_edeg(full, 0)   # = jdef(X,B)
L1 = by_edeg(full, 1)
L2 = by_edeg(full, 2)
J3 = by_edeg(full, 3)   # = jdef(E,B)
print("edeg split of jdef(E+X,B):", {0:len(J0),1:len(L1),2:len(L2),3:len(J3)})
print("check J0 == jdef(X,B):", J0 == jdef(X,B))
print("check J3 == jdef(E,B):", J3 == jdef(E,B))

# E-nuclearity+centrality normal form: E associates everywhere and commutes. Implement by
# fully sorting: since E central+nuclear, treat E as a commuting associative scalar that can be
# pulled to the FRONT and bracketing of E is irrelevant. For X,B keep free nonassoc.
# Normal form of a monomial: (E_count, normalized X/B-tree). E central+nuclear means we can
# remove all E's from the tree (they contribute a commuting scalar E^k) and the remaining tree
# is the X/B bracketing with E-nodes spliced out. Splicing E out of a binary tree where E is a
# leaf: if a node is ('*', E, R) -> R (E hops out as scalar); ('*', L, E) -> L; recursively.
def strip_E(t):
    # returns (ecount, tree_without_E or None)
    if isinstance(t, str):
        if t == 'E': return (1, None)
        return (0, t)
    el, tl = strip_E(t[1]); er, tr = strip_E(t[2])
    ec = el + er
    if tl is None and tr is None: tt = None
    elif tl is None: tt = tr
    elif tr is None: tt = tl
    else: tt = ('*', tl, tr)
    return (ec, tt)
def nf(P):
    r = defaultdict(int)
    for t, c in P.items():
        ec, tt = strip_E(t)
        r[(ec, tt)] += c
    return {k: v for k, v in r.items() if v}

for nm, P in [("L1", L1), ("L2", L2), ("J3=jdef(E,B)", J3)]:
    n = nf(P)
    print(f"\n{nm}: raw {len(P)} -> after E-central/nuclear NF: {len(n)} surviving")
    if not n:
        print("   => VANISHES by E-centrality/nuclearity ALONE (no octonion alt needed).")
    else:
        for k, v in list(n.items())[:14]:
            print(f"     {v}  E^{k[0]}  Xtree={k[1]}")

# Combined Delta = L1+L2+J3 after NF
DeltaNF = nf(padd(L1, L2, J3))
print(f"\nDelta = L1+L2+J3 after E-central/nuclear NF: {len(DeltaNF)} surviving (the hard kernel)")
for k, v in list(DeltaNF.items())[:20]:
    print(f"     {v}  E^{k[0]}  Xtree={k[1]}")
