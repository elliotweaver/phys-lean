"""
N288 CRITICAL: does [FA,FB]=FC hold as FULL-space endomorphisms (arbitrary X, not just Herm)?
And is it structural (any *-ring)? This decides Lean tractability of the so(3) closure.
FA=innerMul(slotB1,slotC1), FB=innerMul(slotC1,slotA1), FC=innerMul(slotA1,slotB1).
"""
import numpy as np
np.set_printoptions(suppress=True,precision=4)
def run(d, star, herm_only):
    def zero(): return np.zeros((3,3,d,d))
    def mm(A,B):
        R=zero()
        for i in range(3):
            for j in range(3):
                for k in range(3): R[i,j]+=A[i,k]@B[k,j]
        return R
    def jb(A,B): return mm(A,B)+mm(B,A)  # banked convention
    def slot(i,j,x):
        M=zero(); M[i,j]=x; M[j,i]=star(x); return M
    def innerMul(A,B): return lambda X: jb(A,jb(B,X))-jb(B,jb(A,X))
    I=np.eye(d)
    sA1=slot(0,1,I);sB1=slot(0,2,I);sC1=slot(1,2,I)
    FA=innerMul(sB1,sC1);FB=innerMul(sC1,sA1);FC=innerMul(sA1,sB1)
    np.random.seed(1)
    def randfull():
        M=zero()
        for i in range(3):
            for j in range(3): M[i,j]=np.random.randn(d,d)
        return M
    def randherm():
        M=zero()
        for i in range(3):
            r=np.random.randn(d,d);M[i,i]=r+star(r)
        for (i,j) in [(0,1),(0,2),(1,2)]:
            x=np.random.randn(d,d);M[i,j]=x;M[j,i]=star(x)
        return M
    gen=randherm if herm_only else randfull
    maxd=0
    for _ in range(12):
        X=gen()
        lhs=FA(FB(X))-FB(FA(X)); rhs=FC(X)
        maxd=max(maxd,np.max(np.abs(lhs-rhs)))
    return maxd
print("FULL-space (arbitrary X):")
print(f"  scalars ℚ (comm):   [FA,FB]-FC max = {run(1,lambda x:x,False):.2e}")
print(f"  2x2 real *-ring:    [FA,FB]-FC max = {run(2,lambda x:x.T,False):.2e}")
print("Hermitian-only X:")
print(f"  scalars ℚ:          [FA,FB]-FC max = {run(1,lambda x:x,True):.2e}")
print(f"  2x2 real *-ring:    [FA,FB]-FC max = {run(2,lambda x:x.T,True):.2e}")
