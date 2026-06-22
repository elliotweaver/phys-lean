"""verify_bb22 (run 57): VERIFY by exact Zorn that the (2,2) entry of the building block
jdef(Xz a b c)(Xz p 0 0) equals the 4-associator combination I read off the Lean trace:

  (2,2)/2 = [SC,SP,ac] + [SB,p,SA*b] - [SC*SA,p,c] - [SB*a,SP,b]

where SA=star a, SB=star b, SC=star c, SP=star p, and [x,y,z]=(x*y)*z - x*(y*z).
If TRUE, the entry is a pure associator combination and step (d) of the sequenced rewrite
applies. Then test whether THAT combination is provably zero (it must be, since the entry
is zero) and HOW: is it in the span of the linearized alt-laws (swap12/swap23/Moufang)?
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
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(11)
def rndZ(): return Z(F(rng.randint(-4,4)),tuple(F(rng.randint(-4,4)) for _ in range(3)),
    tuple(F(rng.randint(-4,4)) for _ in range(3)),F(rng.randint(-4,4)))

def assoc(x,y,z): return zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z)))

# matrices over Z
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

ok_struct=True; ok_2x=True
for _ in range(300):
    a,b,c,p = rndZ(),rndZ(),rndZ(),rndZ()
    A=Xz(a,b,c); Bm=Xz(p,zzero(),zzero())
    D=jdefM(A,Bm)
    e22 = D[2][2]
    SA,SB,SC,SP = zstar(a),zstar(b),zstar(c),zstar(p)
    comb = madd_scalar = zadd(
        zadd(assoc(SC,SP,zmul(a,c)), assoc(SB,p,zmul(SA,b))),
        zadd(zsc(F(-1),assoc(zmul(SC,SA),p,c)), zsc(F(-1),assoc(zmul(SB,a),SP,b))))
    # claim: e22 == 2*comb
    if not zis0(zsub(e22, zsc(F(2),comb))): ok_2x=False
print("building-block (2,2) == 2 * ([SC,SP,ac]+[SB,p,SA*b]-[SC*SA,p,c]-[SB*a,SP,b]):", ok_2x)

# Now: is `comb` itself identically zero (it must be)? And do the 4 associators
# cancel via the alternating property in some clean way? Print which pairings vanish.
print("\nsample associator magnitudes (should each be NONZERO individually, sum to 0):")
a,b,c,p = rndZ(),rndZ(),rndZ(),rndZ()
SA,SB,SC,SP = zstar(a),zstar(b),zstar(c),zstar(p)
A1=assoc(SC,SP,zmul(a,c)); A2=assoc(SB,p,zmul(SA,b))
A3=zsc(F(-1),assoc(zmul(SC,SA),p,c)); A4=zsc(F(-1),assoc(zmul(SB,a),SP,b))
for nm,t in [("A1=[SC,SP,ac]",A1),("A2=[SB,p,SA b]",A2),("A3=-[SC SA,p,c]",A3),("A4=-[SB a,SP,b]",A4)]:
    print(f"  {nm}: zero={zis0(t)}")
print("  sum A1+A2+A3+A4 zero:", zis0(zadd(zadd(A1,A2),zadd(A3,A4))))
