"""
N301 probe4 — the TRACE-POWER route to family spectrum-preservation (isospectrality)
routed through the JUST-BANKED N300 jTr-invariance (derH3 kills jTr).

Char-poly coefficients as trace-power polynomials (want to confirm numerically):
  jS(A) = (1/2)( jTr(A)^2 - jTr(A∘A) )
  jN(A) = (1/6)( jTr(A)^3 - 3 jTr(A) jTr(A∘A) + 2 jTr(A∘A∘A) )     [Jordan powers, ∘ symmetric]
where jTr is the REAL linear trace rtr = reQ∘trace, A∘B = (1/2) jb.

Then the CLEAN isospectrality argument (for T=famC a derivation, ∘=Jordan product):
  d/ds jTr((A+sTA)∘(A+sTA))|0 = 2 jTr(A∘TA) = jTr(T(A∘A)) = 0   (N300, A∘A Hermitian)
  d/ds jTr((A+sTA)^{∘3})|0    = 3 jTr(A∘A∘TA) = jTr(T(A∘A∘A)) = 0  (N300, if power-assoc gives T(A^3)=3 A^2∘TA)
so DjS[TA]=0 and DjN[TA]=0, i.e. famC preserves the whole spectrum.

MEASURES:
 (1) confirm the trace-power formulas for jS, jN numerically (vs banked jN/jS defs mimicked).
 (2) confirm T(A∘A) = 2 A∘TA  (derivation Leibniz for Jordan product), T=famC.
 (3) confirm T(A∘A∘A) = 3 (A∘A)∘TA  (needs power-associativity / Jordan), T=famC.
 (4) confirm jTr(A∘TA)=0 and jTr((A∘A)∘TA)=0 (the N300 killers at work).
 (5) full: DjS[famC A]=0, DjN[famC A]=0 for random Hermitian A (already ~0 in probe3 for jN).
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
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)     # jb = AB+BA
def jprod(A,B): return 0.5*jb_mat(A,B)                 # Jordan product A∘B
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def jTr(M): return reQ(M[0,0])+reQ(M[1,1])+reQ(M[2,2])   # rtr = reQ∘trace
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

def nrm_o(o): return reQ(omul(ostar(o),o))
def jN_direct(A):
    d0=reQ(A[0,0]); d1=reQ(A[1,1]); d2=reQ(A[2,2])
    x=A[0,1]; y=A[0,2]; z=A[1,2]
    tri = 2.0*reQ( omul(omul(x, z), ostar(y)) )
    return d0*d1*d2 - d0*nrm_o(z) - d1*nrm_o(y) - d2*nrm_o(x) + tri
def jS_direct(A):
    d0=reQ(A[0,0]); d1=reQ(A[1,1]); d2=reQ(A[2,2])
    x=A[0,1]; y=A[0,2]; z=A[1,2]
    return d0*d1+d0*d2+d1*d2 - nrm_o(x) - nrm_o(y) - nrm_o(z)

rng=np.random.default_rng(5)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M

# Jordan powers
def A2(A): return jprod(A,A)
def A3(A): return jprod(jprod(A,A),A)

A=herm_rand()
tA=jTr(A); tA2=jTr(A2(A)); tA3=jTr(A3(A))
jS_tp = 0.5*(tA*tA - tA2)
jN_tp = (1.0/6.0)*(tA**3 - 3*tA*tA2 + 2*tA3)
print("(1) jS: direct=%.4f  trace-power=%.4f  diff=%.2e" % (jS_direct(A), jS_tp, abs(jS_direct(A)-jS_tp)))
print("    jN: direct=%.4f  trace-power=%.4f  diff=%.2e" % (jN_direct(A), jN_tp, abs(jN_direct(A)-jN_tp)))

# (2) T(A∘A) = 2 A∘TA
TA=famC(A)
lhs2=famC(A2(A)); rhs2=2*jprod(A,TA)
print("(2) T(A∘A)=2 A∘TA           resid=%.2e" % float(np.abs(lhs2-rhs2).max()))

# (3) T(A∘A∘A) = 3 (A∘A)∘TA  ? test both this and TA∘A∘A + ... Leibniz forms
lhs3=famC(A3(A))
rhs3a=3*jprod(A2(A),TA)
rhs3b=jprod(jprod(TA,A),A)+jprod(jprod(A,TA),A)+jprod(jprod(A,A),TA)
print("(3a) T(A∘A∘A)=3 (A∘A)∘TA     resid=%.2e" % float(np.abs(lhs3-rhs3a).max()))
print("(3b) T(A∘A∘A)=Leibniz(3 terms) resid=%.2e" % float(np.abs(lhs3-rhs3b).max()))

# (4) jTr(A∘TA)=0 and jTr((A∘A)∘TA)=0  (the N300 killers, since these are (1/2)T(A^2) etc)
print("(4) jTr(A∘TA)=%.2e   jTr((A∘A)∘TA)=%.2e" % (jTr(jprod(A,TA)), jTr(jprod(A2(A),TA))))

# (5) DjS, DjN under famC via trace-power variation
def D_tracepow(A, TA):
    # d/ds jS,jN of trace-power form:  DjS = tA*jTr(TA) - jTr(A∘TA);  DjN=(1/6)(3tA^2 jTr(TA) -3 jTr(TA) tA2 -3 tA*2jTr(A∘TA) +2*3 jTr(A2∘TA))
    tTA=jTr(TA); tATA=jTr(jprod(A,TA)); tA2TA=jTr(jprod(A2(A),TA))
    DjS = tA*tTA - tATA
    DjN = (1.0/6.0)*(3*tA*tA*tTA - 3*tTA*tA2 - 3*tA*2*tATA + 2*3*tA2TA)
    return DjS, DjN
DjS,DjN = D_tracepow(A,TA)
print("(5) DjS[famC A]=%.2e   DjN[famC A]=%.2e  (via trace-power + jTr-killers)" % (DjS,DjN))
