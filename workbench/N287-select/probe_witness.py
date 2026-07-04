"""
N287 SELECT — step 6: find EXPLICIT colour-commuting witnesses for tractable Lean scope.
The 2nd su(3)=centralizer of colour lives in the inner-derivation complement f4/g2.
Find concrete inner-derivation elements innerMul(A,B)=[L_A,L_B] (L_A X = jb A X) that commute
with all of colour, and whether a small set forms a nonabelian su(2) (structure constants).
Also: verify the 2nd su(3) is DISJOINT from jActL(g2) (genuinely in the complement, not gauge).
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
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
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
u1=I8[1]
crow=np.array([[ (g2mats[k]@u1)[i] for k in range(14)] for i in range(8)])
_,cs2,cv=np.linalg.svd(crow); cr=int(np.sum(cs2>1e-8))
colourmats=[sum(cv[r][k]*g2mats[k] for k in range(14)) for r in range(cr,14)]

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
# full-matrix (non-Hermitian) basis for L_A operators on 27 Hermitian arena? innerMul preserves Herm.
# Represent operators as 27x27 on the Hermitian arena via mat_to_vec / vec_to_mat.
def vec_to_mat(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    idx=3
    for (i,j) in pairs:
        for c in range(8): M[i,j]+=v[idx]*I8[c]; M[j,i]+=v[idx]*ostar(I8[c]); idx+=1
    return M
def Lop(A):  # L_A X = jb(A,X) as 27x27 (A Hermitian)
    M=np.zeros((N,N))
    for a in range(N):
        M[:,a]=mat_to_vec(jb(A,arena_basis[a]))
    return M
def innerMul(A,B):
    LA=Lop(A); LB=Lop(B); return LA@LB-LB@LA
def jActL_mat(D):
    M=np.zeros((N,N))
    for a in range(N):
        Mb=arena_basis[a]; R=zero_mat()
        for i in range(3):
            for j in range(3): R[i,j]=D@Mb[i,j]
        M[:,a]=mat_to_vec(R)
    return M
colour_lift=[jActL_mat(D) for D in colourmats]
g2_lift=[jActL_mat(D) for D in g2mats]
f4basis=np.load('/Users/elliotweaver/phys-lean/workbench/N287-select/f4basis.npy')
def comm(X,Y): return X@Y-Y@X

# centralizer of colour in f4 -> basis (2nd su3)
def centralizer_basis(gens):
    big=[np.array([comm(f4basis[a],g).reshape(-1) for a in range(52)]).T for g in gens]
    Mbig=np.vstack(big); _,sv,vv=np.linalg.svd(Mbig); r=int(np.sum(sv>1e-6*sv[0]))
    nc=vv[r:]
    return [sum(nc[t][a]*f4basis[a] for a in range(52)) for t in range(nc.shape[0])]
su3ew=centralizer_basis(colour_lift)
print("dim su3ew(cent of colour) =",len(su3ew))

# Is su3ew disjoint from g2-lift? (i.e. entirely in inner-derivation complement)
G2=np.array([m.reshape(-1) for m in g2_lift])       # 14 x 729
SE=np.array([m.reshape(-1) for m in su3ew])         # 8 x 729
both=np.vstack([G2,SE]); r=np.linalg.matrix_rank(both,tol=1e-6)
print("g2(14) + su3ew(8): combined rank",r," intersection dim",14+8-r,"(0 => su3ew fully in complement)")

# find explicit inner-derivation witnesses commuting with colour
# innerMul(slot pairs). slotA a = E00 with octonion a on (0,0)? Use arena diag/off basis.
# Try innerMul of pairs of arena basis elements; collect those commuting with colour.
found=[]
labels=[]
cand=[]
for a in range(N):
    for b in range(a+1,N):
        X=innerMul(arena_basis[a],arena_basis[b])
        if np.max(np.abs(X))<1e-9: continue
        cand.append((a,b,X))
print("nonzero innerMul candidates:",len(cand))
# which commute with all colour?
commuting=[(a,b,X) for (a,b,X) in cand if all(np.max(np.abs(comm(X,g)))<1e-7 for g in colour_lift)]
print("innerMul(basis,basis) commuting with ALL colour:",len(commuting))
for (a,b,X) in commuting[:12]:
    print("   pair",(a,b),"in su3ew? resid",np.max(np.abs(X.reshape(-1)-np.linalg.lstsq(SE.T,X.reshape(-1),rcond=None)[0]@SE)))
