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
LI,LJ,LK=Lmat(E[1]),Lmat(E[2]),Lmat(E[3])   # left mult by hI,hJ,hK (ImH units)
# On the H-subalgebra span{E0,E1,E2,E3}: does left-su(2) close?
Hidx=[0,1,2,3]
def restrict(A,idx):
    return A[np.ix_(idx,idx)]
LIh,LJh,LKh=[restrict(M,Hidx) for M in (LI,LJ,LK)]
print("On H(4-dim): [LI,LJ]=2LK?", np.allclose(comm(LIh,LJh),2*LKh))
print("On H: LI^2=-I?", np.allclose(LIh@LIh,-np.eye(4)))
# Casimir on H:
CasH=LIh@LIh+LJh@LJh+LKh@LKh
print("Casimir on H = ", CasH[0,0],"*I? ->", np.allclose(CasH,CasH[0,0]*np.eye(4)), "  j(j+1)*(-4)=? for j=1/2: -3")
# On full O: left su(2) closes?
def vec(A): return A.flatten()
def closure(gens):
    mats=list(gens);Vm=np.array([vec(m) for m in mats])
    def rk(V): return np.linalg.matrix_rank(V,tol=1e-9)
    ch=True
    while ch:
        ch=False;cur=len(mats)
        for i in range(cur):
            for j in range(i+1,cur):
                c=comm(mats[i],mats[j])
                if np.allclose(c,0):continue
                t=np.vstack([Vm,vec(c)])
                if rk(t)>rk(Vm):mats.append(c);Vm=t;ch=True
    return rk(Vm)
print("Left-su(2) closure dim on FULL O:", closure([LI,LJ,LK]), "(3=closes, >3=fights non-assoc)")
# The ADJOINT (derivation) realization for comparison: ad=L-R
def Rmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(E[j],a)
    return A
adI,adJ,adK=[Lmat(E[i])-Rmat(E[i]) for i in (1,2,3)]
print("Adjoint closure dim on O:", closure([adI,adJ,adK]))
