"""
N287 SELECT — step 9: identify the GAUGE-NEUTRAL room. Hypothesis: centralizer_{f4}(g2)=3
is the inner-derivation algebra of the REAL sub-arena J3(R) (real symmetric 3x3) = so(3).
Mechanism: innerMul(A,B) with A,B real-entried commutes with ALL gauge (D kills 1 => jAct D A=0).
Verify: (a) {innerMul(realHerm,realHerm)} spans a 3-dim space = centralizer_{f4}(g2);
        (b) it is so(3) (dim 3, simple, nonabelian, closes).
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
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')
def comm(X,Y): return X@Y-Y@X
def cent_basis(gens):
    big=[np.array([comm(f4basis[a],g).reshape(-1) for a in range(52)]).T for g in gens]
    _,sv,vv=np.linalg.svd(np.vstack(big)); r=int(np.sum(sv>1e-6*sv[0])); nc=vv[r:]
    return [sum(nc[t][a]*f4basis[a] for a in range(52)) for t in range(nc.shape[0])]
centg2=cent_basis(g2_lift)
print("dim centralizer_{f4}(g2) =",len(centg2))

# real sub-arena J3(R): real symmetric 3x3 -> basis: 3 diag + 3 off (real). innerMul of these.
def rmat(entrymap):
    M=zero_mat()
    for (i,j),val in entrymap.items():
        M[i,j]=M[i,j]+val*I8[0]
        if i!=j: M[j,i]=M[j,i]+val*I8[0]
    return M
realbasis=[rmat({(0,0):1}),rmat({(1,1):1}),rmat({(2,2):1}),
           rmat({(0,1):1}),rmat({(0,2):1}),rmat({(1,2):1})]
# collect innerMul over real-basis pairs
realinner=[]
for a in range(6):
    for b in range(a+1,6):
        X=innerMul(realbasis[a],realbasis[b])
        if np.max(np.abs(X))>1e-9: realinner.append(X)
RI=np.array([m.reshape(-1) for m in realinner])
print("nonzero real inner-derivations:",len(realinner)," span dim:",np.linalg.matrix_rank(RI,tol=1e-6))
# does span(real inner) == centralizer_{f4}(g2)?
CG=np.array([m.reshape(-1) for m in centg2])
both=np.vstack([RI,CG]); r=np.linalg.matrix_rank(both,tol=1e-6)
print("real-inner span == cent_{f4}(g2)? combined rank",r," (=3 means equal)")
# all real inner commute with g2?
print("real inner commute with ALL g2?",all(np.max(np.abs(comm(X,g)))<1e-7 for X in realinner for g in g2_lift))
# is the 3-dim real-inner algebra so(3) (simple, nonabelian)?
Q,_=np.linalg.qr(RI.T)
def resid(M): v=M.reshape(-1); return np.max(np.abs(v-Q@(Q.T@v)))
closed=max(resid(comm(realinner[a],realinner[b])) for a in range(len(realinner)) for b in range(len(realinner)))
nz=sum(1 for a in range(len(realinner)) for b in range(a+1,len(realinner)) if np.max(np.abs(comm(realinner[a],realinner[b])))>1e-6)
print("real-inner bracket-closed? resid",closed," nonzero brackets:",nz,"(nonabelian => so(3))")
