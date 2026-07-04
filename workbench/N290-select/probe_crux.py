"""
N290 SELECT — de-risk the ⊆ crux over the Hermitian octonion arena.
Confirm: (a) joint kernel of a PAIR {famA,famB} on the Hermitian arena is dim 1 (= span I);
(b) derivations kill the unit (famX(I)=0), so I is trivially IN the kernel (the easy ⊇);
(c) the exact entrywise constraints from famA M=0, famB M=0 on a general Hermitian M.
"""
from fractions import Fraction as F
import numpy as np
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
Hl=make_level(*C); Ol=make_level(*Hl)
O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
ZERO=unflat([F(0)]*8); ONE=unflat([F(1)]+[F(0)]*7)
def mget(M,i,j): return M.get((i,j),ZERO)
def mmul(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            acc=ZERO
            for k in range(3): acc=O_add(acc,O_mul(mget(A,i,k),mget(B,k,j)))
            R[(i,j)]=acc
    return R
def madd(A,B): return {(i,j):O_add(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def msub(A,B): return {(i,j):O_sub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def jprod(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,x): return {(i,j):x,(j,i):O_star(x)}
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
sA1=slot(0,1,ONE); sB1=slot(0,2,ONE); sC1=slot(1,2,ONE)
def FC(X): return msub(jprod(sA1,jprod(sB1,X)),jprod(sB1,jprod(sA1,X)))
def FA(X): return msub(jprod(sB1,jprod(sC1,X)),jprod(sC1,jprod(sB1,X)))
def FB(X): return msub(jprod(sC1,jprod(sA1,X)),jprod(sA1,jprod(sC1,X)))
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))

# general Hermitian M = Dg(d0,d1,d2) + slotA a + slotB b + slotC c
def Herm(d0,d1,d2,a,b,c):
    M=Dg(d0,d1,d2)
    for (i,j,x) in [(0,1,a),(0,2,b),(1,2,c)]:
        M[(i,j)]=O_add(mget(M,i,j),x); M[(j,i)]=O_add(mget(M,j,i),O_star(x))
    return M

# ---- (a) joint kernel of PAIR {famA,famB} on Hermitian arena, dim over Q ----
# 27 Hermitian basis: 3 diag reals + 3 slots x 8
def ebasis(k):
    v=[F(0)]*8; v[k]=F(1); return unflat(v)
HB=[]
for i in range(3):
    M={}; M[(i,i)]=ONE; HB.append(M)
for (i,j) in [(0,1),(0,2),(1,2)]:
    for k in range(8):
        HB.append(slot(i,j,ebasis(k)))
def vecify(M):
    out=[]
    for i in range(3): out.append(flat(mget(M,i,i))[0])
    for (i,j) in [(0,1),(0,2),(1,2)]: out.extend(flat(mget(M,i,j)))
    return out
def opmat(op):
    cols=[vecify(op(M)) for M in HB]
    A=np.zeros((27,27))
    for c,col in enumerate(cols):
        for r,val in enumerate(col): A[r,c]=float(val)
    return A
MA=opmat(FA); MB=opmat(FB); MC=opmat(FC)
for (nm,stack) in [("{FA}",MA),("{FA,FB}",np.vstack([MA,MB])),
                   ("{FA,FC}",np.vstack([MA,MC])),("{FA,FB,FC}",np.vstack([MA,MB,MC]))]:
    d=27-np.linalg.matrix_rank(stack)
    print(f"dim joint kernel on Hermitian arena, family={nm}: {d}")

# ---- (b) derivations kill the unit: famX(I)=0 ----
I3=Dg(F(1),F(1),F(1))
print("\nfamA(I)=0?",iszero(FA(I3)),"  famB(I)=0?",iszero(FB(I3)),"  famC(I)=0?",iszero(FC(I3)))

# ---- (c) exact constraints: on general Herm, what does famA M=0 & famB M=0 force? ----
import random; random.seed(11)
# apply the PAIR kernel projection: solve numerically then read structure
# Instead: symbolically inspect famA(Herm) and famB(Herm) with symbolic a,b,c,d
# Use a random Hermitian, show famA M, famB M forms:
d0,d1,d2=F(1),F(-2),F(3)
a=unflat([F(random.randint(-2,2)) for _ in range(8)])
b=unflat([F(random.randint(-2,2)) for _ in range(8)])
c=unflat([F(random.randint(-2,2)) for _ in range(8)])
M=Herm(d0,d1,d2,a,b,c)
def show(M,label):
    parts=[]
    for i in range(3):
        for j in range(3):
            v=flat(mget(M,i,j))
            if v!=[F(0)]*8: parts.append(f"({i},{j})={[str(t) for t in v]}")
    print(f"  {label}: "+("; ".join(parts) if parts else "0"))
print("\nGeneral Hermitian M with d=(1,-2,3), random a,b,c:")
show(FA(M),"FA(M)")
show(FB(M),"FB(M)")
show(FC(M),"FC(M)")
