"""
N2d-hard — THE EXACT DEFECT-ASSOCIATOR IDENTITY (the heart of the Lean proof).

Over a NON-associative base A with the conjugation/Born structure
   star(a) = -a on imaginary gens, a·a = -n_a CENTRAL scalar (so a + a* = 0, a·a* = n_a central).
Keep non-associativity (binary-tree monomials, no flatten). Reduce ONLY by the central
relations (g·g -> -n_g scalar, pull central scalars out). Compute
   D(x,y) = Nrm(xy) - Nrm(x)Nrm(y)   for x=(a,b), y=(c,d)
and express the residual as a combination of base ASSOCIATORS [p,q,r]=(pq)r - p(qr).

This shows EXACTLY what the contrapositive "A non-assoc => D not identically 0" reduces to.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# monomial: ('1',) unit | ('L',k) leaf (imaginary gen k) | ('N',l,r) node
UNIT=('1',)
def Lf(k): return ('L',k)
NSYM={0:'n_a',1:'n_b',2:'n_c',3:'n_d'}

# element: dict monomial -> coeff, coeff is dict over frozenset-multiset of n-symbols -> Fraction
# represent coeff as tuple(sorted multiset of n-syms) -> Fraction
def cmul(c1,c2):
    r=defaultdict(Fr)
    for k1,v1 in c1.items():
        for k2,v2 in c2.items():
            r[tuple(sorted(k1+k2))]+=v1*v2
    return {k:v for k,v in r.items() if v!=0}
def cadd(c1,c2):
    r=defaultdict(Fr,c1)
    for k,v in c2.items(): r[k]+=v
    return {k:v for k,v in r.items() if v!=0}
def cneg(c): return {k:-v for k,v in c.items()}
ONE_C={():Fr(1)}
def scal(nkey): return {(NSYM[nkey],):Fr(1)}

def E(d): return {m:c for m,c in d.items() if c}
def add(x,y):
    r=defaultdict(dict,x)
    for m,c in y.items(): r[m]=cadd(r.get(m,{}),c)
    return E(r)
def neg(x): return {m:cneg(c) for m,c in x.items()}
def sub(x,y): return add(x,neg(y))
def scale_c(cf,x): return E({m:cmul(cf,c) for m,c in x.items()})

def mono_mul(m1,m2):
    # returns element (dict) because g·g reduces to central scalar
    if m1==UNIT: return {m2:ONE_C}
    if m2==UNIT: return {m1:ONE_C}
    if m1[0]=='L' and m2[0]=='L' and m1[1]==m2[1]:
        # g·g = -n_g  (scalar) ; as element: UNIT with coeff -n_g
        return {UNIT: cneg(scal(m1[1]))}
    return {('N',m1,m2):ONE_C}
def mul(x,y):
    r={}
    for m1,c1 in x.items():
        for m2,c2 in y.items():
            prod=mono_mul(m1,m2)
            for mm,cc in prod.items():
                r=add(r,{mm:cmul(cmul(c1,c2),cc)})
    return r
def star_mono(m):
    if m==UNIT: return {UNIT:ONE_C}
    if m[0]=='L': return {m:cneg(ONE_C)}   # star(g) = -g
    # anti-auto: star(N(l,r)) = star(r)·star(l)
    return mul(star_handle(m[2]), star_handle(m[1]))
def star_handle(m): return star_mono(m)
def star(x):
    r={}
    for m,c in x.items():
        sm=star_mono(m)
        r=add(r, scale_c(c,sm))
    return r

g=lambda k:{Lf(k):ONE_C}
a,b,c,d=g(0),g(1),g(2),g(3)
def Nrm(z):
    re,im=z; return add(mul(re,star(re)), mul(star(im),im))
def cd_mul(z,w):
    ar,ai=z;cr,ci=w
    return (sub(mul(ar,cr),mul(star(ci),ai)), add(mul(ci,ar),mul(ai,star(cr))))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))

def assoc(p,q,r): return sub(mul(mul(p,q),r), mul(p,mul(q,r)))

def fmt_mono(m):
    if m==UNIT: return "1"
    if m[0]=='L': return chr(97+m[1])
    return f"({fmt_mono(m[1])}·{fmt_mono(m[2])})"
def fmt(x):
    parts=[]
    for m,c in sorted(x.items(),key=lambda kv:str(kv[0])):
        for nk,v in sorted(c.items()):
            term=('*'.join(nk)) if nk else ''
            parts.append(f"{v}{('*'+term) if term else ''}·{fmt_mono(m)}")
    return " + ".join(parts) if parts else "0"

# Compute D for several clean witnesses and express via associators of the 4 letters.
print("=== D(x,y) over NON-assoc conjugation algebra, by witness ===\n")
cases={
 "x=(0,a) y=(0,b)": ((g(99) if False else {}, a),({}, b)),
 "x=(0,a) y=(b,0)": (({}, a),(b, {})),
 "x=(a,0) y=(0,b)": ((a,{}),({}, b)),
 "x=(0,a) y=(0,c)": (({}, a),({}, c)),
 "x=(a,b) y=(c,0)": ((a,b),(c,{})),
 "x=(a,b) y=(0,d)": ((a,b),({},d)),
 "x=(a,b) y=(c,d)": ((a,b),(c,d)),
}
for name,(x,y) in cases.items():
    dd=D(x,y)
    print(f"{name}:  D = {fmt(dd)}")
print()
# express x=(0,a) y=(0,b) defect: D = (ba)(ab) - n_a n_b. Relate to [b,a,?]...
# show it equals -[b, a, ab]?? test on octonions numerically.
