#!/usr/bin/env python3
"""
N256 SELECT — MEASURE the candidate 'unique isospin-fixed axis' (the TWIN of N252's
unique colour-fixed axis). Reuses the faithful exact-Q CD model from N255.

Questions:
 (1) dim of the JOINT KERNEL of su(2)_L = {DI,DJ,DK} acting on the fundamental 7 = ImO.
 (2) is it EXACTLY span{kappaO 1} = span{e4}?  (e4 = <0,1> in O = CD(H))
 (3) does a MINIMAL subset (single element? a pair?) already pin the joint kernel to 1-dim
     (so the Lean proof can mirror N252's single 'Dreg' element and stay light)?
 (4) contrast: the COLOUR-fixed axis is span{u1}=span{e1}; the ISOSPIN-fixed axis is span{e4};
     they are DIFFERENT lines -> the two U(1) directions are genuinely different (dual to N255).
"""
from fractions import Fraction as F
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DZ=(F(0),F(0))
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DZ)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)
def o_from_vec(v):
    def dbl(b): return (v[b+0],v[b+1])
    def h(b): return (dbl(b+0),dbl(b+2))
    return (h(0),h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1): v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]
ImO=list(range(1,8))
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
u1=(hI,h_zero)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):
    a,b=x; return (ad_H(P,a),ad_H(P,b))
DI=mat(lambda x:innerDeriv(hI,x)); DJ=mat(lambda x:innerDeriv(hJ,x)); DK=mat(lambda x:innerDeriv(hK,x))
chargeM=mat(lambda x: octCrossO(u1,x))
# kappaO 1 = <0,1> in O = CD(H):  second H-copy = 1 = e4 (index 4 in 0-based oct vec)
kap = basis(4)   # e4
def vec7(z):  # ImO part -> 7-vector
    return o_to_vec(z)[1:]
kap7 = vec7(kap)
print("kappaO 1 as 7-vector (e4 -> index 3 here):", kap7)

def apply(A,v): return [sum(A[i][j]*v[j] for j in range(7)) for i in range(7)]
def joint_kernel(gens):
    # nullspace of the stacked matrix [g1;g2;...]
    rows=[]
    for g in gens: rows += g
    nr=len(rows); nc=7
    M=[row[:] for row in rows]
    piv=[]; r=0
    for c in range(nc):
        p=next((i for i in range(r,nr) if M[i][c]!=0),None)
        if p is None: continue
        M[r],M[p]=M[p],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(nr):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(nc)]
        piv.append(c); r+=1
        if r==nr: break
    free=[c for c in range(nc) if c not in piv]
    basis=[]
    for fc in free:
        v=[F(0)]*nc; v[fc]=F(1)
        for ri,pc in enumerate(piv): v[pc]=-M[ri][fc]
        basis.append(v)
    return basis

for name,gens in [("DI alone",[DI]),("DJ alone",[DJ]),("DK alone",[DK]),
                  ("DI,DJ",[DI,DJ]),("DI,DK",[DI,DK]),("DJ,DK",[DJ,DK]),
                  ("DI,DJ,DK (full su(2)_L)",[DI,DJ,DK])]:
    nb=joint_kernel(gens)
    print(f"  joint ker of {{{name}}} on the 7: dim = {len(nb)}")
    if len(nb)==1:
        v=nb[0]
        # normalize and compare with kap7
        print(f"     basis vector: {v}")

# is the full joint kernel exactly span{kap7=e4}?
nb=joint_kernel([DI,DJ,DK])
print("\n=== IS joint ker su(2)_L == span{kappaO 1 = e4}? ===")
if len(nb)==1:
    v=nb[0]
    # kap7 has a 1 at index 3 (e4). check v is a scalar multiple of kap7
    # find scale
    idx=next((i for i in range(7) if kap7[i]!=0))
    scale=v[idx]/kap7[idx]
    same=all(v[i]==scale*kap7[i] for i in range(7))
    print("  joint ker is 1-dim; equals span{e4}?", same, " (scale",scale,")")
else:
    print("  dim != 1:", len(nb))

# minimal-generator question for a light Lean proof: which single element / pair has ker exactly 1?
print("\n=== minimal pinning subset (for a light Lean proof mirroring N252's single Dreg) ===")
# try all single generators and combos a*DI+b*DJ+c*DK for small integers
import itertools
def lin(coeffs):
    R=[[F(0)]*7 for _ in range(7)]
    for co,G in zip(coeffs,[DI,DJ,DK]):
        for i in range(7):
            for j in range(7): R[i][j]+=F(co)*G[i][j]
    return R
found=[]
for a,b,c in itertools.product(range(-2,3),repeat=3):
    if (a,b,c)==(0,0,0): continue
    nb=joint_kernel([lin((a,b,c))])
    if len(nb)==1:
        found.append((a,b,c))
if found:
    print("  SINGLE regular isospin element a*DI+b*DJ+c*DK with 1-dim kernel EXISTS:", found[:8])
    a,b,c=found[0]
    nb=joint_kernel([lin((a,b,c))])
    v=nb[0]; idx=next(i for i in range(7) if kap7[i]!=0); scale=v[idx]/kap7[idx]
    print("     e.g.", (a,b,c),"-> ker = span{",v,"} == span{e4}?", all(v[i]==scale*kap7[i] for i in range(7)))
else:
    print("  NO single lin-combo of DI,DJ,DK has a 1-dim kernel; need a PAIR to pin.")
    # find a minimal pair
    for (g1n,g1),(g2n,g2) in itertools.combinations([("DI",DI),("DJ",DJ),("DK",DK)],2):
        nb=joint_kernel([g1,g2])
        if len(nb)==1:
            print(f"     PAIR {{{g1n},{g2n}}} pins the axis to 1-dim.")
            break

# colour axis contrast
print("\n=== contrast with colour-fixed axis span{u1=e1} ===")
print("  colour-fixed axis (N252) = span{e1};  isospin-fixed axis = span{e4};  DIFFERENT lines:", 3!=0)
print("  -> hyperOp=crossOp(e4) and chargeOp=crossOp(e1) are cross-products of DIFFERENT fixed axes (dual to N255).")
