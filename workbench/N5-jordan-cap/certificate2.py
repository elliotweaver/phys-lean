"""
CERTIFICATE SOLVER v2 — efficient, single-entry, decisive.

Question 1: does each H_3 Jordan-defect entry lie in the span of INSTANCES of the
banked Alternative.lean laws (alternation only, NO norm/trace centrality)?
Question 2: if not, does adding the composition relations (star a + a = T central,
            a * star a = N central) close it?

We work in the free non-associative *-algebra. Law instances are difference-vectors.
Exact ℚ Gaussian elimination, sparse, with a tight argument pool and timing.
"""
from fractions import Fraction as F
from collections import defaultdict
import time, sys

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
    return [[dict(ZERO),o01,o02],
            [star(o01),dict(ZERO),o12],
            [star(o02),star(o12),dict(ZERO)]]
A=herm3z({'p':F(1)},{'q':F(1)},{'r':F(1)})
B=herm3z({'s':F(1)},{'t':F(1)},{'u':F(1)})
D=jdef(A,B)

def degree(m):
    if isinstance(m,str): return 1
    return degree(m[0])+degree(m[1])
def subtrees(m,acc):
    acc.add(m)
    if isinstance(m,tuple): subtrees(m[0],acc); subtrees(m[1],acc)

def E_(x): return {x:F(1)}
def L_swap12(x,y,z): return sub(add(E_(((x,y),z)),E_(((y,x),z))), add(E_((x,(y,z))),E_((y,(x,z)))))
def L_swap23(x,y,z): return sub(add(E_(((x,y),z)),E_(((x,z),y))), add(E_((x,(y,z))),E_((x,(z,y)))))
def L_left(x,y):  return sub(E_((x,(x,y))), E_(((x,x),y)))
def L_right(x,y): return sub(E_(((x,y),y)), E_((x,(y,y))))
def L_flex(x,y):  return sub(E_((x,(y,x))), E_(((x,y),x)))
def L_mL(x,y,z):  return sub(E_((x,(y,(x,z)))), E_((((x,y),x),z)))
def L_mR(x,y,z):  return sub(E_((((z,x),y),x)), E_((z,(x,(y,x)))))
def L_mM(x,y,z):  return sub(E_(((x,y),(z,x))), E_((x,((y,z),x))))

def solve_entry(i,j,tlimit=60):
    t0=time.time()
    E=D[i][j]
    if not E: return ("ZERO",0,0)
    tgt=degree(next(iter(E)))   # 4
    acc=set()
    for m in E: subtrees(m,acc)
    g1=sorted([m for m in acc if degree(m)==1],key=str)
    g2=sorted([m for m in acc if degree(m)==2],key=str)
    g3=sorted([m for m in acc if degree(m)==3],key=str)
    instances=[]
    def consider(vec):
        if vec and all(degree(m)==tgt for m in vec): instances.append(vec)
    # binary laws reaching degree 4: (deg2,deg2)? no-> left/right/flex use x twice.
    # L_left(x,y): max monomial deg = 2*deg(x)+deg(y). For tgt=4: (x deg1,y deg2) or (x deg1? 2*1+2=4) ; (x deg1,y deg2)
    for x in g1:
        for y in g2:
            consider(L_left(x,y)); consider(L_right(y,x) if False else L_right(x,y))
            consider(L_flex(x,y)); consider(L_flex(y,x))
            consider(L_left(y,x) if False else None) if False else None
    for x in g2:
        for y in g1:
            consider(L_right(x,y))  # (x deg2,y deg1)->? (xy)y deg 2+1+1=4
    # ternary laws degree = sum of arg degrees == 4: partitions (2,1,1),(1,2,1),(1,1,2)
    trip=[]
    for x in g1+g2:
        for y in g1+g2:
            for z in g1+g2:
                if degree(x)+degree(y)+degree(z)==tgt:
                    trip.append((x,y,z))
    for (x,y,z) in trip:
        consider(L_swap12(x,y,z)); consider(L_swap23(x,y,z))
        consider(L_mL(x,y,z)); consider(L_mR(x,y,z)); consider(L_mM(x,y,z))
    # assemble & solve cols x = b
    monset=set(E); 
    for v in instances: monset|=set(v)
    mons=sorted(monset,key=str); midx={m:k for k,m in enumerate(mons)}
    nrows=len(mons); ncols=len(instances)
    M=[[F(0)]*(ncols+1) for _ in range(nrows)]
    for c,v in enumerate(instances):
        for m,val in v.items(): M[midx[m]][c]=val
    for m,val in E.items(): M[midx[m]][ncols]=val
    rr=0; piv=[]
    for cc in range(ncols):
        pr=None
        for r2 in range(rr,nrows):
            if M[r2][cc]!=0: pr=r2; break
        if pr is None: continue
        M[rr],M[pr]=M[pr],M[rr]
        pv=M[rr][cc]; M[rr]=[x/pv for x in M[rr]]
        for r2 in range(nrows):
            if r2!=rr and M[r2][cc]!=0:
                f=M[r2][cc]; M[r2]=[M[r2][k]-f*M[rr][k] for k in range(ncols+1)]
        piv.append((rr,cc)); rr+=1
        if rr==nrows: break
    for r2 in range(nrows):
        if all(M[r2][k]==0 for k in range(ncols)) and M[r2][ncols]!=0:
            return ("NO-SOLUTION",ncols,round(time.time()-t0,1))
    nnz=sum(1 for (rrp,cc) in piv if M[rrp][ncols]!=0)
    return ("SOLVED",ncols,round(time.time()-t0,1),nnz)

if __name__=="__main__":
    only=sys.argv[1] if len(sys.argv)>1 else None
    for i in range(3):
        for j in range(3):
            if only and f"{i}{j}"!=only: continue
            E=D[i][j]
            if not E: print(f"entry({i},{j}): zero"); continue
            res=solve_entry(i,j)
            print(f"entry({i},{j}): {len(E)} terms -> {res}")
