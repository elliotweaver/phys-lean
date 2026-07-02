import numpy as np
from numpy.linalg import svd

d0m = [[0,0,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d1m = [[0,0,0,0,0,0,0],[0,0,0,-1,0,0,0],[0,0,0,0,-1,0,0],[0,1,0,0,0,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d2m = [[0,0,0,0,0,0,0],[0,0,1,0,0,0,0],[0,-1,0,0,0,0,0],[0,0,0,0,-1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d3m = [[0,0,0,0,0,-1,0],[0,0,0,0,0,0,0],[0,0,0,-1,0,0,0],[0,0,1,0,0,0,0],[0,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
d13m= [[0,0,0,0,0,0,0],[0,0,-1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,-1],[0,0,0,0,0,1,0]]
allm = {'d0m':d0m,'d1m':d1m,'d2m':d2m,'d3m':d3m,'d13m':d13m}

print("=== colour membership (col0 == 0) ===")
for name,M in allm.items():
    M=np.array(M); col0=M[:,0]
    print(f"{name}: col0={col0.tolist()}  colour={bool(np.all(col0==0))}")

def kernel_dim(Mlist):
    A=np.vstack(Mlist).astype(float)
    r=np.linalg.matrix_rank(A,tol=1e-9)
    return 7-r
def nullspace(A,tol=1e-9):
    u,s,vt=svd(A); return vt[np.sum(s>tol):]

d0=np.array(d0m); d13=np.array(d13m); d1=np.array(d1m); d2=np.array(d2m)
print("\n=== single-matrix kernel dims ===")
for name,M in allm.items():
    print(f"ker({name}) dim:", kernel_dim([np.array(M)]))

print("\n=== single regular candidate MH = d0m + d13m ===")
MH=d0+d13
for row in MH.tolist(): print("  ",row)
print("col0(MH):", MH[:,0].tolist(), " colour:", bool(np.all(MH[:,0]==0)))
print("ker(MH) dim:", kernel_dim([MH]))
ns=nullspace(MH.astype(float))
print("MH nullspace basis rows:")
for v in ns: print("  ",np.round(v/ (v[np.argmax(np.abs(v))]),4).tolist())

print("\n=== joint kernels of colour generator SUBSETS ===")
print("joint {d0,d13} dim:", kernel_dim([d0,d13]))
print("joint {d0,d1,d2,d13} dim:", kernel_dim([d0,d1,d2,d13]))
# Which single colour matrix already has kernel = span{e0} exactly (dim 1, and that vector is e0)?
print("\n=== which single colour dm has kernel exactly span{e0}? ===")
for name,M in allm.items():
    M=np.array(M)
    if not np.all(M[:,0]==0): continue
    d=kernel_dim([M])
    ns=nullspace(M.astype(float))
    is_e0 = (d==1 and abs(ns[0][0])>0.9 and np.allclose(ns[0][1:],0,atol=1e-6))
    print(f"{name}: kerdim={d}  ker==span(e0)?={is_e0}")
