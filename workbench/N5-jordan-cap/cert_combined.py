"""cert_combined (run 58): DECISIVE lever-basis test for the building block
jdef(Xz a b c)(Xz p 0 0). Pool = UNION of DIRECTLY-PROVABLE bounded levers:
  - ka family (associator-transport): ka(x,y,w) over all leaf triples.
  - alternating laws: swap12/swap23/left/right/flex/Moufang over deg1+deg2 args.
  - NA (norm-associator): for n=g*Sg or Sg*g, [n,u,v]/[u,n,v]/[u,v,n]=0.
  - NC (norm-commute): n*u - u*n = 0.
Each lever is provable in Lean by `ext;...;ring` at bounded cost (ka measured 16s/3.4GB).
If the union spans an entry, that entry closes by `linear_combination (norm:=abel) Σ cᵢ·levᵢ`.
Report per-entry SOLVED/NO-SOLUTION + which families the cert uses.
"""
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

def degree(m): return 1 if isinstance(m,str) else degree(m[0])+degree(m[1])
def subtrees(m,acc):
    acc.add(m)
    if isinstance(m,tuple): subtrees(m[0],acc); subtrees(m[1],acc)
L=lambda s:E_(s)
def assocv(x,y,z): return sub(mul(mul(x,y),z), mul(x,mul(y,z)))
LEAVES=['a','b','c','p','A','B','C','P']

# alternating-law difference vectors (monomial space)
def L_swap12(x,y,z): return sub(add(E_(((x,y),z)),E_(((y,x),z))), add(E_((x,(y,z))),E_((y,(x,z)))))
def L_swap23(x,y,z): return sub(add(E_(((x,y),z)),E_(((x,z),y))), add(E_((x,(y,z))),E_((x,(z,y)))))
def L_left(x,y):  return sub(E_((x,(x,y))), E_(((x,x),y)))
def L_right(x,y): return sub(E_(((x,y),y)), E_((x,(y,y))))
def L_flex(x,y):  return sub(E_((x,(y,x))), E_(((x,y),x)))
def L_mL(x,y,z):  return sub(E_((x,(y,(x,z)))), E_((((x,y),x),z)))
def L_mR(x,y,z):  return sub(E_((((z,x),y),x)), E_((z,(x,(y,x)))))
def L_mM(x,y,z):  return sub(E_(((x,y),(z,x))), E_((x,((y,z),x))))

def gen_pool(E):
    tgt=degree(next(iter(E)))
    acc=set()
    for m in E: subtrees(m,acc)
    g1=sorted([m for m in acc if degree(m)==1],key=str)
    g2=sorted([m for m in acc if degree(m)==2],key=str)
    allg=g1+g2
    inst=[]; seen={}
    def push(name,v):
        if not v: return
        if not all(degree(m)==tgt for m in v): return
        sig=tuple(sorted((str(m),v[m]) for m in v))
        if sig in seen: return
        seen[sig]=True; inst.append((name,v))
    # ka family over all leaf triples
    for x in LEAVES:
        for y in LEAVES:
            for w in LEAVES:
                Sx,Sy,Sw=star(L(x)),star(L(y)),star(L(w))
                yx=mul(L(y),L(x)); SxSy=mul(Sx,Sy)
                v=add(mul(mul(Sx,Sw),yx), neg(mul(Sx,mul(Sw,yx))),
                      neg(mul(mul(SxSy,L(w)),L(x))), mul(SxSy,mul(L(w),L(x))))
                push(f"ka({x},{y},{w})",v)
    # alternating laws over arg subterms (deg1+deg2)
    for x in allg:
        for y in allg:
            push("left",L_left(x,y)); push("right",L_right(x,y)); push("flex",L_flex(x,y))
    for x in allg:
        for y in allg:
            for z in allg:
                if degree(x)+degree(y)+degree(z)!=tgt: continue
                push("swap12",L_swap12(x,y,z)); push("swap23",L_swap23(x,y,z))
                push("mL",L_mL(x,y,z)); push("mR",L_mR(x,y,z)); push("mM",L_mM(x,y,z))
    # NA / NC over norms and leaf args
    norms=[("Na",mul(L('a'),star(L('a')))),("Nb",mul(L('b'),star(L('b')))),
           ("Nc",mul(L('c'),star(L('c')))),("Np",mul(L('p'),star(L('p')))),
           ("Na'",mul(star(L('a')),L('a'))),("Nb'",mul(star(L('b')),L('b'))),
           ("Nc'",mul(star(L('c')),L('c'))),("Np'",mul(star(L('p')),L('p')))]
    leafargs=[L(s) for s in LEAVES]
    for nm,n in norms:
        for u in leafargs:
            for vv in leafargs:
                push(f"NA1[{nm}]",assocv(n,u,vv))
                push(f"NA2[{nm}]",assocv(u,n,vv))
                push(f"NA3[{nm}]",assocv(u,vv,n))
            push(f"NC[{nm}]",sub(mul(n,u),mul(u,n)))
    return inst

def lead(v, order): return min(v, key=lambda m: order[m])
def solve_entry(E):
    if not E: return ("ZERO",)
    inst=gen_pool(E)
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
    if rb: return ("NO-SOLUTION", len(inst), len(rb), rb)
    cert=[(inst[k][0],-cc) for k,cc in bprov.items() if cc!=0]
    return ("SOLVED", len(inst), len(cert), cert)

for i in range(3):
    for j in range(3):
        E=D[i][j]
        if not E: print(f"({i},{j}): ZERO"); continue
        res=solve_entry(E)
        if res[0]=="SOLVED":
            fams=sorted(set(nm.split('(')[0].split('[')[0] for nm,_ in res[3]))
            print(f"({i},{j}): SOLVED pool={res[1]} cert={res[2]} families={fams}")
        else:
            print(f"({i},{j}): NO-SOLUTION pool={res[1]} residual={res[2]}")
