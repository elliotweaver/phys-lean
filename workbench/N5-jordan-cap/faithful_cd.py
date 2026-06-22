"""faithful_cd (run 59): the EXACT repo Cayley-Dickson model, replacing the wrong split-Zorn.
Models CD(CD B) over a GENERIC commutative star-ring B exactly as `ext;cdsimp;ring` sees it:
each B-coordinate is a formal commuting variable, and starB is an OPAQUE involution mapping
each variable x to an independent variable x~ (with starB(x~)=x). A piece is provable by
ext;cdsimp;ring IFF it is the zero polynomial in these variables. This is the faithful
instrument (the split-Zorn model was the wrong real form -> wrong pairings, run-59 ONE-LAW fix).

Repo product (Phys/Cascade/Double.lean):
  CD over A:  (z*w).re = z.re*w.re + -(starA w.im * z.im)
              (z*w).im = w.im*z.re + z.im*starA w.re
  starA z   = <starA' z.re, -z.im>      (one level down on re, negate im)
Base B: starB = opaque involution on formal vars.
"""
from fractions import Fraction as F
from collections import defaultdict

# ---- polynomials over formal B-variables (commuting); star swaps x <-> x~ ----
# monomial: frozenset-like sorted tuple of (var, exp). We use tuple(sorted(varname)) with repetition.
# represent poly as dict: monomial(tuple of varnames sorted) -> Fraction
def pzero(): return {}
def pvar(name): return {(name,): F(1)}
def padd(*xs):
    r = defaultdict(F)
    for x in xs:
        for m, v in x.items(): r[m] += v
    return {m: v for m, v in r.items() if v != 0}
def pneg(x): return {m: -v for m, v in x.items()}
def psub(x, y): return padd(x, pneg(y))
def pmul(x, y):
    r = defaultdict(F)
    for mx, cx in x.items():
        for my, cy in y.items():
            m = tuple(sorted(mx + my))
            r[m] += cx*cy
    return {m: v for m, v in r.items() if v != 0}
def pstarB(x):
    # opaque involution on each variable: 'foo' <-> 'foo~'
    def sv(v): return v[:-1] if v.endswith('~') else v+'~'
    r = defaultdict(F)
    for m, c in x.items():
        nm = tuple(sorted(sv(v) for v in m))
        r[nm] += c
    return {m: v for m, v in r.items() if v != 0}

# ---- B-element = poly ; CDB element = (re:poly, im:poly) ; CDCDB = (re:CDB, im:CDB) ----
# starCDB(u) = (pstarB(u.re), pneg(u.im))
def starCDB(u): return (pstarB(u[0]), pneg(u[1]))
def addCDB(u, v): return (padd(u[0], v[0]), padd(u[1], v[1]))
def negCDB(u): return (pneg(u[0]), pneg(u[1]))
def mulCDB(u, v):
    # (u*v).re = u.re*v.re + -(starB v.im * u.im)
    # (u*v).im = v.im*u.re + u.im*starB v.re
    re = padd(pmul(u[0], v[0]), pneg(pmul(pstarB(v[1]), u[1])))
    im = padd(pmul(v[1], u[0]), pmul(u[1], pstarB(v[0])))
    return (re, im)

# top level over A=CDB: element = (re:CDB, im:CDB)
def starO(z): return (starCDB(z[0]), negCDB(z[1]))
def addO(z, w): return (addCDB(z[0], w[0]), addCDB(z[1], w[1]))
def negO(z): return (negCDB(z[0]), negCDB(z[1]))
def mulO(z, w):
    # (z*w).re = z.re*w.re + -(starA w.im * z.im)   [A-mul, A-star]
    # (z*w).im = w.im*z.re + z.im*starA w.re
    re = addCDB(mulCDB(z[0], w[0]), negCDB(mulCDB(starCDB(w[1]), z[1])))
    im = addCDB(mulCDB(w[1], z[0]), mulCDB(z[1], starCDB(w[0])))
    return (re, im)
def zeroO(): return ((pzero(), pzero()), (pzero(), pzero()))
def isO0(z):
    return all(len(p) == 0 for p in (z[0][0], z[0][1], z[1][0], z[1][1]))

def symO(name):
    # formal octonion: 4 B-coords as independent variables
    def b(suf): return pvar(f"{name}.{suf}")
    return ((b("rr"), b("ri")), (b("ir"), b("ii")))

if __name__ == "__main__":
    # sanity: ka must be identically zero here (it compiles in Lean via ext;cdsimp;ring)
    a, y, w = symO('a'), symO('y'), symO('w')
    Sa, Sy, Sw = starO(a), starO(y), starO(w)
    yx = mulO(y, a); SaSy = mulO(Sa, Sy)
    lhs = addO(mulO(mulO(Sa, Sw), yx), negO(mulO(Sa, mulO(Sw, yx))))
    rhs = addO(mulO(mulO(SaSy, w), a), negO(mulO(SaSy, mulO(w, a))))
    ka = addO(lhs, negO(rhs))
    print("ka identically zero in faithful CD model:", isO0(ka))
    # also check basic: flexible law a*(y*a) = (a*y)*a
    flex = addO(mulO(a, mulO(y, a)), negO(mulO(mulO(a, y), a)))
    print("flexible law zero:", isO0(flex))
    # left alt a*(a*y)=(a*a)*y
    la = addO(mulO(a, mulO(a, y)), negO(mulO(mulO(a, a), y)))
    print("left-alt zero:", isO0(la))
