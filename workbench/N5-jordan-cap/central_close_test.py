"""
DECISIVE MEASUREMENT for the structural route.

After splitting only the OUTER CD layer, each H_3 Jordan-defect entry component is an
equation in the ASSOCIATIVE ring H (= CD(Dbl)) over the H-atoms {a.re,a.im,...} with
star the H-conjugation (anti-automorphism).  freeH_test showed pure associativity leaves
88-148 residual terms.  CLAIM (run 43's diagnosis): those residuals are killed by the
COMPOSITION-ALGEBRA centrality of H:
    for every H-element h:  h + star h  is CENTRAL  (the trace)
                            h * star h  is CENTRAL  (the norm)
Equivalently, h satisfies its rank-2 'characteristic' identity:
    h*h - (h + star h)*h + (h*star h) = 0           [Cayley-Hamilton over the center]
i.e.  star h = (h + star h) - h  with (h+star h), (h*star h) central scalars.

Here we model H as the FREE ASSOCIATIVE algebra over atoms, but impose the centrality
relations by treating, for each atom-quaternion x, the symbol  t_x := x + star x  and
n_x := x*star x  as CENTRAL (commute & associate with everything), and reduce star x ->
t_x - x.  We then check whether each defect entry-component reduces to 0.

If YES: the structural Lean proof is `simp [outer CD split] ; <rewrite star via trace> ;
        noncomm_ring/abel using centrality of trace & norm`.  CHEAP & moat-correct.
If NO:  a deeper identity is needed.
"""
from fractions import Fraction as F
from collections import defaultdict

# ---- free associative algebra over a SET of central symbols + noncentral atoms ----
# monomial = tuple of generators (left-to-right).  generators: ('x',) noncentral atom;
# central symbols carry a flag and are sorted to the front & merged (they commute).
# We represent a generator as a string; CENTRAL set lists those that commute with all.

CENTRAL = set()   # names that are central scalars (traces t_*, norms n_*)

def is_central(g): return g in CENTRAL

def normal(mon):
    """Pull central generators to the front (sorted); keep noncentral order."""
    centrals = sorted([g for g in mon if is_central(g)])
    rest     = tuple(g for g in mon if not is_central(g))
    return tuple(centrals) + rest

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[normal(m)] += v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def smul(c,x): return {m:(c*v) for m,v in x.items()} if c else {}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items():
            r[normal(mx+my)] += cx*cy
    return {m:v for m,v in r.items() if v!=0}
def gen(g): return {(g,):F(1)}
def zero(): return {}

# ---- octonion entry modeled as a pair of H-elements (re, im) over the free H ----
# H-conjugation star: anti-automorphism.  We impose centrality by REWRITING:
#   for each base atom x (one of the re/im H-parts of a,b,c,p,q,r), introduce
#   star x = t_x - x  where t_x central, and x*star x = n_x central, and ALSO
#   star x * x = n_x (same norm, central, equals x*star x).
# To keep it finite we treat each H-atom x as a single noncentral generator with a
# declared central trace t_x and norm n_x; star x := t_x*1 - x (so star is determined).
ATOMS = []
def reg_atom(name):
    ATOMS.append(name)
    CENTRAL.add('t_'+name); CENTRAL.add('n_'+name)

def H_star_of_atom(name):
    # star x = t_x - x
    return sub(gen('t_'+name), gen(name))

# For a general H element built from atoms we need star to be an anti-automorphism.
# Our H-elements here are always SINGLE atoms (the re/im parts are independent atoms),
# so star on an atom uses the rule above; star distributes over sums/products by
# anti-automorphism.  We implement star on a general element via structural recursion
# on its monomials.
def H_star(x):
    r=zero()
    for mon,coef in x.items():
        # star(prod g1..gk) = star gk .. star g1 ; central pass through (self-conj? trace/norm real => star central = itself)
        term={(): F(1)}  # start with scalar 1
        acc={():F(1)}
        # build reversed product of star of each generator
        prod={():F(1)}
        gens=list(mon)
        sgens=[]
        for g in reversed(gens):
            if is_central(g):
                sgens.append(gen(g))      # central symbols are real (self-conjugate)
            else:
                sgens.append(H_star_of_atom(g))
        p={():F(1)}
        for sg in sgens:
            p=mul(p,sg)
        r=add(r, smul(coef, p))
    return r

# octonion = (re, im) with re,im in free-H
class Oc:
    __slots__=('re','im')
    def __init__(s,re,im): s.re=re; s.im=im
def o_zero(): return Oc(zero(),zero())
def o_add(*os): 
    return Oc(add(*[o.re for o in os]), add(*[o.im for o in os]))
def o_neg(o): return Oc(neg(o.re),neg(o.im))
def o_star(o): return Oc(H_star(o.re), neg(o.im))
def o_mul(z,w):
    # CD: (z*w).re = z.re*w.re - star(w.im)*z.im ; .im = w.im*z.re + z.im*star(w.re)
    re = sub(mul(z.re,w.re), mul(H_star(w.im), z.im))
    im = add(mul(w.im,z.re), mul(z.im, H_star(w.re)))
    return Oc(re,im)

def o_atom(name):
    reg_atom(name+'R'); reg_atom(name+'I')
    return Oc(gen(name+'R'), gen(name+'I'))
def o_real(name):
    # central real diagonal: re = central self-conj scalar, im = 0
    CENTRAL.add(name)
    return Oc(gen(name), zero())

# matrices
def herm3(d0,d1,d2, o01,o02,o12):
    return [[d0, o01, o02],
            [o_star(o01), d1, o12],
            [o_star(o02), o_star(o12), d2]]
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

A=herm3(o_real('d0'),o_real('d1'),o_real('d2'), o_atom('a'),o_atom('b'),o_atom('c'))
B=herm3(o_real('e0'),o_real('e1'),o_real('e2'), o_atom('p'),o_atom('q'),o_atom('r'))
D=jdef(A,B)

print("=== H-level (associative) + composition-algebra CENTRALITY (trace t_*, norm n_*) ===")
allok=True
for i in range(3):
    for j in range(3):
        e=D[i][j]
        nz=len(e.re)+len(e.im)
        if nz: allok=False
        print(f"  entry({i},{j}): .re terms={len(e.re)}  .im terms={len(e.im)}")
print("ALL entry components vanish using associativity + trace/norm centrality:", allok)
