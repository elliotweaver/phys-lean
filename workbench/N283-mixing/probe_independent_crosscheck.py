"""
probe_independent_crosscheck — INDEPENDENT verification of the two load-bearing N283 claims.
Re-derives the octonion table from scratch (a SEPARATE Cayley–Dickson code path from
probe_gram.py), gates it against the ALTERNATIVE laws x(xy)=(xx)y and (yx)x=y(xx) on all 64
basis pairs (a genuine octonion-table correctness check), then recomputes:
  (1) torus Gram off-diagonal B(L1,R1) = 4      (the key new number)
  (2) JOINT centralizer(su(2)_L + colour su(3)) in so(8) = 0   (the deep obstruction)
Plus the CHIRAL-vs-electroweak discriminators: Q,Y non-skew (outside so(8)); angle = 60° chiral.
Run: python3 probe_independent_crosscheck.py  →  EXIT 0, all asserts pass.
"""
from fractions import Fraction as F

def cd_mul(mul, star, add, sub):
    def M(z, w):
        a, b = z; c, d = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    return M
def cd_star(star, neg):
    def S(z):
        a, b = z; return (star(a), neg(b))
    return S
def cd_add(add):
    def A(z, w): a,b=z; c,d=w; return (add(a,c), add(b,d))
    return A
def cd_sub(sub):
    def S(z, w): a,b=z; c,d=w; return (sub(a,c), sub(b,d))
    return S
def cd_neg(neg):
    def N(z): a,b=z; return (neg(a), neg(b))
    return N

m0,s0,a0,su0,n0 = (lambda x,y:x*y),(lambda x:x),(lambda x,y:x+y),(lambda x,y:x-y),(lambda x:-x)
def lift(m,s,a,su,n):
    return cd_mul(m,s,a,su), cd_star(s,n), cd_add(a), cd_sub(su), cd_neg(n)
mC,sC,aC,suC,nC = lift(m0,s0,a0,su0,n0)
mH,sH,aH,suH,nH = lift(mC,sC,aC,suC,nC)
mO,sO,aO,suO,nO = lift(mH,sH,aH,suH,nH)

def flat(z):
    ((a,b),(c,d)),((e,f),(g,h)) = z
    return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v
    return (((a,b),(c,d)),((e,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
E=[basis(i) for i in range(8)]

def eq(z,w): return flat(z)==flat(w)
alt_ok=True
for i in range(8):
    for j in range(8):
        x,y=E[i],E[j]
        if not eq(mO(x,mO(x,y)), mO(mO(x,x),y)): alt_ok=False
        if not eq(mO(mO(y,x),x), mO(y,mO(x,x))): alt_ok=False
sq_ok = all(flat(mO(E[k],E[k]))==[F(-1)]+[F(0)]*7 for k in range(1,8))
id_ok = all(eq(mO(E[0],E[i]),E[i]) and eq(mO(E[i],E[0]),E[i]) for i in range(8))
print(f"[gate] alternative laws hold on all 64 basis pairs: {alt_ok}")
print(f"[gate] e_k^2=-1 (k>=1): {sq_ok};  e0=1 identity: {id_ok}")
assert alt_ok and sq_ok and id_ok, "octonion table FAILED sanity gate"

def leftReg(x):
    return [[flat(mO(x,E[j]))[i] for j in range(8)] for i in range(8)]
def rightReg(x):
    return [[flat(mO(E[j],x))[i] for j in range(8)] for i in range(8)]
def gForm(x,y):
    return flat(mO(x, sO(y)))[0]
def crossOpO(a):
    Mx=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(mO(a,E[j])); col[0]+=gForm(a,E[j])
        for i in range(8): Mx[i][j]=col[i]
    return Mx
def mm(A,B):
    return [[sum(A[i][k]*B[k][j] for k in range(8)) for j in range(8)] for i in range(8)]
def tr(A): return sum(A[i][i] for i in range(8))
def Bf(A,C): return tr(mm(A,C))
def is_skew(A): return all(A[i][j]+A[j][i]==0 for i in range(8) for j in range(8))
def subm(A,B): return [[A[i][j]-B[i][j] for j in range(8)] for i in range(8)]
def comm(A,B): return subm(mm(A,B),mm(B,A))

u1,e2O,e3O,e4O=E[1],E[2],E[3],E[4]
L1,L2,L3=leftReg(u1),leftReg(e2O),leftReg(e3O)
R1=rightReg(u1)
Q=crossOpO(u1); Y=crossOpO(e4O)

print(f"\n[claim 1] B(L1,L1)={Bf(L1,L1)} B(R1,R1)={Bf(R1,R1)} B(L1,R1)={Bf(L1,R1)}  (expect -8,-8,4)")
assert Bf(L1,L1)==-8 and Bf(R1,R1)==-8 and Bf(L1,R1)==4

import math
print(f"[chiral] cos(T3_L,T3_R)=4/sqrt(64)={float(Bf(L1,R1))/math.sqrt(64)} (expect 0.5=60deg)")
print(f"[EW obstruction] Q skew? {is_skew(Q)}  Y skew? {is_skew(Y)}  (expect False,False -> outside so(8))")
assert not is_skew(Q) and not is_skew(Y)

so8=[]; lab=[]
for a in range(8):
    for b in range(a+1,8):
        Mx=[[F(0)]*8 for _ in range(8)]; Mx[a][b]=F(1); Mx[b][a]=F(-1); so8.append(Mx); lab.append((a,b))
def f64(A): return [A[i][j] for i in range(8) for j in range(8)]
def build(v):
    Mx=[[F(0)]*8 for _ in range(8)]
    for k,c in enumerate(v):
        if c!=0: a,b=lab[k]; Mx[a][b]+=c; Mx[b][a]-=c
    return Mx
def nulldim(rows,nc):
    mat=[r[:] for r in rows]; nr=len(mat); piv=0
    for c in range(nc):
        p=None
        for r in range(piv,nr):
            if mat[r][c]!=0: p=r;break
        if p is None: continue
        mat[piv],mat[p]=mat[p],mat[piv]; pv=mat[piv][c]; mat[piv]=[x/pv for x in mat[piv]]
        for r in range(nr):
            if r!=piv and mat[r][c]!=0:
                f=mat[r][c]; mat[r]=[mat[r][j]-f*mat[piv][j] for j in range(nc)]
        piv+=1
    return nc-piv
def nullbasis(rows,nc):
    mat=[r[:] for r in rows]; nr=len(mat); pivc=[]; piv=0
    for c in range(nc):
        p=None
        for r in range(piv,nr):
            if mat[r][c]!=0: p=r;break
        if p is None: continue
        mat[piv],mat[p]=mat[p],mat[piv]; pv=mat[piv][c]; mat[piv]=[x/pv for x in mat[piv]]
        for r in range(nr):
            if r!=piv and mat[r][c]!=0:
                f=mat[r][c]; mat[r]=[mat[r][j]-f*mat[piv][j] for j in range(nc)]
        pivc.append(c); piv+=1
    free=[c for c in range(nc) if c not in pivc]; bv=[]
    for fc in free:
        v=[F(0)]*nc; v[fc]=F(1)
        for i,pc in enumerate(pivc): v[pc]=-mat[i][fc]
        bv.append(v)
    return bv

prods={(i,j):flat(mO(E[i],E[j])) for i in range(8) for j in range(8)}
drows=[]
for i in range(8):
    for j in range(8):
        for out in range(8):
            row=[F(0)]*28
            for k in range(28):
                Ek=so8[k]
                t1=sum(prods[(i,j)][m]*Ek[out][m] for m in range(8))
                t2=sum(Ek[p][i]*prods[(p,j)][out] for p in range(8))
                t3=sum(Ek[q][j]*prods[(i,q)][out] for q in range(8))
                row[k]=t1-t2-t3
            if any(x!=0 for x in row): drows.append(row)
g2b=nullbasis(drows,28)
g2m=[build(v) for v in g2b]
print(f"\n[dim] g2=Der(O)={len(g2b)} (expect 14)")
assert len(g2b)==14

crows=[[g2m[k][out][1] for k in range(len(g2m))] for out in range(8)]
cb=nullbasis(crows,len(g2b))
colour=[]
for v in cb:
    Mx=[[F(0)]*8 for _ in range(8)]
    for k,c in enumerate(v):
        if c!=0: Mx=[[Mx[i][j]+c*g2m[k][i][j] for j in range(8)] for i in range(8)]
    colour.append(Mx)
print(f"[dim] colour={{D in g2: D u1=0}}={len(cb)} (expect 8)")
assert len(cb)==8

def cent(gens):
    rows=[]
    for g in gens:
        cols=[f64(comm(Ek,g)) for Ek in so8]
        for r in range(64): rows.append([cols[k][r] for k in range(28)])
    return nulldim(rows,28)
print(f"[dim] centralizer(su(2)_L) in so(8)={cent([L1,L2,L3])} (expect 6)")
assert cent([L1,L2,L3])==6
jc=cent([L1,L2,L3]+colour)
print(f"[claim 2] JOINT centralizer(su(2)_L + colour su(3)) in so(8)={jc} (expect 0)")
assert jc==0

print("\n=== ALL INDEPENDENT CROSS-CHECKS PASSED ===")
print("verdict CONFIRMED: no colour-neutral abelian u(1)_Y in so(8); torus angle is chiral 60deg;")
print("gather Q,Y outside so(8) => mixing-angle VALUE NOT forceable posit-free from the spinor torus.")
