"""bb_cert (run 57): per-entry certificate for the building block jdef(Xz a b c)(Xz p 0 0).
For each entry, solve: entry = Σ k_i * ka(args_i)  in the FREE non-associative algebra,
where ka(x,y,w) := (Sx*Sw)*(y*x) - Sx*(Sw*(y*x)) - [ ((Sx*Sy)*w)*x - (Sx*Sy)*(w*x) ]
is the key_assoc lever (LHS-RHS, identically zero). If solvable, the Lean entry proof is
  linear_combination (norm := abel) Σ k_i * ka_i
(with k_i repeated for integer coeffs to keep abel scalar-free).

For DIAGONAL entries the central-norm structure (a*Sa etc.) also appears; we add the
'central' lever family: cd(n,u) := n*u - u*n for n a norm a*Sa (commutativity) and the
two associator-reassociations — but FIRST just try ka-only and report residual.

Sparse incremental span solver with provenance (from cert_span.py).
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

# matrices
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

# ka lever in the free algebra. x,y,w are single leaves (with star as needed).
# ka(x,y,w) = (Sx*Sw)*(y*x) - Sx*(Sw*(y*x)) - ((Sx*Sy)*w)*x + (Sx*Sy)*(w*x)
def Lf(s): return E_(s)
def ka(x,y,w):
    Sx,Sy,Sw = star(Lf(x)), star(Lf(y)), star(Lf(w))
    yx=mul(Lf(y),Lf(x)); SxSy=mul(Sx,Sy)
    t1=mul(mul(Sx,Sw),yx)
    t2=mul(Sx,mul(Sw,yx))
    t3=mul(mul(SxSy,Lf(w)),Lf(x))
    t4=mul(SxSy,mul(Lf(w),Lf(x)))
    return add(t1, neg(t2), neg(t3), t4)

# atoms available (leaves), including conjugates as independent leaves
LEAVES=['a','b','c','p','A','B','C','P']
# generate ka instances over all (x,y,w) leaf triples
def gen_ka():
    inst=[]
    seen={}
    for x in LEAVES:
        for y in LEAVES:
            for w in LEAVES:
                v=ka(x,y,w)
                if not v: continue
                sig=tuple(sorted((str(m),v[m]) for m in v))
                if sig in seen: continue
                seen[sig]=True
                inst.append((f"ka({x},{y},{w})",v))
    return inst

KA_INST=gen_ka()
print(f"generated {len(KA_INST)} distinct ka-instances\n")

def degree(m): return 1 if isinstance(m,str) else degree(m[1])+degree(m[2])
def lead(v, order): return min(v, key=lambda m: order[m])
def solve(E, inst):
    if not E: return ("ZERO",)
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
    if rb: return ("NO-SOLUTION", len(rb), rb)
    cert=[(inst[k][0],-cc) for k,cc in bprov.items() if cc!=0]
    return ("SOLVED", cert)

for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: print(f"({i},{j}): ZERO"); continue
        res=solve(E, KA_INST)
        if res[0]=="SOLVED":
            print(f"({i},{j}): {len(E)} terms SOLVED by ka-only, cert size {len(res[1])}:")
            for nm,cf in res[1]: print(f"        {cf}  {nm}")
        else:
            print(f"({i},{j}): {len(E)} terms  ka-only NO-SOLUTION, residual {res[1]}")
