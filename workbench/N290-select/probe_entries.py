"""
N290 — verify EXACTLY which entries famA(M)=0 and famB(M)=0 force to vanish/be-equal,
via the collapse famX = adE(ocRM Kx) = [ocRM Kx, M].  Entry (i,j) of [K,M] = sum_k K[i,k]M[k,j] - M[i,k]K[k,j].
"""
import numpy as np
pA=np.array([[0,1,0],[1,0,0],[0,0,0]]); pB=np.array([[0,0,1],[0,0,0],[1,0,0]]); pC=np.array([[0,0,0],[0,0,1],[0,1,0]])
def comm(P,Q): return P@Q-Q@P
Ka=comm(pB,pC); Kb=comm(pC,pA); Kc=comm(pA,pB)
print("Ka=\n",Ka); print("Kb=\n",Kb)
# symbolic M with entries m[i][j]; [K,M]_{ij} = sum_k K[i,k] m[k,j] - m[i,k] K[k,j]
import sympy as sp
m=sp.Matrix(3,3, lambda i,j: sp.Symbol(f"m{i}{j}"))
def brk(K):
    Ks=sp.Matrix(K.tolist())
    return Ks*m - m*Ks
print("\n[Ka,M] entries:")
BA=brk(Ka)
for i in range(3):
    for j in range(3):
        if BA[i,j]!=0: print(f"  ({i},{j}): {BA[i,j]}")
print("\n[Kb,M] entries:")
BB=brk(Kb)
for i in range(3):
    for j in range(3):
        if BB[i,j]!=0: print(f"  ({i},{j}): {BB[i,j]}")
