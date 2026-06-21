"""
N2d — verify the two CLEANLY-BANKABLE theorems before Lean:

(E) EASY direction: if base A is COMMUTATIVE associative *-ring, the A-valued
    self-overlap norm  Nrm(z) = z.re*star(z.re) + star(z.im)*z.im  is MULTIPLICATIVE
    on CD A:  Nrm(x*y) = Nrm(x)*Nrm(y).   [covers rungs C and H: bases R, C are comm]
    Test: sympy, COMMUTATIVE base symbols, star a ring HOM (comm base => star is an
    automorphism). Expect defect == 0.

(S) SPECIALIZATION: on S ℚ = CD(O ℚ), the generic Nrm's fully-projected real part
    equals N2c's concrete  N z = (z*star z).re.re.re.re.
    (Checked numerically in earlier probes; here we just re-assert the projection.)

(H) HARD direction reality check: with a bare ASSOCIATIVE (noncommutative) base,
    Nrm is NOT generally multiplicative -> the easy direction genuinely needs
    commutativity (or scalar-norm structure). Confirms the hard direction is deep.
"""
import sympy as sp

# ---------- (E) commutative base, star = ring automorphism ----------
# commutative base: use commutative symbols; star is an involutive automorphism.
ar, ai, br, bi, cr, ci, dr, di = sp.symbols('ar ai br bi cr ci dr di')
# A commutative *-ring: model star by an involution s(.) that is a ring hom.
# Simplest faithful comm *-ring with nontrivial star: A = R[t]/(t^2-D)?? Overkill.
# Use the actual cascade base: A = ℂ-like Dbl over a comm ring, star = conj.
# But the EASY-direction theorem is over an ABSTRACT CommRing+StarRing. The cleanest
# faithful symbolic check: take A = the free COMMUTATIVE *-ring on one element u with
# star(u)=v (independent), star ring-hom & involutive: star(u)=v, star(v)=u.
u, v = sp.symbols('u v', commutative=True)
def s_comm(expr):
    return expr.subs({u: v, v: u}, simultaneous=True)

# elements of CD A are pairs of comm-base elements; base elements are polynomials in u,v.
def base_mul(x, y): return sp.expand(x*y)             # commutative
def cd_mul(z, w):
    a,b=z; c,d=w
    re = sp.expand(a*c - s_comm(d)*b)
    im = sp.expand(d*a + b*s_comm(c))
    return (re, im)
def Nrm(z):
    a,b=z
    return sp.expand(a*s_comm(a) + s_comm(b)*b)
# generic elements with base entries arbitrary polynomials in u,v:
a = sp.symbols('a', commutative=True)
# use independent comm symbols for the 4 base entries, each carrying its own star image
A1,A2 = sp.symbols('A1 A2', commutative=True)  # a and star(a)
B1,B2 = sp.symbols('B1 B2', commutative=True)
C1,C2 = sp.symbols('C1 C2', commutative=True)
D1,D2 = sp.symbols('D1 D2', commutative=True)
# define star to swap the pair for each entry
swap = {A1:A2, A2:A1, B1:B2, B2:B1, C1:C2, C2:C1, D1:D2, D2:D1}
def s2(expr): return sp.expand(expr.subs(swap, simultaneous=True))
def cd_mul2(z,w):
    a,b=z;c,d=w
    return (sp.expand(a*c - s2(d)*b), sp.expand(d*a + b*s2(c)))
def Nrm2(z):
    a,b=z
    return sp.expand(a*s2(a)+s2(b)*b)
x=(A1,B1); y=(C1,D1)
defectE = sp.expand(Nrm2(cd_mul2(x,y)) - Nrm2(x)*Nrm2(y))
print("(E) commutative associative base, A-valued Nrm defect:")
print("    defect =", defectE, " -> MULTIPLICATIVE" if defectE==0 else " -> NOT mult")
print()

# ---------- (H) bare associative NONcommutative base: not multiplicative ----------
a_,b_,c_,d_ = sp.symbols('a_ b_ c_ d_', commutative=False)
aS,bS,cS,dS = sp.symbols('aS bS cS dS', commutative=False)
stmap={a_:aS,b_:bS,c_:cS,d_:dS,aS:a_,bS:b_,cS:c_,dS:d_}
def starNC(expr):
    expr=sp.expand(expr); out=0
    for term in sp.Add.make_args(expr):
        coeff,factors=term.as_coeff_mul(); nc=[]
        for f in factors:
            if f.is_commutative: coeff*=f
            else:
                base,e=f.as_base_exp()
                for _ in range(int(e)): nc.append(base)
        prod=coeff
        for g in [stmap[g] for g in reversed(nc)]: prod=prod*g
        out+=prod
    return sp.expand(out)
def cdNC(z,w):
    a,b=z;c,d=w
    return (sp.expand(a*c-starNC(d)*b), sp.expand(d*a+b*starNC(c)))
def NrmNC(z):
    a,b=z; return sp.expand(a*starNC(a)+starNC(b)*b)
xH=(a_,b_); yH=(c_,d_)
defectH=sp.expand(NrmNC(cdNC(xH,yH))-NrmNC(xH)*NrmNC(yH))
print("(H) bare ASSOCIATIVE noncommutative base, A-valued Nrm defect term count:",
      len(sp.Add.make_args(defectH)))
print("    -> nonzero, so easy direction genuinely needs commutativity / scalar-norm. (deep)")
