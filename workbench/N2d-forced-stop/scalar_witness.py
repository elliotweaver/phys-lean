"""
N2d — SCALAR norm composition defect, reduced under base-associativity.

The trunk norm is the SCALAR self-overlap (project z·z* all the way to the bottom
ℝ) — exactly N2c's `N : S ℚ → ℚ`. For z=(a,b) in CD A,
   z·z* = (a a* + b* b , 0),   q(z) = scalarpart(a a* + b* b).

We compute the SCALAR composition defect
   Dq(x,y) := q(xy) - q(x) q(y),   x=(a,b), y=(c,d),
over the free NON-associative *-algebra (imaginary gens, g_i* = -g_i), then reduce
under ASSOCIATIVITY of the base.  If it vanishes under associativity, the defect is
a pure base-associator obstruction (the easy direction holds on associative bases;
the hard direction has an explicit non-associating-triple witness).

scalarpart(x) := coefficient of the empty word (the ONE component) after we expand;
for imaginary gens, scalarpart of any nonempty reduced word is its coeff only if the
word collapses to a scalar.  We model scalarpart by: reduce under associativity to
leaf-sequences, then a word is scalar iff ... we instead track the FULL element and
read the ONE-coefficient, using the relation g_i g_i = -1? NO — that's specific.

Cleaner: we evaluate numerically on the ACTUAL cascade algebras to get the scalar
defect, and symbolically we only need the A-valued associator structure. So here we
just confirm, numerically, that the scalar defect on CD A is governed by base
associativity, and we extract the witness from a NON-ASSOCIATING octonion triple.
"""
from fractions import Fraction as Fr
import itertools, random

# numeric recursive *-algebra over ℚ (Lean convention)
def z0(L): return Fr(0) if L==0 else (z0(L-1),z0(L-1))
def radd(x,y,L): return x+y if L==0 else (radd(x[0],y[0],L-1),radd(x[1],y[1],L-1))
def rneg(x,L): return -x if L==0 else (rneg(x[0],L-1),rneg(x[1],L-1))
def rstar(x,L): return x if L==0 else (rstar(x[0],L-1),rneg(x[1],L-1))
def rmul(x,y,L):
    if L==0: return x*y
    a,b=x;c,d=y
    re=radd(rmul(a,c,L-1),rneg(rmul(rstar(d,L-1),b,L-1),L-1),L-1)
    im=radd(rmul(d,a,L-1),rmul(b,rstar(c,L-1),L-1),L-1)
    return (re,im)
def projre(x,L):
    while L>0: x=x[0];L-=1
    return x
def q(z,L): return projre(rmul(z,rstar(z,L),L),L)
def assoc(x,y,w,L):  # (xy)w - x(yw)
    return radd(rmul(rmul(x,y,L),w,L), rneg(rmul(x,rmul(y,w,L),L),L), L)
def is0(x,L): return x==0 if L==0 else (is0(x[0],L-1) and is0(x[1],L-1))

# basis element e_k at level L (flat index 0..2^L-1)
def basis(L,k):
    if L==0: return Fr(1)
    half=2**(L-1)
    if k<half: return (basis(L-1,k), z0(L-1))
    else: return (z0(L-1), basis(L-1,k-half))

# ---- O (level 3): find a NON-associating triple of imaginary units ----
L=3
imag=list(range(1,8))  # e1..e7 imaginary octonion units
nonassoc=[]
for i,j,k in itertools.product(imag,repeat=3):
    a,b,c=basis(L,i),basis(L,j),basis(L,k)
    if not is0(assoc(a,b,c,L),L):
        nonassoc.append((i,j,k))
print(f"O(dim8): non-associating imaginary-unit triples: {len(nonassoc)} (of {7**3})")
print("  examples:", nonassoc[:8])

# ---- the N2c witnesses live in S=CD(O): zdX=(e1,e2), zdY=(e5,e6) (in O-copies) ----
# Build them at level 4 and confirm scalar-norm composition fails; identify the
# governing O-associator.
L4=4
def pair_in_S(a_idx, b_idx):
    # element (a, b) of CD(O): re = e_{a_idx} in O, im = e_{b_idx} in O
    a=basis(3,a_idx); b=basis(3,b_idx)
    return (a,b)
zdX=pair_in_S(1,2)   # e1 + e10  (flat): re=e1, im=e2
zdY=pair_in_S(5,6)   # e5 + e14 : re=e5, im=e6
prod=rmul(zdX,zdY,L4)
print("\nN2c witnesses in S=CD(O):")
print("  q(zdX)=",q(zdX,L4)," q(zdY)=",q(zdY,L4)," q(zdX·zdY)=",q(prod,L4),
      " q(zdX)q(zdY)=",q(zdX,L4)*q(zdY,L4))
print("  zdX·zdY == 0 ?", is0(prod,L4))

# scan: scalar-norm defect Dq for x=(a,b),y=(c,d), a,b,c,d single imaginary O-units;
# correlate nonzero Dq with non-association of base triples.
print("\nScan x=(e_a,e_b), y=(e_c,e_d) over imaginary O-units; Dq != 0 cases:")
cnt=0; total=0
for a_,b_,c_,d_ in itertools.product(imag,repeat=4):
    x=pair_in_S(a_,b_); y=pair_in_S(c_,d_)
    total+=1
    Dq=q(rmul(x,y,L4),L4)-q(x,L4)*q(y,L4)
    if Dq!=0: cnt+=1
print(f"  Dq != 0 for {cnt}/{total} index-quadruples")
