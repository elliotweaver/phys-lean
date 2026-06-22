#!/usr/bin/env python3
# run67: find a CLOSED-FORM matrix factorization of the pieceB D-drop
#   Delta := jdef(D+X, B) - jdef(X, B)
# where D is NUCLEAR-CENTRAL (commutes+associates with everything) and X,B are free nonassoc
# matrices. Goal: express Delta as a sum of MATRIX ASSOCIATORS assoc(P,Q,R)=P(QR)-(PQ)R whose
# octonion-entry content vanishes by alternativity -- i.e. find the structural lever shape.
#
# We model entries at the MATRIX level as free nonassoc noncommuting symbols D, X, B with D
# satisfying nuclearity rewrites (D associates in all 3 positions; also commutes since central).
# We compute Delta in the free nonassoc ring, then REDUCE by D-nuclearity (push D to canonical
# position / collapse D-slot associators), and inspect the residual: is it a sum of pure
# associators of X,B (which would vanish at octonion-coordinate level by alternativity)?

import sys
from collections import defaultdict
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
        for k, v in P.items():
            r[k] += v
    return {k: v for k, v in r.items() if v}
def pneg(P): return {k: -v for k, v in P.items()}
def jb(P, Q): return padd(pmul(P, Q), pmul(Q, P))
def jdef(A, B):
    AA = jb(A, A)
    return padd(jb(jb(A, B), AA), pneg(jb(A, jb(B, AA))))

D = {'D': 1}; X = {'X': 1}; B = {'B': 1}
Delta = padd(jdef(padd(D, X), B), pneg(jdef(X, B)))
print("Delta raw monomials:", len(Delta))

# count D-degree distribution
from collections import Counter
def dcount(t):
    if isinstance(t, str): return 1 if t == 'D' else 0
    return dcount(t[1]) + dcount(t[2])
deg = Counter(dcount(t) for t in Delta)
print("D-degree distribution of Delta monomials:", dict(deg))

# D nuclear: rewrite to push D so that any subtree of form (P*Q) with D as the immediate
# left/right operand re-associates. Plus D central: D*P = P*D. We aim to fully normalize and
# see how many monomials survive (associative-collapse already known =0 -> Delta is a sum of
# X,B associators times D-powers).
def flatten(t):
    if isinstance(t, str): return (t,)
    return flatten(t[1]) + flatten(t[2])
def assoc_collapse(P):
    r = defaultdict(int)
    for t, c in P.items():
        r[flatten(t)] += c
    return {k: v for k, v in r.items() if v}
ac = assoc_collapse(Delta)
print("Delta under FULL associativity:", len(ac), "(0 => Delta is pure-associator content)")

# Now the real question: is Delta = sum of assoc(P,Q,R) with at least one slot a pure X or B
# (NOT D), i.e. octonion associators that vanish by alternativity, AND with the D's only as
# central scalar coefficients? Group monomials by their X,B leaf-sequence (D removed) to see
# the octonion-associator skeleton.
def strip_D_seq(t):
    return tuple(s for s in flatten(t) if s != 'D')
skeleton = defaultdict(int)
for t, c in Delta.items():
    # signed by bracketing; we just record (Dcount, XB-sequence) -> coeff with bracketing key
    skeleton[(dcount(t), strip_D_seq(t))] += c
# After D-centrality the coeff of each (Dcount, XBseq) class need not be 0; what must vanish is
# the bracketed octonion combination. Print the XB-sequence multiset sizes.
seqs = Counter(k[1] for k in skeleton)
print("distinct XB-leaf-sequences appearing:", len(seqs))
for s, n in list(seqs.items())[:12]:
    print("   ", ''.join(s), " in", n, "monomial-classes")
