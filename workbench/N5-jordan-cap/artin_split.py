"""artin_split (run 51): Artin's theorem says any 2 elements of an alternative algebra
generate an ASSOCIATIVE subalgebra. So monomials of jdef(X,Y) involving <=2 DISTINCT base
generators satisfy the ASSOCIATIVE Jordan identity automatically (jordan_of_ring) and should
sum to ZERO on their own. Test in the faithful Zorn split-octonion model: split each
zero-diagonal-core entry's monomials by #distinct base generators, evaluate each part.
If the <=2-distinct part is ZERO per entry, the child's HARD residual is ONLY the
>=3-distinct-generator monomials (a genuine reduction of the structural work)."""
from fractions import Fraction as F
from collections import defaultdict
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
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(99)
def rnd(): return Z(F(rng.randint(-4,4)),tuple(F(rng.randint(-4,4)) for _ in range(3)),
    tuple(F(rng.randint(-4,4)) for _ in range(3)),F(rng.randint(-4,4)))
VAL={}
for L in 'abcpqr':
    VAL[L]=rnd(); VAL[L.upper()]=zstar(VAL[L])
def ev(tree):
    if isinstance(tree,str): return VAL[tree]
    return zmul(ev(tree[0]),ev(tree[1]))
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def is_leaf(m): return isinstance(m,str)
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(off):
    o01,o02,o12=off
    return [[dict(ZERO), E(o01), E(o02)],
            [E(STAR[o01]), dict(ZERO), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), dict(ZERO)]]
A=Xz(('a','b','c')); B=Xz(('p','q','r'))
D=jdef(A,B)
def leaves(m,acc):
    if is_leaf(m): acc.append(m)
    else: leaves(m[0],acc); leaves(m[1],acc)
def ndistinct(m):
    acc=[]; leaves(m,acc); return len(set(l.lower() for l in acc))
def eval_part(items):
    tot=zzero()
    for m,c in items:
        e=ev(m); tot=zadd(tot, Z(c*e.a, vscal(c,e.v), vscal(c,e.w), c*e.b))
    return tot
print("Per zero-diagonal-core entry: does the <=2-distinct-generator part vanish on its own?")
all_le2_zero=True
for (i,j) in [(0,0),(1,1),(2,2),(0,1),(0,2),(1,2)]:
    E_=D[i][j]
    le2=[(m,c) for m,c in E_.items() if ndistinct(m)<=2]
    ge3=[(m,c) for m,c in E_.items() if ndistinct(m)>=3]
    full=eval_part(list(E_.items()))
    v_le2=eval_part(le2); v_ge3=eval_part(ge3)
    z2=zis0(v_le2); z3=zis0(v_ge3)
    if not z2: all_le2_zero=False
    print(f"  ({i},{j}): full={'0' if zis0(full) else 'NONZERO'} | "
          f"<=2-distinct: {len(le2)} mons -> {'0' if z2 else 'NONZERO'} | "
          f">=3-distinct: {len(ge3)} mons -> {'0' if z3 else 'NONZERO'}")
print(f"\n==> ALL <=2-distinct parts vanish on their own (Artin/associative): {all_le2_zero}")
print("If TRUE: the child's HARD residual is ONLY the >=3-distinct-generator monomials.")
