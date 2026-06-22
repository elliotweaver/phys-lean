"""measure_core (run 57): cheap symbolic W9.2 measurement of the zero-diagonal core
jdef(Xz a b c)(Xz p q r). Goal: find the SMALLEST genuinely-new bankable sub-lemma and
see how jdef_add_right (additivity in the 2nd arg) splits the work.

Reuses the free-tree-monomial model + exact Zorn validation from reduce_rewrite.py.
NO Lean. Prints, per candidate sub-lemma, the per-entry monomial count.
"""
from fractions import Fraction as F
from collections import defaultdict
import random

# ---- exact Zorn (split-octonion) model for soundness validation ----
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zsc(c,x): return Z(c*x.a,vscal(c,x.v),vscal(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(7)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))

# ---- free algebra (tree monomials over atoms a,b,c,p,q,r + conjugates) ----
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
    z=lambda s: E(s) if s else dict(ZERO)
    return [[dict(ZERO), z(o01), z(o02)],
            [z(STAR[o01]) if o01 else dict(ZERO), dict(ZERO), z(o12)],
            [z(STAR[o02]) if o02 else dict(ZERO), z(STAR[o12]) if o12 else dict(ZERO), dict(ZERO)]]

# ---- Zorn evaluation of a free-tree element ----
VAL={}
def fresh_vals():
    VAL.clear()
    for L in 'abcpqr':
        VAL[L]=rndZ(); VAL[L.upper()]=zstar(VAL[L])
def ev(tree):
    if is_leaf(tree): return VAL[tree]
    return zmul(ev(tree[0]),ev(tree[1]))
def evx(x):
    t=zzero()
    for m,c in x.items(): t=zadd(t, zsc(c, ev(m)))
    return t
def entry_zero_in_model(x, trials=30):
    for _ in range(trials):
        fresh_vals()
        if not zis0(evx(x)): return False
    return True

def report(name, A, B):
    D=jdef(A,B)
    print(f"\n=== {name} ===")
    tot=0; allzero=True
    for i in range(3):
        for j in range(3):
            n=len(D[i][j]); tot+=n
            z=entry_zero_in_model(D[i][j])
            allzero = allzero and z
            flag = "" if z else "  <-- NONZERO IN MODEL!"
            if n>0:
                print(f"  ({i},{j}): {n:3d} monomials   zero-in-model={z}{flag}")
    print(f"  TOTAL monomials across entries: {tot};  all entries zero in model: {allzero}")

# The full zero-diagonal core (3 generators each side)
report("FULL CORE  jdef(Xz a b c)(Xz p q r)", Xz(('a','b','c')), Xz(('p','q','r')))

# jdef_add_right splits the 2nd arg into single generators. So the real atoms are:
report("2nd-arg single p  jdef(Xz a b c)(Xz p 0 0)", Xz(('a','b','c')), Xz(('p',None,None)))
report("2nd-arg single q  jdef(Xz a b c)(Xz 0 q 0)", Xz(('a','b','c')), Xz((None,'q',None)))
report("2nd-arg single r  jdef(Xz a b c)(Xz 0 0 r)", Xz(('a','b','c')), Xz((None,None,'r')))

# And we may ALSO want 1st-arg structure. Single generator FIRST arg, general 2nd:
report("1st-arg single a  jdef(Xz a 0 0)(Xz p q r)", Xz(('a',None,None)), Xz(('p','q','r')))

# The banked base, for calibration:
report("BANKED base  jdef(Xz a 0 0)(Xz p 0 0)", Xz(('a',None,None)), Xz(('p',None,None)))

# Two-generator first arg, single 2nd (smallest genuinely-new beyond base?):
report("2gen/1gen  jdef(Xz a b 0)(Xz p 0 0)", Xz(('a','b',None)), Xz(('p',None,None)))
report("2gen/1gen  jdef(Xz a b 0)(Xz 0 q 0)", Xz(('a','b',None)), Xz((None,'q',None)))
