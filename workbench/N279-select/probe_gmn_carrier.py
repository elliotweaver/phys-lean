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
    A=np.zeros((8,8));
    for j in range(8): A[:,j]=mul(a,E[j])
    return A
def Rmat(a):
    A=np.zeros((8,8));
    for j in range(8): A[:,j]=mul(E[j],a)
    return A
def comm(A,B): return A@B-B@A
# On the FULL carrier O(8):
# weak-isospin T3 (Cartan) as DERIVATION: ad_hI = L_hI - R_hI  (imRep DI extended)
adI = Lmat(E[1])-Rmat(E[1])
# charge Q on carrier: crossOpO(u1) = L_{u1} restricted... actually N241 uses crossOpO u1. 
# crossOp(a)(y)= a*y + <a,y>*1 for a,y imaginary. On carrier, the natural charge is the derivation-free
# gather operator. But let's test the DERIVATION realization (matter as spinor under Der(O)=g2):
# colour+charge live in g2=Der(O). T3 = ad_hI. What's Q, Y as derivations on carrier?
# Q on ImO = crossOp(u1); on carrier the g2-charge is a DERIVATION. Let me use the actual banked structure:
# Simpler test: is there ANY linear relation among ad-realizations giving GMN structure?
# Build ad for the two commuting neutrals seen in gauge: charge dir and hyper dir are NOT derivations though.
# Let me instead test: matter carrier eigenvalues under the commuting {adI (T3), and a colour Cartan}.
# Actually test the KEY claim: on carrier, does L_{u1} (charge complex structure) relate to ad?
Lu1=Lmat(E[1])
print("On carrier: L_u1^2=-I?",np.allclose(Lu1@Lu1,-np.eye(8)))
print("[L_u1, adI]=0?",np.allclose(comm(Lu1,adI),0))
# Eigenvalues of adI (T3) on carrier:
ev_adI=np.round(np.linalg.eigvals(adI).imag,3)  # antisym -> imaginary eigenvalues
print("adI (T3) eigenvalues on O(8) [imag parts]:", sorted(set(ev_adI)))
# So T3 eigenvalues: doublet ±1 structure? adI on H-part:
print("This shows the CARRIER weight structure under the derivation Cartan.")
