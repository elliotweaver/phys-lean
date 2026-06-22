"""cert_bb (run 57): DECISIVE test — does the building-block entry jdef(Xz a b c)(Xz p 0 0)
close by a FLAT certificate over PRODUCT-FORM alternative-law instances (portable to
`linear_combination (norm := abel)`)? The full-Hm entries needed degree-lowering (sq_ch)
+ star-substitution, which a flat abel cert cannot model. But the building block is
uniformly degree-4 with NO squares to reduce — so a flat span over degree-4 law instances
may close it directly.

Free non-associative algebra on atoms {a,b,c,p, A,B,C,P} (A=star a, ...). star is the
tree-reversing conjugation. Law instances = LHS-RHS difference vectors of the banked
product-form laws:
   mul_swap12: (xy)z+(yx)z - x(yz)-y(xz)
   mul_swap23: (xy)z+(xz)y - x(yz)-x(zy)
   mul_mul_left: x(xy)-(xx)y     mul_mul_right: (xy)y-x(yy)   mul_flex: x(yx)-(xy)x
   moufang_left: x(y(xz))-((xy)x)z   moufang_right: ((zx)y)x-z(x(yx))   moufang_mid: (xy)(zx)-x((yz)x)
Args range over the atoms (deg1) and the relevant deg-2 products appearing in the entry.
Sparse incremental span solver (from cert_span.py). Report per-entry SOLVED/NO-SOLUTION
and certificate size.
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
    allg=g1+g2
    inst=[]
    def consider(name,args,vec):
        if vec and all(degree(m)==tgt for m in vec): inst.append((name,args,vec))
    # 2-arg laws over all arg pairs (any degree)
    for x in allg:
        for y in allg:
            consider("left",(x,y),L_left(x,y)); consider("right",(x,y),L_right(x,y)); consider("flex",(x,y),L_flex(x,y))
    # 3-arg laws over arg triples from g1+g2 (cap total degree at tgt)
    for x in allg:
        for y in allg:
            for z in allg:
                if degree(x)+degree(y)+degree(z)!=tgt: continue
                for nm,fn in (("swap12",L_swap12),("swap23",L_swap23),("mL",L_mL),("mR",L_mR),("mM",L_mM)):
                    consider(nm,(x,y,z),fn(x,y,z))
    seen={}; uniq=[]
    for name,args,v in inst:
        if not v: continue
        sig=tuple(sorted((str(m),v[m]) for m in v))
        if sig in seen: continue
        seen[sig]=True; uniq.append((name,args,v))
    return uniq

def lead(v, order): return min(v, key=lambda m: order[m])
def solve_entry(E):
    t0=time.time()
    if not E: return ("ZERO",)
    inst=gen_instances(E)
    monset=set(E)
    for _,_,v in inst: monset|=set(v)
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
            else:
                return v,prov,lm
        return v,prov,None
    for idx,(name,args,v) in enumerate(inst):
        rv,rprov,lm=reduce_vec(v,{idx:F(1)})
        if rv: pivots[lm]=(rv,rprov)
    rb,bprov,lm=reduce_vec(dict(E),{})
    dt=round(time.time()-t0,2)
    if rb: return ("NO-SOLUTION", len(inst), dt, len(rb))
    cert=[(inst[k][0],inst[k][1],-cc) for k,cc in bprov.items() if cc!=0]
    return ("SOLVED", len(inst), dt, len(cert), cert)

if __name__=="__main__":
    for i in range(3):
        for j in range(3):
            E=D[i][j]
            if not E: print(f"entry({i},{j}): zero"); continue
            res=solve_entry(E)
            print(f"entry({i},{j}): {len(E)} terms -> {res[:4]}")
            if res[0]=="SOLVED" and (i,j) in [(2,2),(0,0)]:
                print(f"    CERT ({len(res[4])} instances):")
                for nm,args,cf in res[4][:30]:
                    print(f"      {cf}  {nm}{args}")
