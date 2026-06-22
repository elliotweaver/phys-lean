"""mat_assoc (run 50): reframe — is jdef a clean ℤ-combination of MATRIX associators?
jdef/2 = (AB)A² + (BA)A² + A²(AB) + A²(BA) − A(BA²) − A(A²B) − (BA²)A − (A²B)A
where A²=A*A (matrix). Test candidate associator decompositions in the exact Zorn model
on a NON-Jordan instance (octonion diagonal, so jdef != 0 — we need the IDENTITY in the
free/general matrix setting, not just on Hermitian). Use GENERIC octonion matrices.
A matrix associator [X,Y,Z]=(XY)Z-X(YZ). If jdef = a fixed ℤ-combo of such, that's a pure
matrix-additive identity (provable in Lean without an associative tactic), reframing the node.
"""
from fractions import Fraction as F
import random
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zsub(x,y): return Z(x.a-y.a,tuple(x.v[i]-y.v[i] for i in range(3)),tuple(x.w[i]-y.w[i] for i in range(3)),x.b-y.b)
def zsc(c,x): return Z(c*x.a,vscal(c,x.v),vscal(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(5)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def mz(n): return [[zzero() for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[zadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def msub(A,B): n=len(A); return [[zsub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mscal(c,A): return [[zsc(c,x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=zzero()
            for k in range(n): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def miszero(M): return all(zis0(M[i][j]) for i in range(len(M)) for j in range(len(M)))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def mneg(A): return mscal(F(-1),A)
def assoc(X,Y,Zz): return msub(mmul(mmul(X,Y),Zz), mmul(X,mmul(Y,Zz)))

def randM(n=3): return [[rndZ() for _ in range(n)] for _ in range(n)]

# jdef/2 explicit
def jdef_half(A,B):
    A2=mmul(A,A)
    AB=mmul(A,B); BA=mmul(B,A)
    t=mz(3)
    t=madd(t,mmul(AB,A2)); t=madd(t,mmul(BA,A2))
    t=madd(t,mmul(A2,AB)); t=madd(t,mmul(A2,BA))
    t=msub(t,mmul(A,mmul(B,A2))); t=msub(t,mmul(A,mmul(A2,B)))
    t=msub(t,mmul(mmul(B,A2),A)); t=msub(t,mmul(mmul(A2,B),A))
    return t

# sanity: jdef = 2*jdef_half ?
A=randM(); B=randM()
print("jdef == 2*jdef_half :", miszero(msub(jdefM(A,B), mscal(F(2),jdef_half(A,B)))))

# candidate: jdef_half = [A,B,A2]+[B,A,A2]-[A,A2,B]-[B,A2,A]+[A2,A,B]+[A2,B,A]-... search small.
# Build basis of associators with args in {A,B,A2}, solve for integer combo matching jdef_half.
A2=mmul(A,A)
args={'A':A,'B':B,'A2':A2}
import itertools
triples=list(itertools.product(args.keys(),repeat=3))
# flatten matrices to vectors over the 8 Zorn coords * 9 entries
def flat(M):
    out=[]
    for i in range(3):
        for j in range(3):
            z=M[i][j]; out+= [z.a,z.b]+list(z.v)+list(z.w)
    return out
# Use several random samples to set up an overdetermined linear system for the combo.
samples=[]
target_vecs=[]
basis_vecs={t:[] for t in triples}
for _ in range(6):
    A=randM(); B=randM(); A2=mmul(A,A)
    av={'A':A,'B':B,'A2':A2}
    tgt=jdef_half(A,B)
    target_vecs+=flat(tgt)
    for t in triples:
        X,Y,Zz=[av[k] for k in t]
        basis_vecs[t]+=flat(assoc(X,Y,Zz))
# solve least-squares exact via building matrix and Gaussian elimination over ℚ
cols=list(triples)
M=[[basis_vecs[c][r] for c in cols] for r in range(len(target_vecs))]
bvec=target_vecs[:]
# Gaussian elimination (rational) to find a solution if consistent
import copy
def solve(M,b):
    M=[row[:]+[b[i]] for i,row in enumerate(M)]
    rows=len(M); cols=len(M[0])-1
    piv=[]
    r=0
    for c in range(cols):
        pr=None
        for rr in range(r,rows):
            if M[rr][c]!=0: pr=rr;break
        if pr is None: continue
        M[r],M[pr]=M[pr],M[r]
        inv=F(1)/M[r][c]
        M[r]=[x*inv for x in M[r]]
        for rr in range(rows):
            if rr!=r and M[rr][c]!=0:
                f=M[rr][c]; M[rr]=[a-f*b2 for a,b2 in zip(M[rr],M[r])]
        piv.append((r,c)); r+=1
        if r==rows: break
    # check consistency
    for rr in range(r,rows):
        if all(M[rr][cc]==0 for cc in range(cols)) and M[rr][cols]!=0:
            return None
    sol=[F(0)]*cols
    for (rr,cc) in piv: sol[cc]=M[rr][cols]
    return sol,piv
res=solve(M,bvec)
if res is None:
    print("NO exact associator combo over {A,B,A2} (with these samples).")
else:
    sol,piv=res
    print("SOLUTION found (jdef_half = Σ coeff·[X,Y,Z]):")
    for c,co in zip(cols,sol):
        if co!=0: print(f"   {co} * [{c[0]},{c[1]},{c[2]}]")
    # verify on fresh sample
    A=randM(); B=randM(); A2=mmul(A,A); av={'A':A,'B':B,'A2':A2}
    acc=mz(3)
    for c,co in zip(cols,sol):
        if co!=0:
            X,Y,Zz=[av[k] for k in c]; acc=madd(acc,mscal(co,assoc(X,Y,Zz)))
    print("   verify on fresh sample: jdef_half - combo == 0 :", miszero(msub(jdef_half(A,B),acc)))
