"""
N2d-hard — DECISIVE witness hunt under the TRUNK conjugation structure.

Model the base as a free algebra on IMAGINARY generators a,b,c (star g = -g) with
the COMPOSITION/Born structure: g*g = -g^2 is a CENTRAL scalar n_g, i.e. g^2 = -n_g.
(This is the quadratic minimal-poly / conjugation structure ℝ,ℂ,ℍ,𝕆 all carry.)
Non-associativity is allowed (free magma products, NOT flattened).

For each candidate x,y in CD A with components drawn from a vocabulary that includes
products (ab),(bc),(ca) etc, compute D(x,y)=Nrm(xy)-Nrm(x)Nrm(y), reduce squares to
central scalars, and test whether D equals a fixed multiple of the associator
[a,b,c]=(ab)c-a(bc).  Print the cleanest witnesses.
"""
from collections import defaultdict

# monomials: nested tuples (free magma), leaves are ints (gen index) ; coeff = poly in n_g
# Represent element as dict: magma-term -> int coeff (n_g handled by reduction to scalar 'N{i}' symbols
# Simpler: keep coeffs as dict over frozenset-multiset of n-symbols. Use sympy.
import sympy as sp
na,nb,nc = sp.symbols('n_a n_b n_c', commutative=True)
NSYM={0:na,1:nb,2:nc}

# element: dict magma_term -> sympy coeff. magma_term: int (leaf) or (L,R) tuple, or () for scalar 1.
SCALAR=()
def add(x,y):
    r=defaultdict(lambda:sp.Integer(0),x)
    for m,c in y.items(): r[m]=r[m]+c
    return {m:sp.expand(c) for m,c in r.items() if sp.expand(c)!=0}
def neg(x): return {m:-c for m,c in x.items()}
def sub(x,y): return add(x,neg(y))
def smul(s,x): return {m:sp.expand(s*c) for m,c in x.items() if sp.expand(s*c)!=0}
def reduce_term(m):
    """reduce a magma term: if it's g·g (same leaf) -> scalar -n_g. Returns element dict."""
    if m==SCALAR: return {SCALAR:sp.Integer(1)}
    if isinstance(m,int): return {m:sp.Integer(1)}
    L,R=m
    eL=reduce_term(L); eR=reduce_term(R)
    # multiply eL*eR as magma (no flatten); but first they're reduced elements
    return mul(eL,eR)
def mul(x,y):
    r=defaultdict(lambda:sp.Integer(0))
    for mx,cx in x.items():
        for my,cy in y.items():
            if mx==SCALAR and my==SCALAR: term=SCALAR; r[term]+=cx*cy; continue
            if mx==SCALAR: r[my]+=cx*cy; continue
            if my==SCALAR: r[mx]+=cx*cy; continue
            # same leaf squared -> central scalar -n
            if isinstance(mx,int) and isinstance(my,int) and mx==my:
                r[SCALAR]+= -NSYM[mx]*cx*cy
            else:
                r[(mx,my)]+=cx*cy
    return {m:sp.expand(c) for m,c in r.items() if sp.expand(c)!=0}
def star(x):
    # imaginary gens: star(g)=-g; star(scalar)=scalar; anti-automorphism star(LR)=star(R)star(L)
    def st(m):
        if m==SCALAR: return {SCALAR:sp.Integer(1)}
        if isinstance(m,int): return {m:sp.Integer(-1)}
        L,R=m
        return mul(st(R),st(L))
    res={}
    for m,c in x.items(): res=add(res,smul(c,st(m)))
    return res

g=lambda i:{i:sp.Integer(1)}
a,b,c=g(0),g(1),g(2)
def Nrm(z):
    re,im=z; return add(mul(re,star(re)), mul(star(im),im))
def cd_mul(z,w):
    ar,ai=z;cr,ci=w
    return (sub(mul(ar,cr),mul(star(ci),ai)), add(mul(ci,ar),mul(ai,star(cr))))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))

# associator [a,b,c]
assoc_abc = sub(mul(mul(a,b),c), mul(a,mul(b,c)))
print("associator [a,b,c] =", assoc_abc)

# vocabulary of components
prod=lambda u,v: mul(u,v)
zero={}
one={SCALAR:sp.Integer(1)}
vocab={'0':zero,'a':a,'b':b,'c':c,
       'ab':prod(a,b),'bc':prod(b,c),'ca':prod(c,a),
       'ba':prod(b,a),'cb':prod(c,b),'ac':prod(a,c)}

def prop_to(D_, ref):
    """if D_ == lam*ref for central lam (ratio of matching coeffs), return lam else None."""
    if not D_: return sp.Integer(0)
    # match monomials
    if set(D_.keys())!=set(ref.keys()): return None
    lam=None
    for m in D_:
        r=sp.simplify(D_[m]/ref[m])
        if lam is None: lam=r
        elif sp.simplify(lam-r)!=0: return None
    return lam

import itertools
hits=[]
keys=list(vocab.keys())
for fa in itertools.product(keys,repeat=4):
    if fa.count('0')>=3: continue
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    d=D(x,y)
    lam=prop_to(d,assoc_abc)
    if lam is not None and lam!=0:
        hits.append((sum(1 for t in fa if t!='0'),fa,lam))
hits.sort(key=lambda t:(t[0],str(t[2])))
print(f"\nwitnesses with D = lam*[a,b,c]: {len(hits)}")
for nz,fa,lam in hits[:15]:
    print(f"   x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})   D = ({lam})*[a,b,c]")
if not hits:
    print("   none. Printing the SMALLEST nonzero defects to inspect structure:")
    sizes=[]
    for fa in itertools.product(['0','a','b','c'],repeat=4):
        if fa.count('0')>=3: continue
        x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
        d=D(x,y)
        if d: sizes.append((len(d),fa,d))
    sizes.sort()
    for n,fa,d in sizes[:6]:
        print(f"   x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]}): {n} terms: {d}")
