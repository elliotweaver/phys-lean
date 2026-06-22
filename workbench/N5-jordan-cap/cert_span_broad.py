"""cert_span_broad: same incremental span test, but argument pool widened to ALL
degree<=2 products of the 12 generators (p,q,r,s,t,u + conjugates), not just the
entry's own subtrees. If STILL no-solution, alt-only is genuinely insufficient
(not a pool artifact) and composition relations are required."""
from fractions import Fraction as F
from collections import defaultdict
import time, sys, itertools
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
D=jdef(A,B)
def degree(m):
    if isinstance(m,str): return 1
    return degree(m[0])+degree(m[1])
def E_(x): return {x:F(1)}
def L_swap12(x,y,z): return sub(add(E_(((x,y),z)),E_(((y,x),z))), add(E_((x,(y,z))),E_((y,(x,z)))))
def L_swap23(x,y,z): return sub(add(E_(((x,y),z)),E_(((x,z),y))), add(E_((x,(y,z))),E_((x,(z,y)))))
def L_left(x,y):  return sub(E_((x,(x,y))), E_(((x,x),y)))
def L_right(x,y): return sub(E_(((x,y),y)), E_((x,(y,y))))
def L_flex(x,y):  return sub(E_((x,(y,x))), E_(((x,y),x)))
def L_mL(x,y,z):  return sub(E_((x,(y,(x,z)))), E_((((x,y),x),z)))
def L_mR(x,y,z):  return sub(E_((((z,x),y),x)), E_((z,(x,(y,x)))))
def L_mM(x,y,z):  return sub(E_(((x,y),(z,x))), E_((x,((y,z),x))))
GENS=['p','pc','q','qc','r','rc','s','sc','t','tc','u','uc']
def gen_pool():
    g1=[g for g in GENS]
    g2=[(a,b) for a in GENS for b in GENS]  # all 144 degree-2 products
    return g1,g2
def lead(v,order): return min(v,key=lambda m: order[m])
def solve_entry(i,j,tlimit=40):
    import signal
    class TO(Exception): pass
    def _a(s,f): raise TO()
    signal.signal(signal.SIGALRM,_a); signal.alarm(tlimit)
    t0=time.time()
    try:
        E=D[i][j]
        if not E: return ("ZERO",)
        tgt=4
        g1,g2=gen_pool()
        inst=[]
        def consider(vec):
            if vec and all(degree(m)==tgt for m in vec): inst.append(vec)
        for x in g1:
            for y in g2:
                consider(L_left(x,y)); consider(L_flex(x,y))
        for x in g2:
            for y in g1:
                consider(L_right(x,y))
        for d2 in g2:
            for a in g1:
                for b in g1:
                    for args in ((d2,a,b),(a,d2,b),(a,b,d2)):
                        consider(L_swap12(*args)); consider(L_swap23(*args))
                        consider(L_mL(*args)); consider(L_mR(*args)); consider(L_mM(*args))
        monset=set(E)
        for v in inst: monset|=set(v)
        order={m:k for k,m in enumerate(sorted(monset,key=str))}
        pivots={}
        def reduce_vec(v):
            v=dict(v)
            while v:
                lm=lead(v,order)
                if lm in pivots:
                    pv=pivots[lm]; f=v[lm]/pv[lm]
                    v=add(v,{m:-f*c for m,c in pv.items()})
                else: return v,lm
            return v,None
        for v in inst:
            rv,lm=reduce_vec(v)
            if rv: pivots[lm]=rv
        rb,lm=reduce_vec(dict(E))
        signal.alarm(0)
        dt=round(time.time()-t0,2)
        return (("SOLVED" if not rb else "NO-SOLUTION"), len(inst), len(pivots), dt, len(rb))
    except TO:
        return ("TIMEOUT", len(inst) if 'inst' in dir() else -1, tlimit)
if __name__=="__main__":
    only=sys.argv[1] if len(sys.argv)>1 else "01"
    i,j=int(only[0]),int(only[1])
    print(f"entry({i},{j}) BROAD pool -> {solve_entry(i,j)}")
