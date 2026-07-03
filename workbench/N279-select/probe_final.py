import numpy as np
def conj_n(x):
    y=x.copy(); y[1:]=-y[1:]; return y
def mul_cd(x,y,n):
    if n==1: return np.array([x[0]*y[0]])
    h=n//2; a,b=x[:h],x[h:]; c,d=y[:h],y[h:]
    return np.concatenate([mul_cd(a,c,h)-mul_cd(conj_n(d),b,h), mul_cd(d,a,h)+mul_cd(b,conj_n(c),h)])
def mul(x,y): return mul_cd(x,y,8)
def bE(i):
    v=np.zeros(8); v[i]=1; return v
E=[bE(i) for i in range(8)]
def Lmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(a,E[j])
    return A
def comm(A,B): return A@B-B@A
LI,LJ,LK=Lmat(E[1]),Lmat(E[2]),Lmat(E[3])
Hidx=[0,1,2,3]
def restrict(A,idx): return A[np.ix_(idx,idx)]
# 1. On H: [LI,LJ]=2LK
print("=== DOUBLET on H (associative rung) ===")
print("[L_hI,L_hJ]=2 L_hK on H:", np.allclose(restrict(comm(LI,LJ),Hidx), 2*restrict(LK,Hidx)))
CasH=restrict(LI@LI+LJ@LJ+LK@LK,Hidx)
print("Casimir on H = -3*I (spin-1/2 doublet):", np.allclose(CasH,-3*np.eye(4)), " val=",CasH[0,0])
# 2. On O: obstruction, and = -2*associator
print("\n=== OBSTRUCTION on O (non-associative) ===")
obstr = comm(LI,LJ) - 2*LK   # [L_hI,L_hJ] - L_{[hI,hJ]}, and [hI,hJ]=2hK so L_{[hI,hJ]}=2LK
print("[L_hI,L_hJ]-2L_hK = 0 on O?", np.allclose(obstr,0), " (False=obstructed)")
# associator map assoc(x) = (hI hJ) x - hI (hJ x) = [hI,hJ,x]
def assoc_map():
    A=np.zeros((8,8))
    hIhJ=mul(E[1],E[2])
    for j in range(8):
        A[:,j]= mul(hIhJ,E[j]) - mul(E[1],mul(E[2],E[j]))
    return A
Aso=assoc_map()
# [L_a,L_b]-L_{[a,b]} = -2[a,b,.] check: obstr vs -2*Aso
print("obstruction = -2*associator[hI,hJ,.]?", np.allclose(obstr, -2*Aso))
# rank/dim of obstruction
print("obstruction nonzero (rank):", np.linalg.matrix_rank(obstr,tol=1e-9))
# it should vanish on H, act on Hl
print("obstruction restricted to H = 0?", np.allclose(restrict(obstr,Hidx),0))
print("obstruction only moves Hl (span E4..E7)?", np.allclose(obstr[:4,:],0) and np.allclose(obstr[:,:4],0))
