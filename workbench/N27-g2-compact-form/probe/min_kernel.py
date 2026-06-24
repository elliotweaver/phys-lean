#!/usr/bin/env python3
"""N27 probe: minimal subset of the 14 banked derivations whose joint kernel on
ImO (7-dim) is already 0 (rank 7). A small such subset makes the d=1 / joint-kernel
exclusion a cheap explicit linear-algebra fact in Lean (no 98x7 rank)."""
from fractions import Fraction as F
from itertools import combinations
DMAPS = {
 0:{2:(5,-1),3:(4,1),4:(3,-1),5:(2,1)}, 1:{2:(4,-1),3:(5,-1),4:(2,1),5:(3,1)},
 2:{2:(3,1),3:(2,-1),4:(5,-1),5:(4,1)}, 3:{1:(6,-1),3:(4,-1),4:(3,1),6:(1,1)},
 4:{1:(5,1),2:(6,-1),5:(1,-1),6:(2,1)}, 5:{1:(4,1),3:(6,-1),4:(1,-1),6:(3,1)},
 6:{1:(3,-1),3:(1,1),4:(6,-1),6:(4,1)}, 7:{1:(2,-1),2:(1,1),5:(6,-1),6:(5,1)},
 8:{1:(7,-1),2:(4,1),4:(2,-1),7:(1,1)}, 9:{1:(4,-1),2:(7,-1),4:(1,1),7:(2,1)},
 10:{1:(5,1),3:(7,-1),5:(1,-1),7:(3,1)},11:{1:(2,1),2:(1,-1),4:(7,-1),7:(4,1)},
 12:{1:(3,-1),3:(1,1),5:(7,-1),7:(5,1)},13:{2:(3,-1),3:(2,1),6:(7,-1),7:(6,1)},
}
def to7(spec):
    M=[[F(0)]*7 for _ in range(7)]
    for row,(col,coeff) in spec.items(): M[row-1][col-1]=F(coeff)
    return M
D7=[to7(DMAPS[k]) for k in range(14)]
def rank(rows,ncol):
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
for size in range(1,6):
    found=False
    for combo in combinations(range(14),size):
        rows=[[D7[k][i][j] for j in range(7)] for k in combo for i in range(7)]
        if rank(rows,7)==7:
            print(f'MINIMAL subset size {size}: {combo} -> joint kernel rank 7 (kernel=0)')
            # print the action rows of each chosen D on a generic vector for Lean transcription
            found=True; break
    if found: break
