#!/usr/bin/env python3
# RUN 71: verify the BIADDITIVE polar decomposition (squares opaque, no mul-distribution):
#   jdef(D+X,Y) = jdef(X,Y) + jdef(D,Y) + E,   E = the 12 cross terms below.
# Here QD=jb(D,D), QX=jb(X,X), and jb(D,X), jb(X,D) are kept as OPAQUE atoms — the
# decomposition uses ONLY jb-biadditivity (jb_add_left/right), provable abstractly.
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
def jdef(A,B):
    AA=jb(A,A); return padd(jb(jb(A,B),AA),pneg(jb(A,jb(B,AA))))

D={'D':1}; X={'X':1}; Y={'Y':1}
DX=pmul(D,X); XD=pmul(X,D)
jbDX=jb(D,X); jbXD=jb(X,D)
QD=jb(D,D); QX=jb(X,X)
E = padd(
    jb(jb(D,Y), jbDX),
    jb(jb(D,Y), jbXD),
    jb(jb(D,Y), QX),
    jb(jb(X,Y), QD),
    jb(jb(X,Y), jbDX),
    jb(jb(X,Y), jbXD),
    pneg(jb(D, jb(Y, jbDX))),
    pneg(jb(D, jb(Y, jbXD))),
    pneg(jb(D, jb(Y, QX))),
    pneg(jb(X, jb(Y, QD))),
    pneg(jb(X, jb(Y, jbDX))),
    pneg(jb(X, jb(Y, jbXD))),
)
lhs = jdef(padd(D,X), Y)
rhs = padd(jdef(X,Y), jdef(D,Y), E)
resid = padd(lhs, pneg(rhs))
print("polar decomposition residual (FREE model, no nuclearity):", len(resid))
print("  (0 => the 12-term decomposition is a pure biadditive identity, provable by jb_add + abel)")
