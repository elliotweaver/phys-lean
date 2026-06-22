"""group_levers (run 59): the UNIFORM decomposition. For each BB1 entry, partition its
monomials by atom-word (flat letter multiset). Each individually-zero group is a degree-4
zero-identity; the remaining groups pair into cancelling pairs (each also a degree-4
zero-identity). Verify: (i) each lever piece is IDENTICALLY ZERO in the faithful Zorn model
(=> provable by bounded ext;ring like ka), (ii) the pieces sum exactly to the entry.
Output the lever pieces (Lean-ready) and the count, so we can estimate compile cost.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, random, itertools

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

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def fmul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def fstar(x): return {star_mon(m):v for m,v in x.items()}
def E_(x): return {x:F(1)}
Z0={}
def mzero(): return [[dict(Z0) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            s=dict(Z0)
            for k in range(3): s=add(s,fmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: E_(s) if s else dict(Z0)
    return [[dict(Z0), z(o01), z(o02)],
            [fstar(E_(o01)) if o01 else dict(Z0), dict(Z0), z(o12)],
            [fstar(E_(o02)) if o02 else dict(Z0), fstar(E_(o12)) if o12 else dict(Z0), dict(Z0)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)

def flat(m):
    if isinstance(m,str): return (m,)
    return flat(m[0])+flat(m[1])
rng=random.Random(2024)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def ev(m, env):
    if isinstance(m,str): return env[m]
    return zmul(ev(m[0],env), ev(m[1],env))
def ev_vec(vec, env):
    r=zzero()
    for m,c in vec.items():
        t=ev(m,env)
        r=zadd(r, Z(c*t.a, vscal(c,t.v), vscal(c,t.w), c*t.b))
    return r
def vec_is0(vec, trials=200):
    for _ in range(trials):
        env={s:rndZ() for s in ['a','b','c','p']}
        for s in ['a','b','c','p']: env[CONJ[s]]=zstar(env[s])
        if not zis0(ev_vec(vec,env)): return False
    return True

def lean_mon(m):
    if isinstance(m,str):
        return {'a':'a','b':'b','c':'c','p':'p','A':'star a','B':'star b','C':'star c','P':'star p'}[m]
    l,r=m
    sl=lean_mon(l); sr=lean_mon(r)
    return f"({sl} * {sr})"
def lean_vec(vec):
    parts=[]
    for m,c in sorted(vec.items(),key=str):
        s=lean_mon(m)
        if c==1: parts.append(f"+ {s}")
        elif c==-1: parts.append(f"- {s}")
        elif c>0: parts.append(f"+ {c} * {s}")
        else: parts.append(f"- {abs(c)} * {s}")
    return " ".join(parts)

def decompose(i,j,show=False):
    E=D[i][j]
    if not E: return ("ZERO",0,[])
    groups=defaultdict(dict)
    for m,v in E.items(): groups[flat(m)][m]=v
    words=sorted(groups,key=str)
    gvec={w:dict(groups[w]) for w in words}
    indiv0=[w for w in words if vec_is0(gvec[w])]
    rest=[w for w in words if w not in indiv0]
    levers=[]  # each (label, vec)
    for w in indiv0:
        levers.append((f"g[{''.join(w)}]", gvec[w]))
    # pair up the rest: find a perfect matching among rest where pair sums to 0
    radj=defaultdict(list)
    for x in range(len(rest)):
        for y in range(x+1,len(rest)):
            s=add(gvec[rest[x]], gvec[rest[y]])
            if vec_is0(s): radj[x].append(y); radj[y].append(x)
    def match(rem):
        if not rem: return []
        x=min(rem)
        for y in radj[x]:
            if y in rem:
                sub=match(rem-{x,y})
                if sub is not None: return [(x,y)]+sub
        return None
    m=match(frozenset(range(len(rest))))
    if m is None:
        return ("NO-PAIRING", len(rest), levers)
    for (x,y) in m:
        levers.append((f"p[{''.join(rest[x])}+{''.join(rest[y])}]", add(gvec[rest[x]],gvec[rest[y]])))
    # verify each lever zero + sum == E
    allzero=all(vec_is0(v) for _,v in levers)
    tot={}
    for _,v in levers: tot=add(tot,v)
    sumok=(add(tot,neg(E))=={})
    return ("OK", len(levers), levers, allzero, sumok)

todo=[(int(sys.argv[1]),int(sys.argv[2]))] if len(sys.argv)>2 else [(i,j) for i in range(3) for j in range(3)]
for (i,j) in todo:
    r=decompose(i,j)
    if r[0]=="ZERO": print(f"({i},{j}): ZERO"); continue
    if r[0]=="NO-PAIRING":
        print(f"({i},{j}): NO PERFECT PAIRING ({r[1]} unpaired groups)"); continue
    _,n,levers,allzero,sumok=r
    print(f"({i},{j}): {n} levers, all-zero={allzero}, sum==entry={sumok}")
    if len(sys.argv)>2:
        for lab,v in levers:
            print(f"    {lab}:  {lean_vec(v)}")
