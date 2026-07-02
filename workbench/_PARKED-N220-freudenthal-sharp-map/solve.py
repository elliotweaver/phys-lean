#!/usr/bin/env python3
"""N220 MEASURE step 2: solve the SHARP off-diagonal convention so that
   pairT(A#, B) == jNpolar(A,B) EXACTLY for all Hermitian B.
   Trace form T(X,B)=Re tr(XB); its off-diagonal reduces (X,B Hermitian) to
   T = Σ eᵢ·reQ(X_ii) + 2 reQ(a'·star p)+2 reQ(b'·star q)+2 reQ(c'·star r).
   Match against jNpolar's p/q/r linear parts to read a',b',c'."""
from fractions import Fraction as F
import random, itertools
from model import (o_mul,o_star,o_add,o_neg,o_zero,o_smul,reQ,gForm,rand_o,rq,
                   jN,jS,jNpolar,Hm,mat_mul,reTrace)

def pairT(X,Y): return reTrace(mat_mul(X,Y))

# candidate off-diagonal builders: each takes (d0,d1,d2,a,b,c) -> octonion
# slot a' @(0,1); b' @(0,2); c' @(1,2)
def make_sharpMat(a_fn,b_fn,c_fn):
    def sm(d0,d1,d2,a,b,c):
        dp0=d1*d2-gForm(c,c); dp1=d0*d2-gForm(b,b); dp2=d0*d1-gForm(a,a)
        ap=a_fn(d0,d1,d2,a,b,c); bp=b_fn(d0,d1,d2,a,b,c); cp=c_fn(d0,d1,d2,a,b,c)
        return Hm(dp0,dp1,dp2,ap,bp,cp)
    return sm

# a' options (should be  b*star c - d2 a  per derivation)
a_opts = {
  "b·sc - d2 a": lambda d0,d1,d2,a,b,c: o_add(o_mul(b,o_star(c)), o_neg(o_smul(d2,a))),
  "sc·b?- d2 a": lambda d0,d1,d2,a,b,c: o_add(o_mul(o_star(c),b), o_neg(o_smul(d2,a))),
}
# b' options (should be  a c - d1 b)
b_opts = {
  "a·c - d1 b": lambda d0,d1,d2,a,b,c: o_add(o_mul(a,c), o_neg(o_smul(d1,b))),
  "c·a - d1 b": lambda d0,d1,d2,a,b,c: o_add(o_mul(c,a), o_neg(o_smul(d1,b))),
}
# c' options (candidate: star a · b - d0 c, OR b·star a - d0 c)
c_opts = {
  "sa·b - d0 c": lambda d0,d1,d2,a,b,c: o_add(o_mul(o_star(a),b), o_neg(o_smul(d0,c))),
  "b·sa - d0 c": lambda d0,d1,d2,a,b,c: o_add(o_mul(b,o_star(a)), o_neg(o_smul(d0,c))),
}

random.seed(3)
# generate a fixed test battery
battery=[]
for _ in range(60):
    battery.append((rq(),rq(),rq(),rand_o(),rand_o(),rand_o(),
                    rq(),rq(),rq(),rand_o(),rand_o(),rand_o()))

def test(sm):
    for (d0,d1,d2,a,b,c,e0,e1,e2,p,q,r) in battery:
        Ash=sm(d0,d1,d2,a,b,c); Bm=Hm(e0,e1,e2,p,q,r)
        if pairT(Ash,Bm)!=jNpolar(d0,d1,d2,a,b,c,e0,e1,e2,p,q,r):
            return False
    return True

print("Searching off-diagonal conventions for exact match T(A#,B)==jNpolar...")
found=[]
for an,af in a_opts.items():
  for bn,bf in b_opts.items():
    for cn,cf in c_opts.items():
      sm=make_sharpMat(af,bf,cf)
      if test(sm):
        found.append((an,bn,cn))
        print("  EXACT MATCH:", an,"|",bn,"|",cn)
if not found:
    print("  none of the enumerated combos matched; will inspect per-slot")
