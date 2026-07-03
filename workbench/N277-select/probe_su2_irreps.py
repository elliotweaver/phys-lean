import numpy as np

# Banked integer matrices (7x7), 0-indexed coord i = imaginary unit e_{i+1}.
# Convention: (qI M) acts as e_j |-> sum_i M[i,j] e_i  OR  M[i,j] row=output? 
# From Cmat: chargeOp e2 = e3 means row2(e3-index1? ). Let's use the file's stated convention:
# "row i = output coordinate e_{i+1}"; qZ M x with (M x)_i = sum_j M[i,j] x_j. So M acts as matrix on column vectors: v |-> M v.
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

Jmat = np.array([
 [0,0,2,0,0,0,0],
 [0,0,0,0,0,0,0],
 [-2,0,0,0,0,0,0],
 [0,0,0,0,0,0,0],
 [0,0,0,0,0,0,2],
 [0,0,0,0,0,0,0],
 [0,0,0,0,-2,0,0]], dtype=float)

def comm(A,B): return A@B - B@A

# su(2)_L closure: [DI,DJ] = ? DK. Compute.
K_from_IJ = comm(Imat, Jmat)
print("=== su(2) closure ===")
print("[Imat,Jmat] =\n", K_from_IJ.astype(int))
# In su(2): [Ti,Tj]=2 eps_ijk Tk if Ti have eigenvalues... let's just see the pattern.
# Guess Kmat = [Imat,Jmat]/ (some factor). Check [Jmat,Kmat] ~ Imat and [Kmat,Imat] ~ Jmat.
# Try Kmat = K_from_IJ / 2:
for fac in [1,2,4]:
    Kmat = K_from_IJ/fac
    c1 = comm(Jmat, Kmat)
    c2 = comm(Kmat, Imat)
    print(f"fac={fac}: [J,K]/Imat ratio check: [J,K]=\n{c1.astype(int)}\n  Imat*? ", np.allclose(c1, fac*Imat) or np.allclose(c1,-fac*Imat), " [K,I] vs Jmat:", np.allclose(c2, fac*Jmat) or np.allclose(c2,-fac*Jmat))

# Use Kmat = K_from_IJ/2 as the third generator (whatever normalization; irrep structure is scale-free)
Kmat = K_from_IJ/2.0
print("\nKmat =\n", Kmat.astype(int))

# Casimir (up to scale): C = Imat@Imat + Jmat@Jmat + Kmat@Kmat
C = Imat@Imat + Jmat@Jmat + Kmat@Kmat
print("\n=== Casimir C = I^2+J^2+K^2 ===\n", C.astype(float))
evals, evecs = np.linalg.eigh(C)
print("Casimir eigenvalues:", np.round(evals,4))
# isotypic: count multiplicities
uniq = {}
for e in np.round(evals,4):
    uniq[e]=uniq.get(e,0)+1
print("Casimir eigenvalue multiplicities (dim of each C-eigenspace):", uniq)

# For su(2): irrep of spin s has Casimir value s(s+1)*(norm). dim=2s+1.
# The C-eigenspaces are the ISOTYPIC components. To get # of irreps of each type,
# need to know the generator normalization. Let's instead directly find irreducible submodules
# by looking at the algebra generated and invariant subspaces.

# Simpler: the su(2)_L-irrep dimensions. Real antisymmetric su(2) on R^7.
# Let's decompose: find joint structure. Rank of each generator, and the orbit dims.
print("\n=== generator ranks ===")
for name,M in [("Imat",Imat),("Jmat",Jmat),("Kmat",Kmat)]:
    print(name, "rank", np.linalg.matrix_rank(M))

# The three generators together: which coords do they act on? Coord 0 (e1) killed by all?
print("\n=== which coords are su(2)_L singlets (killed by I,J,K)? ===")
for i in range(7):
    v = np.zeros(7); v[i]=1
    killed = np.allclose(Imat@v,0) and np.allclose(Jmat@v,0) and np.allclose(Kmat@v,0)
    print(f"e{i+1} (coord {i}): su(2)_L-singlet={killed}")

# Full su(2)_L-invariant singlet subspace = joint kernel of I,J,K
M_stack = np.vstack([Imat, Jmat, Kmat])
ns = M_stack.shape[1] - np.linalg.matrix_rank(M_stack)
print("dim of joint kernel (su(2)_L singlets):", ns)
# basis of joint kernel
from numpy.linalg import svd
U,S,Vt = svd(M_stack)
tol=1e-9
null_mask = np.zeros(7,dtype=bool)
# nullspace via svd of M_stack: right-singular vectors with ~0 singular value
rank = (S>tol).sum()
null_basis = Vt[rank:] if rank < 7 else np.zeros((0,7))
print("joint-kernel (singlet) basis vectors (rows):")
print(np.round(null_basis,3))
