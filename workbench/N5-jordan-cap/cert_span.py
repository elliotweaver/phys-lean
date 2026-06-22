"""cert_span: sparse incremental span-membership. Decides, per entry, whether the
Jordan-defect lies in the ℚ-span of banked-law difference-vectors. Fast: dict vectors,
pivot basis built incrementally (no dense Gauss-Jordan). Also extracts a certificate
(which law instances, with coeffs) by tracking provenance."""
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
    return [[dict(ZERO),o01,o02],[star(o01),dict(ZERO),o12],[star(o02),star(o12),dict(ZERO)]]
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

def gen_instances(E):
    tgt=degree(next(iter(E)))
    acc=set()
    for m in E: subtrees(m,acc)
    g1=sorted([m for m in acc if degree(m)==1],key=str)
    g2=sorted([m for m in acc if degree(m)==2],key=str)
    inst=[]  # (name, args, vec)
    def consider(name,args,vec):
        if vec and all(degree(m)==tgt for m in vec): inst.append((name,args,vec))
    for x in g1:
        for y in g2:
            consider("left",(x,y),L_left(x,y)); consider("flex",(x,y),L_flex(x,y))
    for x in g2:
        for y in g1:
            consider("right",(x,y),L_right(x,y))
    for d2 in g2:
        for a in g1:
            for b in g1:
                for args in ((d2,a,b),(a,d2,b),(a,b,d2)):
                    consider("swap12",args,L_swap12(*args)); consider("swap23",args,L_swap23(*args))
                    consider("mL",args,L_mL(*args)); consider("mR",args,L_mR(*args)); consider("mM",args,L_mM(*args))
    # dedupe by canonical vector signature (and skip zero)
    seen={}; uniq=[]
    for name,args,v in inst:
        if not v: continue
        sig=tuple(sorted((str(m),v[m]) for m in v))
        if sig in seen: continue
        seen[sig]=True; uniq.append((name,args,v))
    return uniq

def lead(v, order):
    # leading monomial = smallest by the fixed order index
    return min(v, key=lambda m: order[m])

def solve_entry(i,j):
    t0=time.time()
    E=D[i][j]
    if not E: return ("ZERO",)
    inst=gen_instances(E)
    # fixed monomial order over union
    monset=set(E)
    for _,_,v in inst: monset|=set(v)
    order={m:k for k,m in enumerate(sorted(monset,key=str))}
    # incremental pivot basis of the column span; track provenance as coeff dict over instance idx
    pivots={}   # lead_mon -> (reduced_vec, prov_dict)
    def reduce_vec(v, prov):
        v=dict(v); prov=dict(prov)
        while v:
            lm=lead(v,order)
            if lm in pivots:
                pv,pprov=pivots[lm]
                f=v[lm]/pv[lm]
                v=add(v,{m:-f*c for m,c in pv.items()})
                for k,c in pprov.items(): prov[k]=prov.get(k,F(0))-f*c
            else:
                return v,prov,lm
        return v,prov,None
    for idx,(name,args,v) in enumerate(inst):
        rv,rprov,lm=reduce_vec(v,{idx:F(1)})
        if rv: pivots[lm]=(rv,rprov)
    # now reduce target
    rb,bprov,lm=reduce_vec(dict(E),{})
    dt=round(time.time()-t0,2)
    if rb:
        return ("NO-SOLUTION", len(inst), len(pivots), dt, len(rb))
    # bprov: target = -Σ bprov[idx]*instance[idx]?  We built target reduction subtracting pivots;
    # solution coeffs for instances: target ≡ Σ (-bprov over instance basis). Count nonzero.
    cert=[(inst[k][0],inst[k][1],-c) for k,c in bprov.items() if c!=0]
    return ("SOLVED", len(inst), len(pivots), dt, len(cert))

if __name__=="__main__":
    only=sys.argv[1] if len(sys.argv)>1 else None
    for i in range(3):
        for j in range(3):
            if only and f"{i}{j}"!=only: continue
            E=D[i][j]
            if not E: print(f"entry({i},{j}): zero"); continue
            print(f"entry({i},{j}): {len(E)} terms -> {solve_entry(i,j)}")
