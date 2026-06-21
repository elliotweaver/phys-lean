"""
N2d-hard-backward — find an EXPLICIT generic witness (fast, curated).

Target theorem to close the iff at the cascade boundary:
   B associative *-ring, NON-commutative  ==>  Nrm NOT multiplicative on CD(CD B).
(Mirrors the banked forward half Nrm_mul_of_doubled_base: B commutative ==> mult.)
Recovers genNrm_not_mul_at_S since B = H Q is non-commutative and CD(CD(H Q)) = S Q.

We search a CURATED, sparse set of CD(CD B) witnesses x,y built from a non-commuting
pair p,q in B, and report the defect D = Nrm(xy) - Nrm(x)Nrm(y) in CD B.
We want a witness whose D is a NONZERO multiple of [p,q] = pq - qp (so D != 0 iff
p,q don't commute) -- ideally with D landing in the base slot so the Lean proof is
a single `ext <;> simp <;> ring`-style computation contradicted by a comm hypothesis.
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
        for my,cy in y.items():
            r[mx+my]+=cx*cy
    return E(dict(r))
def b_star(x):
    r=defaultdict(int)
    for m,c in x.items():
        r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def g(s): return {(s,):1}
Z={}
oneB={():1}
p,q,P,Q=g('p'),g('q'),g('P'),g('Q')
comm=b_sub(b_mul(p,q),b_mul(q,p))

# CD B
def cd_add(z,w): return (b_add(z[0],w[0]), b_add(z[1],w[1]))
def cd_neg(z): return (b_neg(z[0]),b_neg(z[1]))
def cd_sub(z,w): return cd_add(z,cd_neg(w))
def cd_mul(z,w):
    a,b=z;c,d=w
    return (b_sub(b_mul(a,c),b_mul(b_star(d),b)), b_add(b_mul(d,a),b_mul(b,b_star(c))))
def cd_star(z): return (b_star(z[0]),b_neg(z[1]))
def cd_z(z): return (not E(z[0])) and (not E(z[1]))
CDZ=(Z,Z)

# CD(CD B)
def cc_mul(u,v):
    a,b=u;c,d=v
    return (cd_sub(cd_mul(a,c),cd_mul(cd_star(d),b)), cd_add(cd_mul(d,a),cd_mul(b,cd_star(c))))
def cc_star(u): return (cd_star(u[0]),cd_neg(u[1]))
def Nrm(u): return cc_mul(u,cc_star(u))[0]   # element of CD B
def defect(x,y): return cd_sub(Nrm(cc_mul(x,y)), cd_mul(Nrm(x),Nrm(y)))

def fmt_b(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_cd(z): return f'[{fmt_b(z[0])} ; {fmt_b(z[1])}]'

# CD B building blocks
ipB=(p,Z); iqB=(q,Z)      # iota p, iota q in CD B
e2B=(Z,oneB)              # e2 in CD B
ip_e2=cd_mul(ipB,e2B)     # (iota p)*e2
iq_e2=cd_mul(iqB,e2B)
oneCDB=(oneB,Z)
CDB={'0':CDZ,'ip':ipB,'iq':iqB,'e2':e2B,'ipe2':ip_e2,'iqe2':iq_e2,'1':oneCDB}

# CD(CD B) witnesses: (re,im) with re,im in CDB
def comm_mult(z):
    """if z (in CD B) is k*[p,q] in some slot pattern, return description else None"""
    def slot(s):
        if not E(s): return (True,0,True)  # zero
        c1=s.get(('p','q'),0); c2=s.get(('q','p'),0)
        rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
        if not rem and c1==-c2 and c1!=0: return (True,c1,False)
        return (False,None,False)
    ok0=slot(z[0]); ok1=slot(z[1])
    if ok0[0] and ok1[0] and not(ok0[2] and ok1[2]):
        return (ok0[1],ok1[1])
    return None

keys=list(CDB.keys())
found=[]; nonzero=[]
for X0 in keys:
  for X1 in keys:
    x=(CDB[X0],CDB[X1])
    if cd_z(x[0]) and cd_z(x[1]): continue
    for Y0 in keys:
      for Y1 in keys:
        y=(CDB[Y0],CDB[Y1])
        if cd_z(y[0]) and cd_z(y[1]): continue
        d=defect(x,y)
        if cd_z(d): continue
        cm=comm_mult(d)
        rec=(X0,X1,Y0,Y1,d)
        if cm is not None: found.append(rec+(cm,))
        nonzero.append((len(E(d[0]))+len(E(d[1])),rec))

print(f"witnesses with defect proportional to [p,q]: {len(found)}")
for X0,X1,Y0,Y1,d,cm in found[:25]:
    print(f"  x=({X0};{X1}) y=({Y0};{Y1})  D={fmt_cd(d)}   (coeffs {cm})")

print(f"\nsimplest nonzero defects overall (smallest term count):")
nonzero.sort(key=lambda t:t[0])
for n,(X0,X1,Y0,Y1,d) in nonzero[:12]:
    print(f"  x=({X0};{X1}) y=({Y0};{Y1})  D={fmt_cd(d)}")
