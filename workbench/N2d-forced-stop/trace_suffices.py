"""
N2d-hard — does TRACE-CENTRALITY ALONE (a+star a central, for all a) suffice for
the forward direction over an associative *-ring?  (No separate norm-centrality posit.)

From trace-central we get (crux.py): a*star a = star a * a (symmetric) AND a*star a central
(since a*star a = a*(c_a - a) = c_a*a - a^2 ... hmm a^2 not central). Let's just TEST:
substitute star(g)=c_g - g with c central, reduce the 12-term defect, check ==0.
"""
from collections import defaultdict
def E(d): return {m:v for m,v in d.items() if v}
def canon(m):
    cs=sorted([f for f in m if f[0]=='c']); gs=[f for f in m if f[0]=='g']
    return tuple(cs)+tuple(gs)
def mul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): r[canon(mx+my)]+=cx*cy
    return E(dict(r))
def add(x,y):
    r=defaultdict(int,x)
    for m,v in y.items(): r[m]+=v
    return E(dict(r))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def g(k): return {(('g',k),):1}
def c(k): return {(('c',k),):1}
def star_g(k): return sub(c(k), g(k))
def star(x):
    res={}
    for m,co in x.items():
        cur={():co}
        for f in m:
            sf=c(f[1]) if f[0]=='c' else star_g(f[1])
            cur=mul(sf,cur)
        res=add(res,cur)
    return res
# CD over this base: components are elements; star on base = `star`
def cd_mul(z,w):
    a,b=z;c_,d=w
    return (sub(mul(a,c_),mul(star(d),b)), add(mul(d,a),mul(b,star(c_))))
def Nrm(z):
    a,b=z; return add(mul(a,star(a)), mul(star(b),b))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))
a,b,cc,d=g(0),g(1),g(2),g(3)
res=D((a,b),(cc,d))
print("Forward defect over assoc *-ring with TRACE-CENTRAL (a+star a central):")
print("  residual terms:", len(res))
if not res:
    print("  ✅ == 0  -> trace-centrality ALONE suffices for the forward direction!")
else:
    for m,v in sorted(res.items(),key=lambda kv:str(kv[0])):
        print(f"    {v:+d} {m}")
