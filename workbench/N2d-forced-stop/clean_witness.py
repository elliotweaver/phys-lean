"""
N2d-hard-backward — THE CLEAN STRUCTURED WITNESS over the real non-associative base.

From defect_assoc.py: for x=(0,a), y=(0,b) in CD A with a,b IMAGINARY (a*=-a),
   defect D = Nrm(xy)-Nrm(x)Nrm(y) = (b·a)·(a·b) - n_a·n_b      (in A)
where n_a = a·a* central. Over an ASSOCIATIVE base this is 0; over a NON-associative
base it can be nonzero. Test on A = octonions O = CD(H): does there exist an imaginary
pair a,b in O making D != 0? If yes, x=(0,a),y=(0,b) is a clean generic witness for
"A non-associative => Nrm not multiplicative on CD A."

Crucially: also test whether the SAME a,b that fail to associate (some triple) give D!=0,
and how to connect "exists non-assoc triple" to "exists D!=0".
"""
from fractions import Fraction as Fr
import itertools, random

# Octonions O = CD(H), H = CD(C), C = CD(R). Build the full tower over Q.
def Rmul(a,b): return a*b
def Radd(a,b): return a+b
def Rneg(a): return -a
def Rstar(a): return a
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(Radd,Rneg,Rmul,Rstar,Fr(0),Fr(1),1)
def CD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,Z,one,2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H)   # dims 2,4,8
def flat(z,K):
    if K.dim==1: return [z]
    half=K  # need sub-structure; rebuild via recursion using known towers
# simpler: flatten by recursion with explicit tower
def flatten(z):
    # z is nested pair; flatten to list of Fr
    if isinstance(z,Fr) or isinstance(z,int): return [Fr(z)]
    return flatten(z[0])+flatten(z[1])
def Ostar(z): return O.star(z)
def imag_rand():
    # random imaginary octonion: 8 coords, real part 0
    v=[Fr(random.randint(-3,3)) for _ in range(8)]
    v[0]=Fr(0)
    # rebuild nested
    def build(vs):
        if len(vs)==1: return vs[0]
        h=len(vs)//2
        return (build(vs[:h]),build(vs[h:]))
    return build(v)
def Nrm_base(a):  # a*a* in O (central scalar): returns octonion
    return O.mul(a,O.star(a))
# CD over O for the witness x=(0,a),y=(0,b)
COA=CD(O)
def witness_defect(a,b):
    x=(O.zero,a); y=(O.zero,b)
    nxy=COA.mul(COA.mul(x,y),COA.star(COA.mul(x,y)))[0]  # Nrm(xy) in O
    nx=O.mul(x[0:1] and a or a, O.star(a)) if False else COA.mul(x,COA.star(x))[0]
    ny=COA.mul(y,COA.star(y))[0]
    return O.sub(nxy, O.mul(nx,ny))

random.seed(3)
bites=0; tested=0; examples=[]
for _ in range(2000):
    a=imag_rand(); b=imag_rand()
    d=witness_defect(a,b)
    tested+=1
    fd=flatten(d)
    if any(x!=0 for x in fd):
        bites+=1
        if len(examples)<3: examples.append((flatten(a),flatten(b),fd))
print(f"x=(0,a),y=(0,b) over O: defect != 0 in {bites}/{tested} random imaginary pairs")
for fa,fb,fd in examples:
    print(f"  a={fa}\n  b={fb}\n  D={fd}\n")
