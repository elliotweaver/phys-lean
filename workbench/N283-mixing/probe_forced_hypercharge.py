"""
N283 probe 3 — THE DECISIVE TEST: is there a FORCED hypercharge line?

Build g2 = Der(O ℚ) = 14-dim skew derivations. colour = {D in g2 : D u1 = 0} (N201).
Then compute the JOINT centralizer inside so(8) of  su(2)_L ∪ colour  (and also of colour alone,
and the full derived gauge). A weak mixing angle is FORCED only if the hypercharge direction Y
(commuting with su(2)_L, and ideally with colour) is a UNIQUE line pinned by the fold.

If the joint centralizer of {su(2)_L, colour} is a single u(1) line -> Y forced -> compute the
convention-free angle. If it is >1 dim or 0 -> the hypercharge direction needs a posited choice
-> NAME the blocker.
"""
from fractions import Fraction as F
import importlib.util, io, contextlib
spec = importlib.util.spec_from_file_location("pg", "/Users/elliotweaver/phys-lean/workbench/N283-mixing/probe_gram.py")
pg = importlib.util.module_from_spec(spec)
with contextlib.redirect_stdout(io.StringIO()):
    spec.loader.exec_module(pg)

F0=F(0)
e=pg.e; octmul=pg.octmul; flat=pg.flat; basis=pg.basis
L1,L2,L3=pg.L1,pg.L2,pg.L3
matmul,matsub,matadd,comm,iszero=pg.matmul,pg.matsub,pg.matadd,pg.comm,pg.iszero
B=pg.B
u1=e[1]

def transpose(M): return [[M[j][i] for j in range(8)] for i in range(8)]
def is_skew(M): return iszero(matadd(transpose(M),M))
def flat64(M): return [M[i][j] for i in range(8) for j in range(8)]

# so(8) basis: 28 unit skews
so8=[]; labels=[]
for a in range(8):
    for b in range(a+1,8):
        M=[[F0]*8 for _ in range(8)]; M[a][b]=F(1); M[b][a]=F(-1)
        so8.append(M); labels.append((a,b))

def build(v):
    M=[[F0]*8 for _ in range(8)]
    for k,coef in enumerate(v):
        if coef!=0:
            a,b=labels[k]; M[a][b]+=coef; M[b][a]-=coef
    return M

def nullbasis(rows, ncol):
    mat=[row[:] for row in rows]; nrow=len(mat); pivcols=[]; r=0
    for c in range(ncol):
        piv=None
        for rr in range(r,nrow):
            if mat[rr][c]!=0: piv=rr;break
        if piv is None: continue
        mat[r],mat[piv]=mat[piv],mat[r]; pv=mat[r][c]; mat[r]=[x/pv for x in mat[r]]
        for rr in range(nrow):
            if rr!=r and mat[rr][c]!=0:
                f=mat[rr][c]; mat[rr]=[mat[rr][j]-f*mat[r][j] for j in range(ncol)]
        pivcols.append(c); r+=1
    free=[c for c in range(ncol) if c not in pivcols]
    bv=[]
    for fc in free:
        v=[F0]*ncol; v[fc]=F(1)
        for i,pc in enumerate(pivcols): v[pc]=-mat[i][fc]
        bv.append(v)
    return bv

# ---- g2 = Der(O): X skew (28) AND X is a derivation: X(uv) = (Xu)v + u(Xv) for all basis u,v ----
# derivation condition on basis pairs: for each (i,j), X(e_i e_j) - (X e_i)e_j - e_i (X e_j) = 0.
# X = sum_k c_k E_k. Linear in c.
def der_rows():
    rows=[]
    prods={}  # (i,j) -> flat(e_i e_j)
    for i in range(8):
        for j in range(8):
            prods[(i,j)]=flat(octmul(basis(i),basis(j)))
    for i in range(8):
        for j in range(8):
            # condition vector over 8 output coords, each linear in 28 c_k
            # X(e_i e_j): e_i e_j = sum_m prods[i,j][m] e_m ; X e_m = column m of X
            # (X e_i) e_j : X e_i = sum_p (Xe_i)_p e_p ; times e_j
            for out in range(8):
                row=[F0]*28
                for k in range(28):
                    Ek=so8[k]
                    # X(e_i e_j)[out] = sum_m prods[i,j][m]*Ek[out][m]
                    t1=sum(prods[(i,j)][m]*Ek[out][m] for m in range(8))
                    # (X e_i) e_j : X e_i = column i of Ek = [Ek[p][i]]_p ; (Xe_i)e_j = sum_p Ek[p][i]* (e_p e_j)
                    t2=sum(Ek[p][i]*prods[(p,j)][out] for p in range(8))
                    # e_i (X e_j): X e_j = col j; sum_q Ek[q][j]*(e_i e_q)
                    t3=sum(Ek[q][j]*prods[(i,q)][out] for q in range(8))
                    row[k]=t1-t2-t3
                if any(x!=0 for x in row): rows.append(row)
    return rows

g2basis = nullbasis(der_rows(), 28)
print("dim g2 = Der(O) =", len(g2basis), "(expect 14)")
g2mats=[build(v) for v in g2basis]

# colour = {D in g2 : D u1 = 0}. u1 = e[1] = basis(1). D u1 = column 1 of D.
# impose (D u1)=0 : 8 conditions linear in the g2 coordinates.
def colour_rows():
    rows=[]
    for out in range(8):
        row=[sum(g2basis[k][kk] for kk in [0])*0 for k in range(len(g2basis))]  # placeholder len
        row=[g2mats[k][out][1] for k in range(len(g2mats))]  # (D u1)_out = D[out][1]
        rows.append(row)
    return rows
cb = nullbasis(colour_rows(), len(g2basis))
print("dim colour = {D in g2: D u1=0} =", len(cb), "(expect 8 = su(3))")
# colour matrices in so(8)
colour_mats=[]
for v in cb:
    M=[[F0]*8 for _ in range(8)]
    for k,coef in enumerate(v):
        if coef!=0: M=matadd(M, [[coef*g2mats[k][i][j] for j in range(8)] for i in range(8)])
    colour_mats.append(M)

# sanity: colour commutes with su(2)_L? (it should NOT necessarily). And D u1 = 0 check.
print("colour elements skew?", all(is_skew(M) for M in colour_mats))
print("colour kills u1?", all(all(M[out][1]==0 for out in range(8)) for M in colour_mats))

def centralizer(gens, ambient_basis, ambient_build):
    rows=[]
    for g in gens:
        for Ek in ambient_basis:
            pass
    # generic: solve for X in ambient (so8) with [X,g]=0 for all g
    rows=[]
    for g in gens:
        cols=[flat64(comm(Ek,g)) for Ek in so8]
        for r in range(64):
            rows.append([cols[k][r] for k in range(28)])
    nb=nullbasis(rows,28)
    return [build(v) for v in nb], nb

# centralizer of su(2)_L
cent_L,_ = centralizer([L1,L2,L3], so8, build)
print("\ndim centralizer(su(2)_L) in so(8) =", len(cent_L))

# centralizer of colour
cent_col,_ = centralizer(colour_mats, so8, build)
print("dim centralizer(colour su(3)) in so(8) =", len(cent_col))

# JOINT centralizer of su(2)_L AND colour
cent_joint, njoint = centralizer([L1,L2,L3]+colour_mats, so8, build)
print("dim JOINT centralizer(su(2)_L + colour) in so(8) =", len(cent_joint))
for idx,M in enumerate(cent_joint):
    nz=[(labels[k],v) for k,v in enumerate(njoint[idx]) if v!=0]
    print(f"  Yline[{idx}] support:", nz[:14])

# If joint centralizer is 1-dim -> forced hypercharge. Compute its Gram vs T3=L1.
if len(cent_joint)>=1:
    print("\n=== candidate hypercharge lines: B(Y,Y), B(Y,L1), commute with su(2)_L & colour ===")
    for idx,Y in enumerate(cent_joint):
        bYY=B(Y,Y); bYL=B(Y,L1); bLL=B(L1,L1)
        print(f"  Y[{idx}]: B(Y,Y)={bYY} B(Y,L1)={bYL} B(L1,L1)={bLL}")
