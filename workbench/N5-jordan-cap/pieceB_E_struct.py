#!/usr/bin/env python3
# E = the 12 cross terms. With D nuclear, reduce E under D-nuclear NF: how many survive?
# And: split E by D-degree to see the structure. The deg-1-in-D part is the real kernel.
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
def dcount(t):
    if isinstance(t,str): return 1 if t=='D' else 0
    return dcount(t[1])+dcount(t[2])
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
DX=pmul(D,X); XD=pmul(X,D)
jbDX=jb(D,X); jbXD=jb(X,D); QD=jb(D,D); QX=jb(X,X)
E = padd(
    jb(jb(D,Y), jbDX), jb(jb(D,Y), jbXD), jb(jb(D,Y), QX),
    jb(jb(X,Y), QD), jb(jb(X,Y), jbDX), jb(jb(X,Y), jbXD),
    pneg(jb(D, jb(Y, jbDX))), pneg(jb(D, jb(Y, jbXD))), pneg(jb(D, jb(Y, QX))),
    pneg(jb(X, jb(Y, QD))), pneg(jb(X, jb(Y, jbDX))), pneg(jb(X, jb(Y, jbXD))),
)
print("E free:", len(E), " E D-nuclear-NF:", len(nuc_nf(E)))
for deg in [1,2,3]:
    piece={t:c for t,c in E.items() if dcount(t)==deg}
    print(f"  E D-deg {deg}: free={len(piece)} nuc-NF={len(nuc_nf(piece))}")
