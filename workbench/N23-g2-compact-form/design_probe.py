#!/usr/bin/env python3
"""N23 DESIGN probe: pick the cleanest Lean-formalizable route.
  - perfectness: which brackets give each generator D_k (cert for [L,L]=L)
  - Casimir C = -sum rho(D_k)^2 : is it scalar on ImO? (clean irreducibility lever)
  - propagation: for each unit e_i, a single derivation mapping it cleanly toward e_j
"""
from fractions import Fraction as F
DMAPS = {
 0:{2:(5,-1),3:(4,1),4:(3,-1),5:(2,1)}, 1:{2:(4,-1),3:(5,-1),4:(2,1),5:(3,1)},
 2:{2:(3,1),3:(2,-1),4:(5,-1),5:(4,1)}, 3:{1:(6,-1),3:(4,-1),4:(3,1),6:(1,1)},
 4:{1:(5,1),2:(6,-1),5:(1,-1),6:(2,1)}, 5:{1:(4,1),3:(6,-1),4:(1,-1),6:(3,1)},
 6:{1:(3,-1),3:(1,1),4:(6,-1),6:(4,1)}, 7:{1:(2,-1),2:(1,1),5:(6,-1),6:(5,1)},
 8:{1:(7,-1),2:(4,1),4:(2,-1),7:(1,1)}, 9:{1:(4,-1),2:(7,-1),4:(1,1),7:(2,1)},
 10:{1:(5,1),3:(7,-1),5:(1,-1),7:(3,1)},11:{1:(2,1),2:(1,-1),4:(7,-1),7:(4,1)},
 12:{1:(3,-1),3:(1,1),5:(7,-1),7:(5,1)},13:{2:(3,-1),3:(2,1),6:(7,-1),7:(6,1)},
}
def to_matrix(spec):
    M=[[F(0)]*8 for _ in range(8)]
    for row,(col,coeff) in spec.items(): M[row][col]=F(coeff)
    return M
D=[to_matrix(DMAPS[k]) for k in range(14)]
def restrict7(M): return [[M[i][j] for j in range(1,8)] for i in range(1,8)]
D7=[restrict7(D[k]) for k in range(14)]
def matmul(A,B,n): return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def matsub(A,B,n): return [[A[i][j]-B[i][j] for j in range(n)] for i in range(n)]
def matadd(A,B,n): return [[A[i][j]+B[i][j] for j in range(n)] for i in range(n)]

# Casimir C = -sum D7_k^2 (7x7)
C=[[F(0)]*7 for _ in range(7)]
for k in range(14):
    sq=matmul(D7[k],D7[k],7)
    C=matsub(C,sq,7)
print("=== Casimir C = -sum rho(D_k)^2 on ImO (7x7) ===")
for r in C: print("  ",[int(x) for x in r])
isScalar = all(C[i][j]==(C[0][0] if i==j else 0) for i in range(7) for j in range(7))
print("  C is scalar * I_7 :", isScalar, " value:", int(C[0][0]) if isScalar else None)

# ---- propagation: applying D7_k to unit e_i (i=1..7 -> index 0..6) ----
print("\n=== D7_k e_i (unit -> image), find clean single-unit moves ===")
def apply7col(M,i): return [M[r][i] for r in range(7)]   # D7 e_{i+1}
for i in range(7):
    moves=[]
    for k in range(14):
        col=apply7col(D7[k],i)
        nz=[(r+1,int(col[r])) for r in range(7) if col[r]!=0]
        if len(nz)==1: moves.append((k,nz[0]))
    print(f"  e{i+1}: single-unit images via D_k:", moves)

# ---- perfectness: each generator as combination of brackets ----
def flat(M): return [M[i][j] for i in range(8) for j in range(8)]
def bracket8(A,B): return matsub(matmul(A,B,8),matmul(B,A,8),8)
BASIS=[flat(D[k]) for k in range(14)]
def solve_in_basis(target):
    rows=[[BASIS[k][c] for k in range(14)]+[target[c]] for c in range(64)]
    r=0; piv=[]
    for c in range(14):
        p=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: p=i;break
        if p is None: continue
        rows[r],rows[p]=rows[p],rows[r]; pv=rows[r][c]; rows[r]=[x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        piv.append(c); r+=1
    coeff=[F(0)]*14
    for idx,col in enumerate(piv): coeff[col]=rows[idx][14]
    return coeff
# is each D_k a single bracket [D_i,D_j] up to scalar? find the cleanest
print("\n=== perfectness: D_k as a SINGLE bracket c[D_i,D_j] (cleanest cert) ===")
for k in range(14):
    found=None
    for i in range(14):
        for j in range(i+1,14):
            cc=solve_in_basis(flat(bracket8(D[i],D[j])))
            # is cc a multiple of e_k only?
            if cc[k]!=0 and all(cc[m]==0 for m in range(14) if m!=k):
                found=(i,j,cc[k]); break
        if found: break
    print(f"  D{k} = (1/{found[2]})*[D{found[0]},D{found[1]}]" if found else f"  D{k}: no single-bracket; needs combo")
