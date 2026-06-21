"""
N2d-hard-backward — THOROUGH search for an ABSTRACT witness x(p,q),y(p,q) in CD(CD B),
B free ASSOCIATIVE *-ring on a non-commuting pair p,q, whose norm-defect
D = Nrm(xy) - Nrm x Nrm y  (in CD B) is a CLEAN obstruction tied to [p,q].

Since B is ASSOCIATIVE, the entire defect is a B-polynomial => the eventual Lean proof
is `ext <;> simp <;> ring`-style + a contradiction from a commutativity hypothesis.

We mirror the banked concrete witness zdX=e1+e10, zdY=e5+e14 structure: witnesses that
mix the inner doubling generator (e2 of CD B) and outer (e2 of CD(CD B)) with iota of
p and q at the BOTTOM (B) level.  Rich pool, both components, depth up to one product.
"""
from collections import defaultdict
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def b_add(*xs):
    r=defaultdict(int)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def b_neg(x): return {m:-v for m,v in x.items()}
def b_sub(x,y): return b_add(x,b_neg(y))
def b_mul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def b_star(x):
    r=defaultdict(int)
    for m,c in x.items():
        r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
Z={}; oneB={():1}
def g(s): return {(s,):1}
p,q=g('p'),g('q')
comm=b_sub(b_mul(p,q),b_mul(q,p))   # [p,q]

def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,w): return cadd(z,cneg(w))
    def cmul(z,w):
        a,b=z;c,d=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)

L1=mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)         # CD B
L2=mkCD(L1[0],L1[1],L1[2],L1[3],L1[4],L1[5])      # CD(CD B)
c1add,c1neg,c1sub,c1mul,c1star,c1zero=L1
c2add,c2neg,c2sub,c2mul,c2star,c2zero=L2

def Nrm(u): return c2mul(u,c2star(u))[0]          # in CD B
def D(x,y): return c1sub(Nrm(c2mul(x,y)), c1mul(Nrm(x),Nrm(y)))
def isz1(x): return not E(x)
def isz2(z): return isz1(z[0]) and isz1(z[1])

def fmt1(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmtcd(z): return f'[ {fmt1(z[0])} ; {fmt1(z[1])} ]'

# --- atoms in CD B (= A) ---
ipB=(p,Z); iqB=(q,Z)            # iota_B p, iota_B q
e2B=(Z,oneB)                    # e2 of CD B
oneA=(oneB,Z)
# atoms in CD(CD B): pairs of CD B elements
def iA(a): return (a, c1zero)   # iota_A(a) ; a in CD B
E2=(c1zero, oneA)               # e2 of CD(CD B)
# basis-ish atoms (mirror e1..e16 spread)
atomsA=[ipB, iqB, e2B, c1mul(ipB,e2B), c1mul(iqB,e2B), oneA]
atomsA_names=['ip','iq','e2','ipe2','iqe2','1']
# top atoms: iota_A(atom)  and  e2-twisted
topatoms=[]; topnames=[]
for a,an in zip(atomsA,atomsA_names):
    topatoms.append(iA(a)); topnames.append(f'i[{an}]')
    topatoms.append(c2mul(iA(a),E2)); topnames.append(f'i[{an}]*E2')
topatoms.append(E2); topnames.append('E2')

# witness = sum of up to 2 top atoms (mirror e1+e10)
singles=list(zip(topatoms,topnames))
def combos():
    for a in singles: yield (a[0],a[1])
    for (a,an),(b,bn) in itertools.combinations(singles,2):
        yield (c2add(a,b), f'{an}+{bn}')

def clean_comm(coord):
    if not E(coord): return None
    ks=set(); allk=set(coord)|set(comm)
    for k in allk:
        cv=coord.get(k,0); bv=comm.get(k,0)
        if bv==0:
            if cv!=0: return None
        else: ks.add((cv,bv))
    if len(ks)==1:
        cv,bv=ks.pop()
        if cv%bv==0: return cv//bv
    return None

print("base [p,q] =", fmt1(comm))
clist=list(combos())
print(f"witness pool size: {len(clist)}  (search {len(clist)**2} ordered pairs)\n")

clean_hits=[]; simplest=[]
seen=0
for x,xn in clist:
  for y,yn in clist:
    seen+=1
    d=D(x,y)
    if isz2(d): continue
    nterms=len(E(d[0]))+len(E(d[1]))
    simplest.append((nterms,xn,yn,d))
    # check coord clean multiple of [p,q] with other coord 0
    if not E(d[1]):
        k=clean_comm(d[0])
        if k is not None: clean_hits.append((xn,yn,'re',k,d))
    if not E(d[0]):
        k=clean_comm(d[1])
        if k is not None: clean_hits.append((xn,yn,'im',k,d))

print(f"=== CLEAN [p,q]-multiple defects (one coord = k[p,q], other 0): {len(clean_hits)} ===")
for xn,yn,co,k,d in clean_hits[:25]:
    print(f"  x={xn:18s} y={yn:18s}  {co}={k}*[p,q]   D={fmtcd(d)}")

print(f"\n=== simplest nonzero defects overall ===")
simplest.sort(key=lambda t:t[0])
seenset=set()
for n,xn,yn,d in simplest:
    key=fmtcd(d)
    if key in seenset: continue
    seenset.add(key)
    print(f"  ({n}) x={xn:18s} y={yn:18s}  D={fmtcd(d)}")
    if len(seenset)>=15: break
