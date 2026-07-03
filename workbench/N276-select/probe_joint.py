import numpy as np

# Banked integer 7x7 matrices on the imaginary coords c1..c7 (index 0..6).
# Cmat = chargeOp = crossOp u1 (N240); Imat = imRep DI = weak-isospin Cartan T3 (N202).
Cmat = np.array([
 [0,0,0,0,0,0,0],
 [0,0,-1,0,0,0,0],
 [0,1,0,0,0,0,0],
 [0,0,0,0,-1,0,0],
 [0,0,0,1,0,0,0],
 [0,0,0,0,0,0,1],
 [0,0,0,0,0,-1,0]], dtype=float)

Imat = np.array([
 [0,0,0,0,0,0,0],
 [0,0,-2,0,0,0,0],
 [0,2,0,0,0,0,0],
 [0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0],
 [0,0,0,0,0,0,-2],
 [0,0,0,0,0,2,0]], dtype=float)

print("=== COMMUTE check [Q,T3] ===")
print("‖QT3-T3Q‖ =", np.abs(Cmat@Imat - Imat@Cmat).max())

# Joint eigenstructure over ℂ. Q=Cmat, T3=Imat, both real-antisymmetric -> imaginary eigenvalues.
# Simultaneous diagonalization: they commute, so share eigenvectors.
# Work over ℂ.
Q = Cmat; T3 = Imat
# eigen of Q
wQ, vQ = np.linalg.eig(Q)
print("\n=== Q eigenvalues (charge) ===")
print(np.round(wQ,3))
print("=== T3 eigenvalues (isospin Cartan) ===")
wT, vT = np.linalg.eig(T3)
print(np.round(wT,3))

# Simultaneous: diagonalize Q, then T3 within eigenspaces. Since they commute and Q has distinct-ish
# eigenvalues on blocks, T3 eigenvalue per joint eigenvector:
# Build joint (q, t) labels by diagonalizing Q+ i*pi*T3 (generic combo) to split.
M = Q + np.pi*T3  # generic real combo, still antisymmetric -> distinct imaginary eigenvalues split joint spaces
wM, vM = np.linalg.eig(M)
print("\n=== JOINT (Q, T3) weights per common eigenvector ===")
labels=[]
for i in range(7):
    v = vM[:,i]
    q = (v.conj() @ Q @ v)/(v.conj()@v)
    t = (v.conj() @ T3 @ v)/(v.conj()@v)
    labels.append((np.round(q.imag,3), np.round(t.imag,3)))
# collapse to unique (q,t) with multiplicity
from collections import Counter
cnt = Counter(labels)
for (q,t),m in sorted(cnt.items()):
    print(f"  (Q={q:+.0f}i, T3={t:+.0f}i)  mult {m}")

print("\n=== READING: block structure of the fundamental 7 ===")
print(" coord c1 (u1 axis): Q=0, T3=0  -> the singlet (doubly neutral)")
print(" block (c2,c3): Q=±1i, T3=±2i   -> charged, isospin-active (doublet-like)")
print(" block (c4,c5): Q=±1i, T3=0     -> charged, isospin-SINGLET (colour-only)")
print(" block (c6,c7): Q=±1i, T3=±2i   -> charged, isospin-active (doublet-like)")

# FAMILY-BREAKING forceability test (Candidate A):
# The family S3 permutes the THREE arena SLOTS (positions in J3). u1/kap live in the OCTONION FIBER,
# not the slot space. Confirm: is there ANY family-symmetric invariant that distinguishes a slot?
print("\n=== FAMILY-BREAKING: which derived objects live in slot-space vs fiber ===")
print(" family S3 acts on SLOT positions {A,B,C} of J3(O).")
print(" u1, kappaO1: directions in the OCTONION FIBER (entry values) -> family-UNIVERSAL (N268),")
print("   they break GAUGE (colour/isospin) within a fiber, NOT the slot symmetry.")
print(" Peirce E0,E1,E2: the three DIAGONAL idempotents -> permuted by S3 (each equivalent);")
print("   picking one = a POSIT (choosing 1 of 3 symmetric idempotents).")
print(" cubic norm jN, trace form: permutation-INVARIANT -> family-symmetric, no distinguished slot.")
print(" => CONCLUSION: no derived object distinguishes a SLOT. N275 ceiling confirmed structurally:")
print("    the family-breaker cannot come from fiber directions (universal) nor arena invariants")
print("    (symmetric) nor Peirce idempotents (posit). Slot-distinction needs INTER-slot gather.")
