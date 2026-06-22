"""
Decisive test: after splitting only the OUTER CD layer (O = CD H), is each component
(.re, .im) of the H_3 Jordan-defect entry a TRUE identity in the FREE ASSOCIATIVE
*-ring over the H-atoms {a.re,a.im,b.re,...} with star an anti-automorphism?

If YES -> noncomm_ring SHOULD close it (the residual means simp incompleteness).
If NO  -> the split is structurally insufficient; the identity needs more than
          associativity of H (it needs the trace/centrality), so noncomm_ring can
          never close and the honest route is full coordinate ring over Q.

Model: free associative algebra over noncommuting atoms; star is an anti-automorphism
fixing nothing (atoms and their stars are independent generators, but star(xy)=star y star x
and star(star x)=x, star(x+y)=star x+star y).
"""
from fractions import Fraction as F
from collections import defaultdict

# element = dict: monomial(tuple of signed atoms) -> coeff. atom = ('name',) leaf; star handled by name with 'S' flag.
# Represent atom as (name, conj_bool). monomial = tuple of atoms (left-to-right product). associative => flat tuple.
def leaf(name, conj=False): return {((name,conj),): F(1)}
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def smul(c,x): return {m:c*v for m,v in x.items()} if c!=0 else {}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items():
            r[mx+my]+=cx*cy   # associative concat
    return {m:v for m,v in r.items() if v!=0}
def star_atom(a): name,conj=a; return (name, not conj)
def star(x):
    r=defaultdict(F)
    for m,v in x.items():
        # star(prod) = reverse prod of star atoms
        rm=tuple(star_atom(a) for a in reversed(m))
        r[rm]+=v
    return {m:v for m,v in r.items() if v!=0}

# An octonion entry o = (o_re, o_im) as a pair of H-elements.
class Oc:
    def __init__(s, re, im): s.re=re; s.im=im
def o_atom(name): return Oc(leaf(name+'r'), leaf(name+'i'))
def o_star(o): return Oc(star(o.re), neg(o.im))
def o_zero(): return Oc({}, {})
def o_add(*os):
    return Oc(add(*[o.re for o in os]), add(*[o.im for o in os]))
def o_neg(o): return Oc(neg(o.re), neg(o.im))
def o_mul(z,w):
    # CD: (z*w).re = z.re*w.re + -(star w.im * z.im); .im = w.im*z.re + z.im*star w.re
    re = add(mul(z.re,w.re), neg(mul(star(w.im), z.im)))
    im = add(mul(w.im,z.re), mul(z.im, star(w.re)))
    return Oc(re,im)

# real diagonal: central self-conjugate scalar -> model as Oc(leaf real, 0). For the
# zero-diagonal hard test we use zero diagonals.
def herm3(o01,o02,o12, d=None):
    if d is None: d=[o_zero(),o_zero(),o_zero()]
    return [[d[0], o01, o02],
            [o_star(o01), d[1], o12],
            [o_star(o02), o_star(o12), d[2]]]

def mmul(A,B):
    n=len(A); C=[[o_zero() for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            s=o_zero()
            for k in range(n): s=o_add(s,o_mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def madd(A,B): n=len(A); return [[o_add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[o_neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

A=herm3(o_atom('a'),o_atom('b'),o_atom('c'))
B=herm3(o_atom('p'),o_atom('q'),o_atom('r'))
D=jdef(A,B)
print("=== H-level (free associative *-ring) check: each .re/.im component should be {} ===")
allok=True
for i in range(3):
    for j in range(3):
        e=D[i][j]
        nz_re=len(e.re); nz_im=len(e.im)
        if nz_re or nz_im: allok=False
        print(f"  entry({i},{j}): .re terms={nz_re}  .im terms={nz_im}")
print("ALL components vanish in free associative *-ring:", allok)
