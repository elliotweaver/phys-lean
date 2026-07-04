"""
N287 SELECT — MEASURE-FIRST step 2: THE KEY QUESTION.
Does the DERIVED f4 = Der(H3(O)) supply the colour-neutral u(1)_Y commuting with su(2)_L
that so(8)/so(7) could NOT (N283 joint-centralizer=0)?  == INPUT A's structural payoff.

Setup (exact Fraction octonion table = N283 convention), arena = 3x3 matrices over O.
  - correct octonion inner derivations: D from liftEnd(ad_q) on O=CD(H), component-wise ad_q on
    the two H-halves.  su(2)_L = {DI,DJ,DK} (q = quaternion imag units in ONE H).
    colour = stab_{g2}(u1).  (verify these are in the 14-dim Der(O).)
  - jActL D = entrywise D on each of the 9 octonion entries (72x72 on the full matrix space).
  - innerMul A B = [L_A,L_B], L_A X = jb A X, jb = matrix Jordan product AB+BA.
QUESTIONS:
  Q1  dim f4 = Der(jb on the 27-dim Hermitian arena)  (expect 52).
  Q2  joint centralizer of (jActL su(2)_L + jActL colour) inside f4  -- NONZERO? colour-neutral abelian?
  Q3  the concrete N286 member innerMul(slotA 1, slotB 1): does it commute with jActL(su(2)_L)? colour?
Use numpy floats for dims; exact Fraction confirm on the decisive witness.
"""
import numpy as np
from fractions import Fraction as F

# ---- exact octonion table ----
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
C  = make_level(lambda x,y:x*y, lambda x:x, lambda x,y:x+y, lambda x,y:x-y)
Hl = make_level(*C); Ol = make_level(*Hl)
O_mul, O_star, O_add, O_sub = Ol
def flat(z):
    ((za, zb), (zc, zd)) = z; (a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h = v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]
def omul(x,y): return O_mul(x,y)
def ostar(x): return O_star(x)

# octonion multiplication as an 8x8x8 structure constant table: (e_i e_j) = sum_k T[i][j][k] e_k
T=[[[F(0)]*8 for _ in range(8)] for _ in range(8)]
for i in range(8):
    for j in range(8):
        c=flat(omul(e[i],e[j]))
        for k in range(8): T[i][j][k]=c[k]
Tnp=np.array([[[float(T[i][j][k]) for k in range(8)] for j in range(8)] for i in range(8)])

def oc_mul_np(x,y):  # x,y length-8 float vectors
    return np.einsum('ijk,i,j->k', Tnp, x, y)

# ---- correct octonion inner derivation: liftEnd(ad_q), q a quaternion imag unit ----
# O = CD(H), H-halves are flat indices {0,1,2,3} and {4,5,6,7}. ad_q on H (4-dim, associative).
def adH(qidx):  # ad of the H-imag unit at H-local index qidx (1,2,3) on a 4-dim H block
    # build 4x4: ad_q(x) = q*x - x*q, using the octonion table restricted to indices {0,1,2,3}
    M=np.zeros((4,4))
    for j in range(4):
        # q*e_j - e_j*q  in H = restricting octonion table (H sits in first component -> same indices 0..3)
        qe = np.zeros(8); ejq=np.zeros(8)
        qv=np.zeros(8); qv[qidx]=1.0
        ev=np.zeros(8); ev[j]=1.0
        qe=oc_mul_np(qv,ev); ejq=oc_mul_np(ev,qv)
        col=(qe-ejq)[:4]
        M[:,j]=col
    return M
def liftDeriv(qidx):  # 8x8 block-diag [adH,adH]
    M=np.zeros((8,8)); a=adH(qidx)
    M[:4,:4]=a; M[4:,4:]=a
    return M
DI=liftDeriv(1); DJ=liftDeriv(2); DK=liftDeriv(3)

# verify: is derivation of O? D(e_i e_j)=D(e_i)e_j + e_i D(e_j)
def is_deriv_np(D,tol=1e-9):
    for i in range(8):
        for j in range(8):
            lhs=oc_mul_np(D@np.eye(8)[i], np.eye(8)[j]) + oc_mul_np(np.eye(8)[i], D@np.eye(8)[j])
            # D(e_i e_j): D applied to vector (e_i e_j)
            eij=oc_mul_np(np.eye(8)[i],np.eye(8)[j])
            rhs=D@eij
            if np.max(np.abs(lhs-rhs))>tol: return False
    return True
print("DI deriv?",is_deriv_np(DI)," DJ?",is_deriv_np(DJ)," DK?",is_deriv_np(DK))
# structure: [DI,DJ] = 2 DK ?
print("[DI,DJ]-2DK max:", np.max(np.abs((DI@DJ-DJ@DI)-2*DK)))
print("DI(u1=e1):",np.round(DI@np.eye(8)[1],6)," (colour: expect 0)")

# ---- g2 = Der(O) basis via nullspace (numpy) ----
# unknown D 8x8=64. condition D(e_i e_j)-D(e_i)e_j-e_i D(e_j)=0.
rows=[]
I8=np.eye(8)
for i in range(8):
    for j in range(8):
        eij=oc_mul_np(I8[i],I8[j])
        # comp k: sum_m eij[m] D[k][m]  - sum_m T[m][j][k] D[m][i] - sum_m T[i][m][k] D[k? ]...
        # D(e_i)e_j: D(e_i)=col i = sum_m D[m][i] e_m ; times e_j -> comp k: sum_m D[m][i] T[m][j][k]
        # e_i D(e_j): comp k: sum_m D[m][j] T[i][m][k]
        for k in range(8):
            row=np.zeros(64)
            for m in range(8): row[k*8+m]+=eij[m]
            for m in range(8): row[m*8+i]-=Tnp[m][j][k]
            for m in range(8): row[m*8+j]-=Tnp[i][m][k]
            rows.append(row)
A=np.array(rows)
u,s,vt=np.linalg.svd(A)
tol=1e-8
null_dim=np.sum(s<tol)+ (64-len(s))
print("\n=== dim Der(O) =",64-np.sum(s>tol),"(expect 14) ===")
g2basis=vt[np.sum(s>tol):]  # rows spanning nullspace, each length 64
g2mats=[v.reshape(8,8) for v in g2basis]
print("g2 basis count:",len(g2mats))
