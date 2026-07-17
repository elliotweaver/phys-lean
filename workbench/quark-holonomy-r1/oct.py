"""Exact-rational octonion model matching the phys-lean Cayley-Dickson convention.
O Q = CD(H Q), H Q = CD(Dbl Q), Dbl Q = complex (standard).
Dbl mul: (a,b)(c,d) = (ac - bd, ad + bc); star (a,b)=(a,-b).
CD mul: (z*w).re = z.re*w.re - star(w.im)*z.im ; (z*w).im = w.im*z.re + z.im*star(w.re)
   (from Double.lean:  re = z.re*w.re + -(star w.im * z.im); im = w.im*z.re + z.im*star w.re)
CD star: (star z).re = star z.re ; (star z).im = -z.im
"""
from fractions import Fraction as F

# ---- Dbl layer (complex) ----
def dbl_mul(z, w):  # z,w = (re,im) rationals
    a,b = z; c,d = w
    return (a*c - b*d, a*d + b*c)
def dbl_star(z):
    a,b = z; return (a, -b)
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0], -z[1])
DBL0=(F(0),F(0)); DBL1=(F(1),F(0))

# ---- generic CD layer given base ops ----
class CD:
    def __init__(self, mul, star, add, neg, zero, one):
        self.mul=mul; self.star=star; self.add=add; self.neg=neg; self.zero=zero; self.one=one
    def make(self):
        base=self
        def mul(z,w):  # z=(re,im), w=(re,im) with re,im in base
            zr,zi=z; wr,wi=w
            re = base.add(base.mul(zr,wr), base.neg(base.mul(base.star(wi), zi)))
            im = base.add(base.mul(wi,zr), base.mul(zi, base.star(wr)))
            return (re,im)
        def star(z):
            zr,zi=z; return (base.star(zr), base.neg(zi))
        def add(z,w): return (base.add(z[0],w[0]), base.add(z[1],w[1]))
        def neg(z): return (base.neg(z[0]), base.neg(z[1]))
        zero=(base.zero, base.zero); one=(base.one, base.zero)
        return CD(mul,star,add,neg,zero,one)

Dbl = CD(dbl_mul, dbl_star, dbl_add, dbl_neg, DBL0, DBL1)
H = Dbl.make()      # quaternions
Ohat = H.make()     # octonions

# ---- flatten octonion to 8-vector and back ----
# nesting: O=(H_re,H_im), H=(D_re,D_im), D=(q_re,q_im)
def oct_to_vec(o):
    Hre,Him=o
    out=[]
    for h in (Hre,Him):
        Dre,Dim=h
        for d in (Dre,Dim):
            out.append(d[0]); out.append(d[1])
    return out  # length 8
def vec_to_oct(v):
    def d(i): return (v[i], v[i+1])
    def h(i): return (d(i), d(i+2))
    return (h(0), h(4))
def O0(): return vec_to_oct([F(0)]*8)

# basis e0..e7
E=[]
for k in range(8):
    v=[F(0)]*8; v[k]=F(1); E.append(vec_to_oct(v))

def omul(x,y): return Ohat.mul(x,y)
def ostar(x): return Ohat.star(x)
def oadd(x,y): return Ohat.add(x,y)
def oneg(x): return Ohat.neg(x)

# ---- the banked objects ----
# u1 = <<<0,1>,<0,0>>,<<0,0>,<0,0>>>  -> H_re=( (0,1),(0,0) ), H_im=0
# vec: index0=re.re.re=0, index1=re.re.im=1, rest 0  => e1
u1 = vec_to_oct([F(0),F(1),F(0),F(0),F(0),F(0),F(0),F(0)])
# u2 = <<<0,0>,<1,0>>,...> -> H_re=( (0,0),(1,0) ) => re.im.re=1 => index2
u2 = vec_to_oct([F(0),F(0),F(1),F(0),F(0),F(0),F(0),F(0)])

def reQ(x): return x[0][0][0]  # x.re.re.re
def gForm(v,w): return reQ(omul(v, ostar(w)))
def octCross(x,y):
    xy = omul(x,y)
    g = gForm(x,y)
    # xy + g*1
    v = oct_to_vec(xy); v[0]=v[0]+g
    return vec_to_oct(v)
def assoc(x,y,z):
    return oadd(omul(omul(x,y),z), oneg(omul(x, omul(y,z))))
def assoc3(x,y,z):
    return gForm(x, octCross(y,z))

# sanity checks vs banked facts
print("u1*u1 =", oct_to_vec(omul(u1,u1)), "(expect e0=-1)")
print("u2*u2 =", oct_to_vec(omul(u2,u2)))
c = octCross(u1,u2)
print("octCross u1 u2 =", oct_to_vec(c))
print("assoc3 u2 u1 (u1xu2) =", assoc3(u2,u1,c), "(expect -1)")
print("assoc3 u1 u2 (u1xu2) =", assoc3(u1,u2,c), "(expect +1)")
# assoc witness: assoc (iota(iJ)) (iota e2) e2  -- skip; just check assoc on fano triple
print("assoc(u2,u1,c) =", oct_to_vec(assoc(u2,u1,c)), "(fano-line triple: expect 0 if quaternion subalg)")
