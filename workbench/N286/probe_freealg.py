"""
N286 FREE-ALGEBRA symbolic certificate.
Expand both sides of the candidate universal identity in the FREE non-associative,
non-commutative Q-algebra on generators A,B,X,Y. Elements are dicts {monomial: coeff}
where a monomial is a fully-parenthesized binary tree of generators (nested tuples,
leaves are 'A'/'B'/'X'/'Y').  Product = concatenation into a new node (NON-associative,
NON-commutative). Addition = dict merge.

If LHS - RHS == {} (empty), the identity is a FORMAL consequence of biadditivity of the
product => provable in Lean by `simp only [mul_add, add_mul]; abel` over ANY NonAssocRing.

  jb a b      = a*b + b*a
  jdef a b    = jb (jb a b) (jb a a) - jb a (jb b (jb a a))
  innerMul a b x = jb a (jb b x) - jb b (jb a x)
  d(A,B,X,Y)  = innerMul A B (jb X Y) - jb (innerMul A B X) Y - jb X (innerMul A B Y)
  PolJ(u,v,w;t) = jdef(u+v+w,t) - jdef(u+v,t) - jdef(u+w,t) - jdef(v+w,t)
                  + jdef(u,t) + jdef(v,t) + jdef(w,t)
  CANDIDATE:  d == 1/2 PolJ(B,X,Y;A) - 1/2 PolJ(A,X,Y;B)
"""
from fractions import Fraction as F

def add(p, q):
    r = dict(p)
    for m, c in q.items():
        r[m] = r.get(m, F(0)) + c
        if r[m] == 0: del r[m]
    return r
def sub(p, q): return add(p, scal(F(-1), q))
def scal(c, p):
    if c == 0: return {}
    return {m: c*co for m, co in p.items()}
def mul(p, q):
    r = {}
    for m1, c1 in p.items():
        for m2, c2 in q.items():
            m = (m1, m2)  # non-assoc, non-comm product node
            r[m] = r.get(m, F(0)) + c1*c2
            if r[m] == 0: del r[m]
    return r
def gen(name): return {name: F(1)}

A, B, X, Y = gen('A'), gen('B'), gen('X'), gen('Y')

def jb(a, b): return add(mul(a, b), mul(b, a))
def jdef(a, b):
    aa = jb(a, a)
    return sub(jb(jb(a, b), aa), jb(a, jb(b, aa)))
def innerMul(a, b, x): return sub(jb(a, jb(b, x)), jb(b, jb(a, x)))
def d(a, b, x, y):
    return sub(sub(innerMul(a, b, jb(x, y)), jb(innerMul(a, b, x), y)),
               jb(x, innerMul(a, b, y)))
def PolJ(u, v, w, t):
    uvw = add(add(u, v), w)
    return add(sub(sub(sub(jdef(uvw, t), jdef(add(u, v), t)),
                       jdef(add(u, w), t)), jdef(add(v, w), t)),
               add(add(jdef(u, t), jdef(v, t)), jdef(w, t)))

LHS = d(A, B, X, Y)
RHS = sub(scal(F(1, 2), PolJ(B, X, Y, A)), scal(F(1, 2), PolJ(A, X, Y, B)))
diff = sub(LHS, RHS)
print(f"LHS monomials: {len(LHS)}   RHS monomials: {len(RHS)}   diff monomials: {len(diff)}")
if not diff:
    print(">>> FORMAL IDENTITY over the FREE non-associative ring — abel closes it after mul_add/add_mul.")
else:
    print(">>> NOT a formal free identity. Residual:")
    for m, c in list(diff.items())[:20]:
        print("   ", c, m)

# ---- INTEGER version: d + d == combo (explicit 14-term jdef combo, all integer coeffs) ----
def combo(a,b,x,y):
    P1 = sub(sub(sub(jdef(add(add(b,x),y),a), jdef(add(b,x),a)), jdef(add(b,y),a)),
             jdef(add(x,y),a))
    P1 = add(P1, add(add(jdef(b,a), jdef(x,a)), jdef(y,a)))
    P2 = sub(sub(sub(jdef(add(add(a,x),y),b), jdef(add(a,x),b)), jdef(add(a,y),b)),
             jdef(add(x,y),b))
    P2 = add(P2, add(add(jdef(a,b), jdef(x,b)), jdef(y,b)))
    return sub(P1, P2)
LHS2 = add(d(A,B,X,Y), d(A,B,X,Y))
RHS2 = combo(A,B,X,Y)
diff2 = sub(LHS2, RHS2)
print(f"\n[INTEGER identity d+d == combo] diff monomials: {len(diff2)}")
print(">>> d + d = combo  is FORMAL (abel closes)." if not diff2 else ">>> residual!")
