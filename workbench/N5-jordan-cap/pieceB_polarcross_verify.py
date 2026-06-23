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
D={'D':1}; X={'X':1}; Y={'Y':1}
def pc(D,X,Y):
    return padd(
      jb(jb(D,Y),jb(D,X)), jb(jb(D,Y),jb(X,D)), jb(jb(D,Y),jb(X,X)),
      jb(jb(X,Y),jb(D,D)), jb(jb(X,Y),jb(D,X)), jb(jb(X,Y),jb(X,D)),
      pneg(jb(D,jb(Y,jb(D,X)))), pneg(jb(D,jb(Y,jb(X,D)))), pneg(jb(D,jb(Y,jb(X,X)))),
      pneg(jb(X,jb(Y,jb(D,D)))), pneg(jb(X,jb(Y,jb(D,X)))), pneg(jb(X,jb(Y,jb(X,D)))),
    )
lhs = jdef(padd(D,X),Y)
rhs = padd(jdef(X,Y),jdef(D,Y),pc(D,X,Y))
resid = padd(lhs,pneg(rhs))
print("abstract polar identity FREE residual:", len(resid), "(0 => jdef_polar_first holds over any NonAssocRing)")
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
def nucnf(P):
    r=defaultdict(int)
    for t,c in P.items(): r[(flatten(t),stripD(t))]+=c
    return {k:v for k,v in r.items() if v}
print("jdef(D,Y) nuc-NF:", len(nucnf(jdef(D,Y))), "(0 => Dg nuclear kills it)")
print("polarCross(D,X,Y) nuc-NF size (D nuclear):", len(nucnf(pc(D,X,Y))), "(the surviving pieceB residual)")
