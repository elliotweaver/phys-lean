"""
N2d — DECISIVE: with IMAGINARY generators (star g = -g, the cascade's actual
structure: e_i* = -e_i), is the norm defect a PURE base associator?

Free NON-associative algebra on generators g0,g1,... with involution star fixed by
star(g_i) = -g_i  (imaginary units), extended as an involutive anti-automorphism,
and star(1)=1.  This is EXACTLY the structure of the imaginary units in the
cascade algebras (e_i* = -e_i, the N2c witnesses e1+e10, e5+e14 are imaginary).

Compute D(x,y) = N(xy)-N(x)N(y) on CD A for x=(a,b), y=(c,d) with a,b,c,d drawn
from imaginary generators, and check whether D reduces to a base ASSOCIATOR
[u,v,w] = (uv)w - u(vw).
"""
from collections import defaultdict
import itertools

# monomials: ONEM, or ('i',k) imaginary generator k, or (L,R) node.
ONEM = ('one',)
def gen(k): return {('i',k):1}
def aadd(x,y):
    r=defaultdict(int,x)
    for m,c in y.items():
        r[m]+=c
        if r[m]==0: del r[m]
    return dict(r)
def aneg(x): return {m:-c for m,c in x.items()}
def asub(x,y): return aadd(x,aneg(y))
def amul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            if mx==ONEM and my==ONEM: key=ONEM
            elif mx==ONEM: key=my
            elif my==ONEM: key=mx
            else: key=(mx,my)
            r[key]+=cx*cy
            if r[key]==0: del r[key]
    return dict(r)
def star_mono(m):
    # involutive anti-automorphism, star(g_i) = -g_i (sign tracked by caller)
    if m==ONEM: return (ONEM, 1)
    if m[0]=='i': return (m, -1)            # star(g)= -g
    L,R = m
    sl,sgnl = star_mono(L); sr,sgnr = star_mono(R)
    return ((sr,sl), sgnl*sgnr)             # reverse order, multiply signs
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm,sgn=star_mono(m)
        r[sm]+=c*sgn
        if r[sm]==0: del r[sm]
    return dict(r)
def cd_mul(z,w):
    a,b=z; c,d=w
    return (asub(amul(a,c),amul(astar(d),b)), aadd(amul(d,a),amul(b,astar(c))))
def nrm(z):
    re,im=z
    return aadd(amul(re,astar(re)),amul(astar(im),im))
def D_of(x,y): return asub(nrm(cd_mul(x,y)),amul(nrm(x),nrm(y)))

def leaves(m):
    if m==ONEM: return ()
    if m[0]=='i': return (m,)
    return leaves(m[0])+leaves(m[1])
def reduce_assoc(elt):
    r=defaultdict(int)
    for m,co in elt.items():
        r[leaves(m)]+=co
        if r[leaves(m)]==0: del r[leaves(m)]
    return dict(r)

g=[gen(k) for k in range(4)]
one={ONEM:1}; zero={}
def assoc(u,v,w): return asub(amul(amul(u,v),w),amul(u,amul(v,w)))

# reference associators among imaginary gens
refs={}
for trip in itertools.product(range(4),repeat=3):
    refs[trip]=assoc(g[trip[0]],g[trip[1]],g[trip[2]])

def match_assoc(D):
    out=[]
    for trip,rf in refs.items():
        if rf and D==rf: out.append(('+',trip))
        if rf and D==aneg(rf): out.append(('-',trip))
    return out

vocab={'0':zero,'1':one}
for k in range(4): vocab[f'g{k}']=g[k]

print("Hunting imaginary-generator witnesses (xr,xi,yr,yi) with D == +/- associator:")
hits=[]
keys=list(vocab.keys())
for fill in itertools.product(keys,repeat=4):
    xr,xi,yr,yi=(vocab[k] for k in fill)
    D=D_of((xr,xi),(yr,yi))
    if not D: continue
    ma=match_assoc(D)
    if ma:
        hits.append((fill,ma,len(D)))
print(f"  exact-associator hits: {len(hits)}")
for fill,ma,n in hits[:20]:
    print("   ",fill,"-> D ==",ma,f"({n} terms)")

# Also: simplest defects that VANISH under associativity (pure obstruction)
print("\nSimplest defects that vanish under associativity (pure assoc obstruction):")
pure=[]
for fill in itertools.product(keys,repeat=4):
    xr,xi,yr,yi=(vocab[k] for k in fill)
    D=D_of((xr,xi),(yr,yi))
    if not D: continue
    if reduce_assoc(D): continue
    pure.append((len(D),fill,D))
pure.sort(key=lambda t:t[0])
print(f"  pure-obstruction fills: {len(pure)}")
for n,fill,D in pure[:8]:
    print("   ",fill,f"D({n} terms):")
    for mono,co in sorted(D.items(),key=lambda kv:str(kv[0])):
        print(f"        {co:+d} * {mono}")
    print("        matches:",match_assoc(D))
