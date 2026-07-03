#!/usr/bin/env python3
"""N259 SELECT probe 5b — efficient bracket-closure of colour+isospin (and full g_SM)."""
from fractions import Fraction as F
import sys
sys.setrecursionlimit(10000)
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
u1=(hI,h_zero); kap1=basis(4)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def subm(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def addm(A,B): return [[A[r][c]+B[r][c] for c in range(7)] for r in range(7)]
def scal(c,A): return [[c*A[r][cc] for cc in range(7)] for r in range(7)]
def comm(A,B): return subm(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
Q  = mat(lambda x: octCrossO(u1,x))
Yh = mat(lambda x: octCrossO(kap1,x))
def innerD(P): return mat(lambda x,P=P:(h_add(h_mul(P,x[0]),h_neg(h_mul(x[0],P))),h_add(h_mul(P,x[1]),h_neg(h_mul(x[1],P)))))
DI=innerD(hI); DJ=innerD(hJ); DK=innerD(hK)

def nullspace(rows,ncols):
    R=[r[:] for r in rows]; nr=len(R); pivots=[]; r=0; col_piv={}
    for c in range(ncols):
        piv=next((i for i in range(r,nr) if R[i][c]!=0),None)
        if piv is None: continue
        R[r],R[piv]=R[piv],R[r]; pv=R[r][c]; R[r]=[x/pv for x in R[r]]
        for i in range(nr):
            if i!=r and R[i][c]!=0:
                f=R[i][c]; R[i]=[R[i][j]-f*R[r][j] for j in range(ncols)]
        col_piv[c]=r; pivots.append(c); r+=1
        if r==nr: break
    free=[c for c in range(ncols) if c not in col_piv]
    B=[]
    for fc in free:
        vec=[F(0)]*ncols; vec[fc]=F(1)
        for c in pivots: vec[c]=-R[col_piv[c]][fc]
        B.append(vec)
    return B
def vec_to_mat(v): return [[v[i*7+j] for j in range(7)] for i in range(7)]
def build_g2_basis():
    rows=[]
    for ia in range(1,8):
        for ib in range(1,8):
            a=E[ia]; b=E[ib]; ab=o_mul(a,b)
            imag_ab=o_to_vec(ab)[1:8]; imag_a=o_to_vec(a)[1:8]; imag_b=o_to_vec(b)[1:8]
            per_unknown=[]
            for p in range(7):
                for q in range(7):
                    dab=[F(0)]*8; dab[p+1]=imag_ab[q]; dab_o=o_from_vec(dab)
                    da=[F(0)]*8; da[p+1]=imag_a[q]; da_o=o_from_vec(da)
                    db=[F(0)]*8; db[p+1]=imag_b[q]; db_o=o_from_vec(db)
                    expr=o_add(o_add(dab_o, o_neg(o_mul(da_o,b))), o_neg(o_mul(a,db_o)))
                    per_unknown.append(o_to_vec(expr))
            for comp in range(8):
                row=[per_unknown[k][comp] for k in range(49)]
                if any(x!=0 for x in row): rows.append(row)
    return nullspace(rows,49)
g2mats=[vec_to_mat(v) for v in build_g2_basis()]
def colour_centralizer():
    n=len(g2mats); rows=[]; commmats=[comm(M,Q) for M in g2mats]
    for comp in range(49):
        row=[flat(commmats[a])[comp] for a in range(n)]
        if any(x!=0 for x in row): rows.append(row)
    ns=nullspace(rows,n); cmats=[]
    for v in ns:
        M=[[F(0)]*7 for _ in range(7)]
        for a in range(n):
            if v[a]!=0: M=addm(M,scal(v[a],g2mats[a]))
        cmats.append(M)
    return cmats
su3=colour_centralizer()
su2=[DI,DJ,DK]

# incremental reduced-row-echelon span. keep pivot rows.
class Span:
    def __init__(self): self.rows=[]  # reduced echelon rows over 49
    def _reduce(self,v):
        v=v[:]
        for r in self.rows:
            # find pivot col of r
            pc=next(i for i,x in enumerate(r) if x!=0)
            if v[pc]!=0:
                f=v[pc]/r[pc]
                v=[v[i]-f*r[i] for i in range(49)]
        return v
    def add(self,M):
        v=self._reduce(flat(M))
        if any(x!=0 for x in v):
            # normalize
            pc=next(i for i,x in enumerate(v) if x!=0); v=[x/v[pc] for x in v]
            # reduce existing rows against v
            for k in range(len(self.rows)):
                if self.rows[k][pc]!=0:
                    f=self.rows[k][pc]; self.rows[k]=[self.rows[k][i]-f*v[i] for i in range(49)]
            self.rows.append(v); return True
        return False
    def dim(self): return len(self.rows)
    def contains(self,M): return not any(x!=0 for x in self._reduce(flat(M)))

def closure_dim(gens, cap=25):
    S=Span()
    genmats=[]
    for g in gens:
        if S.add(g): genmats.append(g)
    basis=list(genmats)
    changed=True
    while changed and S.dim()<cap:
        changed=False
        cur=list(basis)
        newmats=[]
        for i in range(len(cur)):
            for j in range(i+1,len(cur)):
                b=comm(cur[i],cur[j])
                if not S.contains(b):
                    S.add(b); newmats.append(b); changed=True
        basis=basis+newmats
        if not newmats: break
    return S.dim()

print("dim colour su(3)_c =", len(su3))
print("dim ⟨colour ∪ isospin⟩_Lie inside g2(14) =", closure_dim(su3+su2, cap=14))
print("  (14 => generate ALL g2, NOT a clean subalgebra; <14 => closes)")
print("dim ⟨colour+isospin+Y⟩_Lie =", closure_dim(su3+su2+[Yh], cap=21))
print("dim ⟨both full factors: colour+Q+isospin+Y⟩_Lie =", closure_dim(su3+[Q]+su2+[Yh], cap=21), "(so7=21)")
