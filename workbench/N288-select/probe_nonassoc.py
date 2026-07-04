"""
N288 FINAL tractability check: so(3) closure [FA,FB]=FC as FULL-space endomorphism over the
ACTUAL non-associative octonions (arbitrary X, not Herm). Exact Fractions.
Also test over sedenions CD(O) (non-alternative) to see if closure survives — if it holds over
BOTH, it's pure slot-combinatorics (needs neither associativity nor alternativity of entries).
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
Hl=make_level(*C); Ol=make_level(*Hl); Sl=make_level(*Ol)

def make_ring(level, dim):
    O_mul,O_star,O_add,O_sub=level
    def flat(z, d=dim):
        if d==1: return [z]
        (a,b)=z; return flat(a,d//2)+flat(b,d//2)
    def unflat(v, d=dim):
        if d==1: return v[0]
        return (unflat(v[:d//2],d//2), unflat(v[d//2:],d//2))
    ZERO=unflat([F(0)]*dim); 
    onev=[F(1)]+[F(0)]*(dim-1); ONE=unflat(onev)
    return O_mul,O_star,O_add,O_sub,flat,unflat,ZERO,ONE

def test(level, dim, label):
    omul,ostar,oadd,osub,flat,unflat,ZERO,ONE=make_ring(level,dim)
    def mget(M,i,j): return M.get((i,j),ZERO)
    def mmul(A,B):
        R={}
        for i in range(3):
            for j in range(3):
                acc=ZERO
                for k in range(3): acc=oadd(acc,omul(mget(A,i,k),mget(B,k,j)))
                R[(i,j)]=acc
        return R
    def madd(A,B): return {(i,j):oadd(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
    def msub(A,B): return {(i,j):osub(mget(A,i,j),mget(B,i,j)) for i in range(3) for j in range(3)}
    def jb(A,B): return madd(mmul(A,B),mmul(B,A))
    def slot(i,j,x): return {(i,j):x,(j,i):ostar(x)}
    def innerMul(A,B,X): return msub(jb(A,jb(B,X)),jb(B,jb(A,X)))
    sA1=slot(0,1,ONE);sB1=slot(0,2,ONE);sC1=slot(1,2,ONE)
    def FA(X): return innerMul(sB1,sC1,X)
    def FB(X): return innerMul(sC1,sA1,X)
    def FC(X): return innerMul(sA1,sB1,X)
    def iszero(M): return all(flat(mget(M,i,j))==[F(0)]*dim for i in range(3) for j in range(3))
    import random; random.seed(9)
    def randfull():
        M={}
        for i in range(3):
            for j in range(3): M[(i,j)]=unflat([F(random.randint(-3,3)) for _ in range(dim)])
        return M
    ok=all(iszero(msub(msub(FA(FB(X:=randfull())),FB(FA(X))),FC(X))) for _ in range(20))
    print(f"  {label} (dim {dim}): [FA,FB]==FC on arbitrary full X? {ok}")
    return ok

print("so(3) closure [FA,FB]=FC as full-space endomorphism:")
test(Hl, 4, "quaternions H (assoc)")
test(Ol, 8, "octonions O (non-assoc, alternative)")
test(Sl, 16, "sedenions S (non-alternative)")
