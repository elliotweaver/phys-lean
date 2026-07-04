"""
N287 SELECT — step 7: CONFIRM THE THEORY-NATIVE MECHANISM (the ONE CAUSE), and lock the witness.
Hypothesis (the coordinate-free lever):
  [jActL D, innerMul A B] = innerMul (D-entrywise A) B + innerMul A (D-entrywise B)
  because jActL D is a derivation of the Jordan product jb ([D̂,L_A]=L_{D̂A}, from banked jAct_jb).
Corollary: if D kills every entry of A and B, jActL D commutes with innerMul A B.
  colour = {D∈Der(O): D u1=0}; every derivation kills 1. So for A,B valued in the ℂ-core
  span{1,u1}, EVERY colour D commutes with innerMul A B.
Verify numerically + pick a witness A,B in the ℂ-core that:
  (a) innerMul(A,B) ≠ 0, (b) commutes with all colour, (c) does NOT commute with all g2
  (so genuinely su(3)_ew not the fully-central piece), (d) escapes g2 (moves the diagonal).
"""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True,precision=3)
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
Cc=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cc); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def basis(i):
    v=[F(0)]*8; v[i]=F(1)
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
e=[basis(i) for i in range(8)]; I8=np.eye(8)
T=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return Sst.T@x
def adH(q):
    M=np.zeros((8,8))
    for j in range(4): M[:,j]=(omul(I8[q],I8[j])-omul(I8[j],I8[q]))
    a=M[:4,:4]; out=np.zeros((8,8)); out[:4,:4]=a; out[4:,4:]=a; return out
DI,DJ,DK=adH(1),adH(2),adH(3)
rows=[]
for i in range(8):
    for j in range(8):
        eij=omul(I8[i],I8[j])
        for k in range(8):
            row=np.zeros(64)
            for m in range(8): row[k*8+m]+=eij[m]
            for m in range(8): row[m*8+i]-=T[m,j,k]
            for m in range(8): row[m*8+j]-=T[i,m,k]
            rows.append(row)
_,ss,vt=np.linalg.svd(np.array(rows)); rank=int(np.sum(ss>1e-8))
g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>1e-8))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]
print("colour dim",len(colourmats),"| check colour kills 1 and u1:")
print("  max|D*1|",max(np.max(np.abs(D@I8[0])) for D in colourmats),
      " max|D*u1|",max(np.max(np.abs(D@u1)) for D in colourmats))
print("  isospin DJ*u1 (should be nonzero):",np.round(DJ@u1,3))

def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
pairs=[(0,1),(0,2),(1,2)]
for (i,j) in pairs:
    for c in range(8):
        M=zero_mat(); M[i,j]=I8[c]; M[j,i]=ostar(I8[c]); arena_basis.append(M)
N=27
def mat_to_vec(M):
    v=np.zeros(N)
    for i in range(3): v[i]=M[i,i,0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): v[idx]=M[i,j,c]; idx+=1
    return v
def omatmul(A,Bm):
    R=zero_mat()
    for i in range(3):
        for k in range(3):
            s=np.zeros(8)
            for j in range(3): s=s+omul(A[i,j],Bm[j,k])
            R[i,k]=s
    return R
def jb(A,Bm): return omatmul(A,Bm)+omatmul(Bm,A)
def Lop(A):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jb(A,arena_basis[a]))
    return M
def innerMul(A,B):
    LA=Lop(A); LB=Lop(B); return LA@LB-LB@LA
def dhat(D,A):  # entrywise D on matrix A
    R=zero_mat()
    for i in range(3):
        for j in range(3): R[i,j]=D@A[i,j]
    return R
def jActL_mat(D):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(dhat(D,arena_basis[a]))
    return M
colour_lift=[jActL_mat(D) for D in colourmats]
g2_lift=[jActL_mat(D) for D in g2mats]
def comm(X,Y): return X@Y-Y@X

# ---- VERIFY THE LEVER: [jActL D, innerMul A B] = innerMul(dhat D A,B)+innerMul(A,dhat D B) ----
def mk(entrymap):  # build Hermitian matrix from dict {(i,j):8vec}
    M=zero_mat()
    for (i,j),v in entrymap.items():
        M[i,j]=M[i,j]+v
        if i!=j: M[j,i]=M[j,i]+ostar(v)
        # if i==j require real
    return M
# test A,B generic Hermitian, D generic derivation
A=mk({(0,0):3*I8[0],(0,1):I8[1]+2*I8[4],(1,2):I8[5]})
B=mk({(1,1):I8[0],(0,2):I8[2],(1,2):I8[3]})
maxerr=0
for D in g2mats[:5]:
    lhs=comm(jActL_mat(D),innerMul(A,B))
    rhs=innerMul(dhat(D,A),B)+innerMul(A,dhat(D,B))
    maxerr=max(maxerr,np.max(np.abs(lhs-rhs)))
print("\n=== LEVER [jActL D,innerMul A B]=innerMul(D̂A,B)+innerMul(A,D̂B): maxerr",maxerr,"===")

# ---- pick witness in the ℂ-core span{1,u1} ----
# candidate: A = E01(u1) (u1 at (0,1)), B = E02(u1) (u1 at (0,2)) -- both ℂ-core, Hermitian
Aw=mk({(0,1):I8[1]})
Bw=mk({(0,2):I8[1]})
X=innerMul(Aw,Bw)
print("\nwitness A=E01(u1),B=E02(u1): innerMul nonzero?",np.max(np.abs(X))>1e-9)
print("  commutes with ALL colour?",all(np.max(np.abs(comm(X,g)))<1e-7 for g in colour_lift))
print("  commutes with ALL g2?",all(np.max(np.abs(comm(X,g)))<1e-7 for g in g2_lift),"(want False => genuinely ew)")
# escapes g2? moves diagonal: X applied to identity-ish moves diagonal (like N285 test)
# a member escapes g2 iff it's not equal to any jActL D. Since it moves the diagonal and g2 fixes diagonal:
Id=mk({(0,0):I8[0],(1,1):I8[0],(2,2):I8[0]})
# innerMul moves the diagonal (N274): check X does not preserve diagonal subspace like g2 does
diagbasis=[mat_to_vec(mk({(i,i):I8[0]})) for i in range(3)]
def moves_diagonal(op):
    for db in diagbasis:
        out=op@db
        # is out a diagonal-real vector? diagonal coords are indices 0,1,2; off must be 0
        if np.max(np.abs(out[3:]))>1e-9: return True
    return False
print("  X moves the diagonal (escapes g2)?",moves_diagonal(X))

# also a cleaner all-real witness (fully central, commutes with all g2) for comparison
Ar=mk({(0,1):I8[0]}); Br=mk({(0,2):I8[0]})
Xr=innerMul(Ar,Br)
print("\nreal witness A=E01(1),B=E02(1): commutes all g2?",all(np.max(np.abs(comm(Xr,g)))<1e-7 for g in g2_lift),
      " moves diag?",moves_diagonal(Xr))

# The N286 banked witness is innerMul(slotA 1, slotB 1). slotA a = a at (0,0); slotB — check by trying (0,0)&(1,1)? 
# Actually N286 uses slotA/slotB — likely diag(0,0) and diag(1,1) reals. Both real -> commutes all g2.
print("\n=== structure-constant check: do ℂ-core inner derivations close into su(3)_ew? ===")
# collect innerMul of a few ℂ-core Hermitian matrices, check bracket-closure into the 8-dim su3ew
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')
def centralizer_basis(gens):
    big=[np.array([comm(f4basis[a],g).reshape(-1) for a in range(52)]).T for g in gens]
    _,sv,vv=np.linalg.svd(np.vstack(big)); r=int(np.sum(sv>1e-6*sv[0])); nc=vv[r:]
    return [sum(nc[t][a]*f4basis[a] for a in range(52)) for t in range(nc.shape[0])]
su3ew=centralizer_basis(colour_lift)
SE=np.array([m.reshape(-1) for m in su3ew])
print("  X in su3ew?",np.max(np.abs(X.reshape(-1)-np.linalg.lstsq(SE.T,X.reshape(-1),rcond=None)[0]@SE))<1e-8)
