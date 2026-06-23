#!/usr/bin/env python3
# RUN 68: confirm the LEVER SET that closes every block-1 L1 coeff C_{ij,k}.
# Alternative.lean banks: assoc x y z = (xy)z - x(yz);  assoc_swap12: A(x,y,z)+A(y,x,z)=0;
#   assoc_swap23: A(x,y,z)+A(x,z,y)=0.  Candidate NEW universal lever:
#   asw_star: A(x,y,z) + star(A(x,y,z)) = 0   (associator skew under the *-involution).
# Note Alternative's assoc has OPPOSITE sign to python [x,y,z]=x(yz)-(xy)z, i.e. A=-[.].
# We verify in the faithful model: (1) asw_star holds; (2) each C is an integer combo of
# {asw_star instance} possibly + swap rewrites -> i.e. C closes via linear_combination.
from fractions import Fraction
from collections import defaultdict
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
import faithful_cd as F

def A(x,y,z):  # Alternative.lean's assoc = (xy)z - x(yz)
    return F.addO(F.mulO(F.mulO(x,y),z), F.negO(F.mulO(x,F.mulO(y,z))))
names={n:F.symO(n) for n in ['a','b','c','p']}
def G(nm):
    return F.starO(names[nm[:-2]]) if nm.endswith('_s') else names[nm]

# (1) star-skew lever, all argument shapes
import itertools
ok=True
for x,y,z in itertools.product(['a','b','c','p','a_s','p_s'],repeat=3):
    val=F.addO(A(G(x),G(y),G(z)), F.starO(A(G(x),G(y),G(z))))
    if not F.isO0(val): ok=False; print("asw_star FAILS at",x,y,z)
print("asw_star: assoc + star assoc = 0  holds for all tested shapes:", ok)

# (2) each C combo (from block1_verify) must be reproducible.
# Diagonal combos were 2(assoc_py+star) = -2(A+star). Off-diagonals: e.g. (0,2)d1:
#   2[p,sa,b] + 2[a,sp,b]  in python = -2 A(p,sa,b) - 2 A(a,sp,b).
# Check (0,2)d1 closes: is A(p,sa,b)+A(a,sp,b) in span of swaps+star?
pa=lambda x,y,z: A(G(x),G(y),G(z))
def show(n,v): print(f"  {n}: {'ZERO' if F.isO0(v) else 'NONZERO'}")
print("Off-diagonal (0,2)d1 = -2(A(p,a_s,b)+A(a,p_s,b)); is the inner sum 0?")
show("A(p,a_s,b)+A(a,p_s,b)", F.addO(pa('p','a_s','b'), pa('a','p_s','b')))
# Decompose via star: star A(p,a_s,b) = -A(p,a_s,b); and A(a,p_s,b) =? -A(p,a_s,b)
show("A(a,p_s,b) + A(p,a_s,b) [direct]", F.addO(pa('a','p_s','b'), pa('p','a_s','b')))
# So off-diagonal inner sum is itself ZERO -> a 2-term associator identity.
# Is it a swap12? A(a,p_s,b)+A(p_s,a,b)=0 (swap12). Need A(p,a_s,b)=A(p_s,a,b)? check:
show("A(p,a_s,b) - A(p_s,a,b)", F.addO(pa('p','a_s','b'), F.negO(pa('p_s','a','b'))))
