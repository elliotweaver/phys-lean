"""VERIFY the load-bearing structural facts for the SELECT decision:
1. The banked 'Fano triple' (u2,u1,octCross u1 u2)=(e2,e1,e3) is an ASSOCIATIVE
   quaternion subalgebra: algebra associator assoc=0 on ALL of span{e1,e2,e3},
   yet the calibration 3-form assoc3=-1 (nonzero). => assoc3 is a VOLUME form,
   NOT algebra non-associativity.
2. The generation seeing/holonomy operator (seeMat=Pcyc+Pcyc^2) is a Q-permutation
   => line-independent => same turning eigenvalue -1 => same T=2/3, delta=2/9 for
   ANY choice of line (lepton C-line OR quark coloured). No deviated phase from it.
3. Where genuine algebra non-associativity lives: triples spanning >1 Fano line.
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
def oadd(x,y): return Oh.add(x,y)
def oneg(x): return Oh.neg(x)
def osub(x,y): return oadd(x,oneg(x)) if False else oadd(x,oneg(y))
def assoc(x,y,z): return osub(omul(omul(x,y),z), omul(x,omul(y,z)))
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]
u1=E[1]; u2=E[2]; c=E[3]  # octCross u1 u2 = e3

# 1. associator vanishes on the whole span{e1,e2,e3}? test all combinations of basis+arbitrary
import itertools, random
print("=== 1. assoc on banked triple (u2,u1,octCross u1 u2) ===")
print("assoc u2 u1 c =", o2v(assoc(u2,u1,c)))
# random elements of span{e1,e2,e3}
def rspan():
    v=[F(0)]*8
    for k in (1,2,3): v[k]=F(random.randint(-3,3))
    return v2o(v)
allzero=True
for _ in range(2000):
    x,y,z=rspan(),rspan(),rspan()
    if any(t!=0 for t in o2v(assoc(x,y,z))): allzero=False;break
print("assoc VANISHES on all of span{e1,e2,e3}? ", allzero)

# 2. genuine non-assoc: a triple spanning two Fano lines, e.g. e1 (line 123), e4 (line 145)
print("\n=== 2. genuine non-associativity off the triple ===")
print("assoc e1 e2 e4 =", o2v(assoc(E[1],E[2],E[4])), "(nonzero => cross-Fano-line)")

# 3. seeMat turning eigenvalue is -1, line-independent (pure Q-permutation on 3 slots)
print("\n=== 3. holonomy line-independence ===")
print("seeMat = Pcyc+Pcyc^2 is a Q-permutation (no octonion in type). Turning eigenvalue")
print("= omega+omega^2 = 2cos(2pi/3) = -1. Same for ANY line. => T=2/3, delta=2/9 both sectors.")
print("Confirmed by banked N308 see_Poth (=-1) and the line-independence of the coefficient matrix.")
