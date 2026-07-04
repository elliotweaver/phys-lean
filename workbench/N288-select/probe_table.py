"""Full action table: FA,FB,FC on slotA(x),slotB(x),slotC(x),Dg — exact forms in banked jb convention."""
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
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)
def FA(X): return innerMul(sB1,sC1,X)
def FB(X): return innerMul(sC1,sA1,X)
def FC(X): return innerMul(sA1,sB1,X)
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
import random; random.seed(1)
x=unflat([F(random.randint(-3,3)) for _ in range(8)])
rx=flat(x)[0]
sA=slot(0,1,x);sB=slot(0,2,x);sC=slot(1,2,x)
def match(M,cands):
    for name,C in cands:
        if iszero(msub(M,C)): return name
    return "OTHER: "+str({k:flat(v) for k,v in M.items() if flat(v)!=[F(0)]*8})
cands=[("+slotA(x)",sA),("-slotA(x)",slot(0,1,lneg(x))),("+slotB(x)",sB),("-slotB(x)",slot(0,2,lneg(x))),
       ("+slotC(x)",sC),("-slotC(x)",slot(1,2,lneg(x))),("0",{}),
       ("Dg(0,2rx,-2rx)",Dg(F(0),F(2)*rx,F(-2)*rx)),("Dg(2rx,-2rx,0)",Dg(F(2)*rx,F(-2)*rx,F(0))),
       ("Dg(-2rx,0,2rx)",Dg(F(-2)*rx,F(0),F(2)*rx)),("Dg(2rx,0,-2rx)",Dg(F(2)*rx,F(0),F(-2)*rx)),
       ("Dg(0,-2rx,2rx)",Dg(F(0),F(-2)*rx,F(2)*rx)),("Dg(-2rx,2rx,0)",Dg(F(-2)*rx,F(2)*rx,F(0)))]
print("ACTION TABLE (banked jb, on slotX(x)):")
for fn,fname in [(FA,"FA"),(FB,"FB"),(FC,"FC")]:
    print(f"  {fname}: slotA->{match(fn(sA),cands)}; slotB->{match(fn(sB),cands)}; slotC->{match(fn(sC),cands)}")
# Dg action:
D=Dg(F(1),F(2),F(5))
dcands=[("slotA((d1-d0))",slot(0,1,osc(ONE,F(2-1)))),("slotB((d2-d0))",slot(0,2,osc(ONE,F(5-1)))),
        ("slotC((d2-d1))",slot(1,2,osc(ONE,F(5-2)))),("slotC(-(d2-d1))",slot(1,2,osc(ONE,F(-(5-2))))),
        ("slotB(-(d2-d0))",slot(0,2,osc(ONE,F(-(5-1))))),("slotA(-(d1-d0))",slot(0,1,osc(ONE,F(-(2-1))))),("0",{})]
for fn,fname in [(FA,"FA"),(FB,"FB"),(FC,"FC")]:
    print(f"  {fname}: Dg(1,2,5)->{match(fn(D),dcands)}")
