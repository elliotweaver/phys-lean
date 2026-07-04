"""
N288 — EXACT slot-action identities via the proven make_level (3-level) Fraction construction.
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
def madd(A,B):
    return {(i,j):O_add(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def msub(A,B):
    return {(i,j):O_sub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
def scal(A,r):
    def ts(z): return z*r if isinstance(z,F) else (ts(z[0]),ts(z[1]))
    return {k:ts(v) for k,v in A.items()}
def jprod(A,B): return madd(mmul(A,B),mmul(B,A))   # BANKED jb = A*B + B*A (NO 1/2)
def slot(i,j,x):
    return {(i,j):x,(j,i):ostar(x)}
def osc(z,r): return z*r if isinstance(z,F) else (osc(z[0],r),osc(z[1],r))
def Dg(d0,d1,d2):
    return {(0,0):osc(ONE,d0),(1,1):osc(ONE,d1),(2,2):osc(ONE,d2)}
def Lop(A,X): return jprod(A,X)
def innerMul(A,B,X): return msub(Lop(A,Lop(B,X)),Lop(B,Lop(A,X)))
sA1=slot(0,1,ONE); sB1=slot(0,2,ONE); sC1=slot(1,2,ONE)
def FC(X): return innerMul(sA1,sB1,X)
def FA(X): return innerMul(sB1,sC1,X)
def FB(X): return innerMul(sC1,sA1,X)
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
def show(M,label):
    parts=[]
    for i in range(3):
        for j in range(3):
            v=flat(mget(M,i,j))
            if v!=[F(0)]*8: parts.append(f"({i},{j})={[str(t) for t in v]}")
    print(f"  {label}: "+("; ".join(parts) if parts else "0"))
import random; random.seed(2)
x=unflat([F(random.randint(-3,3)) for _ in range(8)])
print("x =",[str(t) for t in flat(x)])
show(FC(slot(0,1,x)),"FC slotA(x)")
show(FC(slot(0,2,x)),"FC slotB(x)")
show(FC(slot(1,2,x)),"FC slotC(x)")
show(FC(Dg(F(1),F(2),F(5))),"FC Dg(1,2,5)")
print("FC slotA(x) == -slotB(x)? ", iszero(msub(FC(slot(0,1,x)),scal(slot(0,2,x),F(-1)))))
print("FC slotB(x) == +slotA(x)? ", iszero(msub(FC(slot(0,2,x)),slot(0,1,x))))
# exact slotC->diagonal and Dg->slotC forms (real part reQ = index-0 component)
rc=flat(x)[0]
show(FC(slot(1,2,x)),"FC slotC(x) [reQ(x)=%s]"%rc)
show(FC(Dg(F(1),F(0),F(0))),"FC Dg(1,0,0)")
show(FC(Dg(F(0),F(1),F(0))),"FC Dg(0,1,0)")
show(FC(Dg(F(0),F(0),F(1))),"FC Dg(0,0,1)")
# check FC slotC(c) == Dg(0, 2 reQ c, -2 reQ c)?  (guess)
test=msub(FC(slot(1,2,x)), {(1,1):osc(ONE,F(2)*rc),(2,2):osc(ONE,F(-2)*rc)})
print("FC slotC(x) == Dg(0, 2reQx, -2reQx)?", iszero(test))
def randHerm():
    M={}
    for i in range(3): M[(i,i)]=unflat([F(random.randint(-3,3))]+[F(0)]*7)
    for (i,j) in [(0,1),(0,2),(1,2)]:
        y=unflat([F(random.randint(-3,3)) for _ in range(8)]); M[(i,j)]=y; M[(j,i)]=ostar(y)
    return M
def findc(bracket_fn, target_fn):
    # find scalar c with bracket = c*target on Herm Y
    import itertools
    for _ in range(1):
        Y=randHerm()
        L=bracket_fn(Y); R=target_fn(Y)
        # pick first nonzero entry of R
        for i in range(3):
            for j in range(3):
                rv=flat(mget(R,i,j)); lv=flat(mget(L,i,j))
                for k in range(8):
                    if rv[k]!=0: return lv[k]/rv[k]
    return None
cFAB=findc(lambda Y: msub(FA(FB(Y)),FB(FA(Y))), FC)
print(f"[FA,FB] = {cFAB} * FC")
ok=all(iszero(msub(msub(FA(FB(Y:=randHerm())),FB(FA(Y))),scal(FC(Y),cFAB))) for _ in range(30))
print(f"[FA,FB] == {cFAB}*FC on Herm Y (all)?", ok)
ok2=all(iszero(msub(msub(FB(FC(Y:=randHerm())),FC(FB(Y))),scal(FA(Y),cFAB))) for _ in range(30))
print(f"[FB,FC] == {cFAB}*FA on Herm Y?", ok2)
ok3=all(iszero(msub(msub(FC(FA(Y:=randHerm())),FA(FC(Y))),scal(FB(Y),cFAB))) for _ in range(30))
print(f"[FC,FA] == {cFAB}*FB on Herm Y?", ok3)
