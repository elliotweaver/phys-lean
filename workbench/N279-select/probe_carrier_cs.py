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
# kappaO1 = e4 = E[4]; u1=E[1]
Lk = Lmat(E[4])   # L_{kappaO1} on full carrier
print("L_{kO1}^2 = -I on O(8)?", np.allclose(Lk@Lk, -np.eye(8)))
# su(2)_L = Der(H) inner derivations: ad_hI = L_hI - R_hI etc (hI=E1,hJ=E2,hK=E3)
adI=Lmat(E[1])-Rmat(E[1]); adJ=Lmat(E[2])-Rmat(E[2]); adK=Lmat(E[3])-Rmat(E[3])
print("[L_{kO1}, ad_hI]=0?", np.allclose(comm(Lk,adI),0))
print("[L_{kO1}, ad_hJ]=0?", np.allclose(comm(Lk,adJ),0))
print("[L_{kO1}, ad_hK]=0?", np.allclose(comm(Lk,adK),0))
# colour generator: a g2 derivation NOT killing kO1. Use ad of an octonion beyond H? 
# Try inner derivation from e5=E5 (a Hl unit): D = [L_e5,R_e5]-type. Simpler: check L_{kO1} vs L_{u1}
Lu=Lmat(E[1])
print("[L_{kO1}, L_{u1}] = 0?", np.allclose(comm(Lk,Lu),0), " (the two complex structures)")
# carrier doubling: H = span{E0,E1,E2,E3}, Hl=span{E4,E5,E6,E7}. L_{kO1}(H)=Hl?
H=[0,1,2,3]; Hl=[4,5,6,7]
def maps_into(gen, src, dst):
    for i in src:
        col=gen@E[i]; comp=col.copy()
        for j in dst: comp[j]=0
        if not np.allclose(comp,0): return False
    return True
print("L_{kO1}(H) ⊆ Hl?", maps_into(Lk,H,Hl), "  L_{kO1}(Hl) ⊆ H?", maps_into(Lk,Hl,H))
# On the real unit: L_{kO1}(1)=kO1 (pairs real unit with doubling axis)
print("L_{kO1}(1) = kO1 (E4)?", np.allclose(Lk@E[0], E[4]))
# crossOp(kO1) on ImO kills kO1 but L_{kO1}(kO1)=-1 (real):
print("L_{kO1}(kO1) = -1 (real unit, NOT in ImO)?", np.allclose(Lk@E[4], -E[0]))
