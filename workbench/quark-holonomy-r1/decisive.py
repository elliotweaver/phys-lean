"""DECISIVE test for the SELECT redirect: is a deviated quark phase reachable via a
CORRECTED construction (generations spanning MULTIPLE Fano lines = genuine non-assoc),
or is it genuinely void?

Lepton reference: holonomy=statistics fixed point n*T(1-T)=T from self-blind balance
(1-T)(n-1) + T*(-1)=0. The '-1' is the turning eigenvalue of Pcyc+Pcyc^2. delta=T(1-T)=2/9.

If we octonion-DRESS the transport with genuine non-associativity, does the turning
eigenvalue shift from -1 by a CLEAN forced amount? Test several genuinely-non-assoc
generation configurations and see if ANY gives a clean rational/algebraic deviated eigenvalue.
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
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]
def Lmat(a):
    cols=[o2v(omul(a,E[i])) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]
def mm(A,B):
    n=len(A);m=len(B[0]);k=len(B);return [[sum(A[i][t]*B[t][j] for t in range(k)) for j in range(m)] for i in range(n)]
def madd(A,B): return [[A[i][j]+B[i][j] for j in range(len(A[0]))] for i in range(len(A))]
def trace(A): return sum(A[i][i] for i in range(len(A)))

def charpoly(A):
    n=len(A);c=[F(0)]*(n+1);c[0]=F(1);Mk=[[F(0)]*n for _ in range(n)]
    for k in range(1,n+1):
        AM=[[sum(A[i][t]*Mk[t][j] for t in range(n)) for j in range(n)] for i in range(n)]
        Mk=[[AM[i][j]+(c[k-1] if i==j else F(0)) for j in range(n)] for i in range(n)]
        AMk=[[sum(A[i][t]*Mk[t][j] for t in range(n)) for j in range(n)] for i in range(n)]
        c[k]=-trace(AMk)/F(k)
    return c

# The octonion-resolved holonomy H = Lg + Lg^2 where g is a "cycle unit".
# For a genuine deviation we need g NOT on one Fano line. But g must ALSO generate an
# order-3 cycle of THREE generation directions. The eigenvalue of Lg+Lg^2:
# Lg has eigenvalues = eigenvalues of left-mult by unit imaginary octonion g (g^2=-1):
#   left-mult by imaginary unit g (norm1) has eigenvalues +-i each mult 4 -> Lg^2 = -I.
#   So Lg+Lg^2 = Lg - I. Eigenvalues of Lg = +-i (x4). Lg+Lg^2 = +-i -1.
# That's COMPLEX, not -1. Hmm. But holonomy on 3 abstract slots uses PERMUTATION not Lg.

# The real question: the lepton holonomy operator on 3 slots is the PERMUTATION Pcyc+Pcyc^2.
# It is NOT left-mult by an octonion. Octonion enters only via the AMPLITUDE directions.
# So the "octonion-resolved holonomy" the parent wants would REPLACE the scalar transport
# on each edge by an octonion transport. Around the loop the transports compose:
#   trivial (associative) => single unit, ORDER preserved => eigenvalue -1 unchanged.
#   non-assoc => bracketing ambiguity => NO single well-defined transport => the
#   'eigenvalue' is not a scalar at all.

# Test: build a 3-slot x 8-fiber operator where edge j->j+1 carries Lg_j for chosen units,
# g0,g1,g2 forming a genuinely non-assoc triple. Read charpoly, look for clean deviated root.
def slot_op(units):  # units = [g0(0->1),g1(1->2),g2(2->0)]; forward Pcyc dressed
    # 24x24: block (i+1 mod3, i) = L(units[i]); backward = transpose-ish (2->1 etc) using stars
    N=24;Fwd=[[F(0)]*N for _ in range(N)]
    for i in range(3):
        M=Lmat(units[i]); tgt=(i+1)%3
        for a in range(8):
            for b in range(8): Fwd[tgt*8+a][i*8+b]=M[a][b]
    # backward = the other power
    Bwd=[[F(0)]*N for _ in range(N)]
    for i in range(3):
        M=Lmat(Oh.star(units[i])); src=(i+1)%3  # reverse edge
        for a in range(8):
            for b in range(8): Bwd[i*8+a][src*8+b]=M[a][b]
    return madd(Fwd,Bwd)

configs = {
  "assoc single Fano (e1,e2,e3)": [E[1],E[2],E[3]],
  "non-assoc multi-line (e1,e2,e4)": [E[1],E[2],E[4]],
  "non-assoc (e1,e4,e6)": [E[1],E[4],E[6]],
}
for name,units in configs.items():
    S=slot_op(units)
    cp=charpoly(S)
    nz=[(24-i,cp[i]) for i in range(25) if cp[i]!=0]
    print(f"\n{name}: trace={trace(S)}, traceS^2={trace(mm(S,S))}")
    print("  charpoly nonzero terms:", nz)
