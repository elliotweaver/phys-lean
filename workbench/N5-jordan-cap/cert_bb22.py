"""cert_bb22 (run 57): find the explicit alternating-law certificate that proves
the 4-associator combination
   C = [SC,SP,ac] + [SB,p,SA b] - [SC SA,p,c] - [SB a,SP,b]   = 0
where the associator [x,y,z]=(xy)z-x(yz) and atoms are a,b,c,p with conjugates A,B,C,P
(here SA=A etc; note S* notation == conjugate).

Spanning set = INSTANCES of the banked linearized laws, expressed as associator-form
identities that are PORTABLE to Lean rewrites:
  - assoc_swap12:  [x,y,z] + [y,x,z] = 0   (antisymmetry 1<->2)
  - assoc_swap23:  [x,y,z] + [x,z,y] = 0   (antisymmetry 2<->3)
  - alt_left:      [x,x,z] = 0
  - alt_right:     [x,y,y] = 0
  - alt_flex:      [x,y,x] = 0
But the associators have COMPOUND args (ac, SA b, SC SA, SB a). The honest closing route
uses the FULL trilinearity (associator multilinear in each slot) + antisymmetry. So we
must also LINEARIZE: [x, u*v, z] is NOT directly an alt instance, but the associator
[x,y,z] as a function is trilinear, so we can treat compound args as formal and look for
an antisymmetry-based cancellation.

STRATEGY: model the associator abstractly as an alternating trilinear form on the free
vector space spanned by degree-≤2 monomials in {a,b,c,p,A,B,C,P}. Build it as a dict
keyed by FROZEN (x,y,z) of monomials, antisymmetrized. Then C is a vector in this space;
if C reduces to 0 using ONLY the alternating relations (antisymmetry + repeated-arg=0),
the certificate is exactly: rewrite each associator into a canonical sorted form, signs
from permutation parity, and equal monomials with repeated slots vanish.

This is the cleanest Lean-portable proof: the associator is alternating (assoc_swap12/23
banked), so a sum of associators that is alternating-equivalent to zero closes by sign
bookkeeping. Test that C lies in the alternating ideal.
"""
from fractions import Fraction as F
from collections import defaultdict
import itertools

# monomials are tuples-of-leaves or leaves; we treat them as ATOMIC tokens for the
# alternating form (the form is multilinear, so a compound arg is one basis vector).
# token examples: 'C','P', ('a','c')  meaning a*c ; ('C','A') meaning star c * star a, etc.
# An associator term: (coeff, x, y, z). The alternating form: swapping any two args flips
# sign; equal args -> 0. Canonicalize by sorting (x,y,z) with parity.

def key(m):
    # stable string key for ordering
    if isinstance(m, str): return ('L', m)
    return ('T',)+tuple(key(t) for t in m)

def canon(x,y,z):
    args=[x,y,z]
    # bubble sort tracking parity, by key
    parity=1
    arr=list(args)
    for i in range(3):
        for j in range(2):
            if key(arr[j])>key(arr[j+1]):
                arr[j],arr[j+1]=arr[j+1],arr[j]; parity=-parity
    # repeated arg -> alternating form vanishes
    if arr[0]==arr[1] or arr[1]==arr[2] or arr[0]==arr[2]:
        return None, 0
    return tuple(arr), parity

def add_assoc(D, coeff, x,y,z):
    c,par = canon(x,y,z)
    if c is None: return
    D[c]+=coeff*par

# atoms (S? denotes conjugate). Use uppercase for conjugates.
a,b,c,p='a','b','c','p'; A,B,C,P='A','B','C','P'
# compounds appearing:
ac=(a,c); Ab=(A,b); CA=(C,A); Ba=(B,a)

D=defaultdict(F)
add_assoc(D, F(1),  C, P, ac)    #  [SC,SP,ac]
add_assoc(D, F(1),  B, p, Ab)    #  [SB,p,SA b]
add_assoc(D, F(-1), CA, p, c)    # -[SC SA,p,c]
add_assoc(D, F(-1), Ba, P, b)    # -[SB a,SP,b]

D={k:v for k,v in D.items() if v!=0}
print("=== C as an ALTERNATING form (compound args atomic), after antisymmetry canon ===")
if not D:
    print("  C == 0 by antisymmetry alone (compound args atomic). Residual EMPTY.")
else:
    print(f"  residual {len(D)} terms (NOT closed by antisymmetry-of-atomic-compounds alone):")
    for k,v in D.items():
        print("   ", v, k)
print()
print("INTERPRETATION:")
print(" If empty: the 4 associators close purely by antisymmetry treating compounds as")
print("   single slots -> but that is NOT a valid Lean proof unless compounds really are")
print("   independent. They are NOT (ac shares atoms with c). So expect NONZERO and the")
print("   real closure needs trilinear EXPANSION of compound slots via the Moufang/linearized")
print("   laws. The residual shows which compound expansions are needed.")
