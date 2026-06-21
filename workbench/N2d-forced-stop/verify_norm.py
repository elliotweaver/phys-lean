"""
N2d — DECISIVE anti-vacuity check (W8), independent re-derivation.

Confirms, by exact rational arithmetic on the BANKED Cayley-Dickson double (Lean
conventions, Double.lean), the three claims N2d banks:

  (1) selfMul:  (z·star z).im = 0  generically  =>  z·star z = ι(Nrm z).
  (2) EASY direction:  on COMMUTATIVE bases (C=CD ℝ, H=CD ℂ) the A-valued norm
      Nrm(z)=z.re·star z.re + star z.im·z.im is MULTIPLICATIVE; and it stays
      multiplicative on O=CD ℍ (associative base) but DIES on S=CD 𝕆 (non-assoc base).
      => the law is governed by base ASSOCIATIVITY, and Nrm_mul_of_comm is non-vacuous.
  (3) genNrm dies at S: Nrm(zdX·zdY)=0 while (Nrm zdX·Nrm zdY) projects to 4.

If any of these came out trivially (e.g. Nrm identically 0, or multiplicative
everywhere), the banked theorems would be vacuous. They do not.
"""
from fractions import Fraction as Fr
import random

def z0(L): return Fr(0) if L==0 else (z0(L-1),z0(L-1))
def radd(x,y,L): return x+y if L==0 else (radd(x[0],y[0],L-1),radd(x[1],y[1],L-1))
def rneg(x,L): return -x if L==0 else (rneg(x[0],L-1),rneg(x[1],L-1))
def rsub(x,y,L): return radd(x,rneg(y,L),L)
def rstar(x,L): return x if L==0 else (rstar(x[0],L-1),rneg(x[1],L-1))
def rmul(x,y,L):
    if L==0: return x*y
    a,b=x;c,d=y
    return (radd(rmul(a,c,L-1),rneg(rmul(rstar(d,L-1),b,L-1),L-1),L-1),
            radd(rmul(d,a,L-1),rmul(b,rstar(c,L-1),L-1),L-1))
def is0(x,L): return x==0 if L==0 else (is0(x[0],L-1) and is0(x[1],L-1))
def eq(x,y,L): return is0(rsub(x,y,L),L)
def rand(L,lo=-3,hi=3): return Fr(random.randint(lo,hi)) if L==0 else (rand(L-1,lo,hi),rand(L-1,lo,hi))
def basis(L,k):
    if L==0: return Fr(1)
    h=2**(L-1)
    return (basis(L-1,k),z0(L-1)) if k<h else (z0(L-1),basis(L-1,k-h))

# Nrm on CD A: re,im in level L-1
def Nrm(z,L):
    a,b=z
    return radd(rmul(a,rstar(a,L-1),L-1), rmul(rstar(b,L-1),b,L-1), L-1)
def selfmul(z,L): return rmul(z, rstar(z,L), L)

names={1:"C=CD ℝ",2:"H=CD ℂ",3:"O=CD ℍ",4:"S=CD 𝕆"}
comm={1:True,2:True,3:False,4:False}   # base commutative? (ℝ,ℂ comm; ℍ,𝕆 not)
assoc={1:True,2:True,3:True,4:False}   # base associative? (ℝ,ℂ,ℍ assoc; 𝕆 not)

print("(1) selfMul: (z·star z).im == 0 generically  &  z·star z == ι(Nrm z)")
for L in (1,2,3,4):
    bad=0
    for _ in range(300):
        z=(rand(L-1),rand(L-1))
        s=selfmul(z,L)
        # im component (the new dim of the double) must be 0
        if not is0(s[1],L-1): bad+=1
        # and re == Nrm
        if not eq(s[0], Nrm(z,L), L-1): bad+=1
    print(f"   {names[L]:8s}: violations {bad}/600 -> {'OK (self-overlap is real)' if bad==0 else 'FAIL'}")

print("\n(2) EASY direction & associativity-governed: Nrm multiplicative?")
for L in (1,2,3,4):
    fails=0
    for _ in range(400):
        x=(rand(L-1),rand(L-1)); y=(rand(L-1),rand(L-1))
        if not eq(Nrm((rmul_pair:=rmul(x,y,L)),L), rmul(Nrm(x,L),Nrm(y,L),L-1), L-1):
            fails+=1
    verdict = "MULTIPLICATIVE" if fails==0 else f"BROKEN ({fails}/400)"
    expect = "expect mult (assoc base)" if assoc[L] else "expect BROKEN (non-assoc base)"
    ok = (fails==0)==assoc[L]
    print(f"   {names[L]:8s} comm={comm[L]!s:5s} assoc={assoc[L]!s:5s}: {verdict:18s} [{expect}] {'✓' if ok else '✗ MISMATCH'}")

print("\n(3) generic norm dies at S on the N2c witnesses:")
L=4
zdX=(basis(3,1),basis(3,2)); zdY=(basis(3,5),basis(3,6))
prod=rmul(zdX,zdY,L)
def proj(x,L):
    while L>0: x=x[0]; L-=1
    return x
print("   Nrm(zdX·zdY) == 0 ?", is0(Nrm(prod,L),3),
      " ; (Nrm zdX·Nrm zdY) proj =", proj(rmul(Nrm(zdX,L),Nrm(zdY,L),3),3),
      " (=4, nonzero) -> composition law FAILS at S")
