"""
N2d-hard-backward — SYMBOLIC check of the generic zero-divisor witness over a FREE
ASSOCIATIVE *-ring B on p,q. Take the simplest found witness family and compute x*y
over the free *-ring; confirm x*y is (proportional to) the commutator [p,q] (so x*y=0
iff p*q=q*p), and Nrm(x), Nrm(y) are non-degenerate (= scalar p*star p + q*star q-ish).

Witness (flat blocks, B=base of CD(CD B), x,y in CD(CD B) = depth-2 double):
We re-express the quaternion-found blocks in terms of CD(CD B) coordinates.
Tower used there: B=H, CD B = O, CD(CD B)=S. So here base = B, M=CD B, T=CD M=CD(CD B).
Blocks:
  ip      = iota_M(iota_B p)                 -> T-coord (re=(p,0), im=0) = ((p,0),(0,0))
  iq      = iota_M(iota_B q)
  pe2     = iota_M( (iota_B p) * e2_B )       e2_B=(0,1)_B ; (iota_B p)*e2_B in M
  qe2     = iota_M( (iota_B q) * e2_B )
  e2S=e2T = (0_M, 1_M)
  ipe2S   = ip * e2T
  iqe2S   = iq * e2T
  pe2e2S  = pe2 * e2T
  qe2e2S  = qe2 * e2T
Compute the simplest family: x = ip + iqe2S,  y = pe2 + qe2e2S, and report x*y.
"""
from collections import defaultdict
from fractions import Fraction as Fr

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def nadd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def nneg(x): return {m:-v for m,v in x.items()}
def nsub(x,y): return nadd(x,nneg(y))
def nmul(x,y):
    r=defaultdict(Fr)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def nstar(x):
    r=defaultdict(Fr)
    for m,c in x.items(): r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def ng(s): return {(s,):Fr(1)}
BZ={}; bOne={():Fr(1)}
pp,qq=ng('p'),ng('q')
commK=nsub(nmul(pp,qq),nmul(qq,pp))

class Lev:
    def __init__(s,add,neg,mul,star,zero,one):
        s.add=add;s.neg=neg;s.mul=mul;s.star=star;s.zero=zero;s.one=one
    def sub(s,x,y): return s.add(x,s.neg(y))
Bl=Lev(lambda x,y:nadd(x,y),nneg,nmul,nstar,BZ,bOne)
def mkCD(K):
    Z=(K.zero,K.zero); one=(K.one,K.zero)
    def add(z,w): return (K.add(z[0],w[0]),K.add(z[1],w[1]))
    def neg(z): return (K.neg(z[0]),K.neg(z[1]))
    def mul(z,w):
        a,b=z;c,d=w
        return (K.sub(K.mul(a,c),K.mul(K.star(d),b)), K.add(K.mul(d,a),K.mul(b,K.star(c))))
    def star(z): return (K.star(z[0]),K.neg(z[1]))
    return Lev(add,neg,mul,star,Z,one)
M=mkCD(Bl); T=mkCD(M)

def iB(x): return (x,BZ)      # B->M
def iM(z): return (z,M.zero)  # M->T
e2B=(BZ,bOne)
e2T=(M.zero,M.one)
def Nrm(z): return T.mul(z,T.star(z))[0]    # in M

ip=iM(iB(pp)); iq=iM(iB(qq))
pe2=iM(M.mul(iB(pp),e2B)); qe2=iM(M.mul(iB(qq),e2B))
ipe2S=T.mul(ip,e2T); iqe2S=T.mul(iq,e2T)
pe2e2S=T.mul(pe2,e2T); qe2e2S=T.mul(qe2,e2T)

def flat(z):  # flatten T element to 4 M? -> actually depth: T=CD M, M=CD B => 4 B-polys
    def fM(m): return [m[0],m[1]]
    return fM(z[0])+fM(z[1])
def fmt_b(x):
    if not E(x): return '0'
    return ''.join(f'{c:+g}{"".join(m) if m else "1"}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def show(z,name):
    print(f"{name} = "+" || ".join(fmt_b(b) for b in flat(z)))

x=T.add(ip,iqe2S); y=T.add(pe2,qe2e2S)
show(x,'x'); show(y,'y')
xy=T.mul(x,y)
show(xy,'x*y')
print("x*y flat coords reduce to commutator?")
for i,b in enumerate(flat(xy)):
    # check proportional to [p,q]
    c1=b.get(('p','q'),Fr(0)); c2=b.get(('q','p'),Fr(0))
    rem={m:v for m,v in b.items() if m not in (('p','q'),('q','p'))}
    tag='= %s*[p,q]'%c1 if (not rem and c1==-c2 and c1!=0) else ('0' if not E(b) else 'OTHER: '+fmt_b(b))
    print(f"  coord{i}: {tag}")
show(Nrm(x),'Nrm(x)'); show(Nrm(y),'Nrm(y)')
