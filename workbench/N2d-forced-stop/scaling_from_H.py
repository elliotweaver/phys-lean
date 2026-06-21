# Does H (Nrm mult on CD A) force the scaling law, and how short is the proof?
# Test the chain: bilin(L(x,y),w)=0 (via P2+adj+iota), then nondegeneracy => L=0.
# Key sub-question for SCOPE: is nondegeneracy of bilin on CD A reducible to base,
# i.e. does "bilin v w = 0 for all w" imply v=0 on CD A, by reduction to base form?
from fractions import Fraction as Fr
import random
class Alg:
    def __init__(s,add,neg,mul,star,zero,one,dim):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one;s.dim=dim
    def sub(s,x,y): return s.add(x,s.neg(y))
Rr=Alg(lambda a,b:a+b,lambda a:-a,lambda a,b:a*b,lambda a:a,Fr(0),Fr(1),1)
def CD(K):
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Alg(add,neg,mul,star,(K.zero,K.zero),(K.one,K.zero),2*K.dim)
C=CD(Rr); H=CD(C); O=CD(H); S=CD(O)
def flatten(z):
    if isinstance(z,Fr): return [z]
    return flatten(z[0])+flatten(z[1])
def build(vs):
    if len(vs)==1: return vs[0]
    h=len(vs)//2; return (build(vs[:h]),build(vs[h:]))
def rndK(K): return build([Fr(random.randint(-3,3)) for _ in range(K.dim)])
def eq(K,u,v): return all(x==y for x,y in zip(flatten(u),flatten(v)))
def bilin(K,x,y): return K.add(K.mul(x,K.star(y)),K.mul(y,K.star(x)))[0]
# nondegeneracy of bilin on CD A: is bilin(v,·)=0 => v=0?
# bilin(v,w) lands in base A. "=0 for all w" means base elt 0 for all w.
# Use the reductions: bilin(v,iota d)=v.re*star d+d*star v.re; bilin(v,iota d*e2)=star d*v.im+star v.im*d (corrected)
# Take d=1: bilin(v,iota 1)=v.re+star v.re ; bilin(v,e2)=v.im+star v.im. Not enough alone.
# Real nondegeneracy: the trace form q(v)=projre(v*star v) is positive definite (sum of squares) on the cascade.
# Check: on O, is bilin nondegenerate? i.e. exists w with bilin(v,w)!=0 for any v!=0?
random.seed(77)
for nm,K,B in (("O",O,H),("S",S,O)):
    # for random nonzero v, find if some simple w gives bilin!=0
    bad=0
    for _ in range(200):
        v=rndK(K)
        if eq(K,v,K.zero): continue
        # try w in a spanning set: use w=v itself (bilin(v,v)=2 Nrm v = 2*q in re)
        # simplest: bilin(v, v) projected
        found=any(not eq_base(B,bilin(K,v,w)) for w in [v, K.star(v)])
        if not found: bad+=1
    print(f"  {nm}: nonzero v with bilin(v,v)=bilin(v,star v)=0: {bad}/200")
def eq_base(B,x): 
    return all(c==0 for c in flatten(x))
