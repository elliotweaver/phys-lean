"""
N2d-hard-backward — THE DECISIVE TEST under the cascade's CENTRAL self-overlap structure.

Task target: "for EVERY base A carrying the cascade's central-self-overlap / conjugation
structure" -- NOT bare rings (those are the drift, THE ONE LAW). The cascade base B is an
associative *-ring with:
  (TR) b + star b   CENTRAL   (trace central)
  (NM) b * star b   CENTRAL   (norm/self-overlap central)  -- the Born positivity, structural.

two_hyp.py showed: over a FREE such (trace+norm central) base, the forward defect on
CD(CD B) has 12 surviving terms. CLAIM TO TEST: those 12 terms are exactly a combination
of base COMMUTATORS [g_i,g_j], so

   defect on CD(CD B) = 0   <=>   B commutative.

If TRUE: the iff closes from ONE identity (both directions), and we get a clean witness.
We ALSO hunt a SINGLE witness x,y whose defect equals c*[p,q] under these relations.

Model: generators g0,g1,... ; central symbols c_k=g_k+star g_k, n_k=g_k star g_k.
Relations: star g_k = c_k - g_k ;  g_k*g_k = c_k g_k - n_k  ; c_k,n_k central.
Distinct generators do NOT commute (we keep order); centrality only for c,n.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

def E(d): return {m:v for m,v in d.items() if v}
def is_c(f): return f[0] in ('c','n')
def canon(m):
    # pull central c/n factors to the front (sorted); keep g-order
    cs=sorted([f for f in m if is_c(f)]); gs=[f for f in m if not is_c(f)]
    return tuple(cs)+tuple(gs)
def reduce_sq(m):
    for i in range(len(m)-1):
        if m[i][0]=='g' and m[i+1][0]=='g' and m[i][1]==m[i+1][1]:
            k=m[i][1]; left=m[:i]; right=m[i+2:]
            out=[]
            for mm,cc in reduce_sq(canon(left+(('c',k),('g',k))+right)): out.append((mm,cc))
            for mm,cc in reduce_sq(canon(left+(('n',k),)+right)): out.append((mm,-cc))
            return out
    return [(canon(m),Fr(1))]
def mul(x,y):
    r=defaultdict(Fr)
    for mx,cx in x.items():
        for my,cy in y.items():
            for mm,cc in reduce_sq(canon(mx+my)): r[mm]+=cx*cy*cc
    return E(dict(r))
def add(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def g(k): return {(('g',k),):Fr(1)}
def cc(k): return {(('c',k),):Fr(1)}
def star_g(k): return sub(cc(k),g(k))
def star(x):
    res={}
    for m,co in x.items():
        cur={():co}
        for f in m:
            sf={(f,):Fr(1)} if is_c(f) else star_g(f[1])
            cur=mul(sf,cur)
        res=add(res,cur)
    return res
ZERO={}
def cd_mul(z,w):
    a,b=z;c_,d=w
    return (sub(mul(a,c_),mul(star(d),b)), add(mul(d,a),mul(b,star(c_))))
def cd_star(z): return (star(z[0]),neg(z[1]))
def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
def cd_sub(z,w): return (sub(z[0],w[0]),sub(z[1],w[1]))
def cd_z(z): return (not E(z[0])) and (not E(z[1]))

# CD(CD B): element = ((B,B),(B,B))
def cc_mul(u,v):
    a,b=u;c_,d=v
    return (cd_sub(cd_mul(a,c_),cd_mul(cd_star(d),b)), cd_add(cd_mul(d,a),cd_mul(b,cd_star(c_))))
def cc_star(u): return (cd_star(u[0]),(neg(u[1][0]),neg(u[1][1])))
def Nrm(u): return cc_mul(u,cc_star(u))[0]    # element of A=CD B
def defect(x,y): return cd_sub(Nrm(cc_mul(x,y)), cd_mul(Nrm(x),Nrm(y)))
def A0(z): return (not E(z[0])) and (not E(z[1]))

# commutator of two generators
p,q=g(0),g(1)
commK=sub(mul(p,q),mul(q,p))   # [g0,g1]

def fmt(x):
    if not E(x): return '0'
    def fm(m):
        return '*'.join((f'{t[0]}{t[1]}') for t in m) if m else '1'
    return ' '.join(f'{c:+g}{fm(m)}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),str(kv[0]))))

# Is z a combination of commutators only? Test: z vanishes if we ALSO impose commutativity.
def under_comm(x):
    # map each monomial to its sorted-by-(type,index) form (commutative image)
    r=defaultdict(Fr)
    for m,c in x.items():
        key=tuple(sorted(m))
        r[key]+=c
    return E(dict(r))

# Witness vocabulary over CD(CD B): components in {0,1,g0,g1,star g0,star g1}
Bvoc={'0':ZERO,'1':{():Fr(1)},'g0':g(0),'g1':g(1),'G0':star_g(0),'G1':star_g(1)}
bk=list(Bvoc.keys())
def mk(b0,b1,b2,b3): return ((Bvoc[b0],Bvoc[b1]),(Bvoc[b2],Bvoc[b3]))

# 1) does the GENERAL defect vanish under commutativity? (=> defect is pure commutator)
import random
random.seed(0)
allcomm=True
checked=0
for _ in range(40):
    xl=tuple(random.choice(bk) for _ in range(4))
    yl=tuple(random.choice(bk) for _ in range(4))
    x=mk(*xl); y=mk(*yl)
    if A0(x[0]) and A0(x[1]): continue
    if A0(y[0]) and A0(y[1]): continue
    d=defect(x,y)
    checked+=1
    for slot in d:
        if E(under_comm(slot)):
            allcomm=False
            print("defect NONzero under commutativity at", xl, yl, ":", fmt(under_comm(slot)))
            break
    if not allcomm: break
print(f"checked {checked} witnesses; defect vanishes under commutativity (=> pure commutator): {allcomm}")

# 2) hunt a single witness whose defect is EXACTLY lam*[g0,g1] in some coordinate
def clean_comm(s):
    if not E(s): return None
    c1=s.get((('g',0),('g',1)),Fr(0)); c2=s.get((('g',1),('g',0)),Fr(0))
    rem={m:v for m,v in s.items() if m not in ((('g',0),('g',1)),(('g',1),('g',0)))}
    if rem: return None
    if c1==-c2 and c1!=0: return c1
    return None
def elems(maxnz=2):
    out=[]
    for nz in range(1,maxnz+1):
        for pos in itertools.combinations(range(4),nz):
            for vals in itertools.product([v for v in bk if v!='0'],repeat=nz):
                comps=['0']*4
                for s,v in zip(pos,vals): comps[s]=v
                out.append(tuple(comps))
    return out
els=elems(2)
hits=[]
for xl in els:
    x=mk(*xl)
    if A0(x[0]) and A0(x[1]): continue
    for yl in els:
        y=mk(*yl)
        if A0(y[0]) and A0(y[1]): continue
        d=defect(x,y)
        if A0(d): continue
        for ci,s in enumerate((d[0],d[1])):
            lam=clean_comm(s)
            if lam is not None: hits.append((xl,yl,ci,lam,d))
print(f"single witnesses with coord = lam*[g0,g1] under centrality: {len(hits)}")
hits.sort(key=lambda h:(abs(h[3]),h[0].count('0')+h[1].count('0')))
for xl,yl,ci,lam,d in hits[:12]:
    print(f"  x={xl} y={yl}  coord{ci}={lam}*[g0,g1]   D0={fmt(d[0])}  D1={fmt(d[1])}")
