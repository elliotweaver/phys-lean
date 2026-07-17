"""Where does GENUINE octonion non-associativity enter the generation cycle?
The banked Fano triple (e1,e2,e3) is a quaternion subalgebra (associator=0).
Genuine non-assoc needs three octonions NOT in one quaternion subalgebra.

J3(O) generations = 3 diagonal idempotents; off-diagonal Peirce spaces O_12,O_23,O_31
carry octonion coherences. A visibility loop 1->2->3->1 carries octonions
x12,x23,x31. The loop holonomy compares (x31*x23)*x12 vs x31*(x23*x12).
THIS is the exceptional non-associativity of J3(O).
"""
from fractions import Fraction as F

def dbl_mul(z,w): a,b=z;c,d=w;return (a*c-b*d,a*d+b*c)
def dbl_star(z): a,b=z;return (a,-b)
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DBL0=(F(0),F(0));DBL1=(F(1),F(0))
class CD:
    def __init__(s,mul,star,add,neg,zero,one): s.mul=mul;s.star=star;s.add=add;s.neg=neg;s.zero=zero;s.one=one
    def make(s):
        b=s
        def mul(z,w):
            zr,zi=z;wr,wi=w
            re=b.add(b.mul(zr,wr),b.neg(b.mul(b.star(wi),zi)))
            im=b.add(b.mul(wi,zr),b.mul(zi,b.star(wr)))
            return (re,im)
        def star(z): zr,zi=z;return (b.star(zr),b.neg(zi))
        def add(z,w): return (b.add(z[0],w[0]),b.add(z[1],w[1]))
        def neg(z): return (b.neg(z[0]),b.neg(z[1]))
        return CD(mul,star,add,neg,(b.zero,b.zero),(b.one,b.zero))
Dbl=CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DBL0,DBL1);H=Dbl.make();Oh=H.make()
def v2o(v):
    d=lambda i:(v[i],v[i+1]);h=lambda i:(d(i),d(i+2));return (h(0),h(4))
def o2v(o):
    Hr,Hi=o;out=[]
    for hh in (Hr,Hi):
        Dr,Di=hh
        for dd in (Dr,Di): out.append(dd[0]);out.append(dd[1])
    return out
def omul(x,y): return Oh.mul(x,y)
def ostar(x): return Oh.star(x)
def oadd(x,y): return Oh.add(x,y)
def oneg(x): return Oh.neg(x)
def osub(x,y): return oadd(x,oneg(y))
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]
def assoc(x,y,z): return osub(omul(omul(x,y),z), omul(x,omul(y,z)))

# full 7x7x7 associator table on imaginary units e1..e7 : find non-assoc triples
print("=== which triples (ei,ej,ek), i<j<k in 1..7, have nonzero algebra associator ===")
nonassoc=[]
assoc0=[]
for i in range(1,8):
    for j in range(i+1,8):
        for k in range(j+1,8):
            a=assoc(E[i],E[j],E[k])
            if any(x!=0 for x in o2v(a)):
                nonassoc.append((i,j,k))
            else:
                assoc0.append((i,j,k))
print("non-associating triples:",len(nonassoc), nonassoc[:10],"...")
print("associating triples (quaternion lines):",assoc0)
print()
# The 7 associative triples ARE the 7 Fano lines (quaternion subalgebras).
# e1e2e3 is one of them (our banked triple). Non-assoc triples are those spanning
# >1 Fano line.

# The turning eigenvalue: lepton case is the pure cyclic permutation Pcyc+Pcyc^2 on 3 slots.
# Eigenvalue on turning (Fourier omega) mode = omega+omega^2 = -1.
# For a genuinely octonion-DRESSED transport, each edge j->j+1 carries a fiber
# multiplication by an octonion unit q_edge. Loop holonomy = q2 (q1 q0) (ordered).
# On an ASSOCIATIVE (Fano-line) triple this equals a single unit -> eigenvalue still clean.
# On a NON-assoc configuration the two bracketings differ; there is no single scalar
# eigenvalue -> the "turning eigenvalue" is NOT well-defined as -1 + delta.

# Let me test: pick edge units from a non-assoc triple e1,e2,e4 and compute holonomy both ways
for triple in [(1,2,3),(1,2,4),(1,4,6),(2,4,6)]:
    a,b,c=triple
    q0,q1,q2=E[a],E[b],E[c]
    left = omul(omul(q2,q1),q0)
    right= omul(q2,omul(q1,q0))
    print(f"triple {triple}: (q2q1)q0={o2v(left)}  q2(q1q0)={o2v(right)}  differ={any(x!=y for x,y in zip(o2v(left),o2v(right)))}")
