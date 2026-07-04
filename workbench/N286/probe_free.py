"""N286 freeness test only — few sedenion trials."""
from fractions import Fraction as F
import random
def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    def lstar(z):
        (a, b) = z; return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w; return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w; return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub
def neg_gen():
    def n(z): return (n(z[0]), n(z[1])) if isinstance(z, tuple) else -z
    return n
lneg = neg_gen()
C=make_level(lambda x,y:x*y, lambda x:x, lambda x,y:x+y, lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); Sl=make_level(*Ol)
S_mul,S_star,S_add,S_sub = Sl
N=3
def Szero(): 
    z=F(0)
    o=(((z,z),(z,z)),((z,z),(z,z)))
    return (o,o)
def flat8(z):
    ((za,zb),(zc,zd))=z; (a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd; return [a,b,c,d,e,f,g,h]
def unflat8(v): a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def Sflat(z): return flat8(z[0])+flat8(z[1])
def Sunflat(v): return (unflat8(v[:8]), unflat8(v[8:]))
def Srand(): return Sunflat([F(random.randint(-2,2)) for _ in range(16)])
def SMzero(): return [[Szero() for _ in range(N)] for _ in range(N)]
def SMadd(A,B): return [[S_add(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def SMsub(A,B): return [[S_sub(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def SMsmul(c,A): return [[Sunflat([c*x for x in Sflat(A[i][j])]) for j in range(N)] for i in range(N)]
def SMmul(A,B):
    Cc=SMzero()
    for i in range(N):
        for j in range(N):
            acc=Szero()
            for k in range(N): acc=S_add(acc,S_mul(A[i][k],B[k][j]))
            Cc[i][j]=acc
    return Cc
def SMflat(A):
    v=[]
    for i in range(N):
        for j in range(N): v.extend(Sflat(A[i][j]))
    return v
def SMis_zero(A): return all(x==0 for x in SMflat(A))
def Sjb(A,B): return SMadd(SMmul(A,B),SMmul(B,A))
def Sjdef(A,B):
    AA=Sjb(A,A); return SMsub(Sjb(Sjb(A,B),AA), Sjb(A,Sjb(B,AA)))
def Sderiv_defect(A,B,X,Y):
    D=lambda Z: SMsub(Sjb(A,Sjb(B,Z)), Sjb(B,Sjb(A,Z)))
    return SMsub(D(Sjb(X,Y)), SMadd(Sjb(D(X),Y), Sjb(X,D(Y))))
def SSsum(*a):
    acc=SMzero()
    for x in a: acc=SMadd(acc,x)
    return acc
def SPolJ(u,v,w,t):
    return SMsub(
        SSsum(Sjdef(SSsum(u,v,w),t), Sjdef(u,t), Sjdef(v,t), Sjdef(w,t)),
        SSsum(Sjdef(SSsum(u,v),t), Sjdef(SSsum(u,w),t), Sjdef(SSsum(v,w),t)))
def SMrand(): return [[Srand() for _ in range(N)] for _ in range(N)]
random.seed(7)
bad=0
T=12
for _ in range(T):
    A,B,X,Y=SMrand(),SMrand(),SMrand(),SMrand()
    d=Sderiv_defect(A,B,X,Y)
    rhs=SMsub(SMsmul(F(1,2),SPolJ(B,X,Y,A)), SMsmul(F(1,2),SPolJ(A,X,Y,B)))
    if not SMis_zero(SMsub(d,rhs)): bad+=1
print(f"[FREENESS via SEDENIONS] mismatches: {bad}/{T}")
print(">>> FREE NonAssocRing identity (abel-provable)" if bad==0 else ">>> NOT free; O-specific")
