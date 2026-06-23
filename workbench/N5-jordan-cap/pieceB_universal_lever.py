#!/usr/bin/env python3
# RUN 68: test the SINGLE universal lever hypothesis for ALL block-1 L1 coeffs:
#   each C = 2*( [u,v,w] + star([u,v,w]) )  for some associator [u,v,w]
# where star([u,v,w]) = -[star w, star v, star u]. If true, ONE Lean lemma
#   asw : assoc x y z + star (assoc x y z) = 0   (associator is pure-imaginary)
# plus star-distribution closes every entry. Verify by matching each C's 4 monomials.
from fractions import Fraction
from collections import defaultdict
import sys
sys.path.insert(0, '/Users/elliotweaver/phys-lean/workbench/N5-jordan-cap')
import faithful_cd as F

# rebuild J to get coeffs (reuse block1_verify machinery inline)
def emul(A, B):
    r = defaultdict(Fraction)
    for (dA, tA), cA in A.items():
        for (dB, tB), cB in B.items():
            dm = tuple(sorted(dA + dB))
            t = tB if tA is None else (tA if tB is None else ('*', tA, tB))
            r[(dm, t)] += cA * cB
    return {k: v for k, v in r.items() if v != 0}
def eadd(*As):
    r = defaultdict(Fraction)
    for A in As:
        for k, v in A.items(): r[k] += v
    return {k: v for k, v in r.items() if v != 0}
def eneg(A): return {k: -v for k, v in A.items()}
def esub(A, B): return eadd(A, eneg(B))
def sym(s): return {((), s): Fraction(1)}
def dsym(d): return {((d,), None): Fraction(1)}
ZERO = {}
def mzero(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[eadd(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            acc=dict(ZERO)
            for k in range(3): acc=eadd(acc, emul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def msub(A,B): return [[esub(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return msub(jb(jb(A,B),AA), jb(A,jb(B,AA)))
def Hm():
    M = mzero()
    M[0][0]=dsym('d0'); M[1][1]=dsym('d1'); M[2][2]=dsym('d2')
    M[0][1]=sym('a'); M[1][0]=sym('a_s'); M[0][2]=sym('b'); M[2][0]=sym('b_s')
    M[1][2]=sym('c'); M[2][1]=sym('c_s'); return M
def Yb1():
    M = mzero(); M[0][1]=sym('p'); M[1][0]=sym('p_s'); return M

# star of a base symbol-name
def sname(n): return n[:-2] if n.endswith('_s') else n+'_s'
def stree(t):
    if isinstance(t,str): return sname(t)
    return ('*', stree(t[2]), stree(t[1]))

# associator monomials as symbolic polynomial: [x,y,z] = x*(y*z) - (x*y)*z
def assoc_poly(x,y,z):
    return {('*',x,('*',y,z)): Fraction(1), ('*',('*',x,y),z): Fraction(-1)}
def star_poly(P):
    r=defaultdict(Fraction)
    for t,v in P.items(): r[stree(t)] += v
    return {k:v for k,v in r.items() if v}

J = jdef(Hm(), Yb1())
all_ok = True
for i in range(3):
    for j in range(3):
        deg1 = {k:v for k,v in J[i][j].items() if len(k[0])==1}
        for dk in ['d0','d1','d2']:
            coeff = {k[1]:v for k,v in deg1.items() if k[0]==(dk,)}
            if not coeff: continue
            # find an associator [x,y,z] (x,y,z in base names) s.t. coeff = 2*([x,y,z]+star)
            # brute search over the names appearing in coeff
            nameset=set()
            def collect(t):
                if isinstance(t,str): nameset.add(t)
                else: collect(t[1]); collect(t[2])
            for t in coeff: collect(t)
            names=sorted(nameset)
            found=None
            for x in names:
                for y in names:
                    for z in names:
                        cand = assoc_poly(x,y,z)
                        cand = {k:2*v for k,v in cand.items()}
                        candf = eadd(cand, {k:2*v for k,v in star_poly(assoc_poly(x,y,z)).items()})
                        if candf == coeff:
                            found=(x,y,z); break
                    if found: break
                if found: break
            print(f"({i},{j})[{dk}]: 2([{found[0]},{found[1]},{found[2]}] + star) " if found
                  else f"({i},{j})[{dk}]: NO single-associator match", end="")
            print("  OK" if found else "  <-- needs combo")
            all_ok = all_ok and bool(found)
print("="*50)
print("ALL block-1 L1 coeffs = 2*(assoc + star assoc):", all_ok)
