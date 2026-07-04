"""
N289 — full action table of FC, FA (and famB target) on the spanning family
{slotA a, slotB b, slotC c, Dg d0 d1 d2}, exact octonion Fractions.
Goal: identify each action as a slot expression so the bracket ⁅FC,FA⁆=FB
can be proved by LinearMap.ext on the spanning set, NO coordinate bash.
FC=innerMul(sA1,sB1), FA=innerMul(sB1,sC1), FB=innerMul(sC1,sA1).
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
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)
def FA(X): return innerMul(sB1,sC1,X)
def FB(X): return innerMul(sC1,sA1,X)
def FC(X): return innerMul(sA1,sB1,X)
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))

def slotA(x): return slot(0,1,x)
def slotB(x): return slot(0,2,x)
def slotC(x): return slot(1,2,x)
def show(name,M):
    # try to express M as combination of slotA/B/C(x) and Dg
    # print the nonzero upper entries
    parts=[]
    for (i,j) in [(0,1),(0,2),(1,2),(0,0),(1,1),(2,2)]:
        v=mget(M,i,j)
        if flat(v)!=[F(0)]*8:
            parts.append(f"({i}{j})={flat(v)}")
    print(f"  {name}: "+("  ".join(parts) if parts else "0"))

import random; random.seed(7)
a=unflat([F(random.randint(-4,4)) for _ in range(8)])
d0,d1,d2=F(random.randint(-3,3)),F(random.randint(-3,3)),F(random.randint(-3,3))
print(f"a flat = {flat(a)}")
print(f"Dg = ({d0},{d1},{d2})")
print("=== FC action ===")
show("FC slotA(a)  [expect -slotB a]", FC(slotA(a)))
show("FC slotB(a)  [expect +slotA a]", FC(slotB(a)))
show("FC slotC(a)  [?]", FC(slotC(a)))
show("FC Dg        [?]", FC(Dg(d0,d1,d2)))
print("=== FA action ===")
show("FA slotA(a)  [?]", FA(slotA(a)))
show("FA slotB(a)  [expect -slotC a]", FA(slotB(a)))
show("FA slotC(a)  [expect +slotB a]", FA(slotC(a)))
show("FA Dg        [?]", FA(Dg(d0,d1,d2)))
print("=== FB action (RHS target) ===")
show("FB slotA(a)", FB(slotA(a)))
show("FB slotB(a)", FB(slotB(a)))
show("FB slotC(a)", FB(slotC(a)))
show("FB Dg", FB(Dg(d0,d1,d2)))
print("=== reference slot entries ===")
show("slotA(a)", slotA(a)); show("slotB(a)", slotB(a)); show("slotC(a)", slotC(a))
print(f"star(a) flat = {flat(ostar(a))}")

# Now directly verify bracket on spanning set: [FC,FA] = FB on each generator
def br(f,g): return lambda X: msub(f(g(X)),g(f(X)))
BR=br(FC,FA)
print("=== bracket [FC,FA] vs FB on spanning set ===")
for nm,X in [("slotA(a)",slotA(a)),("slotB(a)",slotB(a)),("slotC(a)",slotC(a)),("Dg",Dg(d0,d1,d2))]:
    print(f"  [FC,FA]({nm}) == FB({nm})?", iszero(msub(BR(X),FB(X))))
