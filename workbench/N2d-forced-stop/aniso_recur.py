"""
ANISOTROPY recursion structure — the genuine hard piece for Hcore.

Hcore chain (R=Nrm mult => Q=scaling): bilin(L(x,y),w)=0 for all w  [adjoint + P2].
To get L=0: set w=L -> bilin(L,L)=2*Nrm L=0 -> Nrm L=0 -> (ANISOTROPY) L=0.

So nondegeneracy REDUCES to anisotropy:  Nrm v = 0  =>  v = 0  on CD A.

Nrm_{CD A} z = z.re*star z.re + star z.im*z.im  (in base A).
For z=(a,b):  Nrm z = a*star a + star b * b.

Anisotropy recursion: Nrm_{CD A}(a,b)=0 => a=0 and b=0, GIVEN base A anisotropic
AND the two self-overlap terms a*star a, star b * b are "non-negative" so their
sum is 0 only if each is 0 (no cancellation). Bottoms out at Dbl Q ~ Q[i].

TEST over the cascade tower (bottom = Dbl Q ~ Q[i], star=conj):
  - is Nrm v always a SUM OF SQUARES of the flat Q-coords (=> >=0, =0 iff v=0)?
  - does a*star a + star b*b = 0 force a=0,b=0 at each rung?
"""
from fractions import Fraction as Fr
import random

# bottom = Dbl Q = Q[i], elements (x,y)=x+iy, star=(x,-y), mul complex
class Alg:
    def __init__(s, add, neg, mul, star, zero, one, rnd, eq, flat, name):
        s.add=add; s.neg=neg; s.mul=mul; s.star=star
        s.zero=zero; s.one=one; s.rnd=rnd; s.eq=eq; s.flat=flat; s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))

Dbl = Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]), lambda a:(-a[0],-a[1]),
          lambda a,b:(a[0]*b[0]-a[1]*b[1], a[0]*b[1]+a[1]*b[0]),
          lambda a:(a[0],-a[1]), (Fr(0),Fr(0)), (Fr(1),Fr(0)),
          lambda:(Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),
          lambda a,b:a==b, lambda a:[a[0],a[1]], "Dbl")

def CDof(K, name=None):
    Z=(K.zero,K.zero)
    def add(z,w): return (K.add(z[0],w[0]), K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]), K.neg(z[1]))
    def mul(z,w):
        a,b=z; c,d=w
        return (K.sub(K.mul(a,c), K.mul(K.star(d),b)),
                K.add(K.mul(d,a), K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]), K.neg(z[1]))
    def rnd(): return (K.rnd(), K.rnd())
    def eq(z,w): return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    def flat(z): return K.flat(z[0])+K.flat(z[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq,flat, name or ("CD("+K.name+")"))

H = CDof(Dbl,"H"); O = CDof(H,"O"); S = CDof(O,"S")
def iota(K,a): return (a, K.zero[0])
def Nrm(K,z): return K.mul(z,K.star(z))[0]  # in base

def nrm_is_sumsq(CDA, baseK, T=300, seed=1):
    # Nrm_{CDA} z is an element of baseK; project fully to Q and compare to sum of squares of flat coords
    random.seed(seed); ok=True
    for _ in range(T):
        z=CDA.rnd()
        n=Nrm(CDA,z)            # element of baseK
        # full real projection of n:
        nf=baseK.flat(n)
        nproj=nf[0]             # the "re...re" scalar; for a self-overlap it should be the sum of squares and rest 0
        coords=CDA.flat(z)
        ss=sum(c*c for c in coords)
        # check: n projects to (ss, 0,0,...)
        if nproj!=ss or any(c!=0 for c in nf[1:]):
            ok=False; break
    return ok

def aniso_step(CDA, baseK, T=400, seed=2):
    # Nrm_{CDA}(z)=0 (in base) => z=0 ?
    random.seed(seed); bad=0
    for _ in range(T):
        z=CDA.rnd()
        if baseK.eq(Nrm(CDA,z), baseK.zero) and not CDA.eq(z,CDA.zero):
            bad+=1
    return bad

print("=== Nrm is a sum of squares (projects to (ss,0,...)) ===")
for nm,CDA,base in (("H",H,Dbl),("O",O,H),("S",S,O)):
    print(f"  {nm}: Nrm = sum-of-squares: {nrm_is_sumsq(CDA,base)}")
print()
print("=== anisotropy at base-element level: Nrm v = 0 (in base) => v = 0 ===")
for nm,CDA,base in (("H",H,Dbl),("O",O,H),("S",S,O)):
    print(f"  {nm}: nonzero v with base-Nrm v = 0: {aniso_step(CDA,base)}/400")
print()
print("KEY: even at S (non-assoc), Nrm v=0 => v=0 (anisotropy survives -- it's about")
print("     the FORM, not associativity). So anisotropy holds on the WHOLE tower over Q,")
print("     and reduces by recursion to Dbl Q ~ Q[i]: x^2+y^2=0 => x=y=0.")
