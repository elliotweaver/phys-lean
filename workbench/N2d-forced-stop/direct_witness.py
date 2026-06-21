"""
N2d-hard-backward — DIRECT WITNESS route (NOT the refuted proportionality route).

We do NOT need defect proportional to [p,q]. We need: for an EXPLICIT witness
x(p,q), y(p,q) in CD(CD B), the equation  Nrm(xy) = Nrm x * Nrm y  to FORCE pq = qp.
Equivalently some projection of the defect D := Nrm(xy)-Nrm x Nrm y equals
  lambda*(pq - qp)   (modulo nothing) -- a CLEAN extraction on ONE coordinate.

Cascade-relevant pair: p,q are the IMAGINARY units (star p = -p, star q = -q).
The banked concrete witness zdX,zdY is exactly x=((p,0),(q,0)), y=((0,p),(0,q))
with p=i, q=j in B=H.  We test several witness forms over the free *-ring on two
ANTI-self-adjoint generators a,b (star a=-a, star b=-b) and look for a coordinate
of D that is a clean multiple of [a,b]=ab-ba.
"""
from collections import defaultdict

# Free *-ring on anti-self-adjoint generators 'a','b':  star(a)=-a, star(b)=-b.
# Monomials are tuples of letters in {'a','b'}; star reverses order and multiplies
# by (-1)^length.
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
        sign=(-1)**len(m)
        r[tuple(reversed(m))]+=sign*c
    return E(dict(r))
Z={}
def g(s): return {(s,):1}
a,b = g('a'),g('b')
comm = b_sub(b_mul(a,b),b_mul(b,a))   # [a,b]=ab-ba

def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,w): return cadd(z,cneg(w))
    def cmul(z,w):
        u,v=z;c,d=w
        return (sub(mul(u,c),mul(star(d),v)), add(mul(d,u),mul(v,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)

c1add,c1neg,c1sub,c1mul,c1star,c1zero = mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)
c2add,c2neg,c2sub,c2mul,c2star,c2zero = mkCD(c1add,c1neg,c1sub,c1mul,c1star,c1zero)

def Nrm(u): return c2mul(u,c2star(u))[0]   # in CD B
def defect(x,y): return c1sub(Nrm(c2mul(x,y)), c1mul(Nrm(x),Nrm(y)))

def fmt_b(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_cd(z): return f'[ {fmt_b(z[0])} ; {fmt_b(z[1])} ]'

def clean_mult_of_comm(coord):
    """Is coord == k*[a,b] for nonzero integer k? (only ab,ba monomials)."""
    if not E(coord): return None
    ca=coord.get(('a','b'),0); cb=coord.get(('b','a'),0)
    rem={m:v for m,v in coord.items() if m not in (('a','b'),('b','a'))}
    if rem: return None
    if ca==-cb and ca!=0: return ca
    return None

# candidate witnesses (re,im) with re,im in CD B; building blocks in B = level-1 CD
ia=(a,Z); ib=(b,Z)     # iota a, iota b in CD B
e2=(Z,{():1})          # e2 of CD B
ae2=c1mul(ia,e2); be2=c1mul(ib,e2)
zero1=(Z,Z); one1=({():1},Z)
pool={'ia':ia,'ib':ib,'e2':e2,'ae2':ae2,'be2':be2,'0':zero1,'1':one1}
keys=list(pool.keys())

print("=== concrete-mirror witness x=((a,0),(b,0)) y=((0,a),(0,b)) ===")
x=((a,Z),(b,Z)); y=((Z,a),(Z,b))
D=defect(x,y); print("  D =", fmt_cd(D))
for ci,c in enumerate(D):
    k=clean_mult_of_comm(c)
    if k is not None: print(f"  coord{ci} == {k}*[a,b]  <-- CLEAN")

print("\n=== search over witnesses x=(R,I) y=(R2,I2) for a CLEAN [a,b] coord ===")
hits=[]
def isz(z): return (not E(z[0])) and (not E(z[1]))
for R in keys:
 for I in keys:
  x=(pool[R],pool[I])
  if isz(x[0]) and isz(x[1]): continue
  for R2 in keys:
   for I2 in keys:
    y=(pool[R2],pool[I2])
    if isz(y[0]) and isz(y[1]): continue
    D=defect(x,y)
    if isz(D): continue
    for ci,c in enumerate(D):
        k=clean_mult_of_comm(c)
        if k is not None:
            hits.append((R,I,R2,I2,ci,k,D))
print(f"clean-[a,b]-coord witnesses found: {len(hits)}")
seen=set()
for R,I,R2,I2,ci,k,D in hits:
    key=(R,I,R2,I2)
    if key in seen: continue
    seen.add(key)
    print(f"  x=({R};{I}) y=({R2};{I2})  coord{ci}={k}*[a,b]   D={fmt_cd(D)}")
    if len(seen)>=20: break
