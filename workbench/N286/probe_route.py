"""
N286 route-finding probe v2 (fast). Find explicit rational combo:
   d(A,B,X,Y) = sum_k c_k * jdef(P_k, Q_k)
with P_k,Q_k integer-affine combos of A,B,X,Y, valid over ALL octonion matrices,
so that on Hermitian args each jdef=0 => d=0.

Uses the fully-multilinear polarization PolJ(u,v,w;t) (inclusion-exclusion, purely (1,1,1)
in u,v,w and linear in t). Small samples, numpy-free exact solve via few components.
"""
from fractions import Fraction as F
import random

def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    def lstar(z):
        (a, b) = z; return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w; return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w; return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub
def neg_gen():
    def n(z): return (n(z[0]), n(z[1])) if isinstance(z, tuple) else -z
    return n
lneg = neg_gen()
C_mul,C_star,C_add,C_sub = make_level(lambda x,y:x*y, lambda x:x, lambda x,y:x+y, lambda x,y:x-y)
H_mul,H_star,H_add,H_sub = make_level(C_mul,C_star,C_add,C_sub)
O_mul,O_star,O_add,O_sub = make_level(H_mul,H_star,H_add,H_sub)
def Ozero(): return (((F(0),F(0)),(F(0),F(0))),((F(0),F(0)),(F(0),F(0))))
def flat(z):
    ((za,zb),(zc,zd))=z; (a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd; return [a,b,c,d,e,f,g,h]
def unflat(v): a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def Orand(): return unflat([F(random.randint(-2,2)) for _ in range(8)])
N=3
def Mzero(): return [[Ozero() for _ in range(N)] for _ in range(N)]
def Madd(A,B): return [[O_add(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Msub(A,B): return [[O_sub(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Msmul(c,A): return [[unflat([c*x for x in flat(A[i][j])]) for j in range(N)] for i in range(N)]
def Mmul(A,B):
    C=Mzero()
    for i in range(N):
        for j in range(N):
            acc=Ozero()
            for k in range(N): acc=O_add(acc,O_mul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def Mstar(A): return [[O_star(A[j][i]) for j in range(N)] for i in range(N)]
def Mflat(A):
    v=[]
    for i in range(N):
        for j in range(N): v.extend(flat(A[i][j]))
    return v
def Mis_zero(A): return all(x==0 for x in Mflat(A))
def jb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return Msub(jb(jb(A,B),AA), jb(A,jb(B,AA)))
def innerMul(A,B):
    return lambda X: Msub(jb(A,jb(B,X)), jb(B,jb(A,X)))
def deriv_defect(A,B,X,Y):
    D=innerMul(A,B); return Msub(D(jb(X,Y)), Madd(jb(D(X),Y), jb(X,D(Y))))
def Mrand(): return [[Orand() for _ in range(N)] for _ in range(N)]
def Mherm():
    A=Mzero()
    for i in range(N): A[i][i]=unflat([F(random.randint(-2,2))]+[F(0)]*7)
    for i in range(N):
        for j in range(i+1,N):
            o=Orand(); A[i][j]=o; A[j][i]=O_star(o)
    return A

def Ssum(*a):
    acc=Mzero()
    for x in a: acc=Madd(acc,x)
    return acc
def PolJ(u,v,w,t):
    # inclusion-exclusion trilinear symmetric polarization of P->jdef(P,t) at (u,v,w)
    return Msub(
        Ssum(jdef(Ssum(u,v,w),t), jdef(u,t), jdef(v,t), jdef(w,t)),
        Ssum(jdef(Ssum(u,v),t), jdef(Ssum(u,w),t), jdef(Ssum(v,w),t)))

random.seed(11)
# sanity + multilinearity of d
def check_multilinear():
    A,B,X,Y=Mrand(),Mrand(),Mrand(),Mrand()
    d1=deriv_defect(Madd(A,A),B,X,Y)  # scale A by 2
    d2=Msmul(F(2),deriv_defect(A,B,X,Y))
    linA = Mis_zero(Msub(d1,d2))
    return linA
print("[d linear in A]", check_multilinear())
gz=sum(0 if Mis_zero(deriv_defect(Mrand(),Mrand(),Mrand(),Mrand())) else 1 for _ in range(30))
hz=sum(0 if Mis_zero(deriv_defect(Mherm(),Mherm(),Mherm(),Mherm())) else 1 for _ in range(30))
print(f"[sanity] general d nonzero {gz}/30 ; hermitian d nonzero {hz}/30")

# Basis of multilinear (1,1,1,1) instances.  Start with 4 fully-symmetric PolJ (choice of t).
def basis_instances(A,B,X,Y):
    V=[A,B,X,Y]; names=['A','B','X','Y']; insts=[]; labels=[]
    for t in range(4):
        rest=[i for i in range(4) if i!=t]
        insts.append(PolJ(V[rest[0]],V[rest[1]],V[rest[2]],V[t]))
        labels.append(f"PolJ({names[rest[0]]},{names[rest[1]]},{names[rest[2]]};{names[t]})")
    return insts,labels

def gauss_solve(rows, rhs):
    M=[r[:]+[rhs[i]] for i,r in enumerate(rows)]
    ncol=len(rows[0]); r=0; piv=[]
    for c in range(ncol):
        p=None
        for rr in range(r,len(M)):
            if M[rr][c]!=0: p=rr;break
        if p is None: continue
        M[r],M[p]=M[p],M[r]; inv=M[r][c]; M[r]=[x/inv for x in M[r]]
        for rr in range(len(M)):
            if rr!=r and M[rr][c]!=0:
                f=M[rr][c]; M[rr]=[a-f*b for a,b in zip(M[rr],M[r])]
        piv.append(c); r+=1
        if r==len(M): break
    sol=[F(0)]*ncol
    for i,c in enumerate(piv): sol[c]=M[i][ncol]
    # consistency check
    for i,row in enumerate(rows):
        s=sum(row[k]*sol[k] for k in range(ncol))
        if s!=rhs[i]: return None
    return sol

def solve_and_verify(basis_fn, tuples_solve=4, trials=40):
    rows=[]; rhs=[]; labels=None
    for _ in range(tuples_solve):
        A,B,X,Y=Mrand(),Mrand(),Mrand(),Mrand()
        d=Mflat(deriv_defect(A,B,X,Y))
        insts,labels=basis_fn(A,B,X,Y)
        IF=[Mflat(m) for m in insts]
        for comp in range(len(d)):
            rows.append([IF[k][comp] for k in range(len(insts))]); rhs.append(d[comp])
    sol=gauss_solve(rows,rhs)
    if sol is None: return None,labels,None
    bad=0
    for _ in range(trials):
        A,B,X,Y=Mrand(),Mrand(),Mrand(),Mrand()
        d=deriv_defect(A,B,X,Y); insts,_=basis_fn(A,B,X,Y)
        acc=Mzero()
        for c,m in zip(sol,insts): acc=Madd(acc,Msmul(c,m))
        if not Mis_zero(Msub(d,acc)): bad+=1
    return sol,labels,bad

sol,labels,bad = solve_and_verify(basis_instances)
print("\n[symmetric PolJ basis] solve:", "CONSISTENT" if sol else "INCONSISTENT")
if sol:
    for c,l in zip(sol,labels): print(f"   {l}: {c}")
    print(f"   verify mismatches: {bad}/40")
    if bad==0: print(">>> UNIVERSAL IDENTITY d = sum c_k PolJ  FOUND.")

# ================= FREENESS TEST: does the identity hold over SEDENIONS (non-alternative)? =================
# If it holds over CD(O)=sedenions too, it is (very likely) a FREE NonAssocRing identity => abel-provable.
S_mul,S_star,S_add,S_sub = make_level(O_mul,O_star,O_add,O_sub)  # sedenions = CD(O)
def Szero(): return (Ozero(), Ozero())
def Sflat(z): return flat(z[0]) + flat(z[1])
def Sunflat(v): return (unflat(v[:8]), unflat(v[8:]))
def Srand(): return Sunflat([F(random.randint(-2,2)) for _ in range(16)])
def SMzero(): return [[Szero() for _ in range(N)] for _ in range(N)]
def SMadd(A,B): return [[S_add(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def SMsub(A,B): return [[S_sub(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def SMsmul(c,A): return [[Sunflat([c*x for x in Sflat(A[i][j])]) for j in range(N)] for i in range(N)]
def SMmul(A,B):
    C=SMzero()
    for i in range(N):
        for j in range(N):
            acc=Szero()
            for k in range(N): acc=S_add(acc,S_mul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def SMflat(A):
    v=[]
    for i in range(N):
        for j in range(N): v.extend(Sflat(A[i][j]))
    return v
def SMis_zero(A): return all(x==0 for x in SMflat(A))
def Sjb(A,B): return SMadd(SMmul(A,B),SMmul(B,A))
def Sjdef(A,B):
    AA=Sjb(A,A); return SMsub(Sjb(Sjb(A,B),AA), Sjb(A,Sjb(B,AA)))
def SinnerMul(A,B):
    return lambda X: SMsub(Sjb(A,Sjb(B,X)), Sjb(B,Sjb(A,X)))
def Sderiv_defect(A,B,X,Y):
    D=SinnerMul(A,B); return SMsub(D(Sjb(X,Y)), SMadd(Sjb(D(X),Y), Sjb(X,D(Y))))
def SSsum(*a):
    acc=SMzero()
    for x in a: acc=SMadd(acc,x)
    return acc
def SPolJ(u,v,w,t):
    return SMsub(
        SSsum(Sjdef(SSsum(u,v,w),t), Sjdef(u,t), Sjdef(v,t), Sjdef(w,t)),
        SSsum(Sjdef(SSsum(u,v),t), Sjdef(SSsum(u,w),t), Sjdef(SSsum(v,w),t)))
def SMrand(): return [[Srand() for _ in range(N)] for _ in range(N)]

bad_sed=0
for _ in range(60):
    A,B,X,Y=SMrand(),SMrand(),SMrand(),SMrand()
    d=Sderiv_defect(A,B,X,Y)
    rhs=SMsub(SMsmul(F(1,2),SPolJ(B,X,Y,A)), SMsmul(F(1,2),SPolJ(A,X,Y,B)))
    if not SMis_zero(SMsub(d,rhs)): bad_sed+=1
print(f"\n[FREENESS via SEDENIONS] d = 1/2 PolJ(B,X,Y;A) - 1/2 PolJ(A,X,Y;B) mismatches: {bad_sed}/60")
print(">>> holds over sedenions => FREE NonAssocRing identity (abel-provable)" if bad_sed==0 else ">>> FAILS over sedenions => NOT free; identity is O-specific")
