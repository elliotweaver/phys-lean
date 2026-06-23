"""Free non-associative *-algebra symbolic tracker + lever-decomposition solver.

Goal: for each entry of polarCross1 (Pj_k)(Xz a b c)(Xz p q r), express it as a
ℚ-linear combination of the BANKED lever instances:
    asw_star(x,y,z) := assoc(x,y,z) + star(assoc(x,y,z))   [= 0, PieceB.asw_star]
    ka(x,y,w)       := (sx*sw)*(y*x) - sx*(sw*(y*x)) - ((sx*sy)*w)*x + (sx*sy)*(w*x)
                       where sx=star x etc.  [= 0, Building.ka]
plus the alternating product laws if needed. Output the exact linear_combination string.

Representation: an algebra element is a dict {monomial: Fraction}. A monomial is a frozen
nested tuple of atom-strings, with products kept FORMAL (no associativity). star is pushed
to leaves with anti-multiplicativity and sign on imaginary part -- but in the FREE algebra we
keep star formal too: star(atom) is its own atom 's<atom>', star(u*v) = star(v)*star(u),
star(star x)=x. Real linearity only.
"""
from fractions import Fraction as F
from itertools import product as iproduct

# ---- monomials: nested tuples of atom strings; products formal ----
# atom: a string like 'a', 'b', ... ; star-atom: ('star','a') handled via canonical naming.
# We represent an element as dict: key = monomial (hashable), val = Fraction.

def lift(atom):
    return {(atom,): F(1)}  # a length-1 tuple wrapping the atom string == the atom monomial

# We'll represent monomials as nested tuples: leaf = str; product = (M1, M2).
# A bare atom 'a' is the leaf string 'a'.

def m_mul(m1, m2):
    return (m1, m2)

def e_add(e1, e2):
    out = dict(e1)
    for m, c in e2.items():
        out[m] = out.get(m, F(0)) + c
        if out[m] == 0: del out[m]
    return out

def e_neg(e):
    return {m: -c for m, c in e.items()}

def e_sub(e1, e2):
    return e_add(e1, e_neg(e2))

def e_smul(s, e):
    s = F(s)
    if s == 0: return {}
    return {m: s*c for m, c in e.items()}

def e_mul(e1, e2):
    out = {}
    for m1, c1 in e1.items():
        for m2, c2 in e2.items():
            m = m_mul(m1, m2)
            out[m] = out.get(m, F(0)) + c1*c2
            if out[m] == 0: del out[m]
    return out

def atom(name):
    return {name: F(1)}

# star: formal involution, anti-multiplicative, real-linear.
# leaf 'x' -> 'sx'; 'sx' -> 'x'.  star(M1*M2) = star(M2)*star(M1).
def m_star(m):
    if isinstance(m, str):
        if m.startswith('s') and len(m) > 1 and not m[1:].startswith('s_'):
            # 'sX' -> 'X'  (we use 's' prefix for star of a base leaf)
            return m[1:]
        else:
            return 's' + m
    else:
        a, b = m
        return (m_star(b), m_star(a))

def e_star(e):
    out = {}
    for m, c in e.items():
        ms = m_star(m)
        out[ms] = out.get(ms, F(0)) + c
        if out[ms] == 0: del out[ms]
    return out

# ---- the levers ----
def assoc(x, y, z):
    # (x*y)*z - x*(y*z)
    return e_sub(e_mul(e_mul(x,y),z), e_mul(x, e_mul(y,z)))

def asw_star(x, y, z):
    A = assoc(x,y,z)
    return e_add(A, e_star(A))

def ka(x, y, w):
    sx, sy, sw = e_star(x), e_star(y), e_star(w)
    # (sx*sw)*(y*x) - sx*(sw*(y*x)) - ((sx*sy)*w)*x + (sx*sy)*(w*x)
    t1 = e_mul(e_mul(sx,sw), e_mul(y,x))
    t2 = e_mul(sx, e_mul(sw, e_mul(y,x)))
    t3 = e_mul(e_mul(e_mul(sx,sy),w), x)
    t4 = e_mul(e_mul(sx,sy), e_mul(w,x))
    return e_add(e_sub(e_sub(t1,t2), t3), t4)

# product-form alternative laws (also = 0):
def alt_mul_left(x,y):  # x*(x*y) - (x*x)*y
    return e_sub(e_mul(x, e_mul(x,y)), e_mul(e_mul(x,x), y))

if __name__ == "__main__":
    # sanity: asw_star/ka should be FORMALLY non-trivial (don't vanish in free algebra)
    a = atom('a'); b = atom('b'); c = atom('c')
    print("asw_star(a,b,c) terms:", len(asw_star(a,b,c)))
    print("ka(a,b,c) terms:", len(ka(a,b,c)))
    print("assoc(a,a,b) terms (free, nonzero):", len(assoc(a,a,b)))
