"""
N304 SELECT probe — DERIVE the theory-native next beat after N303 (fold-root complexification
of the mixing sector). Exact-Fraction octonion arithmetic (byte-for-byte the Lean CD product).

N303 banked ONE mixing plane: (A,B)->C, famMixJ_C = <famC,kAB>, square -16 on span{slotC 1,slotC u1}.
By S3 family symmetry there are THREE planes: (A,B)->C, (B,C)->A, (C,A)->B, each with its own
family generator famX and fold-root-dressed coset gen kXY, hence its own complex structure.

THEORY-NATIVE HYPOTHESES TO MEASURE (what the fold says comes next):
  (Q1) THE THREE COMPLEX STRUCTURES. Compute famMixJ_C=<famC,kAB>, famMixJ_A=<famA,kBC>,
       famMixJ_B=<famB,kCA>. Do the three, restricted to the mass module L0 (via A->Lmul A),
       form a QUATERNIONIC structure (J_A J_B = ±J_C etc.)? A quaternionic/octonionic rigid
       structure on the three generation-mixing planes would be a FORCED deep result and could
       seed forced mixing relations.
  (Q2) THE DISTINGUISHED-TEXTURE / S3-BREAKING QUESTION. Does ANY derived operator built from the
       banked sector FIX a distinguished mass-texture element (lift the isospectral degeneracy to
       a specific point)? Test the joint fixed space of famMixJ. Expected per N275: no fixed root
       in the family-symmetric part; but the complex structure eigenstructure may distinguish.
  (Q3) FORCED NUMBERS. famMixJ_C^2 = -16 (N303). Are famMixJ_A^2, famMixJ_B^2 also -16 (S3 says
       yes)? Is the "16" tied to a forced ratio? Test eigenvalues of the su(3)_flavour Cartan on
       the three generations (the weight structure of the fundamental 3).
  (Q4) THE su(3)_flavour CARTAN on L0. The rank-2 Cartan {famMixJ (a real generator now), a second
       diagonal} acts on the three matter slots. Its eigenvalues on the three slots = the weights
       of the 3. Are those weights (hence generation-distinguishing quantum numbers) forced?
"""
import numpy as np
from fractions import Fraction as F

# ---- exact Cayley-Dickson tower R -> C -> H -> O (matches Lean CD.mul/star) ----
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
I8=np.eye(8)
u1v=I8[1]
def zero_mat(): return np.zeros((3,3,8))
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def Lmul(A): return lambda X: jb_mat(A,X)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def jTr(M): return reQ(M[0,0])+reQ(M[1,1])+reQ(M[2,2])
def rtr(M): return jTr(M)
def one_oct():
    v=np.zeros(8); v[0]=1.0; return v
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a):
    M=zero_mat(); M[0,1]=a.copy(); M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b.copy(); M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c.copy(); M[2,1]=ostar(c); return M

one=one_oct()
# family generators (real-unit slots)
famA = innerMul(slotB(one), slotC(one))
famB = innerMul(slotC(one), slotA(one))
famC = innerMul(slotA(one), slotB(one))
# fold-root-dressed coset generators (u1-dressed slots), matching N292/303
kBC = innerMul(slotB(u1v), slotC(one))
kCA = innerMul(slotC(u1v), slotA(one))
kAB = innerMul(slotA(u1v), slotB(one))

def commutator(T,S): return lambda X: T(S(X)) - S(T(X))

# The three complex structures on their mixing planes (as endomorphisms of the arena)
famMixJ_C = commutator(famC, kAB)   # N303: on span{slotC 1, slotC u1}
famMixJ_A = commutator(famA, kBC)
famMixJ_B = commutator(famB, kCA)

print("="*74)
print("Q3 — the three complex structures each square to -16 on their plane?")
for lbl,J,slotf in [("C",famMixJ_C,slotC),("A",famMixJ_A,slotA),("B",famMixJ_B,slotB)]:
    v1 = slotf(one); vu = slotf(u1v)
    J2_1 = J(J(v1)); J2_u = J(J(vu))
    r1 = np.abs(J2_1 - (-16.0)*v1).max()
    ru = np.abs(J2_u - (-16.0)*vu).max()
    print("  famMixJ_%s^2(slot 1)=-16? resid=%.2e   ^2(slot u1)=-16? resid=%.2e"%(lbl,r1,ru))

print("="*74)
print("Q1 — DO THE THREE COMPLEX STRUCTURES FORM A QUATERNIONIC STRUCTURE on L0?")
print("     Test on the diagonal Cartan and slots: J_A J_B =? ±4 J_C etc.")
# Normalize to j = J/4 so j^2 = -1
def scale(T,s): return lambda X: s*T(X)
jA = scale(famMixJ_A, 0.25); jB = scale(famMixJ_B,0.25); jC = scale(famMixJ_C,0.25)
# test on a spread of arena elements
rng=np.random.default_rng(7)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M
tests=[slotA(one),slotB(one),slotC(one),slotA(u1v),slotB(u1v),slotC(u1v),Dg(1,-1,0),herm_rand()]
def close(T,S,name):
    m=0.0
    for X in tests: m=max(m,np.abs(T(X)-S(X)).max())
    print("   %-24s max resid=%.3e"%(name,m))
# quaternion candidates
close(lambda X: jA(jB(X)), jC, "jA jB = jC ?")
close(lambda X: jA(jB(X)), scale(jC,-1), "jA jB = -jC ?")
close(lambda X: jB(jA(X)), jC, "jB jA = jC ?")
close(lambda X: jB(jA(X)), scale(jC,-1), "jB jA = -jC ?")
# anticommutator
close(lambda X: jA(jB(X))+jB(jA(X)), lambda X: 0*X, "{jA,jB}=0 ?")

print("="*74)
print("Q4 — the su(3)_flavour CARTAN eigenvalues on the three generation slots (the weights).")
print("     famMixJ_C is a real Cartan generator (a REAL rotation in su(3)_flavour).")
print("     Its action on slotA/slotB/slotC (the three generations at fixed octonion value):")
for slotf,sname in [(slotA,"slotA"),(slotB,"slotB"),(slotC,"slotC")]:
    v = slotf(one)
    Jv = famMixJ_C(v)
    nz=[]
    for i in range(3):
        for j in range(3):
            if np.abs(Jv[i,j]).max()>1e-9: nz.append("(%d,%d):%s"%(i,j,np.round(Jv[i,j],3)))
    print("   famMixJ_C(%s 1) = %s"%(sname, "  ".join(nz) if nz else "0"))

print("="*74)
print("Q2 — DISTINGUISHED TEXTURE: does the joint action fix a specific mass-texture element?")
print("     Build the 26-dim traceless L0 (arena mod scalar) and find the joint kernel of the")
print("     family so(3) {famA,famB,famC} AND the coset {kAB,kBC,kCA} = the su(3)_flavour-invariants.")
# flatten arena element -> 27 real coords (3 diag reQ + 3 slots x 8)
def herm_to_vec(M):
    out=[]
    for i in range(3): out.append(reQ(M[i,i]))
    for (i,j) in [(0,1),(0,2),(1,2)]: out.extend(list(M[i,j]))
    return np.array(out)
def vec_to_herm(v):
    M=zero_mat()
    for i in range(3): M[i,i]=v[i]*I8[0]
    off=[(0,1),(0,2),(1,2)]
    for k,(i,j) in enumerate(off):
        a=v[3+8*k:3+8*k+8]; M[i,j]=a; M[j,i]=ostar(a)
    return M
gens = {"famA":famA,"famB":famB,"famC":famC,"kAB":kAB,"kBC":kBC,"kCA":kCA}
# build matrix of each generator on the 27-dim Hermitian space
def gen_matrix(T):
    cols=[]
    for c in range(27):
        v=np.zeros(27); v[c]=1.0
        M=vec_to_herm(v); TM=T(M)
        cols.append(herm_to_vec(TM))
    return np.array(cols).T  # 27x27
Mfam = np.vstack([gen_matrix(gens[g]) for g in ["famA","famB","famC"]])
Mall = np.vstack([gen_matrix(gens[g]) for g in gens])
def joint_kernel_dim(Mstack):
    # kernel of the stacked action = joint-invariant space
    u,s,vh = np.linalg.svd(Mstack)
    tol=1e-8*max(1.0,s.max())
    rank=int((s>tol).sum())
    return 27-rank
print("   joint-invariant dim under family so(3) {famA,famB,famC} = %d"%joint_kernel_dim(Mfam))
print("   joint-invariant dim under FULL su(3)_flavour (6 gens)   = %d"%joint_kernel_dim(Mall))
print("   (N290: family so(3) invariant core = scalar-unit line, dim 1 expected;")
print("    su(3)_flavour invariant = the S3-transitive result, dim 1 expected = NO distinguished texture.)")

print("="*74)
print("Q1b — the CLEAN quaternion test with signs from the three squares, on the fold-C-core slots.")
# apply jA to slotB(1) and slotB(u1) etc. -- map between planes
for lbl,J in [("jA",jA),("jB",jB),("jC",jC)]:
    print("  %s(slotA 1)->"%lbl, end=" ")
    for slotf,sname in [(slotA,"A"),(slotB,"B"),(slotC,"C")]:
        pass
    JA1=J(slotA(one)); nz=[]
    for i in range(3):
        for j in range(3):
            if np.abs(JA1[i,j]).max()>1e-9: nz.append("(%d,%d):%s"%(i,j,np.round(JA1[i,j],2)))
    print("  ".join(nz) if nz else "0")
