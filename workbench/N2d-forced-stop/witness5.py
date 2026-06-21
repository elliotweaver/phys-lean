"""
N2d — the HARD-DIRECTION WITNESS.

Find x=(xr,xi), y=(yr,yi) in CD A (base entries from {0,1,a,b,c, conj}) whose
A-VALUED self-overlap defect  D(x,y)=Nrm(xy)-Nrm(x)Nrm(y)  is, after imposing base
associativity, a NONZERO base associator-type expression in DISTINCT base elements
a,b,c — i.e. a witness that BITES on a power-associative non-associative algebra like
O (where [g,g,g]=0 but [a,b,c]≠0 for distinct units).

We use imaginary generators (g_i* = -g_i, the cascade structure). We:
  1) compute D over the free NON-assoc *-algebra,
  2) reduce under ASSOCIATIVITY (flatten); if nonzero, D is a pure assoc obstruction,
  3) further reduce that under POWER-ASSOCIATIVITY-ish: we instead directly test the
     witness numerically on O (level 3): is D(x,y) != 0 there? (O is the base whose
     non-associativity must break CD(O)=S.)
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# ---- free non-assoc *-algebra, imaginary gens ----
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

# ---- numeric O (level 3) to TEST whether a witness bites on O ----
def z0(L): return Fr(0) if L==0 else (z0(L-1),z0(L-1))
def radd(x,y,L): return x+y if L==0 else (radd(x[0],y[0],L-1),radd(x[1],y[1],L-1))
def rneg(x,L): return -x if L==0 else (rneg(x[0],L-1),rneg(x[1],L-1))
def rstar(x,L): return x if L==0 else (rstar(x[0],L-1),rneg(x[1],L-1))
def rmul(x,y,L):
    if L==0: return x*y
    a,b=x;c,d=y
    return (radd(rmul(a,c,L-1),rneg(rmul(rstar(d,L-1),b,L-1),L-1),L-1),
            radd(rmul(d,a,L-1),rmul(b,rstar(c,L-1),L-1),L-1))
def is0(x,L): return x==0 if L==0 else (is0(x[0],L-1) and is0(x[1],L-1))
def basis(L,k):
    if L==0: return Fr(1)
    h=2**(L-1)
    return (basis(L-1,k),z0(L-1)) if k<h else (z0(L-1),basis(L-1,k-h))
# A-valued Nrm on CD(O): base level 3, double level 4. Nrm: CD(O)->O.
def NrmS(z):  # z = (re,im) with re,im in O (level3)
    a,b=z
    return radd(rmul(a,rstar(a,3),3), rmul(rstar(b,3),b,3), 3)
def cd_mulS(z,w):
    a,b=z;c,d=w
    re=radd(rmul(a,c,3),rneg(rmul(rstar(d,3),b,3),3),3)
    im=radd(rmul(d,a,3),rmul(b,rstar(c,3),3),3)
    return (re,im)
def D_S(x,y):  # A-valued defect in O
    return radd(NrmS(cd_mulS(x,y)), rneg(rmul(NrmS(x),NrmS(y),3),3), 3)

# leaves / assoc reduce
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

g=[gen(k) for k in range(3)]
one={ONEM:1}; zero={}
vocab={'0':zero,'1':one,'a':g[0],'b':g[1],'c':g[2]}
keys=list(vocab.keys())

# numeric O units for the same symbols: a=e1,b=e2,c=e3 (imaginary octonion units)
unit={'0':z0(3),'1':basis(3,0),'a':basis(3,1),'b':basis(3,2),'c':basis(3,3)}

print("Searching witnesses whose A-valued defect (i) vanishes under base-assoc AND")
print("(ii) is NONZERO on the actual algebra O (so it BITES on a power-assoc nonassoc base):")
found=[]
for fill in itertools.product(keys,repeat=4):
    xr,xi,yr,yi=(vocab[k] for k in fill)
    D=D_of((xr,xi),(yr,yi))
    if not D: continue
    if reduce_assoc(D): continue          # must be pure associator obstruction
    # test on O numerically
    ux=(unit[fill[0]],unit[fill[1]]); uy=(unit[fill[2]],unit[fill[3]])
    DO=D_S(ux,uy)
    if not is0(DO,3):
        found.append((len(D),fill))
found.sort()
print(f"  witnesses that BITE on O: {len(found)}")
for n,fill in found[:15]:
    print(f"   (xr,xi,yr,yi)={fill}   raw D:{n} terms, vanishes under assoc, NONZERO on O")
if found:
    n,fill=found[0]
    print("\nSIMPLEST biting witness:", fill)
    xr,xi,yr,yi=(vocab[k] for k in fill)
    D=D_of((xr,xi),(yr,yi))
    print("  free-nonassoc D terms:")
    for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
        print(f"     {co:+d} * leaves={leaves(m)} tree={m}")
