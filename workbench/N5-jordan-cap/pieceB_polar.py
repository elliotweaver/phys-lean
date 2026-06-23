#!/usr/bin/env python3
# RUN 71: derive the ABSTRACT first-arg polarization of jdef in D, with D NUCLEAR.
# jdef(D+X, Y) - jdef(X,Y) collected by D-degree, each piece reduced under the
# D-nuclear normal form (D associates in all positions; D does NOT commute).
# Goal: find the clean abstract matrix identity to prove in Lean.
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
def jb(P,Q): return padd(pmul(P,Q),pmul(Q,P))
def jdef(A,B):
    AA=jb(A,A); return padd(jb(jb(A,B),AA),pneg(jb(A,jb(B,AA))))

def flatten(t):
    if isinstance(t,str): return (t,)
    return flatten(t[1])+flatten(t[2])
def stripD(t):
    if isinstance(t,str):
        return None if t=='D' else t
    l=stripD(t[1]); r=stripD(t[2])
    if l is None and r is None: return None
    if l is None: return r
    if r is None: return l
    return ('*',l,r)
def dcount(t):
    if isinstance(t,str): return 1 if t=='D' else 0
    return dcount(t[1])+dcount(t[2])
# D-nuclear key: leaf SEQUENCE (order kept, non-commutative) + the X/Y bracketing
def nuc_key(t): return (flatten(t), stripD(t))
def nuc_nf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[nuc_key(t)]+=c
    return {k:v for k,v in r.items() if v}

D={'D':1}; X={'X':1}; Y={'Y':1}
delta = padd(jdef(padd(D,X),Y), pneg(jdef(X,Y)))
for deg in [0,1,2,3]:
    piece = {t:c for t,c in delta.items() if dcount(t)==deg}
    nf = nuc_nf(piece)
    print(f"D-degree {deg}: raw monomials={len(piece)}  under D-nuclear NF={len(nf)}")

print("\n--- D-degree-1 piece under D-nuclear NF (the surviving kernel, abstract): ---")
piece1 = {t:c for t,c in delta.items() if dcount(t)==1}
nf1 = nuc_nf(piece1)
for k,v in sorted(nf1.items(), key=lambda kv: str(kv[0])):
    print(f"  {v:+d}  seq={k[0]}  Xbracket={k[1]}")
