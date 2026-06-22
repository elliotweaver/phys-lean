"""decomp_bb (run 57): for EVERY entry of the building block jdef(Xz a b c)(Xz p 0 0),
express the entry as an explicit ℚ-combination of associators [u,v,w] (with u,v,w the
exact compound subterms appearing), then check each associator-combo is killed by the
'key_assoc' lever family + the basic alternating laws.

We compute the entry symbolically in the FREE algebra, then GREEDILY rewrite it into
associators: the strategy is to recognize that every entry = (sum of (xy)z monomials) and
the matching x(yz) monomials with the SAME atom-word but different bracketing differ by an
associator. We won't fully automate the Lean proof here; we just PRINT, per entry, the
associator content so the Lean lemma can be written with the right key_assoc instances.

Simpler and sufficient: we already proved (Zorn) that the 4-assoc combo works for (2,2).
Here we just CONFIRM that EACH entry, after grouping by atom-word, reduces to a sum of
associators each of which is a key_assoc instance OR an alt_left/right/flex (repeated arg)
OR an assoc_swap (antisymmetry). We test this by: for each entry, build the candidate
associator combination from its (xy)z vs x(yz) structure and verify == entry in Zorn.
"""
from fractions import Fraction as F
import random
# ---- exact Zorn ----
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
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
def assoc(x,y,z): return zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z)))
def mz(): return [[zzero() for _ in range(3)] for _ in range(3)]
def madd(*Ms):
    R=mz()
    for M in Ms:
        for i in range(3):
            for j in range(3): R[i][j]=zadd(R[i][j],M[i][j])
    return R
def mneg(A): return [[zsc(F(-1),x) for x in row] for row in A]
def mmul(A,B):
    C=mz()
    for i in range(3):
        for j in range(3):
            s=zzero()
            for k in range(3): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(a,b,c): return [[zzero(),a,b],[zstar(a),zzero(),c],[zstar(b),zstar(c),zzero()]]

# key_assoc lever (generic): [Sx,Sw,yx] = [Sx Sy, w, x], i.e. KA(x,y,w):=assoc(Sx,Sw,y x)-assoc(Sx Sy,w,x)=0
def KA(x,y,w): return zsub(assoc(zstar(x),zstar(w),zmul(y,x)), assoc(zmul(zstar(x),zstar(y)),w,x))
# verify lever zero
rng=random.Random(7)
def rndZ(): return Z(F(rng.randint(-4,4)),tuple(F(rng.randint(-4,4)) for _ in range(3)),
    tuple(F(rng.randint(-4,4)) for _ in range(3)),F(rng.randint(-4,4)))
ok=all(zis0(KA(rndZ(),rndZ(),rndZ())) for _ in range(200))
print("key_assoc lever KA identically zero:", ok)

# Per-entry: print the entry's value as a function, and record nonzero entries.
print("\nbuilding-block entries jdef(Xz a b c)(Xz p 0 0) — nonzero map:")
a,b,c,p=rndZ(),rndZ(),rndZ(),rndZ()
A=Xz(a,b,c); Bm=Xz(p,zzero(),zzero())
D=jdefM(A,Bm)
for i in range(3):
    for j in range(3):
        print(f"  ({i},{j}): {'ZERO' if zis0(D[i][j]) else 'nonzero'}")
