"""Is jdef(A,B) Hermitian when A,B are Hermitian? (i.e. jdef i j = star (jdef j i))
If yes, proving the 6 upper-triangle+diagonal entries (0,0),(0,1),(0,2),(1,1),(1,2),(2,2)
zero gives the lower triangle for free."""
from fractions import Fraction as F
import random
def issc(x): return isinstance(x,F)
def cadd(x,y): return x+y if issc(x) else (cadd(x[0],y[0]),cadd(x[1],y[1]))
def cneg(x): return -x if issc(x) else (cneg(x[0]),cneg(x[1]))
def csub(x,y): return cadd(x,cneg(y))
def cstar(x): return x if issc(x) else (cstar(x[0]),cneg(x[1]))
def cmul(x,y):
    if issc(x): return x*y
    a,b=x; c,d=y
    return (csub(cmul(a,c),cmul(cstar(d),b)), cadd(cmul(d,a),cmul(b,cstar(c))))
def czero(L): return F(0) if L==0 else (czero(L-1),czero(L-1))
def cis0(x): return x==0 if issc(x) else (cis0(x[0]) and cis0(x[1]))
def fc(cs,L):
    def b(L,l):
        if L==0: return l[0],l[1:]
        re,l=b(L-1,l); im,l=b(L-1,l); return (re,im),l
    o,r=b(L,[F(c) for c in cs]); assert r==[]; return o
LV=3;N=8
def rnd(rng): return fc([F(rng.randint(-2,2)) for _ in range(N)],LV)
def rreal(rng):
    cs=[F(0)]*N; cs[0]=F(rng.randint(-3,3)); return fc(cs,LV)
def mz(n): return [[czero(LV) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[cadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=czero(LV)
            for k in range(n): s=cadd(s,cmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[cneg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def herm(n,rng):
    A=mz(n)
    for i in range(n):
        A[i][i]=rreal(rng)
        for j in range(i+1,n):
            x=rnd(rng); A[i][j]=x; A[j][i]=cstar(x)
    return A
rng=random.Random(9)
ok=True; offdiag_zero=True
for _ in range(300):
    A=herm(3,rng); B=herm(3,rng); D=jdef(A,B)
    for i in range(3):
        for j in range(3):
            if not cis0(csub(D[i][j], cstar(D[j][i]))): ok=False
print("jdef(A,B) is Hermitian (D i j = star(D j i)):", ok)
print("=> proving upper-tri+diag (0,0),(0,1),(0,2),(1,1),(1,2),(2,2) = 0 gives lower for free")
