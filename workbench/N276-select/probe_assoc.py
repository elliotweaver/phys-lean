import numpy as np
import itertools

# ---- Octonions via Cayley-Dickson: O = CD(H), H = CD(C), C = CD(R). 8-dim over R. ----
# Represent octonion as length-8 real vector. Multiplication via CD doubling.
def cd_mul(x, y):
    # x,y length 2n; split (a,b),(c,d). (a,b)*(c,d) = (a c - conj(d) b, d a + b conj(c))
    n = len(x)//2
    a,b = x[:n], x[n:]
    c,d = y[:n], y[n:]
    def conj(z):
        z=z.copy(); 
        if len(z)==1: return z
        z[1:] = -z[1:]
        return z
    def mul(u,v):
        if len(u)==1: return u*v
        return cd_mul(u,v)
    ac = mul(a,c); dcb = mul(conj(d),b) if n>0 else 0
    top = mul(a,c) - mul(conj(d),b)
    bot = mul(d,a) + mul(b,conj(c))
    return np.concatenate([top,bot])

def omul(x,y):
    return cd_mul(x,y)

def ostar(x):
    x=x.copy(); x[1:]=-x[1:]; return x

# basis
def e(i):
    v=np.zeros(8); v[i]=1.0; return v
one=e(0)
# sanity: e1*e1 = -1
assert np.allclose(omul(e(1),e(1)), -one)
# non-associativity witness: (e1 e2) e4 vs e1 (e2 e4)
lhs=omul(omul(e(1),e(2)),e(4)); rhs=omul(e(1),omul(e(2),e(4)))
print("octonion assoc test (e1e2)e4 - e1(e2e4):", np.round(lhs-rhs,3), "(nonzero => non-assoc)")

# ---- J3(O): 3x3 hermitian octonionic. Element = (d0,d1,d2 real diag; a,b,c oct off-diag). ----
# Hermitian: M[i][j] = star(M[j][i]). Off-diagonal slots:
#   slotA a -> positions (1,2)&(2,1)  [we label A at (0,1)? use standard: entries a=(0,1),b=(1,2),c=(2,0)]
# Use matrix of octonions.
def herm(d, a,b,c):
    # d=(d0,d1,d2) reals; a=(0,1), b=(1,2), c=(2,0) octonions
    M=[[one*d[0], a, ostar(c)],
       [ostar(a), one*d[1], b],
       [c, ostar(b), one*d[2]]]
    return M

def mat_mul(M,N):
    R=[[np.zeros(8) for _ in range(3)] for _ in range(3)]
    for i in range(3):
        for j in range(3):
            s=np.zeros(8)
            for k in range(3):
                s=s+omul(M[i][k],N[k][j])
            R[i][j]=s
    return R
def mat_add(M,N):
    return [[M[i][j]+N[i][j] for j in range(3)] for i in range(3)]
def mat_scale(M,s):
    return [[M[i][j]*s for j in range(3)] for i in range(3)]
def jb(M,N):  # Jordan product M∘N = MN+NM  (we use jb = MN+NM, matches banked jb)
    return mat_add(mat_mul(M,N),mat_mul(N,M))
def mat_sub(M,N):
    return [[M[i][j]-N[i][j] for j in range(3)] for i in range(3)]
def mat_norm(M):
    return max(np.abs(M[i][j]).max() for i in range(3) for j in range(3))

def slotA(a): return herm((0,0,0), a, np.zeros(8), np.zeros(8))
def slotB(b): return herm((0,0,0), np.zeros(8), b, np.zeros(8))
def slotC(c): return herm((0,0,0), np.zeros(8), np.zeros(8), c)

# ---- The three-slot Jordan ASSOCIATOR: assoc(X,Y,Z) = (X∘Y)∘Z - X∘(Y∘Z) ----
def jassoc(X,Y,Z):
    return mat_sub(jb(jb(X,Y),Z), jb(X,jb(Y,Z)))

# test at generic octonion entries
rng=np.random.default_rng(0)
a=rng.standard_normal(8); b=rng.standard_normal(8); c=rng.standard_normal(8)
A=slotA(a); B=slotB(b); C=slotC(c)

print("\n=== THREE-SLOT JORDAN ASSOCIATOR assoc(slotA a, slotB b, slotC c) ===")
J=jassoc(A,B,C)
print("‖assoc(A,B,C)‖ =", round(mat_norm(J),4), " (nonzero => the three slots do NOT associate)")

# Its S3 transformation: compare assoc under slot permutations (family symmetry framePerm = submatrix σσ).
# framePerm permutes rows&cols by σ. Represent by permuting the 3x3 matrix.
def framePerm(M, sigma):  # sigma a permutation of (0,1,2)
    return [[M[sigma[i]][sigma[j]] for j in range(3)] for i in range(3)]

# swap(1,2) as sigma on {0,1,2}
import itertools
for name,sig in [("id",(0,1,2)),("swap01",(1,0,2)),("swap12",(0,2,1)),("swap02",(2,1,0)),("cyc",(1,2,0)),("cyc2",(2,0,1))]:
    Js = framePerm(J, sig)
    # Also assoc of permuted slots:
    Ap,Bp,Cp = framePerm(A,sig),framePerm(B,sig),framePerm(C,sig)
    Jperm = jassoc(Ap,Bp,Cp)
    print(f"  {name}: ‖framePerm(assoc)-assoc(perm slots)‖ = {mat_norm(mat_sub(Js,Jperm)):.3e}")

# Where does assoc(A,B,C) live? Diagonal or off-diagonal? Which slots?
print("\n=== assoc(A,B,C) structure (which matrix entries carry it) ===")
for i in range(3):
    for j in range(3):
        nz = np.abs(J[i][j]).max()
        if nz>1e-9:
            print(f"  entry ({i},{j}): ‖‖={nz:.3f}  re-part={J[i][j][0]:.3f}")

# Is it a DIAGONAL object (breaks the slot symmetry by loading a specific diagonal)?
print("\n=== KEY: is the associator a DIAGONAL (family-distinguishing) object? ===")
diag = [J[k][k][0] for k in range(3)]
print("  diagonal real parts (d0,d1,d2) =", np.round(diag,4))
print("  => if these three differ, the associator DISTINGUISHES the slots WITHOUT a posit.")
