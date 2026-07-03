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
# The colour complex structure J = L_{u1} (N201/N266). Furey: matter/antimatter = ±i eigenspaces of J.
J=Lmat(E[1])   # L_{u1}, J^2=-I
print("J=L_u1, J^2=-I?",np.allclose(J@J,-np.eye(8)))
# eigenspaces of J (over C): +i and -i, each 4-dim. These are the two chiralities/matter-antimatter.
w,V=np.linalg.eig(J)
print("J eigenvalues:", sorted(set(np.round(w,3))))
# weak su(2)_L: three candidate realizations. Test which one PRESERVES vs MIXES the J-eigenspaces.
# (a) derivations ad=L-R (N277 realization):
adI,adJ,adK=[Lmat(E[i])-Rmat(E[i]) for i in (1,2,3)]
# (b) left-regular L (doublet realization):
LI,LJ,LK=[Lmat(E[i]) for i in (1,2,3)]
# (c) right-regular R:
RI,RJ,RK=[Rmat(E[i]) for i in (1,2,3)]
def commutes_with_J(gens):
    return all(np.allclose(comm(g,J),0) for g in gens)
print("\nDoes su(2)_L commute with colour-J (=preserve chirality/matter-antimatter split)?")
print(" derivation ad realization [L-R]:", commutes_with_J([adI,adJ,adK]))
print(" left-regular L realization:", commutes_with_J([LI,LJ,LK]))
print(" right-regular R realization:", commutes_with_J([RI,RJ,RK]))
