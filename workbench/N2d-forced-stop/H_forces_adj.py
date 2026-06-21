"""
Confirm the EXACT abstract Hcore I will prove, and that the anisotropy hypothesis
is the minimal honest extra input (derived on the cascade, not posited).

Abstract theorem (over [Ring A][StarRing A], A NOT assumed commutative):
  Hcore: (H: ∀ u v : CD A, Nrm(uv)=Nrm u·Nrm v)
       → (Aniso: ∀ v : CD A, Nrm v = 0 → v = 0)
       → ∀ x y : CD A, x·(star x·y) = iota(Nrm x)·y    [the scaling law]

Chain (each step verified earlier):
  Let L := x·(star x·y) − iota(Nrm x)·y.
  (1) adjoint:  bilin(uv,w) = bilin(v, star u·w)        [unconditional on CD A? NO -
      needs centrality. BUT over CD A with A a *-ring, is it unconditional?]
  ...
Re-examine: adjoint on CD A is unconditional EXACTLY when A's self-overlaps/traces
central. Over a general [Ring A] that's NOT automatic. So the abstract Hcore needs
'A self-overlaps central' too? Test: does adjoint on CD A hold for ALL associative A,
or only central ones? adj_level showed M2 (assoc, non-central) FAILS adjoint.
=> abstract Hcore over [Ring A] is FALSE without centrality (M2 witness, if H holds there).
Does H hold on CD M2? H_implies_adj showed CD M2: H FALSE. So M2 is excluded by H!

KEY QUESTION: does H (Nrm mult on CD A) by itself FORCE the adjoint (i.e. force the
centrality the adjoint needs)? If yes, abstract Hcore = H + Aniso => scaling, clean.
Test: across ALL associative *-ring bases A, is it true that (H on CD A) => (adjoint on CD A)?
"""
from fractions import Fraction as Fr
import random
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,rnd,eq,isz,name):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one
        s.rnd=rnd;s.eq=eq;s.isz=isz;s.name=name
    def sub(s,x,y): return s.add(x,s.neg(y))
Qb=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),
       lambda:Fr(random.randint(-3,3)),lambda a,b:a==b,lambda a:a==0,"Q")
def CDof(K,name=None):
    Z=(K.zero,K.zero)
    def add(z,w):return(K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z):return(K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return(K.sub(K.mul(a,c),K.mul(K.star(d),b)),K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z):return(K.star(z[0]),K.neg(z[1]))
    def rnd():return(K.rnd(),K.rnd())
    def eq(z,w):return K.eq(z[0],w[0]) and K.eq(z[1],w[1])
    def isz(z):return K.isz(z[0]) and K.isz(z[1])
    return Alg(add,neg,mul,star,Z,(K.one,K.zero),rnd,eq,isz,name or("CD("+K.name+")"))
def m_mul(a,b):return(a[0]*b[0]+a[1]*b[2],a[0]*b[1]+a[1]*b[3],a[2]*b[0]+a[3]*b[2],a[2]*b[1]+a[3]*b[3])
M2=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),m_mul,
       lambda a:(a[0],a[2],a[1],a[3]),(Fr(0),)*4,(Fr(1),Fr(0),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(4)),lambda a,b:a==b,
       lambda a:all(x==0 for x in a),"M2")
UT=Alg(lambda a,b:tuple(x+y for x,y in zip(a,b)),lambda a:tuple(-x for x in a),
       lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[2],a[2]*b[2]),lambda a:(a[2],-a[1],a[0]),
       (Fr(0),)*3,(Fr(1),Fr(0),Fr(1)),
       lambda:tuple(Fr(random.randint(-2,2)) for _ in range(3)),lambda a,b:a==b,
       lambda a:all(x==0 for x in a),"UT")
Dual=Alg(lambda a,b:(a[0]+b[0],a[1]+b[1]),lambda a:(-a[0],-a[1]),
         lambda a,b:(a[0]*b[0],a[0]*b[1]+a[1]*b[0]),lambda a:a,(Fr(0),Fr(0)),(Fr(1),Fr(0)),
         lambda:(Fr(random.randint(-3,3)),Fr(random.randint(-3,3))),lambda a,b:a==b,
         lambda a:all(x==0 for x in a),"Dual")
C=CDof(Qb,"C");H=CDof(C,"H");O=CDof(H,"O")
def Nrm(K,z):return K.mul(z,K.star(z))[0]
def bilin(K,x,y):return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
def H_holds(CDA,base,T=400,seed=1):
    random.seed(seed)
    for _ in range(T):
        x,y=CDA.rnd(),CDA.rnd()
        if not base.eq(Nrm(CDA,CDA.mul(x,y)),base.mul(Nrm(CDA,x),Nrm(CDA,y))):return False
    return True
def adjoint_holds(CDA,base,T=400,seed=2):
    random.seed(seed)
    for _ in range(T):
        u,v,w=CDA.rnd(),CDA.rnd(),CDA.rnd()
        if not base.eq(bilin(CDA,CDA.mul(u,v),w),bilin(CDA,v,CDA.mul(CDA.star(u),w))):return False
    return True
# Construct algebras where H holds but try to break adjoint:
# CD A for A in many bases; report (H, adjoint).
print("Searching for H-true & adjoint-false (would break clean abstract Hcore):")
panel=[("CD Q",CDof(Qb),Qb),("CD C",CDof(C),C),("CD H",CDof(H),H),("CD O",CDof(O),O),
       ("CD M2",CDof(M2),M2),("CD UT",CDof(UT),UT),("CD Dual",CDof(Dual),Dual),
       ("CD(CD M2)",CDof(CDof(M2)),CDof(M2)),("CD(CD UT)",CDof(CDof(UT)),CDof(UT))]
any_conflict=False
for nm,CDA,base in panel:
    h=H_holds(CDA,base);a=adjoint_holds(CDA,base)
    c="  <<< CONFLICT" if (h and not a) else ""
    if h and not a: any_conflict=True
    print(f"  {nm:11s}: H={str(h):5s} adjoint={str(a):5s}{c}")
print(f"\nAny H-true&adjoint-false: {any_conflict}")
print("If False => H FORCES the adjoint. Abstract Hcore = H + Aniso => scaling is clean")
print("(adjoint derived FROM H via the banked P-identities / brics, not posited).")
