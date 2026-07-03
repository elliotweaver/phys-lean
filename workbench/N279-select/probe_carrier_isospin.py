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
def Rmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(E[j],a)
    return A
def comm(A,B): return A@B-B@A
# su(2)_L = Der(H) as inner derivations of H-units, extended to O: adI=L_hI-R_hI etc (hI,hJ,hK=E1,E2,E3)
adI,adJ,adK=[Lmat(E[i])-Rmat(E[i]) for i in (1,2,3)]
# Verify closure on O
print("[adI,adJ]=2adK on O?", np.allclose(comm(adI,adJ),2*adK))
# WAIT: earlier adjoint closure was dim 6. Let me recheck the sign convention. innerDeriv might be (1/2)(L-R) or L_a acting differently.
# Actually Der(H) inner derivation of quaternions: D_q(x) = q x - x q = ad_q. On H it closes. On O extended:
# Let me test closure dim of {adI,adJ,adK} on O carefully
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
    return mats,rk(Vm)
mats,d=closure([adI,adJ,adK])
print("closure dim {ad_hI,ad_hJ,ad_hK} on O:",d)
# The N277 banked su(2)_L uses imRep DI on ImO (7-dim). Extended to carrier O (8-dim) it's the derivation.
# Casimir C = adI^2+adJ^2+adK^2
C=adI@adI+adJ@adJ+adK@adK
ev=np.round(np.linalg.eigvals(C).real,4)
from collections import Counter
print("Casimir eigenvalues on O(8) [multiplicity]:", Counter(ev))
# Decompose: eigenvalue e -> spin j via e = -4 j(j+1) (since ad = 2*spin generator, Casimir(ad)=4*spin-Casimir)
# spin-0: 0 ; spin-1/2: -3 ; spin-1: -8 ; spin-3/2:-15
for e,m in sorted(Counter(ev).items()):
    print(f"  eigenvalue {e}: mult {m}")
