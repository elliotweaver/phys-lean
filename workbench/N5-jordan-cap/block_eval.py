"""Evaluate each atom-multiset block of jdef entry in the FAITHFUL Zorn split-octonion
model (real generic letters), to see if blocks vanish individually or only the full
entry vanishes. Decisive for choosing the Lean proof strategy."""
from fractions import Fraction as F
from collections import defaultdict
import random
# Zorn model
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zneg(x): return Z(-x.a,vscal(F(-1),x.v),vscal(F(-1),x.w),-x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x,tol=0): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(99)
def rnd(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
# assign concrete octonions to letters
VAL={}
for L in 'abcpqr':
    VAL[L]=rnd(); VAL[L.upper()]=zstar(VAL[L])
def ev(tree):
    if isinstance(tree,str): return VAL[tree]
    return zmul(ev(tree[0]),ev(tree[1]))
# rebuild jdef entry symbolic
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r),star_tree(l))
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
def Hm_zero(off):
    o01,o02,o12=off
    return [[dict(ZERO), E(o01), E(o02)],
            [E(STAR[o01]), dict(ZERO), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), dict(ZERO)]]
A=Hm_zero(('a','b','c')); B=Hm_zero(('p','q','r'))
D=jdef(A,B)
def leaves(m,acc):
    if is_leaf(m): acc.append(m)
    else: leaves(m[0],acc); leaves(m[1],acc)
def msig(m):
    acc=[]; leaves(m,acc); return tuple(sorted(acc))
def eval_block(items):
    tot=zzero()
    for m,c in items:
        tot=zadd(tot, Z(c*ev(m).a, vscal(c,ev(m).v), vscal(c,ev(m).w), c*ev(m).b))
    return tot
for (i,j) in [(0,1),(0,0),(1,2),(2,2)]:
    E_=D[i][j]
    bysig=defaultdict(list)
    for m,c in E_.items(): bysig[msig(m)].append((m,c))
    full=eval_block([(m,c) for m,c in E_.items()])
    print(f"entry({i},{j}): full={'ZERO' if zis0(full) else 'NONZERO'}, blocks:")
    nonzero_blocks=0
    for sig,items in sorted(bysig.items()):
        bv=eval_block(items)
        z=zis0(bv)
        if not z: nonzero_blocks+=1
        print(f"   {''.join(sig)}: {'0' if z else 'NONZERO '+str((bv.a,bv.v,bv.w,bv.b))}")
    print(f"   -> nonzero blocks: {nonzero_blocks}")
