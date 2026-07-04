"""
N288 — TRACTABILITY MEASURE: is the so(3) closure [FA,FB]=1/4 FC a STRUCTURAL slot identity
(holds for slots over ANY *-ring, hence abel/ring-closable via banked slot lemmas) or does it
need octonion-specific coordinates?

Test the closure with the "octonion entries" replaced by:
  (i) commutative scalars (ℚ)         -> * is trivial, star = id
  (ii) a NON-commutative *-ring: 2x2 real matrices with star = transpose
If the 1/4 closure holds in BOTH, it is a structural slot-combinatorics identity (tractable).
Also report the exact endomorphism coefficient (jb convention A*B+B*A, NO 1/2).
"""
import numpy as np
np.set_printoptions(suppress=True, precision=4)

# Generic *-ring entries as dxd real matrices, star = transpose. Slots live in 3x3 blocks.
def run(d, star):
    # element = 3x3 array of dxd matrices
    def zero(): return np.zeros((3,3,d,d))
    def mm(A,B):
        R=zero()
        for i in range(3):
            for j in range(3):
                for k in range(3): R[i,j]+=A[i,k]@B[k,j]
        return R
    # jb WITHOUT 1/2 (matches banked jb = A*B+B*A)
    def jb(A,B): return mm(A,B)+mm(B,A)
    def slot(i,j,x):
        M=zero(); M[i,j]=x; M[j,i]=star(x); return M
    def Lmul(A): return lambda X: jb(A,X)
    def innerMul(A,B):
        return lambda X: jb(A,jb(B,X))-jb(B,jb(A,X))
    I=np.eye(d)
    sA1=slot(0,1,I); sB1=slot(0,2,I); sC1=slot(1,2,I)
    FA=innerMul(sB1,sC1); FB=innerMul(sC1,sA1); FC=innerMul(sA1,sB1)
    # test [FA,FB] = c * FC on random Hermitian Y, find c
    np.random.seed(0)
    def randHerm():
        M=zero()
        for i in range(3): 
            r=np.random.randn(d,d); M[i,i]=r+r.T
        for (i,j) in [(0,1),(0,2),(1,2)]:
            x=np.random.randn(d,d); M[i,j]=x; M[j,i]=star(x)
        return M
    coeffs=[]
    struct_ok=True
    for _ in range(10):
        Y=randHerm()
        lhs=FA(FB(Y))-FB(FA(Y))
        rhs=FC(Y)
        # solve lhs = c rhs (least squares over all entries)
        a=rhs.reshape(-1); b=lhs.reshape(-1)
        if np.max(np.abs(a))<1e-9:
            if np.max(np.abs(b))>1e-9: struct_ok=False
            continue
        c=np.dot(a,b)/np.dot(a,a)
        if np.max(np.abs(b-c*a))>1e-8: struct_ok=False
        coeffs.append(c)
    return struct_ok, (np.mean(coeffs) if coeffs else None)

def star_id(x): return x
def star_T(x): return x.T
ok1,c1=run(1, star_id)      # commutative scalars
ok2,c2=run(2, star_T)       # noncommutative *-ring (2x2 real, transpose)
print(f"(i)  scalars (commutative): [FA,FB]=c*FC structural={ok1}, c={c1}")
print(f"(ii) 2x2 real *-ring (noncomm): [FA,FB]=c*FC structural={ok2}, c={c2}")
print()
if ok1 and ok2:
    print("=> so(3) CLOSURE IS A STRUCTURAL SLOT IDENTITY (holds over ANY *-ring)")
    print(f"   endomorphism coefficient c={c1:.3f} (jb=A*B+B*A convention)")
    print("   => TRACTABLE in Lean via banked slot-product lemmas + ring/abel, NO octonion coords")
else:
    print("=> closure needs octonion-specific structure (heavier)")
