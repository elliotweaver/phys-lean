import numpy as np
# Confirm the ℚ-NATIVE block decomposition of ImO (coords c1..c7 = index0..6) under
# the two banked COMMUTING integer matrices Q=Cmat, T3=Imat. Over ℚ there are NO eigenvectors
# (eigenvalues ±i,±2i irrational) — so the decomposition must be stated as INVARIANT SUBSPACES.
Cmat = np.array([[0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,-1,0]],float)
Imat = np.array([[0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]],float)
Q,T3=Cmat,Imat
def inv(M, coords):  # is span{e_i : i in coords} invariant under M?
    P=np.zeros((7,7)); 
    for i in coords: P[i,i]=1
    # M maps span into span iff (I-P) M P = 0
    return np.abs((np.eye(7)-P)@M@P).max()
blocks = {"sgl(c1)":[0], "W_hyper(c4,c5)":[3,4], "W_active(c2,c3,c6,c7)":[1,2,5,6]}
print("=== block invariance under Q and T3 (0 = invariant) ===")
for name,cs in blocks.items():
    print(f"  {name:24s}: Q {inv(Q,cs):.1e}  T3 {inv(T3,cs):.1e}")
print("\n=== T3 kernel (isospin-inert directions) ===")
kerT3 = [i for i in range(7) if np.abs(T3[i,:]).max()<1e-9 and np.abs(T3[:,i]).max()<1e-9]
print("  ker T3 coords =", kerT3, " (c1=sgl neutral, c4,c5 = W_hyper charged)")
print("=== Q on W_hyper=span{c4,c5}: Q^2 = -1 ? ===")
Ph=np.zeros((7,7)); Ph[3,3]=Ph[4,4]=1
Qh = Q@Ph
print("  Q^2 + id on W_hyper =", np.abs((Q@Q + np.eye(7))@Ph).max(), " (0 => complex structure)")
print("=== Q, T3 charged (nonzero) on W_hyper / W_active ===")
print("  Q on c4:", Q[:,3].astype(int), " (charged)")
print("  T3 on c4:", T3[:,3].astype(int), " (isospin-INERT: all 0)")
print("  T3 on c2:", T3[:,1].astype(int), " (isospin-ACTIVE)")
print("\n=== dims: 1 + 2 + 4 = 7 ✓, all forced by banked Cmat/Imat, ℚ-native (linarith/decide) ===")
