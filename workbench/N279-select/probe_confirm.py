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
# quaternion triple check
def show(a,b):
    p=mul(E[a],E[b]); nz=[(j,int(p[j])) for j in range(8) if abs(p[j])>1e-9]; return nz
print("E1*E2=",show(1,2)," E2*E3=",show(2,3)," E3*E1=",show(3,1))
def Lmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(a,E[j])
    return A
def comm(A,B): return A@B-B@A
LI,LJ,LK=Lmat(E[1]),Lmat(E[2]),Lmat(E[3])
H=[0,1,2,3]
def rr(A): return A[np.ix_(H,H)]
# closure cyclic on H
print("\nCyclic su(2) closure on Hsub:")
print(" [LI,LJ]=2LK:",np.allclose(rr(comm(LI,LJ)),2*rr(LK)))
print(" [LJ,LK]=2LI:",np.allclose(rr(comm(LJ,LK)),2*rr(LI)))
print(" [LK,LI]=2LJ:",np.allclose(rr(comm(LK,LI)),2*rr(LJ)))
# Hsub is subalgebra-closed under left mult by ImH
def inv(gen):
    for i in H:
        col=gen@E[i]
        if any(abs(col[j])>1e-9 for j in [4,5,6,7]): return False
    return True
print("Hsub invariant under LI,LJ,LK:", all(inv(g) for g in (LI,LJ,LK)))
# obstruction cyclic on O = -2 assoc
def assoc(a,b):
    A=np.zeros((8,8))
    ab=mul(E[a],E[b])
    for j in range(8): A[:,j]=mul(ab,E[j])-mul(E[a],mul(E[b],E[j]))
    return A
print("\nObstruction on O = -2*assoc:")
print(" [LI,LJ]-2LK = -2assoc(1,2):",np.allclose(comm(LI,LJ)-2*LK,-2*assoc(1,2)))
print(" [LJ,LK]-2LI = -2assoc(2,3):",np.allclose(comm(LJ,LK)-2*LI,-2*assoc(2,3)))
# Casimir
Cas=LI@LI+LJ@LJ+LK@LK
print("\nCasimir LI^2+LJ^2+LK^2 = -3*I on ALL O:",np.allclose(Cas,-3*np.eye(8)))
# obstruction nonzero and confined to Hl
ob=comm(LI,LJ)-2*LK
print("obstruction ≠0:",not np.allclose(ob,0)," vanishes on Hsub:",np.allclose(rr(ob),0)," maps Hsub->Hl only")
