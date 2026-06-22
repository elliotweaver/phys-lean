"""bb_cert2 (run 57): per-entry certificate over the FULL banked alternative-law battery
applied at COMPOUND arguments. Pool = LHS-RHS difference vectors (identically zero) of:
  mul_swap12(x,y,z): (xy)z+(yx)z-x(yz)-y(xz)
  mul_swap23(x,y,z): (xy)z+(xz)y-x(yz)-x(zy)
  mul_mul_left(x,y): x(xy)-(xx)y
  mul_mul_right(x,y): (xy)y-x(yy)
  mul_flex(x,y): x(yx)-(xy)x
  moufang_left(x,y,z): x(y(xz))-((xy)x)z
  moufang_right(x,y,z): ((zx)y)x-z(x(yx))
  moufang_mid(x,y,z): (xy)(zx)-x((yz)x)
  ka(x,y,w): the derived key_assoc lever (kept; it's a proven consequence)
Args range over leaves AND the deg-2 subterms that actually appear in each entry, so the
instances stay degree-matched (degree 4). Report per-entry SOLVED + cert, plus which law
families the cert uses (so the Lean lemma imports the right banked names).
"""
from fractions import Fraction as F
from collections import defaultdict
import time

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

def degree(m): return 1 if isinstance(m,str) else degree(m[1])+degree(m[2])
def degv(d):  # degree of a single-monomial vector
    (m,)=list(d.keys()); return degree(m)
def subtrees(m,acc):
    acc.add(m)
    if isinstance(m,tuple): subtrees(m[1],acc); subtrees(m[2],acc)

# law difference-vectors over GIVEN argument-vectors (each a single-monomial dict)
def m_(*xs):
    r=xs[0]
    for x in xs[1:]: r=mul(r,x)
    return r
def Lswap12(x,y,z): return sub(add(mul(mul(x,y),z),mul(mul(y,x),z)), add(mul(x,mul(y,z)),mul(y,mul(x,z))))
def Lswap23(x,y,z): return sub(add(mul(mul(x,y),z),mul(mul(x,z),y)), add(mul(x,mul(y,z)),mul(x,mul(z,y))))
def Lleft(x,y):  return sub(mul(x,mul(x,y)), mul(mul(x,x),y))
def Lright(x,y): return sub(mul(mul(x,y),y), mul(x,mul(y,y)))
def Lflex(x,y):  return sub(mul(x,mul(y,x)), mul(mul(x,y),x))
def LmL(x,y,z):  return sub(mul(x,mul(y,mul(x,z))), mul(mul(mul(x,y),x),z))
def LmR(x,y,z):  return sub(mul(mul(mul(z,x),y),x), mul(z,mul(x,mul(y,x))))
def LmM(x,y,z):  return sub(mul(mul(x,y),mul(z,x)), mul(x,mul(mul(y,z),x)))

def gen_pool(E):
    tgt=degree(next(iter(E)))
    acc=set()
    for m in E: subtrees(m,acc)
    g1=sorted([E_(m) for m in acc if degree(m)==1], key=lambda d:str(d))
    g2=sorted([E_(m) for m in acc if degree(m)==2], key=lambda d:str(d))
    allg=g1+g2
    inst=[]; seen={}
    def consider(name,vec):
        if not vec: return
        if any(degree(m)!=tgt for m in vec): return
        sig=tuple(sorted((str(m),vec[m]) for m in vec))
        if sig in seen: return
        seen[sig]=True; inst.append((name,vec))
    def lab(d): 
        (m,)=list(d.keys()); return str(m)
    for x in allg:
        for y in allg:
            consider(f"left[{lab(x)},{lab(y)}]",Lleft(x,y))
            consider(f"right[{lab(x)},{lab(y)}]",Lright(x,y))
            consider(f"flex[{lab(x)},{lab(y)}]",Lflex(x,y))
    for x in allg:
        for y in allg:
            for z in allg:
                if degv(x)+degv(y)+degv(z)!=tgt: continue
                consider(f"sw12[{lab(x)},{lab(y)},{lab(z)}]",Lswap12(x,y,z))
                consider(f"sw23[{lab(x)},{lab(y)},{lab(z)}]",Lswap23(x,y,z))
                consider(f"mL[{lab(x)},{lab(y)},{lab(z)}]",LmL(x,y,z))
                consider(f"mR[{lab(x)},{lab(y)},{lab(z)}]",LmR(x,y,z))
                consider(f"mM[{lab(x)},{lab(y)},{lab(z)}]",LmM(x,y,z))
    return inst

def lead(v, order): return min(v, key=lambda m: order[m])
def solve(E, inst):
    monset=set(E)
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
    rb,bprov,lm=reduce_vec(dict(E),{})
    if rb: return ("NO-SOLUTION", len(inst), len(rb))
    cert=[(inst[k][0],-cc) for k,cc in bprov.items() if cc!=0]
    return ("SOLVED", len(inst), cert)

for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: print(f"({i},{j}): ZERO"); continue
        res=solve(E, gen_pool(E))
        if res[0]=="SOLVED":
            fams=sorted(set(nm.split('[')[0] for nm,_ in res[2]))
            print(f"({i},{j}): {len(E)} terms SOLVED (pool {res[1]}), cert {len(res[2])}, families={fams}")
        else:
            print(f"({i},{j}): {len(E)} terms NO-SOLUTION (pool {res[1]}, residual {res[2]})")
