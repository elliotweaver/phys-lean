"""
N289 STRUCTURAL REFRAME (W1 step 2): the real-unit slots have REAL (central) entries,
so the octonion non-associativity should NOT bite. Test the ASSOCIATIVE structural identity:

  innerMul A B (X) = [L_A,L_B](X) = K*X - X*K   where K = A*B - B*A (matrix commutator)

for A,B ∈ {sA1,sB1,sC1} (real-unit generator matrices). If TRUE full-space, then:
  FC = ad(Kc), Kc=[sA1,sB1];  FA = ad(Ka), Ka=[sB1,sC1];  FB = ad(Kb), Kb=[sC1,sA1]
and ⁅FC,FA⁆ = ad([Kc,Ka]) IF ad is a Lie hom (needs assoc of the 3x3 matrix mult on these).
Then closure ⇔ [Kc,Ka] = Kb  (a PURE matrix-commutator so(3), 0/1 entries — cheap!).

Also directly test:  ⁅FC,FA⁆(X) = [ [Kc,Ka], X ]  and  [Kc,Ka] = Kb.
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
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))    # matrix commutator
def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*8 for i in range(3) for j in range(3))
sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)

import random; random.seed(99)
def randO(): return unflat([F(random.randint(-5,5)) for _ in range(8)])
def randfull(): return {(i,j):randO() for i in range(3) for j in range(3)}

def ad(K,X): return msub(mmul(K,X),mmul(X,K))   # [K,X] = K*X - X*K

Kc=mcomm(sA1,sB1); Ka=mcomm(sB1,sC1); Kb=mcomm(sC1,sA1)
def show(name,M):
    parts=[f"({i}{j})={flat(mget(M,i,j))}" for i in range(3) for j in range(3) if flat(mget(M,i,j))!=[F(0)]*8]
    print(f"  {name}: "+("  ".join(parts) if parts else "0"))
print("=== matrix commutators of the real-unit slots ===")
show("Kc=[sA1,sB1]",Kc); show("Ka=[sB1,sC1]",Ka); show("Kb=[sC1,sA1]",Kb)

# TEST 1: innerMul A B (X) = ad(Kc, X) full-space?
print("\n=== TEST 1: FC(X) = [Kc,X] full-space? (associative structural form of innerMul) ===")
ok1=True
for t in range(6):
    X=randfull()
    FC=innerMul(sA1,sB1,X)
    if not iszero(msub(FC, ad(Kc,X))): ok1=False
print("  FC = ad(Kc) full-space?", ok1)
ok1b=True
for t in range(6):
    X=randfull()
    if not iszero(msub(innerMul(sB1,sC1,X), ad(Ka,X))): ok1b=False
print("  FA = ad(Ka) full-space?", ok1b)
ok1c=True
for t in range(6):
    X=randfull()
    if not iszero(msub(innerMul(sC1,sA1,X), ad(Kb,X))): ok1c=False
print("  FB = ad(Kb) full-space?", ok1c)

# TEST 2: matrix so(3): [Kc,Ka] = Kb ?
print("\n=== TEST 2: [Kc,Ka] = Kb (pure matrix commutator so(3)) ===")
show("[Kc,Ka]", mcomm(Kc,Ka))
print("  [Kc,Ka] == Kb?", iszero(msub(mcomm(Kc,Ka), Kb)))
print("  [Ka,Kb] == Kc?", iszero(msub(mcomm(Ka,Kb), Kc)))
print("  [Kb,Kc] == Ka?", iszero(msub(mcomm(Kb,Kc), Ka)))

# TEST 3: does ⁅FC,FA⁆(X) = ad([Kc,Ka], X) hold full-space? (ad Lie-hom on these gens)
print("\n=== TEST 3: ⁅FC,FA⁆(X) = [[Kc,Ka],X] full-space? ===")
def br(A,B,X): return msub(innerMul(*A,innerMul(*B,X)), innerMul(*B,innerMul(*A,X)))
ok3=True
KcKa=mcomm(Kc,Ka)
for t in range(6):
    X=randfull()
    L=br((sA1,sB1),(sB1,sC1),X)   # ⁅FC,FA⁆(X)
    R=ad(KcKa,X)
    if not iszero(msub(L,R)): ok3=False
print("  ⁅FC,FA⁆ = ad([Kc,Ka]) full-space?", ok3)
