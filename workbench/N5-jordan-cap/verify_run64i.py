"""verify_run64i: the decisive assembly question. Does dropping the central diagonal from
the FIRST argument hold when the SECOND argument is HERMITIAN?

  R1 := jdef(D+X, E+Y) - jdef(X, E+Y)   [E+Y arbitrary Hermitian 2nd arg]
Test BOTH:
  - exact Zorn (alternative): should be 0 (the reduction holds in the real octonions)
  - free non-assoc (centrality only): residual = the alt burden of THIS reduction

If R1 free-clean -> jdef(Hm,Hm)=jdef(X,Hm)=jdef(X,E)+jdef(X,Y)=jdef(X,E)+0, single alt piece.
Also test the master-identity route's alt piece directly: jdef(X,E)=0 needs G_X off-diag=0.
And confirm full target via the chosen route in Zorn.
"""
from fractions import Fraction as F
import random
from collections import defaultdict
# ---- exact Zorn ----
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd3(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal3(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd3(x.v,y.v),vadd3(x.w,y.w),x.b+y.b)
def zsub(x,y): return Z(x.a-y.a,tuple(x.v[i]-y.v[i] for i in range(3)),tuple(x.w[i]-y.w[i] for i in range(3)),x.b-y.b)
def zsc(c,x): return Z(c*x.a,vscal3(c,x.v),vscal3(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd3(vadd3(vscal3(x.a,y.v),vscal3(y.b,x.v)),vscal3(F(-1),cross(x.w,y.w)))
    w=vadd3(vadd3(vscal3(y.a,x.w),vscal3(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal3(F(-1),x.v),vscal3(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
def zscalar(t): return Z(F(t),(F(0),)*3,(F(0),)*3,F(t))
rng=random.Random(31)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def mz(): return [[zzero() for _ in range(3)] for _ in range(3)]
def madd(*Ms):
    R=mz()
    for M in Ms:
        for i in range(3):
            for j in range(3): R[i][j]=zadd(R[i][j],M[i][j])
    return R
def mneg(A): return [[zsc(F(-1),x) for x in row] for row in A]
def msub(A,B): return madd(A,mneg(B))
def mmul(A,B):
    C=mz()
    for i in range(3):
        for j in range(3):
            s=zzero()
            for k in range(3): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def miszero(A): return all(zis0(A[i][j]) for i in range(3) for j in range(3))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA),mneg(jb(A,jb(B,AA))))
def Dp(d): return [[zscalar(d[0]),zzero(),zzero()],[zzero(),zscalar(d[1]),zzero()],[zzero(),zzero(),zscalar(d[2])]]
def Xp(o): a,b,c=o; return [[zzero(),a,b],[zstar(a),zzero(),c],[zstar(b),zstar(c),zzero()]]

r1z=full=jxe=0; N=300
for _ in range(N):
    d=[rng.randint(-3,3) for _ in range(3)]; e=[rng.randint(-3,3) for _ in range(3)]
    D=Dp(d);E=Dp(e);X=Xp(tuple(rndZ() for _ in range(3)));Y=Xp(tuple(rndZ() for _ in range(3)))
    Hm1=madd(D,X); Hm2=madd(E,Y)
    if not miszero(msub(jdefM(Hm1,Hm2), jdefM(X,Hm2))): r1z+=1   # drop D, Herm 2nd arg
    if not miszero(jdefM(Hm1,Hm2)): full+=1
    if not miszero(jdefM(X,E)): jxe+=1
print(f"exact Zorn (alternative), {N} samples:")
print(f"  R1 Zorn: jdef(Hm1,Hm2)=jdef(X,Hm2) [drop D, Herm 2nd arg] : nonzero={r1z}")
print(f"  full jdef(Hm1,Hm2)=0                                       : nonzero={full}")
print(f"  jdef(X,E)=0 [single residual after drop-D + add_right]     : nonzero={jxe}")

# ---- free model: alt burden of R1 ----
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def smul(s1,s2): return tuple(sorted(s1+s2))
def Eo(atom): return {((),atom):F(1)}
def Es(s): return {((s,),'1'):F(1)}
Zero={}
def fvadd(*vs):
    r=defaultdict(F)
    for v in vs:
        for k,c in v.items(): r[k]+=c
    return {k:c for k,c in r.items() if c!=0}
def fvneg(v): return {k:-c for k,c in v.items()}
def ftmul(t1,t2):
    if t1=='1': return t2
    if t2=='1': return t1
    return ('*',t1,t2)
def fvmul(a,b):
    r=defaultdict(F)
    for (s1,t1),c1 in a.items():
        for (s2,t2),c2 in b.items(): r[(smul(s1,s2),ftmul(t1,t2))]+=c1*c2
    return {k:c for k,c in r.items() if c!=0}
def fmz(): return [[dict(Zero) for _ in range(3)] for _ in range(3)]
def fmadd(*Ms):
    R=fmz()
    for M in Ms:
        for i in range(3):
            for j in range(3): R[i][j]=fvadd(R[i][j],M[i][j])
    return R
def fmneg(A): return [[fvneg(x) for x in row] for row in A]
def fmsub(A,B): return fmadd(A,fmneg(B))
def fmmul(A,B):
    C=fmz()
    for i in range(3):
        for j in range(3):
            s=dict(Zero)
            for k in range(3): s=fvadd(s,fvmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def fjb(A,B): return fmadd(fmmul(A,B),fmmul(B,A))
def fjdef(A,B):
    AA=fjb(A,A); return fmadd(fjb(fjb(A,B),AA),fmneg(fjb(A,fjb(B,AA))))
def fDm(d): return [[Es(d[0]),dict(Zero),dict(Zero)],[dict(Zero),Es(d[1]),dict(Zero)],[dict(Zero),dict(Zero),Es(d[2])]]
def fXz(o):
    a,b,c=o; return [[dict(Zero),Eo(a),Eo(b)],[Eo(STAR[a]),dict(Zero),Eo(c)],[Eo(STAR[b]),Eo(STAR[c]),dict(Zero)]]
def ftot(M): return sum(len(M[i][j]) for i in range(3) for j in range(3))
fD=fDm(['d0','d1','d2']);fE=fDm(['e0','e1','e2']);fX=fXz(('a','b','c'));fY=fXz(('p','q','r'))
fHm1=fmadd(fD,fX);fHm2=fmadd(fE,fY)
R1free=fmsub(fjdef(fHm1,fHm2), fjdef(fX,fHm2))
print()
print(f"free model: R1 = jdef(Hm1,Hm2)-jdef(X,Hm2) [drop D, Herm 2nd] alt burden = {ftot(R1free)}")
print(f"  (0 => drop-D-for-Hermitian-2nd-arg is CENTRALITY-CLEAN, abstractly provable!)")
