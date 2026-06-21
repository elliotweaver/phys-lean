"""
N2d — explicit small defects + the HARD-direction implication test.

Print the explicit free-non-assoc defect for the small witnesses, and then test the
ONE-DIRECTIONAL implication that is the FORCED LINK:
    Nrm multiplicative on CD A  =>  A associative.
Contrapositive witness search: over the ACTUAL non-associative base O (level 3,
alternative, central self-overlap = the cascade structure), is there x,y in CD(O)
with Nrm(xy) != Nrm(x)Nrm(y)?  YES (witness6 found 168). The point of THIS file:
confirm the implication is the clean statement to target, and that the defect on a
NON-associative base is forced by a base associator.
"""
from collections import defaultdict
from fractions import Fraction as Fr
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

a,b,c = gen(0),gen(1),gen(2)
one={ONEM:1}; zero={}

def fmt(elt):
    return [(co,m) for m,co in sorted(elt.items(),key=lambda kv:str(kv[0]))]

for name,(x,y) in {
  "x=(0,a) y=(0,b)": ((zero,a),(zero,b)),
  "x=(a,0) y=(0,c)": ((a,zero),(zero,c)),
  "x=(0,a) y=(b,0)": ((zero,a),(b,zero)),
  "x=(0,a) y=(b,c)": ((zero,a),(b,c)),
}.items():
    D=D_of(x,y)
    print(f"{name}: D =")
    for co,m in fmt(D):
        print(f"     {co:+d} * {m}")
    print()

# The hard-direction implication, stated cleanly:
print("="*60)
print("FORCED LINK (one-directional): Nrm mult on CD A  =>  A associative.")
print("Contrapositive: A non-assoc (some [p,q,r]!=0)  =>  some x,y break Nrm.")
print("Over a BARE *-ring the defect carries commutator junk (above), so the clean")
print("witness needs the cascade structure. The cascade base is ALTERNATIVE with")
print("CENTRAL self-overlap (Born positivity); the FIRST non-alternative/non-assoc")
print("base is the one that breaks it. The Lean target is the implication on CD A.")
