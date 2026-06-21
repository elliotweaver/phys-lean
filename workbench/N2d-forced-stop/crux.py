"""
N2d-hard — verify the CRUX algebraic facts the forward Lean proof rests on.
Base = free associative *-ring; hypothesis: c_a := a + star(a) is CENTRAL.
Claim 1: star([x,y]) = -[x,y]   (commutators anti-self-adjoint)  [from trace-central]
Claim 2: a*star(a) = star(a)*a  (self-overlap symmetric)         [from trace-central]
We verify by substituting star(g) = c_g - g (c central) and reducing.
"""
from collections import defaultdict
# monomials: tuple of ('g',k) or ('c',k) [central]. central factors commute: we keep them
# but sort central factors to front to model centrality.
def E(d): return {m:v for m,v in d.items() if v}
def mul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            r[canon(mx+my)]+=cx*cy
    return E(dict(r))
def canon(m):
    # pull all central ('c',_) factors to the front, keep their order among themselves sorted,
    # keep non-central ('g',_) factors in place (associative, noncommutative).
    cs=sorted([f for f in m if f[0]=='c'])
    gs=[f for f in m if f[0]=='g']
    return tuple(cs)+tuple(gs)
def add(x,y):
    r=defaultdict(int,x)
    for m,v in y.items(): r[m]+=v
    return E(dict(r))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def g(k): return {(('g',k),):1}
def c(k): return {(('c',k),):1}      # c_k = g_k + star g_k, central
def star_g(k): return sub(c(k), g(k)) # star g_k = c_k - g_k
def star(x):
    # anti-automorphism; on monomial reverse and star each factor
    res={}
    for m,co in x.items():
        cur={(): co}
        for f in m:   # build star(f_n)...star(f_1): iterate left-to-right, left-multiply
            if f[0]=='c': sf=c(f[1])           # central, self-conj (c=star c since star(a+star a)=star a+a=c)
            else: sf=star_g(f[1])
            cur=mul(sf,cur)
        res=add(res,cur)
    return res
x,y=g(0),g(1)
def comm(u,v): return sub(mul(u,v),mul(v,u))
C=comm(x,y)
lhs=star(C); rhs=neg(C)
print("Claim1 star([x,y]) == -[x,y] :", lhs==rhs, "   (lhs-rhs):", sub(lhs,rhs))
a=g(0)
print("Claim2 a*star a == star a * a :", mul(a,star_g(0))==mul(star_g(0),a),
      "   diff:", sub(mul(a,star_g(0)),mul(star_g(0),a)))
