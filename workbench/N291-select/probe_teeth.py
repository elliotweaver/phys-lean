"""N291 teeth check: colour-neutrality of Mc, the covariance formula, and slotA(u1) Hermitian."""
import numpy as np
from fractions import Fraction as F
np.set_printoptions(suppress=True, precision=4)
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
_,ss,vt=np.linalg.svd(np.array(rows)); tol=1e-8
rank=int(np.sum(ss>tol)); g2mats=[vt[r].reshape(8,8) for r in range(rank,64)]
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>tol))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]
print("dim colour =",len(colourmats))
# arena
pairs=[(0,1),(0,2),(1,2)]
def zero_mat(): return np.zeros((3,3,8))
arena_basis=[]
for i in range(3):
    M=zero_mat(); M[i,i]=I8[0]; arena_basis.append(M)
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
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jprod(A,B): return 0.5*(mat_mul(A,B)+mat_mul(B,A))
def jActL_mat(D):
    Mrep=np.zeros((N,N))
    for a in range(N):
        M=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@M[i,j]
        Mrep[:,a]=mat_to_vec(R)
    return Mrep
def comm(X,Y): return X@Y-Y@X
def Lop(Amat):
    M=np.zeros((N,N))
    for a in range(N): M[:,a]=mat_to_vec(jprod(Amat, arena_basis[a]))
    return M
def slot(pair,cval):
    (i,j)=pair; M=zero_mat(); M[i,j]=cval.copy(); M[j,i]=ostar(cval); return M

# slotA(u1) Hermitian check
sAu1=slot((0,1),u1.copy())
herm=all(np.max(np.abs(sAu1[i,j]-ostar(sAu1[j,i])))<1e-12 for i in range(3) for j in range(3))
print("slotA(u1) Hermitian?",herm)
sB1=slot((0,2),I8[0].copy())
Mc=comm(Lop(sAu1),Lop(sB1))

# colour-neutrality: [jActL colour_k, Mc] = 0 for all 8 ?
colmax=max(np.max(np.abs(comm(jActL_mat(D),Mc))) for D in colourmats)
print("max [jActL colour, Mc] =",f"{colmax:.2e}"," (0 => Mc is COLOUR-neutral)")
# full gauge: which move it
print("[jActL DI,Mc]=",f"{np.max(np.abs(comm(jActL_mat(DI),Mc))):.3f}",
      " [jActL DJ,Mc]=",f"{np.max(np.abs(comm(jActL_mat(DJ),Mc))):.3f}",
      " [jActL DK,Mc]=",f"{np.max(np.abs(comm(jActL_mat(DK),Mc))):.3f}")
# DJ u1 nonzero?
print("DJ u1 =",DJ@u1," (nonzero => covariance teeth)")
# covariance formula check: [jActL DJ, Mc] == innerMul(slotA(DJ u1))(slotB 1) ?
Dju1=DJ@u1
McD=comm(Lop(slot((0,1),Dju1)),Lop(sB1))
print("covariance formula residual: max|[jActL DJ,Mc] - innerMul(slotA(DJ u1))(slotB1)| =",
      f"{np.max(np.abs(comm(jActL_mat(DJ),Mc)-McD)):.2e}")
# escape-gauge: Mc moves the diagonal Dg(0,0,1)? innerMul(slotA u1)(slotB1)(Dg001)=slotC(star u1)
Dg001=zero_mat(); Dg001[2,2]=I8[0]
McDg=mat_to_vec(  # apply Mc to Dg001 vector
    None) if False else Mc@mat_to_vec(Dg001)
print("Mc(Dg 0 0 1) nonzero? max =",f"{np.max(np.abs(McDg)):.3f}"," (moves diagonal => escapes gauge)")
