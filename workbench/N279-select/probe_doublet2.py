import numpy as np
def conj_n(x):
    y=x.copy(); y[1:]=-y[1:]; return y
def mul_cd(x,y,n):
    if n==1: return np.array([x[0]*y[0]])
    h=n//2; a,b=x[:h],x[h:]; c,d=y[:h],y[h:]
    return np.concatenate([mul_cd(a,c,h)-mul_cd(conj_n(d),b,h), mul_cd(d,a,h)+mul_cd(b,conj_n(c),h)])
def mul(x,y): return mul_cd(x,y,8)
def basis(i):
    v=np.zeros(8); v[i]=1; return v
E=[basis(i) for i in range(8)]
def Lmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(a,E[j])
    return A
def Rmat(a):
    A=np.zeros((8,8))
    for j in range(8): A[:,j]=mul(E[j],a)
    return A
def comm(A,B): return A@B-B@A
LI,LJ,LK=Lmat(E[1]),Lmat(E[2]),Lmat(E[3])
# Lie closure of {LI,LJ,LK}
def vec(A): return A.flatten()
def closure(gens):
    mats=list(gens); Vm=np.array([vec(m) for m in mats])
    def rk(V): return np.linalg.matrix_rank(V,tol=1e-9)
    ch=True
    while ch:
        ch=False; cur=len(mats)
        for i in range(cur):
            for j in range(i+1,cur):
                c=comm(mats[i],mats[j])
                if np.allclose(c,0): continue
                t=np.vstack([Vm,vec(c)])
                if rk(t)>rk(Vm): mats.append(c);Vm=t;ch=True
    return mats,rk(Vm)
mats,d=closure([LI,LJ,LK])
print("Lie closure dim of left-reg {L_hI,L_hJ,L_hK}:",d)
# Adjoint su(2)_L = Der(H): imRep DI etc. These are inner derivations = (1/2)[L_a - R_a]? 
# ad_a(y) = a y - y a = (L_a - R_a)(y). Let's build ad on ImH units:
adI = LI - Rmat(E[1]); adJ=LJ-Rmat(E[2]); adK=LK-Rmat(E[3])
print("[adI,adJ]=? *adK:", np.allclose(comm(adI,adJ), 2*adK), "coef check:")
c=comm(adI,adJ)
# find scalar s with c = s*adK
s=(c.flatten()@adK.flatten())/(adK.flatten()@adK.flatten())
print("  [adI,adJ]=",round(s,3),"* adK, residual",round(np.linalg.norm(c-s*adK),6))
madI,dad=closure([adI,adJ,adK])
print("Lie closure dim of adjoint {ad_hI,ad_hJ,ad_hK}:",dad)
# Under adjoint su(2), decompose O(8-dim). Casimir:
CasAd = adI@adI+adJ@adJ+adK@adK
print("Adjoint Casimir eigenvalues on O:", sorted(set(np.round(np.linalg.eigvals(CasAd).real,3))))
