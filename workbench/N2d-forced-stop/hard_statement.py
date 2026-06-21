"""
N2d — pin the EXACT correct hard-direction statement.

The bare-ring defect carries commutator junk, so "Nrm mult => A assoc" is false over
an arbitrary *-ring. The TRUE forced theorem must use the trunk (Born: self-overlap
central). Candidate clean statements to test numerically/structurally:

  (T1) For the ACTUAL cascade: at each rung, Nrm multiplicative on CD A  while base
       A is associative; the FIRST non-associative base (𝕆) is the FIRST where Nrm
       fails. I.e. on the cascade line, multiplicativity <-> base associativity.
       -> This is provable CONCRETELY (N2c did the S side; the C/H/O side is the
          easy direction). It is the "forced for the cascade" statement.

  (T2) GENERIC contrapositive with an EXPLICIT associator witness: there is a
       universal formula W(p,q,r) giving x,y in CD A from base p,q,r such that
       Nrm(xy) - Nrm(x)Nrm(y) = (a fixed nonzero multiple of) the base associator
       [p,q,r] PLUS commutator-correction terms that VANISH when self-overlaps are
       central. Then: if Nrm is multiplicative AND self-overlaps central, every
       [p,q,r]=0, so A associative.

Test (T2): find x,y as functions of p,q,r (allowing also their stars) such that
the defect, REDUCED MODULO commutators-of-the-relevant-elements, equals the pure
associator [p,q,r]. Do this over the free non-assoc *-ring and check that under the
substitution "make self-overlaps central" the junk dies.

Simplest probe: pick x=(p, q*), y=(r, 0)?  Search systematically for the cleanest.
"""
from collections import defaultdict
import itertools

ONEM=('one',)
def gen(k,conj=False): return {(('gc' if conj else 'g'),k):1}
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
    if m==ONEM: return ONEM
    if m[0] in ('g','gc'): return (('gc' if m[0]=='g' else 'g'),m[1])
    return (star_mono(m[1]),star_mono(m[0]))
def astar(x): return {star_mono(m):c for m,c in x.items()}
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)),aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z;return aadd(amul(a,astar(a)),amul(astar(b),b))
def D_of(x,y): return asub(Nrm(cd_mul(x,y)),amul(Nrm(x),Nrm(y)))

# general (non-assoc) associator
def assoc(u,v,w): return asub(amul(amul(u,v),w),amul(u,amul(v,w)))

# self-overlap centrality reduction: replace any monomial containing a factor of the
# form (g_i,gc_i) or (gc_i,g_i) adjacency ... too ad hoc. Instead test on the actual
# alternative algebra O numerically (done in reframe2). Here: hunt for x,y whose
# defect, AFTER flattening under associativity, is a single associator pattern in
# THREE base letters (mixing g and gc), which is what we can then verify on O.
p,q,r = gen(0),gen(1),gen(2)
P,Q,R = gen(0,True),gen(1,True),gen(2,True)
one={ONEM:1}; zero={}
vocab={'0':zero,'1':one,'p':p,'q':q,'r':r,'P':P,'Q':Q,'R':R}

def leaves(m):
    if m==ONEM: return ()
    if m[0] in ('g','gc'): return (m,)
    return leaves(m[0])+leaves(m[1])
def reduce_assoc(elt):
    r=defaultdict(int)
    for m,co in elt.items():
        r[leaves(m)]+=co
        if r[leaves(m)]==0: del r[leaves(m)]
    return dict(r)

# Among all 4-fills, find those whose defect VANISHES under associativity (pure
# obstruction) and has the FEWEST raw terms; print them — these are hard-dir
# witnesses (their defect is built ONLY from associators).
pure=[]
keys=list(vocab.keys())
for fill in itertools.product(keys,repeat=4):
    x=(vocab[fill[0]],vocab[fill[1]]); y=(vocab[fill[2]],vocab[fill[3]])
    D=D_of(x,y)
    if not D: continue
    if reduce_assoc(D): continue
    pure.append((len(D),fill,D))
pure.sort(key=lambda t:t[0])
print(f"pure-obstruction (vanish-under-assoc) witnesses with stars allowed: {len(pure)}")
for n,fill,D in pure[:10]:
    print("  ",fill,f"-> {n} raw terms")
if pure:
    n,fill,D=pure[0]
    print("\nSimplest pure-obstruction witness:",fill)
    for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
        print(f"    {co:+d} * {m}")
