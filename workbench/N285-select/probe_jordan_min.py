"""Minimal: is jb Jordan (jdef=0) on FULL M₃(O) vs Hermitian H₃(O)? Tiny entries, few trials."""
from fractions import Fraction as F
import random, sys
def R_mul(x,y): return x*y
def R_star(x): return x
def R_add(x,y): return x+y
def R_sub(x,y): return x-y
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    return lmul,lstar
def neg_gen():
    def n(z): return (n(z[0]),n(z[1])) if isinstance(z,tuple) else -z
    return n
lneg=neg_gen()
C_mul,C_star=make_level(R_mul,R_star,R_add,R_sub)
H_mul,H_star=make_level(C_mul,C_star,R_add,R_sub)
O_mul,O_star=make_level(H_mul,H_star,R_add,R_sub)
def Ozero(): return (((F(0),F(0)),(F(0),F(0))),((F(0),F(0)),(F(0),F(0))))
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd;return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v;return (((a,b),(c,d)),((e,f),(g,h)))
def O_add(z,w): return unflat([x+y for x,y in zip(flat(z),flat(w))])
def O_sub(z,w): return unflat([x-y for x,y in zip(flat(z),flat(w))])
def Orand(): return unflat([F(random.randint(-1,1)) for _ in range(8)])
N=3
def Mzero(): return [[Ozero() for _ in range(N)] for _ in range(N)]
def Madd(A,B): return [[O_add(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Msub(A,B): return [[O_sub(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Mmul(A,B):
    C=Mzero()
    for i in range(N):
        for j in range(N):
            acc=Ozero()
            for k in range(N): acc=O_add(acc,O_mul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def jb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def jdef(A,B): return Msub(jb(jb(A,B),jb(A,A)), jb(A,jb(B,jb(A,A))))
def Mrand(): return [[Orand() for _ in range(N)] for _ in range(N)]
def Mherm():
    A=Mzero()
    for i in range(N): A[i][i]=unflat([F(random.randint(-1,1))]+[F(0)]*7)
    for i in range(N):
        for j in range(i+1,N):
            o=Orand(); A[i][j]=o; A[j][i]=O_star(o)
    return A
def is0(A): return all(all(x==0 for x in flat(A[i][j])) for i in range(N) for j in range(N))
random.seed(7)
ff=sum(0 if is0(jdef(Mrand(),Mrand())) else 1 for _ in range(6))
print(f"FULL M3(O): {ff}/6 general pairs jdef!=0 => jb {'NOT' if ff>0 else 'IS'} Jordan on full space"); sys.stdout.flush()
fh=sum(0 if is0(jdef(Mherm(),Mherm())) else 1 for _ in range(6))
print(f"HERM H3(O): {fh}/6 Hermitian pairs jdef!=0 => jb IS {'NOT ' if fh>0 else ''}Jordan on H3(O)"); sys.stdout.flush()
