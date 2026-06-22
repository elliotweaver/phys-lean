"""Diagnostic ONLY: how big is the certificate linear system per entry?
No Gaussian elimination — just count terms, pool, instances, matrix dims."""
from fractions import Fraction as F
from collections import defaultdict
import time

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={}
def reg(g,gc): CONJ[g]=gc; CONJ[gc]=g
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}
ZERO={}
def mzero(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
reg('p','pc'); reg('q','qc'); reg('r','rc')
reg('s','sc'); reg('t','tc'); reg('u','uc')
def herm3z(o01,o02,o12):
    return [[dict(ZERO),o01,o02],[star(o01),dict(ZERO),o12],[star(o02),star(o12),dict(ZERO)]]
A=herm3z({'p':F(1)},{'q':F(1)},{'r':F(1)})
B=herm3z({'s':F(1)},{'t':F(1)},{'u':F(1)})
t0=time.time()
D=jdef(A,B)
print(f"jdef computed in {time.time()-t0:.2f}s")
def degree(m):
    if isinstance(m,str): return 1
    return degree(m[0])+degree(m[1])
def subtrees(m,acc):
    acc.add(m)
    if isinstance(m,tuple): subtrees(m[0],acc); subtrees(m[1],acc)
for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E:
            print(f"entry({i},{j}): ZERO"); continue
        acc=set()
        for m in E: subtrees(m,acc)
        g1=[m for m in acc if degree(m)==1]
        g2=[m for m in acc if degree(m)==2]
        g3=[m for m in acc if degree(m)==3]
        print(f"entry({i},{j}): {len(E)} terms | subtrees deg1={len(g1)} deg2={len(g2)} deg3={len(g3)} | ternpool(g1+g2)={len(g1)+len(g2)} -> ~{(len(g1)+len(g2))**3} ternary triples")
