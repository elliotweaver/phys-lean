"""
N2d symbolic obstruction probe.

Goal: compute  D(z,w) := N(zw) - N(z)N(w)  where
  z=(a,b), w=(c,d) in CD A,
  CD product (Lean Double.lean):  (a,b)(c,d) = (a c - star(d) b , d a + b star(c))
  star(a,b) = (star a, -b)
  N(z) = (z * star z).re = a*star(a) + star(b)*b      [derived above]

Two questions:
  Q1. Over a FREE ASSOCIATIVE *-ring (star anti-automorphism, involutive),
      does D reduce to 0?  If yes => over any ASSOCIATIVE base A, N is
      multiplicative (the easy direction, all rungs <= O). The failure at S
      is then PURELY non-associativity.
  Q2. Find simple witnesses (specializations of a,b,c,d) for which D, expanded
      WITHOUT assuming associativity, equals a single associator of base
      elements. Those are the witnesses the Lean hard-direction proof plugs in.

We model the free associative *-ring with sympy noncommutative symbols.
star is applied symbolically: star(word) = reversed word with each letter starred,
star(star x)=x, star is additive & R-linear.
"""
import sympy as sp

# noncommutative generators and their stars as independent nc symbols
a, b, c, d = sp.symbols('a b c d', commutative=False)
aS, bS, cS, dS = sp.symbols('aS bS cS dS', commutative=False)

# star on the 8 generators
star_gen = {a: aS, b: bS, c: cS, d: dS, aS: a, bS: b, cS: c, dS: d}

def star(expr):
    """Anti-automorphism star on the free associative *-ring."""
    expr = sp.expand(expr)
    if expr == 0:
        return sp.Integer(0)
    out = 0
    for term in sp.Add.make_args(expr):
        coeff, factors = term.as_coeff_mul()
        # factors are in order; star reverses and stars each
        nc = []
        for f in factors:
            if f.is_commutative:
                coeff *= f
            else:
                # f is a power of a single nc generator? assume single generator
                base, exp = f.as_base_exp()
                for _ in range(int(exp)):
                    nc.append(base)
        starred = [star_gen[g] for g in reversed(nc)]
        prod = coeff
        for g in starred:
            prod = prod * g
        out += prod
    return sp.expand(out)

def N(re, im):
    """A-valued self-overlap of (re,im):  re*star(re) + star(im)*im."""
    return sp.expand(re*star(re) + star(im)*im)

# CD product components for z=(a,b), w=(c,d)
def cd_mul(zre, zim, wre, wim):
    p = sp.expand(zre*wre - star(wim)*zim)   # re
    q = sp.expand(wim*zre + zim*star(wre))   # im
    return p, q

# Q1: full generic D over free associative *-ring
p, q = cd_mul(a, b, c, d)
Nzw = N(p, q)
Nz  = N(a, b)
Nw  = N(c, d)
D = sp.expand(Nzw - sp.expand(Nz*Nw))
print("Q1: D = N(zw) - N(z)N(w) over FREE ASSOCIATIVE *-ring:")
print("    D =", D)
print("    => associative base gives N multiplicative:", D == 0)
print()

# Q1b: also check the SCALAR projection version isn't needed -- A-valued already 0.

# Q2: hunt for witnesses isolating a pure associator.
# We want, in the FREE NON-associative setting, D to become an associator like
#   [x,y,z] = (xy)z - x(yz).
# In the associative model D=0 identically, so to SEE the associator we must
# track parenthesization. Instead we reason structurally below by choosing
# special elements that make N collapse to base products whose re-association
# is exactly the multiplicativity identity.
