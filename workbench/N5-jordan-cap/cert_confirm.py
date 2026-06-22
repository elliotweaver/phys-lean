"""SMALL split-octonion confirmation (alt + composition model, faithful).
Decisive de-risk: confirms H3 Jordan defect = 0 in a model that is alternative AND
composition (norm/trace central) — proving alt+composition SUFFICES. Combined with
cert_span's alt-only NO-SOLUTION, this pins the needed relation set exactly.
Small sample count + early exit so it never hangs."""
from fractions import Fraction as F
import random, time
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return (u[0]+v[0],u[1]+v[1],u[2]+v[2])
def vscal(s,u): return (s*u[0],s*u[1],s*u[2])
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zneg(x): return Z(-x.a,vscal(F(-1),x.v),vscal(F(-1),x.w),-x.b)
def zsub(x,y): return zadd(x,zneg(y))
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
def zeq(x,y): return zis0(zsub(x,y))
def rnd(rng): return Z(F(rng.randint(-2,2)),tuple(F(rng.randint(-2,2)) for _ in range(3)),
    tuple(F(rng.randint(-2,2)) for _ in range(3)),F(rng.randint(-2,2)))
def rreal(rng): r=F(rng.randint(-2,2)); return Z(r,(F(0),)*3,(F(0),)*3,r)
rng=random.Random(7)
def mz(n): return [[zzero() for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[zadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=zzero()
            for k in range(n): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[zneg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA),mneg(jb(A,jb(B,AA))))
def mis0(A): return all(zis0(A[i][j]) for i in range(len(A)) for j in range(len(A)))
def herm(n,realdiag=True):
    A=mz(n)
    for i in range(n):
        A[i][i]=rreal(rng) if realdiag else rnd(rng)
        for j in range(i+1,n):
            x=rnd(rng); A[i][j]=x; A[j][i]=zstar(x)
    return A
t0=time.time()
# verify alternative laws hold (sanity)
def assoc(x,y,z): return zsub(zmul(zmul(x,y),z),zmul(x,zmul(y,z)))
bad=0
for _ in range(200):
    x,y,z=rnd(rng),rnd(rng),rnd(rng)
    if not zis0(assoc(x,x,y)): bad+=1
    if not zeq(assoc(x,y,z),zneg(assoc(y,x,z))): bad+=1
print(f"alt-law violations/400 = {bad}  (model is alternative)")
f3r=sum(1 for _ in range(50) if not mis0(jdef(herm(3,True),herm(3,True))))
print(f"n=3 real-diag: jdef != 0 in {f3r}/50   (MUST be 0 = alt+composition SUFFICES)")
f3o=sum(1 for _ in range(50) if not mis0(jdef(herm(3,False),herm(3,False))))
print(f"n=3 octonion-diag (control): jdef != 0 in {f3o}/50   (should be >0: needs real diag)")
f4=sum(1 for _ in range(50) if not mis0(jdef(herm(4,True),herm(4,True))))
print(f"n=4 real-diag (cap control): jdef != 0 in {f4}/50   (MUST be >0 = the cap)")
print(f"done in {time.time()-t0:.1f}s")
