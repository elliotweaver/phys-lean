#!/usr/bin/env python3
# Is the deg-1 polarization P1 expressible as a COMMUTATOR [D,W] = D*W - W*D
# (like pieceA's master-identity route)? If so, with D central-diagonal and W
# off-diagonal-free, diag_comm_offzero (BANKED) kills it directly — no octonion coords.
# Test: P1 = D*W - W*D under D-nuclear NF, for the natural candidate
#   W = jb(Y, jb(X,X))  (the "G-like" object: Y against X's square)
# and also W2 = the cube-associator style. Search a small family.
import sys
from collections import defaultdict
sys.setrecursionlimit(1000000)
def pmul(P,Q):
    r=defaultdict(int)
    for ta,ca in P.items():
        for tb,cb in Q.items(): r[('*',ta,tb)]+=ca*cb
    return {k:v for k,v in r.items() if v}
def padd(*Ps):
    r=defaultdict(int)
    for P in Ps:
        for k,v in P.items(): r[k]+=v
    return {k:v for k,v in r.items() if v}
def pneg(P): return {k:-v for k,v in P.items()}
def psmul(c,P): return {k:c*v for k,v in P.items() if c*v}
def jb(P,Q): return padd(pmul(P,Q),pmul(Q,P))
def comm(P,Q): return padd(pmul(P,Q), pneg(pmul(Q,P)))
def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
def stripD(t):
    if isinstance(t,str): return None if t=='D' else t
    l=stripD(t[1]); r=stripD(t[2])
    if l is None and r is None: return None
    if l is None: return r
    if r is None: return l
    return ('*',l,r)
def nuc_key(t): return (flatten(t), stripD(t))
def nuc_nf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[nuc_key(t)]+=c
    return {k:v for k,v in r.items() if v}

D={'D':1}; X={'X':1}; Y={'Y':1}
DX_XD = padd(pmul(D,X), pmul(X,D))
P1 = padd(
    jb(jb(D,Y), jb(X,X)),
    psmul(2, jb(jb(X,Y), DX_XD)),
    pneg(jb(D, jb(Y, jb(X,X)))),
    pneg(psmul(2, jb(X, jb(Y, DX_XD)))),
)
print("P1 nuc-NF size:", len(nuc_nf(P1)))

# candidate W's (deg-2 in X, deg-1 in Y, NO D): all the natural quadratic objects
GX = padd(pmul(X, jb(X,X)), pneg(pmul(jb(X,X), X)))   # cube-assoc of X
cands = {
  "jb(Y,jb(X,X))": jb(Y, jb(X,X)),
  "jb(jb(X,Y),X)": jb(jb(X,Y), X),
  "jb(X,jb(X,Y))": jb(X, jb(X,Y)),
  "jb(jb(X,X),Y)": jb(jb(X,X), Y),
  "GX(cube-assoc X)": GX,
}
# Try P1 = [D,W] for single candidate, and for 2-term combos with coeffs in {-2,-1,1,2}
import itertools
names=list(cands); 
found=False
for n in names:
    for cf in [1,-1,2,-2]:
        if nuc_nf(padd(P1, pneg(psmul(cf, comm(D, cands[n])))))=={}:
            print(f"P1 = {cf}*[D, {n}]   <-- MATCH"); found=True
for (n1,n2) in itertools.combinations(names,2):
    for c1 in [1,-1,2,-2]:
        for c2 in [1,-1,2,-2]:
            W = padd(psmul(c1,cands[n1]), psmul(c2,cands[n2]))
            if nuc_nf(padd(P1, pneg(comm(D, W))))=={}:
                print(f"P1 = [D, {c1}*{n1} + {c2}*{n2}]   <-- MATCH"); found=True
if not found: print("no commutator match in this family")
