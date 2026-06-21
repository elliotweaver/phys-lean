"""
N2d-hard — DECISIVE symbolic check of the EASY direction over an ASSOCIATIVE
conjugation algebra, to extract the exact identity chain for Lean.

Model: free ASSOCIATIVE *-ring A.  Conjugation/Born structure:
   star u = t(u) - u,  with t(u) CENTRAL scalar  (the trace),
   u*u = u u* = n(u)   CENTRAL scalar  (the norm), equiv. u^2 = t(u) u - n(u).

Represent each generator u in {a,b,c,d} as a noncommutative sympy symbol; t_u, n_u
as commutative symbols. star(u) = t_u - u.  Reduce any u^2 -> t_u*u - n_u.
Centrality of t_u, n_u is automatic (they are commutative scalars).

Compute D(x,y) = Nrm(xy) - Nrm(x) Nrm(y) for x=(a,b), y=(c,d) in CD(A) and check D==0.
Then DROP the 'u^2 reduction' / drop centrality one at a time to confirm each is
load-bearing.
"""
import sympy as sp

a,b,c,d = sp.symbols('a b c d', commutative=False)
ta,tb,tc,td = sp.symbols('t_a t_b t_c t_d', commutative=True)
na,nb,nc,nd = sp.symbols('n_a n_b n_c n_d', commutative=True)

gens = {a:(ta,na), b:(tb,nb), c:(tc,nc), d:(td,nd)}

def star(e):
    """anti-automorphism: star(u)=t_u-u on generators, star(xy)=star(y)star(x)."""
    e = sp.expand(e)
    if e == 0: return sp.Integer(0)
    res = 0
    for term in sp.Add.make_args(e):
        coeff, ncpart = term.as_coeff_Mul()
        # ncpart is a product of noncommutative gens (or 1)
        factors = []
        m = ncpart
        if m == 1:
            res += coeff
            continue
        for f in sp.Mul.make_args(m):
            base, exp = f.as_base_exp()
            for _ in range(int(exp)):
                factors.append(base)
        # star reverses order and applies star to each generator
        sfac = []
        for g in reversed(factors):
            tg = gens[g][0]
            sfac.append(tg - g)   # star(g) = t_g - g
        prod = sp.Integer(1)
        for sf in sfac:
            prod = prod*sf
        res += coeff*prod
    return sp.expand(res)

def reduce_sq(e):
    """repeatedly replace u^2 -> t_u u - n_u until no generator square remains."""
    e = sp.expand(e)
    changed = True
    while changed:
        changed = False
        new = e
        for g,(tg,ng) in gens.items():
            new2 = new.subs(g**2, tg*g - ng)
            # subs on higher powers: also g**3 etc handled by repeated passes via g**2 inside
            if new2 != new:
                new = sp.expand(new2); changed = True
        # handle powers >2 by rewriting g**k = g**(k-2)*g**2
        for g,(tg,ng) in gens.items():
            # find max power
            p = sp.Wild('p')
            # brute: replace g**3,g**4 down
            for k in range(6,1,-1):
                new = sp.expand(new.subs(g**k, g**(k-2)*(tg*g-ng)))
        e = sp.expand(new)
    return e

def norm(re,im):
    # Nrm(z) = re*star(re) + star(im)*im     (matches ForcedStop Nrm_def: re*star re + star im * im)
    return sp.expand(re*star(re) + star(im)*im)

def cd_mul(z,w):
    (ar,ai),(cr,ci)=z,w
    re = sp.expand(ar*cr - star(ci)*ai)
    im = sp.expand(ci*ar + ai*star(cr))
    return (re,im)

x=(a,b); y=(c,d)
xy = cd_mul(x,y)
D = sp.expand(norm(*xy) - norm(*x)*norm(*y))
D = reduce_sq(D)
print("EASY direction over ASSOCIATIVE conjugation algebra (u^2->t u - n, t/n central):")
print("  D(x,y) reduces to:", D)
print("  => multiplicative" if D==0 else "  => NONZERO (something missing)")

# Now DROP the square-reduction (i.e. don't assume u*u = n central scalar) — keep assoc + star anti-auto only
D2 = sp.expand(norm(*xy) - norm(*x)*norm(*y))
print("\nWithout u^2->t u - n reduction (bare associative *-ring, star u=t_u-u):")
print("  D(x,y) =", D2)
print("  residual term count:", len(sp.Add.make_args(D2)) if D2!=0 else 0)
