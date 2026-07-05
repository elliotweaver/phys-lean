"""
N304 SELECT probe 3 — VERIFY the operator-level identities that would be the node's bankable core:
  (V1) [JX, JY] = 0 as operators on the WHOLE arena (not just slot vectors).
  (V2) JA - JB - JC = 0 as an operator on the WHOLE arena (the rank-2 Cartan relation).
  (V3) each JX is in derH3 (free: bracket of famX,kXY which are in derH3) -> isospectral.
  (V4) the diagonal weight action jX(slotY 1) = slotY(w[X,Y]·u1) with exact integer w.
  (V5) the three generations' weight vectors under (JA,JB) and their Weyl-S3 orbit structure
       (the ceiling: masses = Weyl-invariant functions -> degenerate; NAMES why value un-forceable).
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
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
one=one_oct()
famA=innerMul(slotB(one),slotC(one)); famB=innerMul(slotC(one),slotA(one)); famC=innerMul(slotA(one),slotB(one))
kBC=innerMul(slotB(u1v),slotC(one)); kCA=innerMul(slotC(u1v),slotA(one)); kAB=innerMul(slotA(u1v),slotB(one))
def comm(T,S): return lambda X: T(S(X))-S(T(X))
JA=comm(famA,kBC); JB=comm(famB,kCA); JC=comm(famC,kAB)

# broad test set spanning the arena
rng=np.random.default_rng(3)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M
tests=[herm_rand() for _ in range(6)]
# also non-Hermitian generic matrices (JX are endomorphisms of the full matrix space)
def gen_rand():
    M=zero_mat()
    for i in range(3):
        for j in range(3): M[i,j]=rng.standard_normal(8)
    return M
tests += [gen_rand() for _ in range(6)]

def opmax(f):
    return max(np.abs(f(X)).max() for X in tests)

print("="*74)
print("V1 — [JX,JY]=0 as OPERATORS on the whole arena (Hermitian + generic matrices):")
print("  [JA,JB] max=%.2e"%opmax(comm(JA,JB)))
print("  [JB,JC] max=%.2e"%opmax(comm(JB,JC)))
print("  [JC,JA] max=%.2e"%opmax(comm(JC,JA)))

print("="*74)
print("V2 — the rank-2 Cartan relation as an OPERATOR identity on the whole arena:")
for lbl,rel in [("JA-JB-JC", lambda X: JA(X)-JB(X)-JC(X)),
                ("JC-(JA-JB)", lambda X: JC(X)-(JA(X)-JB(X))),
                ("JA-(JB+JC)", lambda X: JA(X)-(JB(X)+JC(X)))]:
    print("  %-14s max=%.2e"%(lbl, opmax(rel)))

print("="*74)
print("V4 — the exact integer weight action jX(slotY 1) = slotY(w[X,Y]·u1):")
def slot_of(i): return [slotA,slotB,slotC][i]
pos=[(0,1),(0,2),(1,2)]
W=np.zeros((3,3))
ok=True
for xi,(nm,J) in enumerate([("JA",JA),("JB",JB),("JC",JC)]):
    for yi in range(3):
        v=slot_of(yi)(one); Jv=J(v)
        (i,j)=pos[yi]; wu1=Jv[i,j][1]; W[xi,yi]=wu1
        # purity: only the yi slot upper entry, only along u1
        pure=Jv[i,j].copy(); pure[1]=0.0
        contam=np.abs(pure).max()
        for zi,(pi,pj) in enumerate(pos):
            if zi!=yi: contam=max(contam,np.abs(Jv[pi,pj]).max())
        if contam>1e-9: ok=False
print("  weight matrix W[JX,slotY] =\n", W)
print("  purely diagonal fold-root (u1) action, no contamination:", ok)

print("="*74)
print("V5 — the three generation weight VECTORS (columns of W in the (JA,JB) independent basis),")
print("     and the Weyl-S3 ceiling:")
# independent Cartan basis: JA, JB (JC = JA - JB). generation weight = (W[JA,g], W[JB,g])
for g,gn in enumerate(["genA","genB","genC"]):
    print("  %s weight = (%.0f, %.0f)"%(gn, W[0,g], W[1,g]))
wsum=(W[0].sum(),W[1].sum())
print("  Sum over the 3 generations = (%.0f, %.0f)  (nonzero => there is a u(1)_flavour trace part)"%wsum)
# traceless (su(3)) part: subtract the mean
Wtl=W - W.mean(axis=1,keepdims=True)
print("  su(3) (traceless) weights (JA,JB rows, mean-subtracted):")
for g,gn in enumerate(["genA","genB","genC"]):
    print("    %s = (%.2f, %.2f)"%(gn, Wtl[0,g], Wtl[1,g]))
print("  traceless sum over gens per row:", np.round(Wtl.sum(axis=1),3), "(0 => genuine su(3) weights)")
# equilateral?
pts=np.array([[Wtl[0,g],Wtl[1,g]] for g in range(3)])
d=[np.linalg.norm(pts[a]-pts[b]) for a,b in [(0,1),(1,2),(2,0)]]
print("  pairwise distances of the 3 su(3)-weights: %s (equal => equilateral fundamental-3 triangle)"%np.round(d,3))
print()
print("  CEILING (why the VALUE is un-forceable, ~10th deferral): the 3 weights are a single")
print("  Weyl-S3 ORBIT (equilateral triangle). Any Weyl-invariant function of the Cartan")
print("  (masses = char-poly coeffs, f4-isospectral N302) is SYMMETRIC in the 3 => degenerate")
print("  in the flavour-symmetric limit. A distinguished mass RATIO needs a Weyl-S3-breaking")
print("  fold-structure. This is the SAME 'no fixed root' ceiling (N275), now at the weight level.")
