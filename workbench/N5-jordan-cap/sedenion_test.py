"""Does the diagonal-central-A Jordan slice hold for SEDENIONS too? (=> pure centrality,
no alternativity content). And do the alternating/Moufang laws FAIL on sedenions
(=> they ARE genuine octonion-alternativity content)?"""
from fractions import Fraction as F
import random

# generic Cayley-Dickson over nested tuples (bottom = Fraction), like cd.py
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

LV=4  # sedenions = level 4 (16 coords)
N=16
def rnd(rng): return fc([F(rng.randint(-2,2)) for _ in range(N)],LV)
def rreal(rng):
    cs=[F(0)]*N; cs[0]=F(rng.randint(-3,3)); return fc(cs,LV)

def assoc(a,b,c): return csub(cmul(cmul(a,b),c), cmul(a,cmul(b,c)))

rng=random.Random(5)
# (1) alternating/Moufang laws on sedenions
la=ra=fl=ml=True
for _ in range(300):
    x=rnd(rng); y=rnd(rng); z=rnd(rng)
    if not cis0(assoc(x,x,y)): la=False          # left-alt
    if not cis0(assoc(x,y,y)): ra=False          # right-alt
    if not cis0(assoc(x,y,x)): fl=False          # flexible
    # left Moufang x(y(xz)) = ((xy)x)z
    L=cmul(x,cmul(y,cmul(x,z))); R=cmul(cmul(cmul(x,y),x),z)
    if not cis0(csub(L,R)): ml=False
print(f"SEDENIONS: left-alt holds={la}  right-alt={ra}  flexible={fl}  left-Moufang={ml}")
print("  (False => the law is genuine OCTONION content, lost at the sedenion step)")

# (2) diagonal-central-A Jordan slice on sedenions
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

f=0
for _ in range(150):
    n=3
    A=mz(n)
    for i in range(n): A[i][i]=rreal(rng)
    B=[[rnd(rng) for _ in range(n)] for _ in range(n)]
    if not is0(jdef(A,B)): f+=1
print(f"SEDENIONS: diagonal-central-A H_3 Jordan slice: jdef!=0 in {f}/150 "
      f"({'=> PURE CENTRALITY, no alternativity content' if f==0 else '=> uses non-assoc'})")
