"""
N283 probe 2 — the HARD TEST (task ⚠).
For a convention-free mixing angle we need:
 (a) a genuine abelian generator Y that COMMUTES with su(2)_L (the u(1)_Y factor),
 (b) all generators inside a SINGLE SIMPLE ambient whose invariant form is unique up to scale.

Test:
 1. Are all regular/cross operators skew-adjoint w.r.t. the Born form gForm? (=> so(8) ambient)
 2. What is the centralizer of su(2)_L = span{L1,L2,L3} inside so(8)? dim + basis.
    Does it contain a u(1) that could be hypercharge?
 3. The convention-free ANGLE between neutral generators (independent of form scale).
 4. Is so(8) SIMPLE and its trace form unique up to scale on this rep?
"""
from fractions import Fraction as F
import importlib.util, sys
spec = importlib.util.spec_from_file_location("pg", "/Users/elliotweaver/phys-lean/workbench/N283-mixing/probe_gram.py")
pg = importlib.util.module_from_spec(spec)
# suppress its prints
import io, contextlib
with contextlib.redirect_stdout(io.StringIO()):
    spec.loader.exec_module(pg)

F0 = F(0)
e = pg.e
octmul = pg.octmul; octstar = pg.octstar; gForm = pg.gForm
flat = pg.flat; basis = pg.basis
L1,L2,L3,R1,R2,R3 = pg.L1,pg.L2,pg.L3,pg.R1,pg.R2,pg.R3
foldVec,foldAx,Qc,Yc = pg.foldVec,pg.foldAx,pg.Qc,pg.Yc
matmul,matsub,matadd,comm,trace,iszero = pg.matmul,pg.matsub,pg.matadd,pg.comm,pg.trace,pg.iszero
B = pg.B

# Gram matrix of the Born form on the flat basis: G_ij = gForm(e_i, e_j)
Gmat = [[gForm(e[i], e[j]) for j in range(8)] for i in range(8)]
print("=== Born-form Gram on flat basis (expect identity) ===")
print("is identity?", all(Gmat[i][j]==(1 if i==j else 0) for i in range(8) for j in range(8)))

# skew-adjoint w.r.t gForm (=identity here): M^T G + G M = 0  => M^T = -M (since G=I)
def transpose(M): return [[M[j][i] for j in range(8)] for i in range(8)]
def is_skew(M): return iszero(matadd(transpose(M), M))
print("\n=== skew-adjoint (in so(8))? ===")
for name,M in {'L1':L1,'L2':L2,'L3':L3,'R1':R1,'R2':R2,'R3':R3,
               'foldVec':foldVec,'foldAx':foldAx,'Q':Qc,'Y':Yc}.items():
    print(f"  {name}: skew? {is_skew(M)}")

# ---- centralizer of su(2)_L inside so(8): solve [X,Li]=0 for i=1,2,3, X skew (28-dim so(8)) ----
# Parametrize so(8): basis E_{ab} = unit skew (a<b): entry(a,b)=1, entry(b,a)=-1. 28 of them.
so8_basis = []
labels = []
for a in range(8):
    for b in range(a+1,8):
        M = [[F0]*8 for _ in range(8)]
        M[a][b]=F(1); M[b][a]=F(-1)
        so8_basis.append(M); labels.append((a,b))

def flat64(M): return [M[i][j] for i in range(8) for j in range(8)]

def centralizer_dim(gens):
    # X = sum c_k E_k ; conditions [X,g]=0 for each g. Build big linear system in 28 unknowns.
    rows = []
    for g in gens:
        # each [E_k, g] flattened is a column contribution; condition sum_k c_k [E_k,g]_entry = 0
        cols = [flat64(comm(Ek, g)) for Ek in so8_basis]  # 28 vectors of len 64
        for r in range(64):
            rows.append([cols[k][r] for k in range(28)])
    # nullspace dimension of this (len(rows) x 28) matrix
    return nullspace(rows, 28), rows

def nullspace(rows, ncol):
    mat = [row[:] for row in rows]
    nrow = len(mat)
    pivcols = []
    r = 0
    for c in range(ncol):
        piv = None
        for rr in range(r, nrow):
            if mat[rr][c] != 0: piv=rr; break
        if piv is None: continue
        mat[r], mat[piv] = mat[piv], mat[r]
        pv = mat[r][c]; mat[r]=[x/pv for x in mat[r]]
        for rr in range(nrow):
            if rr!=r and mat[rr][c]!=0:
                f=mat[rr][c]; mat[rr]=[mat[rr][j]-f*mat[r][j] for j in range(ncol)]
        pivcols.append(c); r+=1
    return ncol - len(pivcols), pivcols

dim, _ = centralizer_dim([L1,L2,L3])
print(f"\n=== dim centralizer of su(2)_L in so(8) = {dim[0]} (pivot-free cols) ===")

# also the centralizer basis explicitly: find null vectors
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
    basisv=[]
    for fc in free:
        v=[F0]*ncol; v[fc]=F(1)
        for i,pc in enumerate(pivcols):
            v[pc] = -mat[i][fc]
        basisv.append(v)
    return basisv, pivcols, free

_, rows = centralizer_dim([L1,L2,L3])
nb, piv, free = nullbasis(rows, 28)
print(f"centralizer dim (nullbasis) = {len(nb)}")
# reconstruct each centralizer element as an 8x8 matrix and identify
def build(v):
    M=[[F0]*8 for _ in range(8)]
    for k,coef in enumerate(v):
        if coef!=0:
            a,b=labels[k]; M[a][b]+=coef; M[b][a]-=coef
    return M
cent = [build(v) for v in nb]
print("centralizer elements (as skew matrices), count:", len(cent))
for idx,M in enumerate(cent):
    nz = [(labels[k], v) for k,v in enumerate(nb[idx]) if v!=0]
    print(f"  c[{idx}] support:", nz[:12])

# Does the centralizer commute internally (abelian)? and is R1 / foldVec / Q / Y in it?
def in_span_ms(target, basisMs):
    return pg.__dict__  # placeholder
print("\n=== is R1 in centralizer of su(2)_L? (commutes with all L) ===")
for name,M in {'R1':R1,'foldVec':foldVec,'foldAx':foldAx,'Q':Qc,'Y':Yc}.items():
    ok = iszero(comm(M,L1)) and iszero(comm(M,L2)) and iszero(comm(M,L3))
    print(f"  {name} in centralizer? {ok}")

print("\n=== convention-free angles cos = B(A,B)/sqrt(B(A,A)B(B,B)) ===")
import math
def ang(A,Bm):
    num=B(A,Bm); den2=B(A,A)*B(Bm,Bm)
    return num, den2, (float(num)/math.sqrt(float(den2)) if den2>0 else None)
for (n1,A),(n2,Bm) in [(('L1',L1),('R1',R1)),(('L1',L1),('foldVec',foldVec)),
    (('L1',L1),('foldAx',foldAx)),(('foldVec',foldVec),('foldAx',foldAx)),
    (('L1',L1),('Q',Qc)),(('L1',L1),('Y',Yc)),(('Q',Qc),('Y',Yc))]:
    num,den2,c=ang(A,Bm)
    print(f"  cos({n1},{n2}) = {num}/sqrt({den2})  ~ {c}")
