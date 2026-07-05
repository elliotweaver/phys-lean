"""
N304 SELECT probe 2 — the RANK-2 CARTAN WEIGHT DIAGRAM of the three generations under
the derived su(3)_flavour. Decide: genuine forward rung (fundamental-3 weight diagram) or
decoration?

su(3) has a rank-2 Cartan. Build two COMMUTING Cartan generators from the banked family so(3)
{famA,famB,famC} + coset {kAB,kBC,kCA}, and read the JOINT weights of the three slots slotA/slotB/slotC.
If the three slots are the three weights of the FUNDAMENTAL 3 (an equilateral triangle in the
weight plane, summing to zero), that is THE canonical su(3) weight diagram — forced, clean, a genuine
structural enrichment. If not, it is decoration.
"""
import numpy as np
from fractions import Fraction as F
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)),add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]
Tt=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): Tt[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',Tt,x,y)
def ostar(x): return Sst.T@x
def reQ(o): return float(o[0])
I8=np.eye(8); u1v=I8[1]
def zero_mat(): return np.zeros((3,3,8))
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def one_oct():
    v=np.zeros(8); v[0]=1.0; return v
def slotA(a):
    M=zero_mat(); M[0,1]=a.copy(); M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b.copy(); M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c.copy(); M[2,1]=ostar(c); return M
one=one_oct()
famA=innerMul(slotB(one),slotC(one)); famB=innerMul(slotC(one),slotA(one)); famC=innerMul(slotA(one),slotB(one))
kBC=innerMul(slotB(u1v),slotC(one)); kCA=innerMul(slotC(u1v),slotA(one)); kAB=innerMul(slotA(u1v),slotB(one))
def comm(T,S): return lambda X: T(S(X))-S(T(X))
JC=comm(famC,kAB); JA=comm(famA,kBC); JB=comm(famB,kCA)

# Each JX acts on slotY(1) -> slotY(w_XY · u1) [diagonal in slot basis, complex structure u1].
# Extract the weight matrix w[X][Y] : the u1-coefficient.
def slot_of(idx): return [slotA,slotB,slotC][idx]
def weight(J, yidx):
    v = slot_of(yidx)(one)
    Jv = J(v)
    # find the (i,j) upper entry of slot y and read its u1 coefficient
    positions=[(0,1),(0,2),(1,2)]  # A,B,C upper entries
    (i,j)=positions[yidx]
    coeff_u1 = Jv[i,j][1]  # index 1 = u1 component
    # verify it is purely slotY(coeff·u1): check other slots ~0
    resid=0.0
    for zi,(pi,pj) in enumerate(positions):
        if zi!=yidx: resid=max(resid, np.abs(Jv[pi,pj]).max())
    # verify the value entry is purely along u1
    val = Jv[i,j].copy(); val[1]=0.0
    resid=max(resid, np.abs(val).max())
    return coeff_u1, resid

print("="*74)
print("WEIGHT MATRIX  w[JX][slotY] (u1-coefficient; resid = off-diagonal contamination)")
print("            slotA      slotB      slotC")
Wm=np.zeros((3,3)); maxr=0.0
for xi,(Jname,J) in enumerate([("JA",JA),("JB",JB),("JC",JC)]):
    row=[]
    for yi in range(3):
        w,r=weight(J,yi); Wm[xi,yi]=w; maxr=max(maxr,r); row.append("%6.2f(r%.0e)"%(w,r))
    print("  %s:  %s"%(Jname,"  ".join(row)))
print("  max off-diagonal contamination resid = %.2e (0 => each JX is DIAGONAL on slots)"%maxr)
print()
print("Column sums (weight of each generation summed over the 3 Cartan dirs):", np.round(Wm.sum(0),3))
print("Row sums    (trace of each Cartan JX over the 3 generations):        ", np.round(Wm.sum(1),3))

print("="*74)
print("Are JA,JB,JC a COMMUTING Cartan? (su(3) Cartan is rank 2 => at most 2 independent)")
tests=[slotA(one),slotB(one),slotC(one),slotA(u1v),slotB(u1v),slotC(u1v)]
def bracket_max(T,S):
    m=0.0
    for X in tests: m=max(m,np.abs(comm(T,S)(X)).max())
    return m
print("  [JA,JB] max =%.2e   [JB,JC] max=%.2e   [JC,JA] max=%.2e"%(bracket_max(JA,JB),bracket_max(JB,JC),bracket_max(JC,JA)))
print("  rank of weight matrix W (independent Cartan directions) =", np.linalg.matrix_rank(Wm,tol=1e-9))
# Sum JA+JB+JC : is it zero (Cartan rank 2, one relation) or scalar?
Jsum=lambda X: JA(X)+JB(X)+JC(X)
ms=max(np.abs(Jsum(X)).max() for X in tests)
print("  (JA+JB+JC) max on test slots =%.2e  => %s"%(ms,"rank-2 relation JA+JB+JC=0" if ms<1e-9 else "not zero"))

print("="*74)
print("THE FUNDAMENTAL-3 WEIGHT DIAGRAM: the three generations as weight VECTORS in the")
print("2-plane spanned by two independent Cartan directions. Do they form an equilateral")
print("triangle summing to zero (the canonical su(3) fundamental 3)?")
# Use two independent Cartan combos: H1 = JA-JB, H2 = JA+JB-2JC (Gell-Mann-like), read gen weights
# gen weight vector = (w[H1][gen], w[H2][gen]) with w linear in JX-combos = Wm rows combined
H1 = Wm[0]-Wm[1]           # (JA-JB) weights on slots
H2 = Wm[0]+Wm[1]-2*Wm[2]   # (JA+JB-2JC) weights on slots
for g,gn in enumerate(["gen1(slotA)","gen2(slotB)","gen3(slotC)"]):
    print("  %s weight = (%.3f, %.3f)"%(gn,H1[g],H2[g]))
print("  sum of the three weight vectors = (%.3f, %.3f)  (0,0 => traceless fundamental 3)"%(H1.sum(),H2.sum()))
# pairwise distances
pts=np.array([[H1[g],H2[g]] for g in range(3)])
d01=np.linalg.norm(pts[0]-pts[1]); d12=np.linalg.norm(pts[1]-pts[2]); d20=np.linalg.norm(pts[2]-pts[0])
print("  pairwise distances: |1-2|=%.3f |2-3|=%.3f |3-1|=%.3f  (equal => equilateral)"%(d01,d12,d20))
