"""
N287 SELECT — MEASURE-FIRST step 3: THE DECISIVE INPUT-A PAYOFF MEASUREMENT.

Build f4 = Der(H3(O)) on the 27-dim Hermitian arena (exact octonion table), then ask:
  Q1  dim f4  (expect 52).
  Q2  colour = jActL(stab_{g2}(u1)) lifted into f4 (8-dim). Its centralizer in f4:
      dim?  Is it a simple 8-dim su(3) (the A2 x A2 decomposition F4 ⊃ su(3)_c x su(3)_ew)?
  Q3  does that centralizer contain su(2)_L = jActL{DI,DJ,DK}?  and a colour-neutral abelian u(1)
      commuting with su(2)_L?  == INPUT A (su(2)_L + colour-neutral u(1)_Y in one simple ambient).
Floats for dims; the decisive small integers re-confirmed exactly afterward if green.
"""
import numpy as np
from fractions import Fraction as F

# ---- exact octonion structure table (N283 convention) ----
def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    def lstar(z):
        (a, b) = z; return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w; return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w; return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub
def lneg(z): return (lneg(z[0]), lneg(z[1])) if isinstance(z, tuple) else -z
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl)
O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]
T=np.zeros((8,8,8))
S=np.zeros((8,8))  # star matrix: star(e_i)=sum S[i][k] e_k
for i in range(8):
    for j in range(8):
        c=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(c[k])
    cs=flat(O_star(e[i]))
    for k in range(8): S[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)     # 8-vec * 8-vec -> 8-vec
def ostar(x): return S.T@x

# ---- octonion derivations DI,DJ,DK and Der(O) basis (from probe_f4, reused) ----
def adH(qidx):
    M=np.zeros((8,8))
    qv=np.zeros(8); qv[qidx]=1.0
    for j in range(4):
        ev=np.zeros(8); ev[j]=1.0
        M[:,j]=(omul(qv,ev)-omul(ev,qv))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a
    return out
DI=adH(1); DJ=adH(2); DK=adH(3)
# Der(O) basis
rows=[]; I8=np.eye(8)
for i in range(8):
    for j in range(8):
        eij=omul(I8[i],I8[j])
        for k in range(8):
            row=np.zeros(64)
            for m in range(8): row[k*8+m]+=eij[m]
            for m in range(8): row[m*8+i]-=T[m,j,k]
            for m in range(8): row[m*8+j]-=T[i,m,k]
            rows.append(row)
A=np.array(rows); u,s,vt=np.linalg.svd(A); tol=1e-8
rank=int(np.sum(s>tol)); print("dim Der(O)=",64-rank)
g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
# colour = {D in g2: D u1 = 0}
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
uu,ss,vv=np.linalg.svd(crow); cr=int(np.sum(ss>tol))
colour_coeffs=vv[cr:]  # rows in 14-dim g2-coordinates
colourmats=[sum(colour_coeffs[r][k]*g2mats[k] for k in range(14)) for r in range(colour_coeffs.shape[0])]
print("dim colour=",len(colourmats))

# ================= build the 27-dim Hermitian arena =================
# arena element = 3x3 octonion matrix M[i][j] (8-vec), Hermitian: M[j][i]=star(M[i][j]), diag real.
# basis: D_i (i=0,1,2) diagonal real unit; Off_{ij,c} (i<j, c=0..7): entry(i,j)=e_c, entry(j,i)=star(e_c).
arena_basis=[]  # each is 3x3x8 numpy array
def zero_mat(): return np.zeros((3,3,8))
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
pairs=[(0,1),(0,2),(1,2)]
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
N=len(arena_basis); print("arena dim=",N,"(expect 27)")

def mat_to_vec(M):  # express Hermitian 3x3x8 M in the 27 basis (least squares, exact-ish)
    # since basis is orthogonal-ish in entries, read coords directly
    v=np.zeros(N)
    for i in range(3): v[i]=M[i,i,0]
    idx=3
    for (i,j) in pairs:
        for c in range(8):
            v[idx]=M[i,j,c]; idx+=1
    return v
def vec_to_mat(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8):
            M[i,j]+=v[idx]*I8[c]; M[j,i]+=v[idx]*ostar(I8[c]); idx+=1
    return M

def omatmul(A,Bm):  # 3x3 octonion matrix product
    R=zero_mat()
    for i in range(3):
        for k in range(3):
            s=np.zeros(8)
            for j in range(3): s=s+omul(A[i,j],Bm[j,k])
            R[i,k]=s
    return R
def jb(A,Bm):
    return omatmul(A,Bm)+omatmul(Bm,A)

# jb as bilinear on the 27-basis: Jtab[a][b] = coords of jb(basis_a, basis_b)
Jtab=np.zeros((N,N,N))
for a in range(N):
    for b in range(N):
        Jtab[a,b]=mat_to_vec(jb(arena_basis[a],arena_basis[b]))

# ================= f4 = Der(jb) : nullspace of derivation condition =================
# T is NxN. condition for basis pair (a,b): T(jb_ab) - jb(T e_a, e_b) - jb(e_a, T e_b) = 0.
# jb(T e_a, e_b) = sum_p T[p][a] Jtab[p][b].  T(jb_ab)=sum_q Jtab[a][b][q]-> T applied: sum_q Jtab[a,b,q] * (col q of Tmat)
# unknown Tmat[i][m], 27*27=729. For each (a,b) and comp i:
#   sum_m Jtab[a,b,m]*Tmat[i][m]  - sum_p Tmat[p][a]*Jtab[p][b][i] - sum_p Tmat[p][b]*Jtab[a][p][i] = 0
def uix(i,m): return i*N+m
drows=[]
for a in range(N):
    for b in range(a,N):  # symmetric, a<=b enough
        for i in range(N):
            row=np.zeros(N*N)
            for m in range(N): row[uix(i,m)]+=Jtab[a,b,m]
            for p in range(N): row[uix(p,a)]-=Jtab[p,b,i]
            for p in range(N): row[uix(p,b)]-=Jtab[a,p,i]
            drows.append(row)
Amat=np.array(drows); print("deriv system shape:",Amat.shape)
# nullspace dim via SVD (729 cols)
uu,ss,vv=np.linalg.svd(Amat,full_matrices=True)
tol2=1e-6*ss[0]
r4=int(np.sum(ss>tol2))
print("\n=== dim f4 = Der(H3(O)) =",N*N-r4,"(expect 52) ===")
f4basis=[vv[r].reshape(N,N) for r in range(r4,N*N)]
print("f4 basis count:",len(f4basis))
np.save('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy',np.array(f4basis))
np.save('/Users/elliotweaver/phys-lean/workbench/N287-select/Jtab.npy',Jtab)
