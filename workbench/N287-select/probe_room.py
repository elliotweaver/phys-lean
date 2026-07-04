"""
N287 SELECT — step 8: THE SHARP N283-DISSOLUTION MEASUREMENT.
N283 measured: joint centralizer of (su(2)_L + colour) in so(8) = 0 (INPUT A blocked).
Measure the SAME quantity in the derived f4=Der(H3(O)), and confirm the maximally-tractable
banked N286 witness M0 = innerMul(slotA 1, slotB 1) lives in it (commutes with the WHOLE gauge g2)
and is non-trivial (escapes g2 / moves diagonal).
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
def innerMul(A,B): return Lop(A)@Lop(B)-Lop(B)@Lop(A)
def jActL_mat(D):
    M=np.zeros((N,N))
    for a in range(N):
        Mb=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@Mb[i,j]
        M[:,a]=mat_to_vec(R)
    return M
g2_lift=[jActL_mat(D) for D in g2mats]
# colour + su(2)_L
DI,DJ,DK=adH(1),adH(2),adH(3)
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>1e-8))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]
colour_lift=[jActL_mat(D) for D in colourmats]
su2L=[jActL_mat(DI),jActL_mat(DJ),jActL_mat(DK)]
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')
def comm(X,Y): return X@Y-Y@X
def cent_dim(gens):
    big=[np.array([comm(f4basis[a],g).reshape(-1) for a in range(52)]).T for g in gens]
    _,sv,_=np.linalg.svd(np.vstack(big)); return 52-int(np.sum(sv>1e-6*sv[0]))
print("dim centralizer_{f4}(FULL g2, 14-dim) =",cent_dim(g2_lift),"(the fully gauge-invariant room)")
print("dim JOINT centralizer_{f4}(colour + su(2)_L) =",cent_dim(colour_lift+su2L),"(N283 measured 0 in so(8))")
print("dim centralizer_{f4}(colour) =",cent_dim(colour_lift))
print("dim centralizer_{f4}(su(2)_L) =",cent_dim(su2L))

# M0 = innerMul(slotA 1, slotB 1): slotA a=(0,1)=a, slotB b=(0,2)=b (Hermitian completion)
def slot(pos,a):
    M=zero_mat(); (i,j)=pos; M[i,j]=a; M[j,i]=ostar(a); return M
M0=innerMul(slot((0,1),I8[0]), slot((0,2),I8[0]))
print("\n=== M0 = innerMul(slotA 1, slotB 1) ===")
print("M0 nonzero?",np.max(np.abs(M0))>1e-9)
print("M0 commutes with FULL g2?",all(np.max(np.abs(comm(M0,g)))<1e-7 for g in g2_lift))
print("  -> M0 in joint centralizer(colour+su2L)?",
      all(np.max(np.abs(comm(M0,g)))<1e-7 for g in colour_lift+su2L))
# M0 escapes g2: not in span of g2_lift
G2=np.array([m.reshape(-1) for m in g2_lift]).T
sol,_,_,_=np.linalg.lstsq(G2,M0.reshape(-1),rcond=None)
print("M0 escapes g2 (not in jActL(g2) image)? residual",np.max(np.abs(G2@sol-M0.reshape(-1))))
# moves diagonal
def moves_diag(op):
    for i in range(3):
        db=mat_to_vec(slot((i,i),I8[0])) if i==0 else np.zeros(N)
    # simpler: apply to Dg(0,0,1)= diag with 1 at (2,2)
    d=zero_mat(); d[2,2]=I8[0]
    out=op@mat_to_vec(d)
    return np.max(np.abs(out[3:]))>1e-9  # any off-diagonal coord nonzero
print("M0 moves the diagonal (N286 escape certificate)?",moves_diag(M0))
