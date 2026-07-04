"""
N290 SELECT — de-risk the FAMILY-INVARIANT CORE route.
famX = adE(ocRM Kx) (N289 collapse), so the joint kernel of the family so(3) on the arena
reduces to the joint CENTRALIZER of the three constant Q so(3) generators Ka,Kb,Kc.
Confirm: (a) Ka,Kb,Kc as Q matrices; (b) their joint centralizer in M3(Q) is Q*id;
(c) the minimal instrument (does a PAIR suffice?); (d) joint centralizer in M3(O) is O*id;
(e) intersect Hermitian -> R*id -> dim 1.
"""
import numpy as np
from fractions import Fraction as F

# the slot patterns (from N289)
pA=np.array([[0,1,0],[1,0,0],[0,0,0]])
pB=np.array([[0,0,1],[0,0,0],[1,0,0]])
pC=np.array([[0,0,0],[0,0,1],[0,1,0]])
def comm(P,Q): return P@Q-Q@P
Kc=comm(pA,pB); Ka=comm(pB,pC); Kb=comm(pC,pA)
print("Ka=comm(pB,pC)=\n",Ka)
print("Kb=comm(pC,pA)=\n",Kb)
print("Kc=comm(pA,pB)=\n",Kc)
# so(3) check
print("[Ka,Kb]=Kc?", np.array_equal(comm(Ka,Kb),Kc))
print("[Kb,Kc]=Ka?", np.array_equal(comm(Kb,Kc),Ka))
print("[Kc,Ka]=Kb?", np.array_equal(comm(Kc,Ka),Kb))

def centralizer_dim(mats):
    # solve X*M=M*X for all M in mats, X in M3 (9 unknowns)
    # build linear system: for each M, (X M - M X) = 0 -> 9 eqns
    rows=[]
    for M in mats:
        # X is 3x3 = 9 vars indexed (i,j)->3i+j
        # (XM-MX)_{ab} = sum_k X_{ak} M_{kb} - M_{ak} X_{kb}
        for a in range(3):
            for b in range(3):
                row=[0]*9
                for k in range(3):
                    row[3*a+k]+=M[k][b]
                    row[3*k+b]-=M[a][k]
                rows.append(row)
    Amat=np.array(rows,dtype=float)
    rank=np.linalg.matrix_rank(Amat)
    return 9-rank

print("\ncentralizer dim of {Ka}:", centralizer_dim([Ka]))
print("centralizer dim of {Ka,Kb}:", centralizer_dim([Ka,Kb]))
print("centralizer dim of {Kb,Kc}:", centralizer_dim([Kb,Kc]))
print("centralizer dim of {Ka,Kb,Kc}:", centralizer_dim([Ka,Kb,Kc]))
# solve explicitly for {Ka,Kb} to see the centralizer basis
def centralizer_basis(mats):
    rows=[]
    for M in mats:
        for a in range(3):
            for b in range(3):
                row=[F(0)]*9
                for k in range(3):
                    row[3*a+k]+=F(int(M[k][b]))
                    row[3*k+b]-=F(int(M[a][k]))
                rows.append(row)
    # nullspace over Q via numpy float then verify
    Amat=np.array([[float(x) for x in r] for r in rows])
    u,s,vh=np.linalg.svd(Amat)
    ns=vh[np.sum(s>1e-9):]
    return ns
print("\ncentralizer basis of {Ka,Kb} (rounded):")
for v in centralizer_basis([Ka,Kb]):
    print("  ", np.round(v,4).reshape(3,3).tolist())
print("centralizer basis of {Ka,Kb,Kc} (rounded):")
for v in centralizer_basis([Ka,Kb,Kc]):
    print("  ", np.round(v,4).reshape(3,3).tolist())
