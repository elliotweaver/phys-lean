"""
N288 de-risk: what is jb(slotA a)(slotA a')? (same-slot -> diagonal). And confirm the exact
rotation action forms needed for Lean:
  FC(slotA a) = ? ,  FC(slotB b) = ?,  FC(slotC c) = ?  (FC = innerMul(slotA 1)(slotB 1))
in the banked jb=A*B+B*A convention, symbolic in the octonion entry.
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
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); O_mul,O_star,O_add,O_sub=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
ZERO=unflat([F(0)]*8); ONE=unflat([F(1)]+[F(0)]*7)
def omul(x,y): return O_mul(x,y)
def ostar(x): return O_star(x)
def mget(M,i,j): return M.get((i,j),ZERO)
def mmul(A,B):
    R={}
    for i in range(3):
        for j in range(3):
            acc=ZERO
            for k in range(3): acc=O_add(acc,omul(mget(A,i,k),mget(B,k,j)))
            R[(i,j)]=acc
    return R
def madd(A,B): return {(i,j):O_add(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def msub(A,B): return {(i,j):O_sub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def jb(A,B): return madd(mmul(A,B),mmul(B,A))   # banked convention
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def Dg(d0,d1,d2):
    def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
    return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
def show(M,label):
    parts=[]
    for i in range(3):
        for j in range(3):
            v=flat(mget(M,i,j))
            if v!=[F(0)]*8: parts.append(f"({i},{j})={[str(t) for t in v]}")
    print(f"  {label}: "+("; ".join(parts) if parts else "0"))
import random; random.seed(5)
a=unflat([F(random.randint(-3,3)) for _ in range(8)])
b=unflat([F(random.randint(-3,3)) for _ in range(8)])
# same-slot jb
show(jb(slot(0,1,a),slot(0,1,b)),"jb(slotA a)(slotA b)")  # diagonal (0,0)+(1,1)?
# FC action
sA1=slot(0,1,ONE); sB1=slot(0,2,ONE)
def FC(X): return innerMul(sA1,sB1,X)
print("FC = innerMul(slotA 1)(slotB 1):")
show(FC(slot(0,1,a)),"FC slotA(a)")
show(FC(slot(0,2,a)),"FC slotB(a)")
show(FC(slot(1,2,a)),"FC slotC(a)")
show(FC(Dg(F(1),F(0),F(0))),"FC Dg(1,0,0)")
# exact identities:
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
print("FC slotA(a) = -slotB(a)?", iszero(msub(FC(slot(0,1,a)),{(0,2):lneg(a),(2,0):lneg(ostar(a))})))
print("FC slotB(a) = +slotA(a)?", iszero(msub(FC(slot(0,2,a)),slot(0,1,a))))
# FC slotC(a): to diagonal Dg(0, 2reQa, -2reQa)
ra=flat(a)[0]
print("FC slotC(a) = Dg(0,2reQa,-2reQa)?", iszero(msub(FC(slot(1,2,a)),Dg(F(0),F(2)*ra,F(-2)*ra))))
# FC Dg(d0,d1,d2) = slotC( (d2-d1) )?  (real)
print("FC Dg(0,1,0) = slotC(-1)?", iszero(msub(FC(Dg(F(0),F(1),F(0))),slot(1,2,lneg(ONE)))))
