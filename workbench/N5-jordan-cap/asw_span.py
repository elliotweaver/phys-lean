"""asw_span (run 58): test whether the asw lever family (asw(x,y,z)=[x,y,z]+[z,y,x] over all
leaf/compound triples appearing) spans EVERY building-block entry, possibly with the
central-norm levers (NA/NC) for the diagonal entries. If yes, the whole building block closes
by per-entry linear_combination(norm:=abel) over asw + norm levers — all bounded ext;ring."""
from fractions import Fraction as F
from collections import defaultdict

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
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}
def E_(x): return {x:F(1)}
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
def aswv(x,y,z): return add(assocv(x,y,z), assocv(z,y,x))
LEAVES=['a','b','c','p','A','B','C','P']
# compound args: products of two leaves (covers b*Sc etc.)
def compounds():
    cs=[]
    for x in LEAVES:
        for y in LEAVES:
            cs.append(mul(L(x),L(y)))
    return cs
ARGS=[L(s) for s in LEAVES]+compounds()

def degree(m): return 1 if isinstance(m,str) else degree(m[0])+degree(m[1])

def gen_pool(tgt):
    inst=[]; seen={}
    def push(name,v):
        if not v: return
        if not all(degree(m)==tgt for m in v): return
        sig=tuple(sorted((str(m),v[m]) for m in v))
        if sig in seen: return
        seen[sig]=True; inst.append((name,v))
    # asw family over all arg triples (cap degree)
    for x in ARGS:
        for y in ARGS:
            for z in ARGS:
                push("asw",aswv(x,y,z))
    # norm-associator + norm-commute for diagonal entries
    norms=[("Na",mul(L('a'),star(L('a')))),("Nb",mul(L('b'),star(L('b')))),
           ("Nc",mul(L('c'),star(L('c')))),("Np",mul(L('p'),star(L('p')))),
           ("Na'",mul(star(L('a')),L('a'))),("Nb'",mul(star(L('b')),L('b'))),
           ("Nc'",mul(star(L('c')),L('c'))),("Np'",mul(star(L('p')),L('p')))]
    for nm,n in norms:
        for u in ARGS:
            for vv in ARGS:
                push(f"NA1[{nm}]",assocv(n,u,vv)); push(f"NA2[{nm}]",assocv(u,n,vv)); push(f"NA3[{nm}]",assocv(u,vv,n))
            push(f"NC[{nm}]",sub(mul(n,u),mul(u,n)))
    return inst

def lead(v, order): return min(v, key=lambda m: order[m])
def solve(E):
    tgt=degree(next(iter(E)))
    inst=gen_pool(tgt)
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
    for idx,(name,v) in enumerate(inst):
        rv,rprov,lm=reduce_vec(v,{idx:F(1)})
        if rv: pivots[lm]=(rv,rprov)
    rb,bprov,lm=reduce_vec(dict(E),{})
    if rb: return ("NO-SOLUTION", len(inst), len(rb))
    cert=[(inst[k][0],-cc) for k,cc in bprov.items() if cc!=0]
    fams=sorted(set(nm.split('(')[0].split('[')[0] for nm,_ in cert))
    return ("SOLVED", len(inst), len(cert), fams)

for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: print(f"({i},{j}): ZERO"); continue
        res=solve(E)
        if res[0]=="SOLVED":
            print(f"({i},{j}): SOLVED pool={res[1]} cert={res[2]} families={res[3]}")
        else:
            print(f"({i},{j}): NO-SOLUTION pool={res[1]} residual={res[2]}")
