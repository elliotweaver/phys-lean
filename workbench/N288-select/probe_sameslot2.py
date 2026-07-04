"""
N288 — exact same-slot jb products (needed for the rotation action proof) + the exact
so(3) closure form. jb=A*B+B*A banked convention.
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
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def show(M,label):
    parts=[]
    for i in range(3):
        for j in range(3):
            v=flat(mget(M,i,j))
            if v!=[F(0)]*8: parts.append(f"({i},{j})={[str(t) for t in v]}")
    print(f"  {label}: "+("; ".join(parts) if parts else "0"))
import random; random.seed(4)
a=unflat([F(random.randint(-3,3)) for _ in range(8)])
# same-slot products
show(jb(slot(0,1,ONE),slot(0,1,a)),"jb(slotA 1)(slotA a)")   # -> diagonal
show(jb(slot(0,2,ONE),slot(0,2,a)),"jb(slotB 1)(slotB a)")
show(jb(slot(1,2,ONE),slot(1,2,a)),"jb(slotC 1)(slotC a)")
# guess: jb(slotA 1)(slotA a) = Dg(2 reQ a, 2 reQ a, 0)?
ra=flat(a)[0]
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
print("jb(slotA1)(slotA a) = Dg(2reQa,2reQa,0)?", iszero(madd(jb(slot(0,1,ONE),slot(0,1,a)),osc_neg:=Dg(F(-2)*ra,F(-2)*ra,F(0)))))
