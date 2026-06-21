"""
N2d-hard — defect under the FULL conjugation (composition-algebra) structure.

Free associative algebra on noncommuting gens a,b,c,d over the CENTRAL polynomial ring
in t_g, n_g.  Conjugation: star(g) = t_g - g  (so g + g* = t_g central; g g* = n_g central).
Reduction rule (adjacent square): g·g = t_g·g - n_g.
Coefficients are polynomials in t_*, n_* (commutative). Monomials: tuples of gens 0..3.

Compute D(x,y)=Nrm(xy)-Nrm(x)Nrm(y) for x=(a,b),y=(c,d) and check it vanishes
after reduction. This is the EASY direction over an associative conjugation algebra.
"""
from collections import defaultdict
import sympy as sp

NG=4
t=[sp.Symbol(f't_{chr(97+i)}') for i in range(NG)]
n=[sp.Symbol(f'n_{chr(97+i)}') for i in range(NG)]

# element = dict: monomial(tuple of gen indices) -> sympy poly coeff (central)
def E(d): return {m:sp.expand(c) for m,c in d.items() if sp.expand(c)!=0}
def add(x,y):
    r=defaultdict(lambda:sp.Integer(0))
    for m,c in x.items(): r[m]+=c
    for m,c in y.items(): r[m]+=c
    return E(r)
def neg(x): return {m:-c for m,c in x.items()}
def sub(x,y): return add(x,neg(y))
def reduce_mono(m, coeff):
    """reduce adjacent squares g g -> t_g g - n_g; returns list of (mono,coeff)."""
    m=list(m)
    i=0
    while i < len(m)-1:
        if m[i]==m[i+1]:
            g=m[i]
            # replace m[i],m[i+1] with t_g*<g> - n_g*<empty here>
            left=m[:i]; right=m[i+2:]
            out=[]
            out.extend(reduce_mono(tuple(left+[g]+right), coeff*t[g]))
            out.extend(reduce_mono(tuple(left+right), -coeff*n[g]))
            return out
        i+=1
    return [(tuple(m),coeff)]
def mul(x,y):
    r=defaultdict(lambda:sp.Integer(0))
    for mx,cx in x.items():
        for my,cy in y.items():
            for mm,cc in reduce_mono(mx+my, cx*cy):
                r[mm]+=cc
    return E(r)
def star(x):
    # star is anti-automorphism; star(g)=t_g-g ; star of monomial = reversed product of star(g)
    res={}
    for m,c in x.items():
        # build product star(g_last)...star(g_first)
        prod={():c}
        for g in m:   # for star(m)=star(g0 g1..)=star(gk)..star(g0); iterate gens in order,
                      # prepend? we accumulate: star(g0 g1 g2)=sg2 sg1 sg0.
            sg={(g,):sp.Integer(-1), ():t[g]}  # t_g - g
            prod=mul(sg,prod)  # left-multiply by star(g): gives ... sg over reversed order
        res=add(res,prod)
    return res

a={(0,):sp.Integer(1)}; b={(1,):sp.Integer(1)}; c={(2,):sp.Integer(1)}; d={(3,):sp.Integer(1)}
def Nrm(z):
    re,im=z
    return add(mul(re,star(re)), mul(star(im),im))
def cd_mul(z,w):
    ar,ai=z; cr,ci=w
    return (sub(mul(ar,cr),mul(star(ci),ai)), add(mul(ci,ar),mul(ai,star(cr))))
x=(a,b); y=(c,d)
D=sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))
print("EASY direction: D over associative CONJUGATION algebra (star g = t_g - g central):")
if not D:
    print("   D == 0  ✅   associativity + conjugation(central trace) ⟹ Nrm multiplicative on CD A")
else:
    print(f"   {len(D)} residual terms:")
    for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
        print("   ", '·'.join(chr(97+g) for g in m) if m else "1", ":", co)
