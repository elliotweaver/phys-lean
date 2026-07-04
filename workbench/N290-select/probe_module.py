"""
N290 SELECT — measure the family-so(3) MODULE structure of the arena and the
so(3)-action on the inter-generation coupling. Reuses the exact-Fraction octonion
construction from N288.
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
Hl=make_level(*C); Ol=make_level(*Hl)
O_mul,O_star,O_add,O_sub=Ol
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
def scal(A,r):
    def ts(z): return z*r if isinstance(z,F) else (ts(z[0]),ts(z[1]))
    return {k:ts(v) for k,v in A.items()}
def jprod(A,B): return madd(mmul(A,B),mmul(B,A))   # BANKED jb = A*B + B*A
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2): return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def Lop(A,X): return jprod(A,X)
def innerMul(A,B,X): return msub(Lop(A,Lop(B,X)),Lop(B,Lop(A,X)))
sA1=slot(0,1,ONE); sB1=slot(0,2,ONE); sC1=slot(1,2,ONE)
def FC(X): return innerMul(sA1,sB1,X)   # famC
def FA(X): return innerMul(sB1,sC1,X)   # famA
def FB(X): return innerMul(sC1,sA1,X)   # famB
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
def show(M,label):
    parts=[]
    for i in range(3):
        for j in range(3):
            v=flat(mget(M,i,j))
            if v!=[F(0)]*8: parts.append(f"({i},{j})={[str(t) for t in v]}")
    print(f"  {label}: "+("; ".join(parts) if parts else "0"))

import random; random.seed(7)
x=unflat([F(random.randint(-4,4)) for _ in range(8)])
print("=== (1) ALL 9 fam-on-slot actions + fam-on-diagonal ===")
for (fn,fname) in [(FA,"FA"),(FB,"FB"),(FC,"FC")]:
    for (i,j,sname) in [(0,1,"slotA"),(0,2,"slotB"),(1,2,"slotC")]:
        show(fn(slot(i,j,x)), f"{fname}({sname}(x))")
    show(fn(Dg(F(1),F(2),F(5))), f"{fname}(Dg(1,2,5))")
    print()

print("=== (2) Is the coupling jb so(3)-INVARIANT via Leibniz? (famX derivation over jb) ===")
# derivation defect: famX(jb A B) - jb(famX A) B - jb A (famX B), on random Herm A,B
def randHerm():
    M={}
    for i in range(3): M[(i,i)]=unflat([F(random.randint(-3,3))]+[F(0)]*7)
    for (i,j) in [(0,1),(0,2),(1,2)]:
        y=unflat([F(random.randint(-3,3)) for _ in range(8)]); M[(i,j)]=y; M[(j,i)]=ostar(y)
    return M
for (fn,fname) in [(FA,"FA"),(FB,"FB"),(FC,"FC")]:
    ok=True
    for _ in range(20):
        A=randHerm(); B=randHerm()
        d=msub(msub(fn(jprod(A,B)), jprod(fn(A),B)), jprod(A,fn(B)))
        if not iszero(d): ok=False; break
    print(f"  {fname} is a derivation of jb (Leibniz holds)? {ok}")

print()
print("=== (3) so(3) action restricted to the coupling triangle: famX applied to jb(slotP)(slotQ) ===")
a=unflat([F(random.randint(-3,3)) for _ in range(8)]); b=unflat([F(random.randint(-3,3)) for _ in range(8)])
# coupling jb(slotA a)(slotB b) = slotC(star a * b); apply famC (which rotates slots) - Leibniz result
print("  jb(slotA a)(slotB b):"); show(jprod(slot(0,1,a),slot(0,2,b)),"   = slotC(star a * b)")
print("  FC(jb(slotA a)(slotB b)) [Leibniz]:"); show(FC(jprod(slot(0,1,a),slot(0,2,b)),),"   FC(coupling)")
print("  jb(FC slotA a)(slotB b)+jb(slotA a)(FC slotB b):")
show(madd(jprod(FC(slot(0,1,a)),slot(0,2,b)), jprod(slot(0,1,a),FC(slot(0,2,b)))),"   Leibniz RHS")

print()
print("=== (4) Casimir of family so(3) on the arena: (FA^2+FB^2+FC^2)(X) = c * X ? ===")
def cas(X): return madd(madd(FA(FA(X)),FB(FB(X))),FC(FC(X)))
# on each slot and diagonal, find the scalar
for (i,j,sname) in [(0,1,"slotA"),(0,2,"slotB"),(1,2,"slotC")]:
    X=slot(i,j,x); CX=cas(X)
    # try CX = r * X
    rv=flat(mget(X,i,j)); lv=flat(mget(CX,i,j))
    r=None
    for k in range(8):
        if rv[k]!=0: r=lv[k]/rv[k]; break
    diff = iszero(msub(CX,scal(X,r))) if r is not None else None
    show(CX, f"Casimir({sname}(x))")
    print(f"    Casimir on {sname} = {r} * {sname}? {diff}")
Xd=Dg(F(1),F(2),F(5)); CXd=cas(Xd)
show(CXd,"Casimir(Dg(1,2,5))")
