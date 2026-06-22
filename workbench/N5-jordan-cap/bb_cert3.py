"""bb_cert3 (run 57): per-entry certificate over a BROAD pool of DIRECTLY-PROVABLE octonion
levers (each verified zero in Zorn, each provable in Lean by ext;cdsimp;ring at low cost):
  KA family: ka(x,y,w) = (Sx*Sw)*(y*x) - Sx*(Sw*(y*x)) - ((Sx*Sy)*w)*x + (Sx*Sy)*(w*x)
     (the key_assoc associator-transport lever) over all leaf triples.
  NA family (norm-associator): for a norm n = g*Sg (g a leaf), the associator vanishes:
     [n,u,v]=0, [u,n,v]=0, [u,v,n]=0  -> as difference vectors (n*u)*v - n*(u*v) etc.
  NC family (norm-commute): n*u - u*n = 0.
Solve each entry's free-algebra vector in this pool's span (sparse, provenance).
Goal: SOLVE all 9 -> then the Lean proof is linear_combination(norm:=abel) per entry.
"""
from fractions import Fraction as F
from collections import defaultdict

def E_(m): return {m:F(1)}
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
        for my,cy in y.items(): r[('m',mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    _,l,r=m; return ('m',star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}
ZERO={}
def mzero(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            s=dict(ZERO)
            for k in range(3): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: E_(s) if s else dict(ZERO)
    return [[dict(ZERO), z(o01), z(o02)],
            [star(E_(o01)) if o01 else dict(ZERO), dict(ZERO), z(o12)],
            [star(E_(o02)) if o02 else dict(ZERO), star(E_(o12)) if o12 else dict(ZERO), dict(ZERO)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)

L=lambda s:E_(s)
def assocv(x,y,z): return sub(mul(mul(x,y),z), mul(x,mul(y,z)))
LEAVES=['a','b','c','p','A','B','C','P']

def gen_pool():
    inst=[]; seen={}
    def push(name,v):
        if not v: return
        sig=tuple(sorted((str(m),v[m]) for m in v))
        if sig in seen: return
        seen[sig]=True; inst.append((name,v))
    # KA family
    for x in LEAVES:
        for y in LEAVES:
            for w in LEAVES:
                Sx,Sy,Sw=star(L(x)),star(L(y)),star(L(w))
                yx=mul(L(y),L(x)); SxSy=mul(Sx,Sy)
                v=add(mul(mul(Sx,Sw),yx), neg(mul(Sx,mul(Sw,yx))),
                      neg(mul(mul(SxSy,L(w)),L(x))), mul(SxSy,mul(L(w),L(x))))
                push(f"ka({x},{y},{w})",v)
    # NA family: norm n=g*Sg ; associators with n in each slot vanish; over all other args u,v (leaves or deg-2)
    norms=[(g, mul(L(g),star(L(g)))) for g in ['a','b','c','p']]
    norms+=[(g+"'", mul(star(L(g)),L(g))) for g in ['a','b','c','p']]  # Sg*g order too
    args=[L(s) for s in LEAVES] + [mul(L(x),L(y)) for x in LEAVES for y in LEAVES]
    # too many; restrict deg-2 args to those appearing as products in entries (a*c, star a*b, etc.)
    # We'll just use leaf args for NA (norm-associator) and norm-commute, plus a few deg2.
    leafargs=[L(s) for s in LEAVES]
    for gname,n in norms:
        for u in leafargs:
            for vv in leafargs:
                push(f"NA1[{gname}]", assocv(n,u,vv))  # [n,u,v]
                push(f"NA2[{gname}]", assocv(u,n,vv))  # [u,n,v]
                push(f"NA3[{gname}]", assocv(u,vv,n))  # [u,v,n]
            push(f"NC[{gname}]", sub(mul(n,u),mul(u,n)))      # n*u-u*n
    return inst

POOL=gen_pool()
print(f"pool size {len(POOL)}")

def lead(v, order): return min(v, key=lambda m: order[m])
def solve(Ev, inst):
    monset=set(Ev)
    for _,v in inst: monset|=set(v)
    order={m:k for k,m in enumerate(sorted(monset,key=str))}
    pivots={}
    def reduce_vec(v, prov):
        v=dict(v); prov=dict(prov)
        while v:
            lm=lead(v,order)
            if lm in pivots:
                pv,pprov=pivots[lm]
                f=v[lm]/pv[lm]
                v=add(v,{m:-f*cc for m,cc in pv.items()})
                for k,cc in pprov.items(): prov[k]=prov.get(k,F(0))-f*cc
            else: return v,prov,lm
        return v,prov,None
    for idx,(nm,v) in enumerate(inst):
        rv,rp,lm=reduce_vec(v,{idx:F(1)})
        if rv: pivots[lm]=(rv,rp)
    rb,bprov,lm=reduce_vec(dict(Ev),{})
    if rb: return ("NO-SOLUTION", len(rb))
    cert=[(inst[k][0],-cc) for k,cc in bprov.items() if cc!=0]
    return ("SOLVED", cert)

for i in range(3):
    for j in range(3):
        Ev=D[i][j]
        if not Ev: print(f"({i},{j}): ZERO"); continue
        res=solve(Ev,POOL)
        if res[0]=="SOLVED":
            fams=sorted(set(nm.split('(')[0].split('[')[0] for nm,_ in res[1]))
            print(f"({i},{j}): SOLVED cert {len(res[1])} families={fams}")
        else:
            print(f"({i},{j}): NO-SOLUTION residual {res[1]}")
