"""
N301 probe3 — is the family generator SPECTRUM-PRESERVING (isospectral)?
If famC in f4=Der(J3O) infinitesimally preserves the cubic norm jN, then the
family rotation carrying Dg t (diagonal, mass-eigenbasis) to slotC (off-diagonal,
mixed) is an ISOSPECTRAL deformation: mixing WITHOUT changing masses. Measure:
  d/ds jN(A + s*famC(A))|_0  = 0 ?   for A = Dg t and general Hermitian A.
Also confirm the family so(3) module structure of L0 (the two sectors are one orbit).
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
I8=np.eye(8)
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
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a):
    M=zero_mat(); M[0,1]=a.copy(); M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b.copy(); M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c.copy(); M[2,1]=ostar(c); return M
famC = innerMul(slotA(one_oct()), slotB(one_oct()))

# cubic norm jN on H3(O): N(Hm) = d0 d1 d2 - (d0|a3|^2 + d1|a2|^2 + d2|a1|^2) + 2 Re(a1 a2 a3)
# with matrix entries (0,1)=a3? Use the standard Freudenthal reduced determinant for Hermitian:
# For A hermitian with diag (d0,d1,d2), off (0,1)=x, (0,2)=y, (1,2)=z:
#   N = d0 d1 d2 - d0*|z|^2 - d1*|y|^2 - d2*|x|^2 + 2 Re( (x) (z) (ybar) ) ... use trace form.
# Simpler: jN(A) = (1/6)[ (tr A)^3 - 3 tr A tr(A^2) + 2 tr(A^3) ]-style via Jordan powers is messy for octonions.
# Use the explicit formula (Freudenthal): N(A)= d0 d1 d2 - sum_i d_i * n(alpha_i) + 2 Re( alpha1 (alpha2 alpha3) )
# where alpha1=(1,2)=z, alpha2=(0,2)=y? Convention: N = d0 d1 d2 - d0 n(z) - d1 n(y) - d2 n(x) + 2 Re(x*(y*z-ish))
def nrm_o(o): return reQ(omul(ostar(o),o))
def reo(o): return reQ(o)
def jN(A):
    d0=reQ(A[0,0]); d1=reQ(A[1,1]); d2=reQ(A[2,2])
    x=A[0,1]; y=A[0,2]; z=A[1,2]  # x@(01), y@(02), z@(12)
    # Freudenthal reduced norm for H3(O):
    #   N = d0 d1 d2 - d0*n(z) - d1*n(y) - d2*n(x) + 2*Re( conj? ) ... trilinear term Re(x * (z_conj? ) )
    # The correct trilinear: 2 Re( x_{01} * x_{12} * x_{20} ) where x_{20}=conj(y). i.e. 2 Re( (x)(z)(conj y) )
    tri = 2.0*reQ( omul(omul(x, z), ostar(y)) )
    return d0*d1*d2 - d0*nrm_o(z) - d1*nrm_o(y) - d2*nrm_o(x) + tri

rng=np.random.default_rng(3)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

# infinitesimal preservation: (d/ds) jN(A + s D(A)) at s=0, D=famC
def dir_deriv(A, DA, h=1e-6):
    return (jN(A + h*DA) - jN(A - h*DA))/(2*h)

print("Is famC (family generator, inner derivation in f4) infinitesimally jN-preserving?")
for lbl,A in [("Dg(2,-3,5)",Dg(2,-3,5)),("Dg(1,1,-2)",Dg(1,1,-2)),("rand herm #1",herm_rand()),("rand herm #2",herm_rand())]:
    DA = famC(A)
    print("  A=%-14s  d/ds jN(A+s famC(A))|0 = %.3e   (jN(A)=%.3f)" % (lbl, dir_deriv(A,DA), jN(A)))

# Also confirm entrywise-gauge check reference: jN of Dg t = product t0 t1 t2
print()
print("sanity jN(Dg(2,-3,5)) = %.1f (should be %.1f)" % (jN(Dg(2,-3,5)), 2*-3*5))
print("sanity jN(0;0;0; slot A=1,B=1,C=1) cross =", jN(slotA(one_oct())+slotB(one_oct())+slotC(one_oct())))
