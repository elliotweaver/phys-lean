"""cert_full: span-membership for jdef_H3 entries using the LAW SET expressible as
additive identities among product-atoms (what `linear_combination (norm := abel)` can
consume). Letters a,b,c (A off-diag), p,q,r (B off-diag); stars are independent letters
(uppercase). Central diagonal scalars d0..d2,e0..e2. Laws:
  - alternative: swap12, swap23, left, right, flex, Moufang (mL,mR,mM)
  - trace-central (per off-diag letter L): [L,x,y]+[L*,x,y]=0 (and mid/right/comm)
  - norm-central (per off-diag letter L): the degree-2 atom (L,L*) is central
  - norm symmetry: L*L* - L**L = 0
  - ocR diagonal centrality: scalar associates/commutes everywhere
We DO NOT bake centrality in by normal-ordering; every use is an explicit additive law
(a column), so a found certificate ports 1:1 to Lean.
"""
from fractions import Fraction as F
from collections import defaultdict
import time, sys

# ---- letters ----
OFF_A=['a','b','c']; OFF_B=['p','q','r']
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
DIAG=['d0','d1','d2','e0','e1','e2']
for d in DIAG: STAR[d]=d   # central reals self-conjugate
CENTRAL=set(DIAG)

def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r),star_tree(l))   # anti-automorphism

# algebra element = dict tree->coeff
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
def E(m): return {m:F(1)}
def starx(x): return {star_tree(m):v for m,v in x.items()}

ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
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

def Hm(diag, off):
    d0,d1,d2=diag; o01,o02,o12=off
    return [[E(d0), E(o01), E(o02)],
            [E(STAR[o01]), E(d1), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), E(d2)]]

ZERODIAG = (None,)  # marker
def Hm_zero(off):
    o01,o02,o12=off
    return [[dict(ZERO), E(o01), E(o02)],
            [E(STAR[o01]), dict(ZERO), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), dict(ZERO)]]

# ---- laws as difference vectors ----
def degree(m):
    if is_leaf(m): return 1
    return degree(m[0])+degree(m[1])
def subtrees(m,acc):
    acc.add(m)
    if not is_leaf(m): subtrees(m[0],acc); subtrees(m[1],acc)

def assoc(x,y,z): return sub(E(((x,y),z)), E((x,(y,z))))   # [x,y,z]=(xy)z - x(yz)
def L_swap12(x,y,z): return add(assoc(x,y,z),assoc(y,x,z))
def L_swap23(x,y,z): return add(assoc(x,y,z),assoc(x,z,y))
def L_left(x,y):  return assoc(x,x,y)
def L_right(x,y): return assoc(x,y,y)
def L_flex(x,y):  return assoc(x,y,x)
def L_mL(x,y,z):  return sub(E((x,(y,(x,z)))), E((((x,y),x),z)))
def L_mR(x,y,z):  return sub(E((((z,x),y),x)), E((z,(x,(y,x)))))
def L_mM(x,y,z):  return sub(E(((x,y),(z,x))), E((x,((y,z),x))))

def gen_laws(target_trees, tgtdeg):
    acc=set()
    for m in target_trees: subtrees(m,acc)
    pool=sorted(acc,key=str)
    laws=[]   # (label, vec)
    def take(label,vec):
        if vec and all(degree(k)==tgtdeg for k in vec): laws.append((label,vec))
    # alternative over all arg combos with right total degree
    for x in pool:
        for y in pool:
            if 2*degree(x)+degree(y)==tgtdeg:
                take(("left",x,y),L_left(x,y)); take(("flex",x,y),L_flex(x,y))
            if degree(x)+2*degree(y)==tgtdeg:
                take(("right",x,y),L_right(x,y))
    for x in pool:
        for y in pool:
            for z in pool:
                if degree(x)+degree(y)+degree(z)==tgtdeg:
                    take(("swap12",x,y,z),L_swap12(x,y,z))
                    take(("swap23",x,y,z),L_swap23(x,y,z))
                if 2*degree(x)+degree(y)+degree(z)==tgtdeg:
                    take(("mL",x,y,z),L_mL(x,y,z)); take(("mR",x,y,z),L_mR(x,y,z)); take(("mM",x,y,z),L_mM(x,y,z))
    # trace-central: for off-diag letter L (deg1), [L,x,y]+[L*,x,y]=0 etc.; comm
    offs=[l for l in 'abcpqr']
    for L in offs:
        Ls=STAR[L]
        for x in pool:
            for y in pool:
                if 1+degree(x)+degree(y)==tgtdeg:
                    take(("trL",L,x,y), add(assoc(L,x,y),assoc(Ls,x,y)))
                    take(("trM",L,x,y), add(assoc(x,L,y),assoc(x,Ls,y)))
                    take(("trR",L,x,y), add(assoc(x,y,L),assoc(x,y,Ls)))
        for x in pool:
            if 1+degree(x)==tgtdeg:
                take(("trC",L,x), sub(add(E((L,x)),E((Ls,x))), add(E((x,L)),E((x,Ls)))))
    # norm-central: degree-2 atom n=(L,L*) central
    for L in offs:
        Ls=STAR[L]; n=(L,Ls)
        for x in pool:
            for y in pool:
                if 2+degree(x)+degree(y)==tgtdeg:
                    take(("nL",L,x,y), assoc(n,x,y))
                    take(("nM",L,x,y), assoc(x,n,y))
                    take(("nR",L,x,y), assoc(x,y,n))
        for x in pool:
            if 2+degree(x)==tgtdeg:
                take(("nC",L,x), sub(E((n,x)),E((x,n))))
        # norm symmetry: L*L* - L**L
        if tgtdeg==2:
            take(("nsym",L), sub(E((L,Ls)),E((Ls,L))))
    # BILINEAR-central (polarized norm): for off-diag L,M, bil=(L,M*)+(M,L*) central
    for ii in range(len(offs)):
        for jj in range(ii+1,len(offs)):
            L=offs[ii]; M=offs[jj]; Ls=STAR[L]; Ms=STAR[M]
            bil=add(E((L,Ms)),E((M,Ls)))  # L*star M + M*star L
            def bassoc(pos,x=None,y=None):
                # associator with bil in position 'pos', distributed over its 2 terms
                if pos=='L': return add(assoc((L,Ms),x,y),assoc((M,Ls),x,y))
                if pos=='M': return add(assoc(x,(L,Ms),y),assoc(x,(M,Ls),y))
                if pos=='R': return add(assoc(x,y,(L,Ms)),assoc(x,y,(M,Ls)))
            for x in pool:
                for y in pool:
                    if 2+degree(x)+degree(y)==tgtdeg:
                        take(("bL",L,M,x,y), bassoc('L',x,y))
                        take(("bM",L,M,x,y), bassoc('M',x,y))
                        take(("bR",L,M,x,y), bassoc('R',x,y))
            for x in pool:
                if 2+degree(x)==tgtdeg:
                    take(("bC",L,M,x), sub(add(E(((L,Ms),x)),E(((M,Ls),x))), add(E((x,(L,Ms))),E((x,(M,Ls))))))
            # bilinear symmetry: (L,M*)+(M,L*) = (M*,L)+(L*,M)  i.e. L star M + M star L = star M L + star L M
            if tgtdeg==2:
                take(("bsym",L,M), sub(add(E((L,Ms)),E((M,Ls))), add(E((Ms,L)),E((Ls,M)))))
    # ocR diagonal centrality: each diag scalar s central
    for s in DIAG:
        for x in pool:
            for y in pool:
                if 1+degree(x)+degree(y)==tgtdeg:
                    take(("dL",s,x,y), assoc(s,x,y))
                    take(("dM",s,x,y), assoc(x,s,y))
                    take(("dR",s,x,y), assoc(x,y,s))
        for x in pool:
            if 1+degree(x)==tgtdeg:
                take(("dC",s,x), sub(E((s,x)),E((x,s))))
    # dedupe by signature
    seen={}; uniq=[]
    for lab,v in laws:
        sig=tuple(sorted((str(k),val) for k,val in v.items()))
        if not sig or sig in seen: continue
        seen[sig]=True; uniq.append((lab,v))
    return uniq

def lead(v,order): return min(v,key=lambda m:order[m])
def solve_entry(E_dict, label=""):
    if not E_dict: return ("ZERO",)
    trees=list(E_dict.keys())
    degs=set(degree(t) for t in trees)
    # the defect is homogeneous degree 4 (3 A's + 1 B) -- but diagonal scalars are degree1
    # so mixed degrees occur. handle per-degree block (laws are degree-homog).
    res={}
    for dgt in sorted(degs):
        blk={t:c for t,c in E_dict.items() if degree(t)==dgt}
        laws=gen_laws(list(blk.keys()),dgt)
        monset=set(blk)
        for _,v in laws: monset|=set(v)
        order={m:k for k,m in enumerate(sorted(monset,key=str))}
        pivots={}
        def reduce_vec(v,prov):
            v=dict(v); prov=dict(prov)
            while v:
                lm=lead(v,order)
                if lm in pivots:
                    pv,pp=pivots[lm]; f=v[lm]/pv[lm]
                    v=add(v,{m:-f*c for m,c in pv.items()})
                    for k,c in pp.items(): prov[k]=prov.get(k,F(0))-f*c
                else: return v,prov,lm
            return v,prov,None
        for idx,(lab,v) in enumerate(laws):
            rv,rp,lm=reduce_vec(v,{idx:F(1)})
            if rv: pivots[lm]=(rv,rp)
        rb,bp,_=reduce_vec(dict(blk),{})
        res[dgt]=("SOLVED" if not rb else "NO-SOLUTION", len(laws), len(rb))
    return res

if __name__=="__main__":
    mode=sys.argv[1] if len(sys.argv)>1 else "zero"
    if mode=="zero":
        A=Hm_zero(('a','b','c')); B=Hm_zero(('p','q','r'))
    else:
        A=Hm(('d0','d1','d2'),('a','b','c')); B=Hm(('e0','e1','e2'),('p','q','r'))
    D=jdef(A,B)
    t0=time.time()
    for i in range(3):
        for j in range(3):
            r=solve_entry(D[i][j],f"{i}{j}")
            print(f"entry({i},{j}): {len(D[i][j])} terms -> {r}")
    print(f"done {time.time()-t0:.1f}s")
