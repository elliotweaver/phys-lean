"""
N2d-hard-backward — THE UNDER-EXPLORED ROUTE: iota_A-image witnesses with COMPOUND
base elements a,b in A = CD B (which is NON-ASSOCIATIVE when B is non-commutative).

x = iota_A(a), y = iota_A(b),  a,b in A = CD B.   Since iota_A is a ring hom and
star(iota_A c)=iota_A(star_A c):
   Nrm(iota_A c) = c *_A star_A c      (an element of A = CD B)
   D(x,y) = (a*b)*star(a*b) - (a*star a)*(b*star b)   [ALL products in A, grouped as
            the CD product dictates -- A is non-associative so grouping matters]
This DIRECTLY probes A's non-associativity.  We search a,b over rich CD B elements
built from the non-commuting pair p,q in B and look for a CLEAN nonzero defect tied
to [p,q] (vanishes under p*q=q*p), ideally 1-2 terms => a short Lean witness.
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
comm=b_sub(b_mul(p,q),b_mul(q,p))

# A = CD B  (NON-associative when B non-comm)
def amul(z,w):
    a,b=z;c,d=w
    return (b_sub(b_mul(a,c),b_mul(b_star(d),b)), b_add(b_mul(d,a),b_mul(b,b_star(c))))
def astar(z): return (b_star(z[0]),b_neg(z[1]))
def aadd(z,w): return (b_add(z[0],w[0]),b_add(z[1],w[1]))
def asub(z,w): return (b_sub(z[0],w[0]),b_sub(z[1],w[1]))
def aisz(z): return (not E(z[0])) and (not E(z[1]))

# Nrm(iota_A c) = c * star_A c   in A
def NrmI(c): return amul(c,astar(c))
def Dii(a,b):  # D(iota_A a, iota_A b) in A
    return asub(NrmI(amul(a,b)), amul(NrmI(a),NrmI(b)))

def fmt1(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmtA(z): return f'[ {fmt1(z[0])} ; {fmt1(z[1])} ]'

def comm_terms(coord):
    """count terms; check if coord is k*[p,q] (only pq,qp monomials)."""
    if not E(coord): return ('0',0)
    cpq=coord.get(('p','q'),0); cqp=coord.get(('q','p'),0)
    rem={m:v for m,v in coord.items() if m not in (('p','q'),('q','p'))}
    if not rem and cpq==-cqp and cpq!=0: return (f'{cpq}*[p,q]',len(E(coord)))
    return (None,len(E(coord)))

# atoms in A = CD B
ip=(p,Z); iq=(q,Z); e2=(Z,oneB); one=(oneB,Z)
ipe2=amul(ip,e2); iqe2=amul(iq,e2)
atoms={'ip':ip,'iq':iq,'e2':e2,'1':one,'ipe2':ipe2,'iqe2':iqe2}
an=list(atoms)
# build candidate a,b: single atoms + pairwise sums + a couple products
cands=dict(atoms)
for (n1,n2) in itertools.combinations(an,2):
    cands[f'{n1}+{n2}']=aadd(atoms[n1],atoms[n2])
# a few products
cands['ip*iq']=amul(ip,iq); cands['iq*ip']=amul(iq,ip)
cands['ip*e2']=ipe2
cn=list(cands)
print("base [p,q] =", fmt1(comm))
print(f"candidate a,b pool: {len(cn)}  (search {len(cn)**2} pairs)\n")

clean=[]; simplest=[]
for na in cn:
  for nb in cn:
    d=Dii(cands[na],cands[nb])
    if aisz(d): continue
    n=len(E(d[0]))+len(E(d[1]))
    simplest.append((n,na,nb,d))
    t0,_=comm_terms(d[0]); t1,_=comm_terms(d[1])
    if t0 is not None and not E(d[1]): clean.append((na,nb,'re',t0,d))
    if t1 is not None and not E(d[0]): clean.append((na,nb,'im',t1,d))

print(f"=== CLEAN k*[p,q] defects (one coord, other 0): {len(clean)} ===")
seen=set()
for na,nb,co,t,d in clean:
    if (na,nb) in seen: continue
    seen.add((na,nb))
    print(f"  a={na:10s} b={nb:10s}  {co}={t}   D={fmtA(d)}")
    if len(seen)>=20: break

print(f"\n=== simplest nonzero defects (smallest term count) ===")
simplest.sort(key=lambda t:t[0])
seen2=set()
for n,na,nb,d in simplest:
    key=fmtA(d)
    if key in seen2: continue
    seen2.add(key)
    # does it vanish under p*q=q*p?
    def collapse(x):
        r=defaultdict(int)
        for m,c in x.items(): r[tuple(sorted(m))]+=c
        return E(dict(r))
    vanish = not E(collapse(d[0])) and not E(collapse(d[1]))
    print(f"  ({n}) a={na:10s} b={nb:10s}  D={fmtA(d)}  {'[vanishes if comm]' if vanish else '[SURVIVES comm collapse!]'}")
    if len(seen2)>=18: break
