import numpy as np
from itertools import product

# Affine F4 (F4^(1)) Cartan matrix.
# Finite F4 Dynkin: 1 - 2 = 3 - 4 (double bond between nodes 2 and 3).
# alpha2 long, alpha3 short (standard Bourbaki F4). Affine node 0 attaches to
# node 1 (the long end; highest root is long).
# Node order: [0(affine), 1, 2, 3, 4]
# Cartan entry A_ij = 2(a_i,a_j)/(a_j,a_j).
# Off-diagonal double bond: between a long root L and short root S,
#   A_{L,S} = -1 (2(L,S)/(S,S)), A_{S,L} = -2 (2(S,L)/(L,L)).
# In F4 (Bourbaki): alpha1,alpha2 long; alpha3,alpha4 short. Bond 2=3.
# So A[2][3] (long acting via short norm) : 2(a2,a3)/(a3,a3) = -2
#    A[3][2] : 2(a3,a2)/(a2,a2) = -1
A = np.array([
 [ 2,-1, 0, 0, 0],   # 0 affine (long), attaches to node1
 [-1, 2,-1, 0, 0],   # 1 long
 [ 0,-1, 2,-2, 0],   # 2 long, double bond to short node3 : entry -2
 [ 0, 0,-1, 2,-1],   # 3 short
 [ 0, 0, 0,-1, 2],   # 4 short
], dtype=float)
print('Affine Cartan A ='); print(A.astype(int))

def intnull(M):
    best=None
    for vec in product(range(0,8),repeat=5):
        v=np.array(vec,dtype=float)
        if v.sum()==0: continue
        if np.allclose(M@v,0,atol=1e-9):
            if best is None or sum(vec)<sum(best):
                best=vec
    return best

marks   = intnull(A)     # A a = 0  -> marks (Kac labels), sum = Coxeter number h
comarks = intnull(A.T)   # A^T c = 0 -> comarks (dual Kac labels), sum = dual Coxeter h^vee
print('marks   (A a =0):', marks,   'sum =', sum(marks)   if marks   else None, '(Coxeter number h)')
print('comarks (A^T c=0):', comarks, 'sum =', sum(comarks) if comarks else None, '(dual Coxeter h^vee)')

# Cross-checks against known F4 constants:
print()
print('Known: F4 Coxeter h = 12, dual Coxeter h^vee = 9.')
print('84 / 9  =', 84/9, ' (= 28/3, the banked EW rung 28pi/3)')
print('84 / 7  =', 84/7, ' (= 12, the banked QCD rung 12pi ; 7 = dim ImO)')
print('84 / 28 =', 84/28,' (= 3,  the banked gravity rung 3pi ; 28 = dim selfAdj)')
print('2*42/9  =', 2*42/9, ' (the P1 target ln(M/v) coefficient of pi)')
