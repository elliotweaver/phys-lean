#!/usr/bin/env python3
"""N26 route probe: joint-kernel of the 7-rep + so(d) dimension-count exclusion.
Re-verifies the banked 14 derivation matrices restricted to ImO = span(e1..e7).
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
# restrict to ImO = span(e1..e7), index 1..7 -> 0..6
D7=[[[D[k][i][j] for j in range(1,8)] for i in range(1,8)] for k in range(14)]

def rank(rows, ncol):
    M=[r[:] for r in rows]; r=0
    for c in range(ncol):
        p=None
        for i in range(r,len(M)):
            if M[i][c]!=0: p=i;break
        if p is None: continue
        M[r],M[p]=M[p],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(len(M)):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[a-f*b for a,b in zip(M[i],M[r])]
        r+=1
    return r

# joint kernel: stack all D7_k as 98x7 rows; nullity = dim of common kernel
rows=[[D7[k][i][j] for j in range(7)] for k in range(14) for i in range(7)]
r=rank(rows,7)
print('joint-kernel: rank of stacked 7-action =',r,' => joint kernel dim =',7-r)

# skew-adjoint check: each D7_k should satisfy D^T = -D (so(7), Born form = identity on units)
allskew=all(D7[k][i][j]==-D7[k][j][i] for k in range(14) for i in range(7) for j in range(7))
print('every rho(D_k) skew-adjoint (D^T=-D) on ImO:', allskew)

# so(d) + so(7-d) dimension count for an invariant subspace of dim d
def sod(n): return n*(n-1)//2
print('dim so(7) =', sod(7), '; dim L = 14')
for d in range(8):
    print(f'  invariant dim d={d}: dim(so(d)+so(7-d)) = {sod(d)+sod(7-d)}  (14<= ? {14<=sod(d)+sod(7-d)})')
