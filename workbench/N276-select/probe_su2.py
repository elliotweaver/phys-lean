import numpy as np
Cmat = np.array([[0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,-1,0]],float)
Imat = np.array([[0,0,0,0,0,0,0],[0,0,-2,0,0,0,0],[0,2,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-2],[0,0,0,0,0,2,0]],float)
Jmat = np.array([[0,0,2,0,0,0,0],[0,0,0,0,0,0,0],[-2,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,2],[0,0,0,0,0,0,0],[0,0,0,0,-2,0,0]],float)
Q=Cmat; DI=Imat; DJ=Jmat
# su(2) closure: [DI,DJ] = c*DK. Compute DK:
comm = DI@DJ - DJ@DI
print("=== [DI,DJ] (should be ∝ DK) ===")
# find scale vs a clean antisym matrix
DK = comm/ -4.0   # guess normalization; we just need the span
print("‖[DI,DJ]‖max =", np.abs(comm).max())
DK = comm.copy()
# su(2) module: full joint action of {DI,DJ,DK}
gens = {"DI":DI,"DJ":DJ,"DK":DK,"Q":Q}
print("\n=== [Q,DI],[Q,DJ],[Q,DK] (Q must COMMUTE with su(2)_L? or only DI?) ===")
for n,M in [("DI",DI),("DJ",DJ),("DK",DK)]:
    print(f"  [Q,{n}] max =", np.abs(Q@M-M@Q).max())

# Full su(2) invariant subspaces of ImO (dim7): joint kernel = isospin singlets
def joint_ker(mats):
    A=np.vstack(mats)
    # nullspace
    u,s,vt=np.linalg.svd(A)
    ns=vt[np.abs(np.append(s,[0]*(7-len(s))))<1e-9] if False else vt[[i for i in range(7) if (i>=len(s) or s[i]<1e-9)]]
    return ns
ns = joint_ker([DI,DJ,DK])
print("\n=== su(2)_L joint kernel (isospin singlets) dim =", ns.shape[0], "===")
for v in ns:
    print("   ", np.round(v,3))

# Casimir C2 = DI^2+DJ^2+DK^2 : its eigenvalues label su(2) irreps (0 for singlet, j(j+1)*scale for spin-j)
Cas = DI@DI+DJ@DJ+DK@DK
w,v=np.linalg.eigh(Cas)
print("\n=== su(2) Casimir eigenvalues on ImO (label multiplet content) ===")
from collections import Counter
print("  ", dict(Counter(np.round(w,2))))
# group into irreps by casimir value; within each, dims
print("\n=== so: how many isospin SINGLETS (Cas=0) vs DOUBLETS/higher on the 7 ===")
for val,m in sorted(Counter(np.round(w,2)).items()):
    print(f"  Casimir={val}: dim {m}")

# Now the CHARGED complement Vsub = the u1-orthogonal imaginary 6-space = coords c2..c7 (index1..6).
# (c1=index0 is u1=sgl). Restrict.
P = np.zeros((7,7))
for i in range(1,7): P[i,i]=1
print("\n=== Charged complement Vsub=span{c2..c7} invariant under Q, su(2)? ===")
for n,M in gens.items():
    print(f"  (I-P) {n} P max =", np.abs((np.eye(7)-P)@M@P).max())
CasV = Cas.copy()
wv,vv=np.linalg.eigh(Cas)
# restrict Casimir to Vsub
CasVsub = P@Cas@P
wv2,_=np.linalg.eigh(CasVsub + (np.eye(7)-P)*(-999))  # push out the c1 direction
print("=== Casimir spectrum on the charged 6-space (drop the -999 sentinel) ===")
print("  ", [round(x,2) for x in sorted(wv2) if abs(x+999)>1])
