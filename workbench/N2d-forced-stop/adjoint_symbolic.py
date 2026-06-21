"""
SYMBOLIC derivation of the ADJOINT identity over CD A, base ops FREE
(non-commutative, non-associative) -- find the MINIMAL base-centrality facts needed.

CD A product:  (a,b)(c,d) = (a c - star(d) b,  d a + b star(c))
star(a,b) = (star a, -b).
bilin(p,q) = (p star(q) + q star(p)).re   [.re = first coord]

Adjoint:  bilin(u v, w) = bilin(v, star(u) w),  u=(u1,u2), v=(v1,v2), w=(w1,w2).

We expand both sides to base-A expressions and subtract. Base A: a *-ring with
distributivity, but mul possibly non-assoc and non-comm. We use sympy noncommutative
symbols and DO NOT assume associativity (sympy Mul is assoc by default -> problem).
Instead: represent base elements as elements of a FREE algebra via string normal forms?
Too heavy. Simpler: TEST the adjoint over bases with TUNABLE properties and see which
property (self-overlap central / trace central / full centrality) is the on/off switch,
already done (adj_level). Here instead: derive the EXACT defect = bilin(uv,w)-bilin(v,star u w)
as a base expression and show it's a sum of COMMUTATORS/ASSOCIATORS that vanish under
'self-overlap & trace central'.

Concretely compute the defect on M2 (non-central) symbolically-ish with random fills,
and express it in terms of base commutators [p,q]=pq-qp to see the structure.
"""
from fractions import Fraction as Fr
import random

def m_mul(a,b):
    return (a[0]*b[0]+a[1]*b[2], a[0]*b[1]+a[1]*b[3],
            a[2]*b[0]+a[3]*b[2], a[2]*b[1]+a[3]*b[3])
def m_add(a,b): return tuple(x+y for x,y in zip(a,b))
def m_neg(a): return tuple(-x for x in a)
def m_sub(a,b): return m_add(a,m_neg(b))
def m_star(a): return (a[0],a[2],a[1],a[3])
def m_comm(a,b): return m_sub(m_mul(a,b),m_mul(b,a))
M0=(Fr(0),)*4
def rndM(): return tuple(Fr(random.randint(-2,2)) for _ in range(4))

# CD over M2
def cd_mul(z,w):
    a,b=z; c,d=w
    return (m_sub(m_mul(a,c), m_mul(m_star(d),b)), m_add(m_mul(d,a), m_mul(b,m_star(c))))
def cd_star(z): return (m_star(z[0]), m_neg(z[1]))
def cd_add(z,w): return (m_add(z[0],w[0]), m_add(z[1],w[1]))
def bilin(z,w):  # .re = base first-coord
    p = cd_add(cd_mul(z,cd_star(w)), cd_mul(w,cd_star(z)))
    return p[0]   # an M2 element
def rndCD(): return (rndM(),rndM())

random.seed(0)
print("=== adjoint defect bilin(uv,w) - bilin(v, star u w) on CD(M2) ===")
nz=0
for _ in range(5):
    u,v,w=rndCD(),rndCD(),rndCD()
    lhs=bilin(cd_mul(u,v),w)
    rhs=bilin(v,cd_mul(cd_star(u),w))
    d=m_sub(lhs,rhs)
    if any(c!=0 for c in d): nz+=1
    print("  defect:",d)
print(f"  nonzero {nz}/5")
print()
# Now: is the defect a combination of [trace, .]/[norm,.] commutators?
# Test: if we restrict u to have CENTRAL self-overlap & trace (u in scalar*I + ...),
# does defect vanish? Use u with u1,u2 SCALAR multiples of I (central):
def scalI(x): return (x,Fr(0),Fr(0),x)
print("=== defect when u-components are CENTRAL (scalar matrices) ===")
random.seed(1); nz=0
for _ in range(5):
    u=(scalI(Fr(random.randint(-2,2))), scalI(Fr(random.randint(-2,2))))
    v,w=rndCD(),rndCD()
    d=m_sub(bilin(cd_mul(u,v),w), bilin(v,cd_mul(cd_star(u),w)))
    if any(c!=0 for c in d): nz+=1
print(f"  central-u defect nonzero: {nz}/5")
print()
print("=== the adjoint is LINEAR in u; suffices on a generating set. Test u=iota(a), u=e2*iota(b) ===")
def iota(a): return (a,M0)
def e2iota(b): return (M0,b)  # e2 * iota(b) = (0,b)?  e2=(0,1); e2*iota(b)=(0, b*star1)=(0,b)
random.seed(2)
for label,ufun in (("u=iota(a)",iota),("u=(0,b)",e2iota)):
    nz=0
    for _ in range(200):
        a=rndM(); u=ufun(a); v,w=rndCD(),rndCD()
        d=m_sub(bilin(cd_mul(u,v),w), bilin(v,cd_mul(cd_star(u),w)))
        if any(c!=0 for c in d): nz+=1
    print(f"  {label}: defect nonzero {nz}/200")
