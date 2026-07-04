"""
N288 — confirm FA, FB rotation actions (cyclic) and FA,FB,FC linear independence, exact.
FA=innerMul(slotB1,slotC1), FB=innerMul(slotC1,slotA1), FC=innerMul(slotA1,slotB1).
"""
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
Cx=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cx); Ol=make_level(*Hl); O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
ZERO=unflat([F(0)]*8); ONE=unflat([F(1)]+[F(0)]*7)
def ostar(x): return O_star(x)
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
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)
def FA(X): return innerMul(sB1,sC1,X)
def FB(X): return innerMul(sC1,sA1,X)
def FC(X): return innerMul(sA1,sB1,X)
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
import random; random.seed(11)
a=unflat([F(random.randint(-4,4)) for _ in range(8)])
# FC: slotA->-slotB, slotB->slotA (gens 1,2)
# FA: rotates slotB<->slotC (gens 0? indices: FA=inner(slotB,slotC), rotates 0-index... check)
print("FA action:")
print("  FA slotB(a)=-slotC(a)?", iszero(msub(FA(slot(0,2,a)),{(1,2):lneg(a),(2,1):lneg(ostar(a))})))
print("  FA slotC(a)=+slotB(a)?", iszero(msub(FA(slot(1,2,a)),slot(0,2,a))))
print("FB action:")
print("  FB slotC(a)=-slotA(a)?", iszero(msub(FB(slot(1,2,a)),{(0,1):lneg(a),(1,0):lneg(ostar(a))})))
print("  FB slotA(a)=+slotC(a)?", iszero(msub(FB(slot(0,1,a)),slot(1,2,a))))
# linear independence: evaluate all three on slotA(a); collect result vectors
def vecof(M):
    out=[]
    for i in range(3):
        for j in range(3): out+=flat(mget(M,i,j))
    return out
import numpy as np
sA=slot(0,1,a); sB=slot(0,2,a); sC=slot(1,2,a)
rows=[]
for Fm in [FA,FB,FC]:
    rows.append(vecof(Fm(sA))+vecof(Fm(sB))+vecof(Fm(sC)))
M=np.array(rows,dtype=float)
print("\nrank[FA,FB,FC] (on slotA,slotB,slotC eval) =", np.linalg.matrix_rank(M), "(3 = lin indep)")
