#!/usr/bin/env python3
# Is P1 itself zero (abstractly / nuclear), or does it need entrywise alternativity?
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
print('P1 free / D-nuclear-NF:', len(P1), '/', len(nuc_nf(P1)))
print('(if D-nuclear-NF P1 != 0, P1 needs the MATRIX structure of D,X,Y + alternativity entrywise)')
