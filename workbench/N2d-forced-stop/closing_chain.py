"""
N2d-hard-backward — find the SHORTEST forced chain from global multiplicativity H to
base commutativity, over CD(CD B), B free associative *-ring on non-commuting p,q.

We work symbolically over the free associative *-ring B (generators p,q,P=star p,
Q=star q), build CD B then CD(CD B), and test candidate FORCED identities:

 H        : Nrm(uv) = Nrm u * Nrm v   for all u,v in CD(CD B)   [hypothesis]
 adj      : bilin(u*v, w) = bilin(v, star u * w)                [no H -- pure form?]
 P1       : bilin(u w, v w) = bilin(u,v) * Nrm w                [from H]
 P2       : bilin(w u, w v) = Nrm w * bilin(u,v)                [from H]

bilin(u,v) := (u * star v + v * star u).re   (in CD B).

Then: evaluate the polarized defect  Delta(u,v,w) = D(u+v,w)-D(u,w)-D(v,w)  where
D(a,b)=Nrm(ab)-Nrm a Nrm b, at u,v,w built from iota(iota p), iota(iota q), e2's, and
look for an instance whose value (in CD B) is a CLEAN multiple of the base commutator
[p,q]=pq-qp.  If found, then  H ==> Delta=0 ==> [p,q]=0  is the closing identity.

This is the DIRECT route: under H every D(a,b)=0 so every Delta=0; if some Delta equals
iota_{CDB}([p,q]-ish), injectivity forces [p,q]=0.
"""
from collections import defaultdict

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
comm=b_sub(b_mul(p,q),b_mul(q,p))

def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,w): return cadd(z,cneg(w))
    def cmul(z,w):
        a,b=z;c,d=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)

a1=mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)        # CD B
a2=mkCD(a1[0],a1[1],a1[2],a1[3],a1[4],a1[5])     # CD(CD B)
c1add,c1neg,c1sub,c1mul,c1star,c1zero=a1
c2add,c2neg,c2sub,c2mul,c2star,c2zero=a2

def Nrm(u): return c2mul(u,c2star(u))[0]         # in CD B
def D(u,v): return c1sub(Nrm(c2mul(u,v)), c1mul(Nrm(u),Nrm(v)))
def bilin(u,v):  # in CD B
    return c1add(c2mul(u,c2star(v)), c2mul(v,c2star(u)))[0]
def Delta(u,v,w):  # polarization of D in first arg
    return c1sub(c1sub(D(c2add(u,v),w), D(u,w)), D(v,w))

def fmt1(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmtcd(z): return f'[ {fmt1(z[0])} ; {fmt1(z[1])} ]'
def isz1(x): return not E(x)
def isz2(z): return isz1(z[0]) and isz1(z[1])

def clean_comm(coord):  # coord (in B) == k*[p,q]?
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

# building blocks in CD(CD B): iota_{CDB}(elt of CD B), e2 of CD(CD B)
def ii(belt): return (belt, c1zero)     # CD(CD B) elt = (re in CDB, 0)
ip=(p,Z); iq=(q,Z)                       # iota_B p, iota_B q  in CD B
e2_1=(Z,oneB)                            # e2 of CD B
oneCDB=(oneB,Z)
e2_2=(c1zero, oneCDB)                    # e2 of CD(CD B)
# pool of CD(CD B) elements
pool={
 'iip':ii(ip),'iiq':ii(iq),'ie2':ii(e2_1),'e2':e2_2,
 'i1':ii(oneCDB),
}
# also products with e2_2
for nm in ['iip','iiq','ie2']:
    pool[nm+'*e2']=c2mul(pool[nm],e2_2)
keys=list(pool)

print("base [p,q] =", fmt1(comm))
print()
print("=== Delta(u,v,w) instances that are CLEAN multiples of [p,q] (coord0, coord1=0) ===")
found=[]
for U in keys:
 for V in keys:
  for W in keys:
    d=Delta(pool[U],pool[V],pool[W])
    if isz2(d): continue
    if not E(d[1]):
        k=clean_comm(d[0])
        if k is not None:
            found.append((U,V,W,'re',k,d)); 
            print(f"  Delta({U},{V},{W}).re == {k}*[p,q], im=0")
    if not E(d[0]):
        k=clean_comm(d[1])
        if k is not None:
            found.append((U,V,W,'im',k,d))
            print(f"  Delta({U},{V},{W}).im == {k}*[p,q], re=0")
print(f"clean Delta witnesses: {len(found)}")
print()
print("=== raw D(u,v) instances that are CLEAN multiples of [p,q] ===")
found2=[]
for U in keys:
 for V in keys:
    d=D(pool[U],pool[V])
    if isz2(d): continue
    if not E(d[1]):
        k=clean_comm(d[0])
        if k is not None: found2.append((U,V,'re',k,d)); print(f"  D({U},{V}).re == {k}*[p,q], im=0  D={fmtcd(d)}")
    if not E(d[0]):
        k=clean_comm(d[1])
        if k is not None: found2.append((U,V,'im',k,d)); print(f"  D({U},{V}).im == {k}*[p,q], re=0  D={fmtcd(d)}")
print(f"clean raw-defect witnesses: {len(found2)}")
print()
print("=== simplest nonzero raw defects D(u,v) (smallest term count) ===")
allnz=[]
for U in keys:
 for V in keys:
   d=D(pool[U],pool[V])
   if not isz2(d): allnz.append((len(E(d[0]))+len(E(d[1])),U,V,d))
allnz.sort(key=lambda t:t[0])
for n,U,V,d in allnz[:10]:
    print(f"  ({n}) D({U},{V}) = {fmtcd(d)}")
