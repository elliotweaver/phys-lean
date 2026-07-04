"""
N281 SELECT — deep measurement of the candidate directions on the fold's octonion table.
Reuses the exact CD product from probe_octonion.py.

Key question (repeated-deferral rail): ★2 mixing-angle/GMN failed on the vector-7 ADJOINT (Q∉span{T3,Y},
[Q,Y]≠0). N279-280 built a RICHER structure — the SPINOR carrier O ℚ with su(2)_L=leftReg (FUNDAMENTAL
doublet), su(2)_R=rightReg, so(4) on H. Does the mixing-angle/charge structure become FORCEABLE there?
"""
import numpy as np
from fractions import Fraction as F

def R_mul(x,y): return x*y
def R_star(x): return x
def gadd(x,y):
    if isinstance(x,tuple): return (gadd(x[0],y[0]), gadd(x[1],y[1]))
    return x+y
def gsub(x,y):
    if isinstance(x,tuple): return (gsub(x[0],y[0]), gsub(x[1],y[1]))
    return x-y
def make_level(mul, star):
    def lmul(z,w):
        (a,b)=z; (c,d)=w
        return (gsub(mul(a,c), mul(star(d),b)), gadd(mul(d,a), mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a), lneg(b))
    return lmul, lstar
def neg_gen():
    def n(z):
        if isinstance(z,tuple): return (n(z[0]), n(z[1]))
        return -z
    return n
lneg = neg_gen()
C_mul,C_star = make_level(R_mul,R_star)
H_mul,H_star = make_level(C_mul,C_star)
O_mul,O_star = make_level(H_mul,H_star)
def flat(z):
    ((za,zb),(zc,zd))=z; (a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd
    return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
def octmul(x,y): return O_mul(x,y)
e=[basis(i) for i in range(8)]
def leftReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(x,basis(j)))
        for i in range(8): M[i][j]=col[i]
    return M
def rightReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(basis(j),x))
        for i in range(8): M[i][j]=col[i]
    return M
def matmul(A,B):
    C=[[F(0)]*8 for _ in range(8)]
    for i in range(8):
        for k in range(8):
            if A[i][k]==0: continue
            for j in range(8): C[i][j]+=A[i][k]*B[k][j]
    return C
def matadd(A,B): return [[A[i][j]+B[i][j] for j in range(8)] for i in range(8)]
def matsub(A,B): return [[A[i][j]-B[i][j] for j in range(8)] for i in range(8)]
def matscale(s,A): return [[s*A[i][j] for j in range(8)] for i in range(8)]
def comm(A,B): return matsub(matmul(A,B),matmul(B,A))
def ident(): return [[F(1) if i==j else F(0) for j in range(8)] for i in range(8)]
def iszero(A): return all(A[i][j]==0 for i in range(8) for j in range(8))
def npf(A): return np.array([[float(A[i][j]) for j in range(8)] for i in range(8)])

L1,L2,L3 = leftReg(e[1]),leftReg(e[2]),leftReg(e[3])
R1,R2,R3 = rightReg(e[1]),rightReg(e[2]),rightReg(e[3])

print("="*70)
print("DIRECTION B: does the charge/hypercharge/GMN structure become forceable")
print("on the SPINOR (fundamental) where it FAILED on the vector-7 (adjoint)?")
print("="*70)
# T3^L = L1 (su(2)_L Cartan, fundamental). T3^R = R1 (su(2)_R Cartan). Both square to -1.
print("L1^2 = -I ?", matmul(L1,L1)==matscale(F(-1),ident()))
print("R1^2 = -I ?", matmul(R1,R1)==matscale(F(-1),ident()))
print("[L1,R1] = 0 (commute on ALL O)?", iszero(comm(L1,R1)))
# eigenvalues of L1, R1, L1+R1, L1-R1 on the 8-dim spinor
for name,M in [("L1(=T3_L)",L1),("R1(=T3_R)",R1),("L1+R1",matadd(L1,R1)),("L1-R1",matsub(L1,R1))]:
    ev = np.linalg.eigvals(npf(M))
    ev_sorted = sorted([complex(round(x.real,4),round(x.imag,4)) for x in ev], key=lambda z:(z.real,z.imag))
    print(f"  eig({name}) = {ev_sorted}")

print("\n--- The colour complex structure JO = L1 (N266) and su(2)_R ---")
print("[L1, R2] = 0 on O?", iszero(comm(L1,R2)), " [L1,R3]=0?", iszero(comm(L1,R3)))
print(">> so R2,R3 do NOT commute with the colour J=L1? (tells whether su(2)_R is colour-compatible)")

print("\n" + "="*70)
print("DIRECTION A: parity — is there a FOLD-FORCED distinction L vs R hand?")
print("="*70)
# A symmetric so(4) is parity-conserving. Is there ANY fold-derived operator that
# picks out ONE hand? Candidates: the doubling map, the star/conjugation, chirality.
# star(x) conjugation: does it swap L<->R?
def starReg():
    # star as an 8x8 matrix: negate imaginary coords (1..7), keep e0
    M=ident(); 
    for i in range(1,8): M[i][i]=F(-1)
    return M
S = starReg()
print("star = diag(1,-1,...,-1). S L1 S = ? relate to R1 (S conjugates L_a to R of star(a))")
SL1S = matmul(matmul(S,L1),S)
print("  S·L1·S = -R1 ?", SL1S==matscale(F(-1),R1), "  = R1?", SL1S==R1, " = L1?", SL1S==L1)
SL2S = matmul(matmul(S,L2),S)
print("  S·L2·S = -R2 ?", SL2S==matscale(F(-1),R2), " = R2?", SL2S==R2)
# So conjugation maps L-hand to R-hand: they are related by the fold's OWN star (conjugation),
# which is DERIVED (Double.lean). That is a SYMMETRY, not an asymmetry -> parity conserving. Confirm.

print("\n" + "="*70)
print("DIRECTION C: joint colour x weak-isospin on the FULL spinor carrier")
print("="*70)
# colour = g2-stabilizer of J=L1. su(2)_L=leftReg. Do they commute on the carrier?
# Need imRep of a colour derivation acting on the 8-dim carrier. That's more machinery.
# Quick proxy: does su(2)_L (leftReg) commute with su(2)_R (rightReg) fully? Already know: on H yes, on O no.
print("(needs colour derivation on 8-dim carrier — heavier; deferring detailed measure)")

print("\n" + "="*70)
print("KEY: GMN on the spinor. Electric charge Q on the fundamental doublet.")
print("="*70)
# On the fundamental doublet, the SM eigenvalues: Q = T3 + Y/2. T3 eigenvalues ±1/2.
# Here T3_L = L1 has eigenvalues ±i (not ±1/2 — it's a complex structure). The 'real' Cartan
# generator with eigenvalues ±1/2 would be (i/2)·L1 in a complexification. Over Q we can't do i.
# THE WALL SIGNATURE: to get real ±1/2 eigenvalues we'd need to complexify (posit i as scalar).
# Measure: is there a REAL operator on the spinor whose eigenvalues are the charge grading 0,±1/3,±2/3,±1?
# The charge operator on the vector-7 had spectrum {0,±i}. On the spinor?
chargeCandidate = L1  # or combos
ev = np.linalg.eigvals(npf(L1))
print("L1 spectrum (real op):", sorted(set(round(x.imag,3) for x in ev)), "(imaginary => needs complexification for real charge)")
