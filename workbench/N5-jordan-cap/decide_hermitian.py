"""Two decisive facts for the H_3 production proof:
 (1) Does n=3 jdef=0 hold for GENERAL 3x3 over O (no Hermitian), or ONLY Hermitian?
 (2) Does the FULL Hermitian n=3 identity FAIL on SEDENIONS (the moat: breaks when
     alternativity breaks)?
"""
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

def run(LV):
    N=1<<LV
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
    def is0(A): return all(cis0(A[i][j]) for i in range(len(A)) for j in range(len(A)))
    def herm(n,rng):
        A=mz(n)
        for i in range(n):
            A[i][i]=rreal(rng)
            for j in range(i+1,n):
                x=rnd(rng); A[i][j]=x; A[j][i]=cstar(x)
        return A
    rng=random.Random(3)
    # general (non-Hermitian) 3x3
    fg=0
    for _ in range(40):
        A=[[rnd(rng) for _ in range(3)] for _ in range(3)]
        B=[[rnd(rng) for _ in range(3)] for _ in range(3)]
        if not is0(jdef(A,B)): fg+=1
    # Hermitian 3x3
    fh=0
    for _ in range(40):
        A=herm(3,rng); B=herm(3,rng)
        if not is0(jdef(A,B)): fh+=1
    # Hermitian, but complex (not real) diagonal
    fc_=0
    for _ in range(40):
        A=mz(3); B=mz(3)
        for i in range(3):
            A[i][i]=rnd(rng); B[i][i]=rnd(rng)  # arbitrary octonion diagonal (not self-conj)
            for j in range(i+1,3):
                x=rnd(rng); A[i][j]=x; A[j][i]=cstar(x)
                y=rnd(rng); B[i][j]=y; B[j][i]=cstar(y)
        if not is0(jdef(A,B)): fc_+=1
    return fg,fh,fc_

for LV,name in ((3,"OCTONIONS"),(4,"SEDENIONS")):
    fg,fh,fc_=run(LV)
    print(f"{name} n=3: general(non-Herm) jdef!=0 in {fg}/200 | "
          f"Hermitian(real diag) {fh}/200 | Hermitian(octonion diag) {fc_}/200")
