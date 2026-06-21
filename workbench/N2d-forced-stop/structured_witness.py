"""
N2d-hard-backward — TARGETED symbolic witness over base A = CD N, N free
noncommutative *-ring. A = CD N is the FIRST non-associative base in the cascade
(non-assoc <=> N noncommutative, by banked iota_iota_e2_assoc_iff).

We want x,y in CD A = CD(CD N) built from the STRUCTURED non-associating data
  alpha = iota_N p, beta = iota_N q  (p,q in N, pq != qp), and the generators e2,
such that the norm defect D = Nrm(xy) - Nrm(x)Nrm(y) (an element of A = CD N) is a
NONZERO expression that vanishes iff [p,q]=0.

N = free associative noncommutative *-ring on p,q (symbols p,q,P=star p,Q=star q).
We DO NOT impose commutativity. We compute exactly.
"""
from collections import defaultdict
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def nadd(*xs):
    r=defaultdict(int)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def nneg(x): return {m:-v for m,v in x.items()}
def nsub(x,y): return nadd(x,nneg(y))
def nmul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def nstar(x):
    r=defaultdict(int)
    for m,c in x.items(): r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def ng(s): return {(s,):1}
NZ={}; nOne={():1}
p,q,P,Q=ng('p'),ng('q'),ng('P'),ng('Q')
comm=nsub(nmul(p,q),nmul(q,p))

# ---- A = CD N ----
def a_add(z,w): return (nadd(z[0],w[0]),nadd(z[1],w[1]))
def a_neg(z): return (nneg(z[0]),nneg(z[1]))
def a_sub(z,w): return a_add(z,a_neg(w))
def a_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def a_star(z): return (nstar(z[0]),nneg(z[1]))
AZ=(NZ,NZ)
def a_is0(z): return (not E(z[0])) and (not E(z[1]))
def a_eq(z,w): return a_is0(a_sub(z,w))

# ---- CD A ----
def c_add(u,v): return (a_add(u[0],v[0]),a_add(u[1],v[1]))
def c_neg(u): return (a_neg(u[0]),a_neg(u[1]))
def c_sub(u,v): return c_add(u,c_neg(v))
def c_mul(u,v):
    a,b=u;c,d=v
    return (a_sub(a_mul(a,c),a_mul(a_star(d),b)), a_add(a_mul(d,a),a_mul(b,a_star(c))))
def c_star(u): return (a_star(u[0]),a_neg(u[1]))
def Nrm(u): return c_mul(u,c_star(u))[0]    # element of A = CD N
def defect(x,y): return a_sub(Nrm(c_mul(x,y)), a_mul(Nrm(x),Nrm(y)))

# structured elements of A = CD N
alpha=(p,NZ)       # iota_N p
beta=(q,NZ)        # iota_N q
e2A=(NZ,nOne)      # e2 of A = CD N  = (0,1)
oneA=(nOne,NZ)
# products in A:
ae2=a_mul(alpha,e2A)    # (iota p) * e2
be2=a_mul(beta,e2A)
# vocabulary of A-elements
Avoc={'0':AZ,'al':alpha,'be':beta,'e2':e2A,'1':oneA,'ae2':ae2,'be2':be2,
      'al*':a_star(alpha),'be*':a_star(beta)}

def fmt_n(x):
    if not E(x): return '0'
    return ''.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_a(z): return f'<{fmt_n(z[0])}|{fmt_n(z[1])}>'

def is_comm_mult(z):
    """return (k0,k1) if z = (k0*[p,q], k1*[p,q]) (each slot multiple of comm or 0), not both 0"""
    def slot(s):
        if not E(s): return (0,True)
        c1=s.get(('p','q'),0); c2=s.get(('q','p'),0)
        rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
        if not rem and c1==-c2 and c1!=0: return (c1,False)
        return (None,False)
    k0,z0=slot(z[0]); k1,z1=slot(z[1])
    if k0 is None or k1 is None: return None
    if z0 and z1: return None
    return (k0,k1)

keys=list(Avoc.keys())
prop=[]; nz=[]
for X0 in keys:
  for X1 in keys:
    x=(Avoc[X0],Avoc[X1])
    if a_is0(x[0]) and a_is0(x[1]): continue
    for Y0 in keys:
      for Y1 in keys:
        y=(Avoc[Y0],Avoc[Y1])
        if a_is0(y[0]) and a_is0(y[1]): continue
        d=defect(x,y)
        if a_is0(d): continue
        nterms=len(E(d[0]))+len(E(d[1]))
        nz.append((nterms,X0,X1,Y0,Y1,d))
        cm=is_comm_mult(d)
        if cm is not None: prop.append((X0,X1,Y0,Y1,d,cm))

print(f"defects proportional to [p,q]: {len(prop)}")
for X0,X1,Y0,Y1,d,cm in prop[:30]:
    print(f"  x=<{X0}|{X1}> y=<{Y0}|{Y1}>  D={fmt_a(d)}  coeffs={cm}")
print(f"\nsmallest nonzero defects:")
nz.sort(key=lambda t:t[0])
for n,X0,X1,Y0,Y1,d in nz[:15]:
    print(f"  ({n}) x=<{X0}|{X1}> y=<{Y0}|{Y1}>  D={fmt_a(d)}")
