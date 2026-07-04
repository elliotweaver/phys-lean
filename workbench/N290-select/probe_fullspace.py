"""
N290 SELECT — full-space vs Hermitian joint kernel dims + confirm famX(1)=0.
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

# FULL 72-dim matrix space basis (9 positions x 8 octonion units)
def ebasis(k):
    v=[F(0)]*8; v[k]=F(1); return unflat(v)
FB_full=[]
for i in range(3):
    for j in range(3):
        for k in range(8):
            FB_full.append(({(i,j):ebasis(k)},i,j,k))
def vecfull(M):
    out=[]
    for i in range(3):
        for j in range(3):
            out.extend(flat(mget(M,i,j)))
    return out  # 72
def opfull(op):
    A=np.zeros((72,72))
    for c,(M,_,_,_) in enumerate(FB_full):
        col=vecfull(op(M))
        for r,val in enumerate(col): A[r,c]=float(val)
    return A
MA=opfull(FA); MB=opfull(FB); MC=opfull(FC)
print("FULL space (72-dim): dim joint ker {FA,FB,FC}:", 72-np.linalg.matrix_rank(np.vstack([MA,MB,MC])))
print("FULL space: dim joint ker {FA,FB}:", 72-np.linalg.matrix_rank(np.vstack([MA,MB])))
# identity matrix I = Dg 1 1 1
I3=Dg(F(1),F(1),F(1))
print("famA(I)=0?",iszero(FA(I3)),"famB(I)=0?",iszero(FB(I3)),"famC(I)=0?",iszero(FC(I3)))
# Is (1: Matrix) exactly Dg 1 1 1 = ocR(1)*id? yes, identity of matrix ring over O.
