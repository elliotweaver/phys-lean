#!/usr/bin/env python3
"""
N220 MEASURE: pin the Freudenthal SHARP MAP A# as an explicit element of J3(O),
byte-for-byte the banked Lean CD product / star / gForm / reQ.

Cascade (exact, from Phys/Cascade):
  Dbl:  mul re = re*re' - im*im' ; mul im = re*im' + im*re' ; star = (re,-im)
  CD:   mul re = z.re*w.re - star(w.im)*z.im ; mul im = w.im*z.re + z.im*star(w.re)
        star = (star z.re, -z.im)
  O Q = CD(CD(Dbl Q)).
  reQ x = x.re.re.re ; gForm v w = reQ(v * star w).

Targets to pin:
  jN   d0 d1 d2 a b c = d0 d1 d2 - d0|c|^2 - d1|b|^2 - d2|a|^2 + 2 reQ((a c) star b)
  jS   d0 d1 d2 a b c = (d0 d1+d0 d2+d1 d2) - |a|^2-|b|^2-|c|^2
  jNpolar(A,B) (N217, the SHARP TRACE-PAIRING scalar) -- the linear polar coefficient.

Candidate sharp ELEMENT A# (classical adjugate; off-diag products of exactly TWO
octonions => bracketing-unambiguous):
  A = Hm d0 d1 d2 a b c   (a@(0,1), b@(0,2), c@(1,2), diag real)
  A# diagonal:  d0' = d1 d2 - |c|^2 ; d1' = d0 d2 - |b|^2 ; d2' = d0 d1 - |a|^2
  A# off-diag:  a' = b*star c - d2 . a   (at (0,1))
                b' = a*c      - d1 . b   (at (0,2))
                c' = b*star a - d0 . c   (at (1,2))
Checks:
  (1) trace(A#) [sum of diag] == jS(A)
  (2) A# is Hermitian
  (3) some trace-pairing of A# with B == jNpolar(A,B)
  (4) trace-pairing of A# with identity == jS(A)  (Euler tie)
"""
from fractions import Fraction as F
import random, itertools

# ---------- Dbl Q ----------
def d_mul(z, w):
    (a,b),(c,d)=z,w
    return (a*c-b*d, a*d+b*c)
def d_star(z): return (z[0], -z[1])
def d_add(z,w): return (z[0]+w[0], z[1]+w[1])
def d_neg(z): return (-z[0],-z[1])
D0=(F(0),F(0)); D1=(F(1),F(0))

# ---------- generic CD over a base with (mul,star,add,neg,zero,one) ----------
def make_cd(mul,star,add,neg,zero,one):
    def cmul(z,w):
        zr,zi=z; wr,wi=w
        re = add(mul(zr,wr), neg(mul(star(wi),zi)))
        im = add(mul(wi,zr), mul(zi,star(wr)))
        return (re,im)
    def cstar(z): return (star(z[0]), neg(z[1]))
    def cadd(z,w): return (add(z[0],w[0]), add(z[1],w[1]))
    def cneg(z): return (neg(z[0]), neg(z[1]))
    czero=(zero,zero); cone=(one,zero)
    return cmul,cstar,cadd,cneg,czero,cone

# H = CD(Dbl)
h_mul,h_star,h_add,h_neg,h_zero,h_one = make_cd(d_mul,d_star,d_add,d_neg,D0,D1)
# O = CD(H)
o_mul,o_star,o_add,o_neg,o_zero,o_one = make_cd(h_mul,h_star,h_add,h_neg,h_zero,h_one)

# ---------- O helpers ----------
def o_from8(v):
    # v = 8 rationals -> nested ((( , ),( , )),(( , ),( , )))
    return (((v[0],v[1]),(v[2],v[3])), ((v[4],v[5]),(v[6],v[7])))
def reQ(x):  # x.re.re.re
    return x[0][0][0]
def o_smul(r, x):
    # scalar mult by rational r, componentwise
    def sm(z):
        if isinstance(z, tuple) and isinstance(z[0], tuple):
            return (sm(z[0]), sm(z[1]))
        return (r*z[0], r*z[1])
    return sm(x)
def gForm(v,w):
    return reQ(o_mul(v, o_star(w)))
def rq(): return F(random.randint(-3,3), random.choice([1,2,3]))
def rand_o():
    return o_from8([rq() for _ in range(8)])

# ---------- the invariants ----------
def jN(d0,d1,d2,a,b,c):
    return (d0*d1*d2 - d0*gForm(c,c) - d1*gForm(b,b) - d2*gForm(a,a)
            + 2*reQ(o_mul(o_mul(a,c), o_star(b))))
def jS(d0,d1,d2,a,b,c):
    return (d0*d1+d0*d2+d1*d2) - gForm(a,a)-gForm(b,b)-gForm(c,c)
def jNpolar(d0,d1,d2,a,b,c, e0,e1,e2,p,q,r):
    return (e0*d1*d2 + d0*e1*d2 + d0*d1*e2
            - e0*gForm(c,c) - 2*d0*gForm(c,r)
            - e1*gForm(b,b) - 2*d1*gForm(b,q)
            - e2*gForm(a,a) - 2*d2*gForm(a,p)
            + 2*(reQ(o_mul(o_mul(a,c),o_star(q)))
                 + reQ(o_mul(o_mul(a,r),o_star(b)))
                 + reQ(o_mul(o_mul(p,c),o_star(b)))))

# ---------- the candidate SHARP element (returns d0',d1',d2',a',b',c') ----------
def sharp(d0,d1,d2,a,b,c):
    dp0 = d1*d2 - gForm(c,c)
    dp1 = d0*d2 - gForm(b,b)
    dp2 = d0*d1 - gForm(a,a)
    ap = o_add(o_mul(b, o_star(c)), o_neg(o_smul(d2, a)))   # b*star c - d2.a  @(0,1)
    bp = o_add(o_mul(a, c),         o_neg(o_smul(d1, b)))   # a*c      - d1.b  @(0,2)
    cp = o_add(o_mul(b, o_star(a)), o_neg(o_smul(d0, c)))   # b*star a - d0.c  @(1,2)
    return dp0,dp1,dp2,ap,bp,cp

# ---------- Hermitian matrix as 3x3 over O; matrix mult; trace pairing ----------
def Hm(d0,d1,d2,a,b,c):
    # returns 3x3 grid of O elements
    ocR = lambda t: o_from8([t,F(0),F(0),F(0),F(0),F(0),F(0),F(0)])
    return [[ocR(d0), a, b],
            [o_star(a), ocR(d1), c],
            [o_star(b), o_star(c), ocR(d2)]]
def mat_mul(X,Y):
    Z=[[o_zero for _ in range(3)] for _ in range(3)]
    for i in range(3):
        for j in range(3):
            acc=o_zero
            for k in range(3):
                acc=o_add(acc, o_mul(X[i][k], Y[k][j]))
            Z[i][j]=acc
    return Z
def reTrace(X):  # sum_i reQ(X_ii)
    return reQ(X[0][0])+reQ(X[1][1])+reQ(X[2][2])
def pairT(X,Y):  # reQ trace of matrix product X*Y  = sum_ij reQ(X_ij Y_ji)
    return reTrace(mat_mul(X,Y))

# ================= MEASUREMENTS =================
random.seed(11)
print("=== check (1) trace(A#) == jS(A) ===")
ok=True
for _ in range(200):
    d0,d1,d2=rq(),rq(),rq(); a,b,c=rand_o(),rand_o(),rand_o()
    dp0,dp1,dp2,ap,bp,cp=sharp(d0,d1,d2,a,b,c)
    lhs=dp0+dp1+dp2; rhs=jS(d0,d1,d2,a,b,c)
    if lhs!=rhs: ok=False; print("FAIL",lhs,rhs); break
print("trace(A#) == jS :", ok)

print("=== check (2) A# Hermitian (its Hm is well-formed, off-diag are octonions) — structural, trivially yes ===")

print("=== check (3) find normalization: jNpolar(A,B) vs pairT(A#, B) ===")
# A# as a matrix:
def sharpMat(d0,d1,d2,a,b,c):
    dp0,dp1,dp2,ap,bp,cp=sharp(d0,d1,d2,a,b,c)
    return Hm(dp0,dp1,dp2,ap,bp,cp)
ratios=set()
consistent=True
for _ in range(80):
    d0,d1,d2=rq(),rq(),rq(); a,b,c=rand_o(),rand_o(),rand_o()
    e0,e1,e2=rq(),rq(),rq(); p,q,r=rand_o(),rand_o(),rand_o()
    Ash=sharpMat(d0,d1,d2,a,b,c)
    Bm =Hm(e0,e1,e2,p,q,r)
    lhs=jNpolar(d0,d1,d2,a,b,c, e0,e1,e2,p,q,r)
    rhs=pairT(Ash,Bm)
    if rhs!=0:
        ratios.add(lhs/rhs)
    elif lhs!=0:
        consistent=False
print("jNpolar / pairT(A#,B) ratios seen:", ratios, "consistent:", consistent)

print("=== check (4) pairT(A#, identity) == jS(A) (Euler tie: tr A# = e2) ===")
I3=Hm(F(1),F(1),F(1),o_zero,o_zero,o_zero)
ok4=True
for _ in range(100):
    d0,d1,d2=rq(),rq(),rq(); a,b,c=rand_o(),rand_o(),rand_o()
    Ash=sharpMat(d0,d1,d2,a,b,c)
    if pairT(Ash,I3)!=jS(d0,d1,d2,a,b,c): ok4=False; break
print("pairT(A#, 1) == jS :", ok4)

print("=== check (5) does jNpolar(A,B) == pairT(A#,B) EXACTLY (ratio {1})? ===")
print("   => if ratios=={1}, the sharp element's trace-pairing IS the first polar, no rescale.")
