"""
N2d-hard — pin the EXACT hypotheses and the cleanest associator witness.

Recursive Cayley-Dickson over Fraction, level L (L=1 C, 2 H, 3 O, 4 S).
star a = (re, -im).  product (a,b)(c,d) = (ac - d* b, d a + b c*)  [matches Double.lean].
Nrm(a,b) = a a* + b* b   (the .re component of z*star z; matches ForcedStop.lean Nrm_def).
"""
from fractions import Fraction as Fr
import itertools, random

def z0(k): return Fr(0) if k==0 else (z0(k-1),z0(k-1))
def radd(x,y,k): return x+y if k==0 else (radd(x[0],y[0],k-1),radd(x[1],y[1],k-1))
def rneg(x,k): return -x if k==0 else (rneg(x[0],k-1),rneg(x[1],k-1))
def rsub(x,y,k): return radd(x,rneg(y,k),k)
def rstar(x,k): return x if k==0 else (rstar(x[0],k-1),rneg(x[1],k-1))
def rmul(x,y,k):
    if k==0: return x*y
    a,b=x;c,d=y
    return (rsub(rmul(a,c,k-1),rmul(rstar(d,k-1),b,k-1),k-1),
            radd(rmul(d,a,k-1),rmul(b,rstar(c,k-1),k-1),k-1))
def is0(x,k): return x==0 if k==0 else (is0(x[0],k-1) and is0(x[1],k-1))
def eq(x,y,k): return is0(rsub(x,y,k),k)
def basis(k,i):
    if k==0: return Fr(1)
    h=2**(k-1)
    return (basis(k-1,i),z0(k-1)) if i<h else (z0(k-1),basis(k-1,i-h))
def scale(c,x,k): return c*x if k==0 else (scale(c,x[0],k-1),scale(c,x[1],k-1))
def assoc(x,y,w,k): return rsub(rmul(rmul(x,y,k),w,k), rmul(x,rmul(y,w,k),k), k)
def rand(k,lo=-2,hi=2): return Fr(random.randint(lo,hi)) if k==0 else (rand(k-1,lo,hi),rand(k-1,lo,hi))

# norm on CD(A) where A is at level L-1 = base level kb
def Nrm(z, kb):   # z=(a,b), a,b at level kb
    a,b=z
    return radd(rmul(a,rstar(a,kb),kb), rmul(rstar(b,kb),b,kb), kb)
def cd_mul(z,w,kb):
    a,b=z;c,d=w
    return (rsub(rmul(a,c,kb),rmul(rstar(d,kb),b,kb),kb),
            radd(rmul(d,a,kb),rmul(b,rstar(c,kb),kb),kb))
def D(x,y,kb):
    return rsub(Nrm(cd_mul(x,y,kb), kb), rmul(Nrm(x,kb),Nrm(y,kb),kb), kb)

names={0:"R",1:"C",2:"H",3:"O",4:"S"}

print("=== (1) Nrm multiplicativity of CD(A) by base level (random) ===")
for kb in (0,1,2,3):   # base R,C,H,O -> double C,H,O,S
    fails=0
    for _ in range(300):
        x=(rand(kb),rand(kb)); y=(rand(kb),rand(kb))
        if not is0(D(x,y,kb),kb): fails+=1
    print(f"  base {names[kb]}(assoc={'Y' if kb<3 else 'N'}) -> double {names[kb+1]}: "
          f"Nrm-mult fails {fails}/300 -> {'MULT' if fails==0 else 'BROKEN'}")

print("\n=== (2) Born structure on base: a+a* central? a*a* central? a a*==a* a? ===")
for kb in (0,1,2,3):
    tcf=ncf=symf=0
    for _ in range(200):
        a=rand(kb); y=rand(kb)
        tr=radd(a,rstar(a,kb),kb)           # a + a*
        nm=rmul(a,rstar(a,kb),kb)           # a a*
        nm2=rmul(rstar(a,kb),a,kb)          # a* a
        if not eq(rmul(tr,y,kb),rmul(y,tr,kb),kb): tcf+=1
        if not eq(rmul(nm,y,kb),rmul(y,nm,kb),kb): ncf+=1
        if not eq(nm,nm2,kb): symf+=1
    print(f"  {names[kb]}: trace-central fails {tcf}/200, norm-central fails {ncf}/200, "
          f"selfoverlap-sym fails {symf}/200")

print("\n=== (3) control: associative base where self-overlaps are NOT central (2x2 mat, transpose star) ===")
# build a tiny associative *-ring: 2x2 rational matrices, star = transpose.
def mmul(A,B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def madd(A,B): return tuple(tuple(A[i][j]+B[i][j] for j in range(2)) for i in range(2))
def mneg(A): return tuple(tuple(-A[i][j] for j in range(2)) for i in range(2))
def mstar(A): return tuple(tuple(A[j][i] for j in range(2)) for i in range(2))  # transpose
def mrand(): return tuple(tuple(Fr(random.randint(-2,2)) for _ in range(2)) for _ in range(2))
def mNrm(z):
    a,b=z; return madd(mmul(a,mstar(a)), mmul(mstar(b),b))
def mcd(z,w):
    a,b=z;c,d=w
    return (madd(mmul(a,c),mneg(mmul(mstar(d),b))), madd(mmul(d,a),mmul(b,mstar(c))))
def mD(x,y): 
    L=mNrm(mcd(x,y)); R=mmul(mNrm(x),mNrm(y))
    return madd(L,mneg(R))
mzero=((Fr(0),Fr(0)),(Fr(0),Fr(0)))
fails=0; centfail=0
for _ in range(300):
    a=mrand(); y=mrand()
    nm=mmul(a,mstar(a))
    if mmul(nm,y)!=mmul(y,nm): centfail+=1
    x=(mrand(),mrand()); yy=(mrand(),mrand())
    if mD(x,yy)!=mzero: fails+=1
print(f"  2x2 matrices (ASSOC, transpose-star): self-overlap-central fails {centfail}/300, "
      f"Nrm-mult fails {fails}/300")
print("  => if Nrm-mult FAILS here, associativity ALONE is NOT enough: centrality is load-bearing.")

print("\n=== (4) cleanest GENERAL hard witness x,y(u,v,w) with D = c*[u,v,w] on O ===")
L=3
# search small witnesses: x=(comp,comp), y=(comp,comp), comps in {0, eu, ev, ew, eu*, ...}
# use three octonion imaginary units forming a non-assoc triple, e.g. 1,2,4 (e1,e2,e4)
u,v,w = basis(3,1), basis(3,2), basis(3,4)
us,vs,ws = rstar(u,3),rstar(v,3),rstar(w,3)
A_uvw = assoc(u,v,w,3)   # base associator [u,v,w] in O
print("  base triple (e1,e2,e4) associates?", is0(A_uvw,3))
vocab={'0':z0(3),'u':u,'v':v,'w':w,'us':us,'vs':vs,'ws':ws}
best=[]
for fa in itertools.product(vocab,repeat=4):
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    d=D(x,y,3)
    if is0(d,3): continue
    # try to express d = c * [u,v,w] for small rational c
    # find scale by first nonzero coordinate ratio
    # flatten d and A_uvw to coordinate vectors
    def flat(z,k):
        if k==0: return [z]
        return flat(z[0],k-1)+flat(z[1],k-1)
    dv=flat(d,3); av=flat(A_uvw,3)
    c=None; ok=True
    for di,ai in zip(dv,av):
        if ai==0:
            if di!=0: ok=False;break
        else:
            r=di/ai
            if c is None: c=r
            elif r!=c: ok=False;break
    if ok and c is not None:
        best.append((len([t for t in fa if t!='0']),fa,c))
best.sort()
print(f"  witnesses with D = c*[u,v,w] exactly: {len(best)}")
for n,fa,c in best[:8]:
    print(f"    x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})  D = {c} * [u,v,w]")
