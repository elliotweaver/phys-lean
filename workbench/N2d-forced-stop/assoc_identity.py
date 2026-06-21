"""
N2d — extract the EXACT generic associator identity for the A-valued defect.

Over the free NON-associative *-ring with IMAGINARY generators (g*=-g), compute
D(x,y) = Nrm(xy) - Nrm(x)Nrm(y) for x=(a,b), y=(c,d) and express it in terms of
associators  [u,v,w] := (uv)w - u(vw).  Goal: find x,y (functions of base a,b,c)
whose defect is EXACTLY a single associator [a,b,c] (or small multiple), giving the
hard-direction witness:  Nrm-mult on CD A  =>  every [a,b,c]=0  =>  A associative.
"""
from collections import defaultdict
import itertools

ONEM=('one',)
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
    if m==ONEM: return (ONEM,1)
    if m[0]=='i': return (m,-1)
    sl,gl=star_mono(m[0]); sr,gr=star_mono(m[1])
    return ((sr,sl),gl*gr)
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm,sg=star_mono(m); r[sm]+=c*sg
        if r[sm]==0: del r[sm]
    return dict(r)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)),aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z;return aadd(amul(a,astar(a)),amul(astar(b),b))
def D_of(x,y): return asub(Nrm(cd_mul(x,y)),amul(Nrm(x),Nrm(y)))

def assoc(u,v,w): return asub(amul(amul(u,v),w),amul(u,amul(v,w)))

a,b,c = gen(0),gen(1),gen(2)
one={ONEM:1}; zero={}

# Candidate witnesses motivated by the N2c structure: x has im-part, y has im-part.
# N2c: zdX=(e1,e2)=(ι a + e2·?), let's parametrize directly with base entries.
candidates = {
  "x=(a,b) y=(c,1)":   ((a,b),(c,one)),
  "x=(a,b) y=(1,d)":   ((a,b),(one,gen(3))),
  "x=(a,1) y=(b,c)":   ((a,one),(b,c)),
  "x=(1,a) y=(b,c)":   ((one,a),(b,c)),
  "x=(a,b) y=(c,a)":   ((a,b),(c,a)),
  "x=(0,a) y=(b,c)":   ((zero,a),(b,c)),
  "x=(0,a) y=(0,b)":   ((zero,a),(zero,b)),
  "x=(a,0) y=(0,c)":   ((a,zero),(zero,c)),
  "x=(0,a) y=(b,0)":   ((zero,a),(b,zero)),
  "x=(a,b) y=(0,c)":   ((a,b),(zero,c)),
}
# reference associators among a,b,c (and with conj via -)
refs={}
for trip in itertools.product([0,1,2],repeat=3):
    refs[trip]=assoc(gen(trip[0]),gen(trip[1]),gen(trip[2]))

def express(D):
    """try to match D to ± a single associator of distinct gens."""
    hits=[]
    for trip,rf in refs.items():
        if rf and D==rf: hits.append(('+',trip))
        if rf and D==aneg(rf): hits.append(('-',trip))
    return hits

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

for name,(x,y) in candidates.items():
    D=D_of(x,y)
    ra=reduce_assoc(D)
    tag = "VANISHES on assoc base" if not ra else f"{len(ra)} terms survive assoc"
    print(f"{name:18s}: D {len(D)} terms; {tag}; assoc-match={express(D)}")
