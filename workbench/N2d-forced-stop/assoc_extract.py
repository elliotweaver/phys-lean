"""
N2d-hard-backward — S2: pin the associator of CD A to the BASE associator.

We compute, over the free associative *-ring on anti-self-adjoint generators
u,v,w (star x = -x for each, star reverses+sign), the associator in CD A
  assoc(X,Y,Z) := (X*Y)*Z - X*(Y*Z)     (valued in CD A)
for X,Y,Z built from iota(u),iota(v),iota(w), e2, and look for a combination
that equals iota( lam * [u,v,w] ) where [u,v,w] = (uv)w - u(vw) is the base
associator.  A clean such witness means: CD A left/right-alternative (or just
the relevant associators vanishing) FORCES the base associator to vanish ==> A
associative.  This is the computational half S2 of the Hurwitz chain.
"""
from collections import defaultdict

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
def b_star(x):           # anti-self-adjoint generators: star(letter)=-letter
    r=defaultdict(int)
    for m,c in x.items():
        r[tuple(reversed(m))]+=((-1)**len(m))*c
    return E(dict(r))
Z={}
def g(s): return {(s,):1}
u,v,w = g('u'),g('v'),g('w')
assoc_base = b_sub(b_mul(b_mul(u,v),w), b_mul(u,b_mul(v,w)))   # [u,v,w]

def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,t): return (add(z[0],t[0]),add(z[1],t[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,t): return cadd(z,cneg(t))
    def cmul(z,t):
        a,b=z;c,d=t
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)

cadd,cneg,csub,cmul,cstar,czero = mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)

def assoc(X,Y,Z_): return csub(cmul(cmul(X,Y),Z_), cmul(X,cmul(Y,Z_)))
def isz(z): return (not E(z[0])) and (not E(z[1]))

def fmt_b(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_cd(z): return f'[ {fmt_b(z[0])} ; {fmt_b(z[1])} ]'

# building blocks in CD A
iu=(u,Z); iv=(v,Z); iw=(w,Z); e2=(Z,{():1})
blocks={'iu':iu,'iv':iv,'iw':iw,'e2':e2}
keys=list(blocks)

def clean_assoc(coord):  # is coord == k*[u,v,w] ?
    if not E(coord) or not E(assoc_base): return None
    keysall=set(coord)|set(assoc_base)
    ratios=set()
    for k in keysall:
        cv=coord.get(k,0); bv=assoc_base.get(k,0)
        if bv==0:
            if cv!=0: return None
        else:
            ratios.add((cv,bv))
    if len(ratios)==1:
        cv,bv=ratios.pop()
        if cv!=0 and cv%bv==0: return cv//bv
    return None

print("base associator [u,v,w] =", fmt_b(assoc_base))
print()
print("=== associator [X,Y,Z] in CD A for block triples; looking for iota([u,v,w]) ===")
hits=[]
for X in keys:
 for Y in keys:
  for Zk in keys:
    D=assoc(blocks[X],blocks[Y],blocks[Zk])
    if isz(D): 
        continue
    tag=""
    k0=clean_assoc(D[0]); k1=clean_assoc(D[1])
    if k0 is not None: tag+=f" coord0={k0}*[u,v,w]"
    if k1 is not None: tag+=f" coord1={k1}*[u,v,w]"
    if tag: hits.append((X,Y,Zk,D,tag))
    if k0 is not None or k1 is not None:
        print(f"  [{X},{Y},{Zk}] = {fmt_cd(D)}{tag}")
print(f"\nclean associator-extracting triples: {len(hits)}")
if not hits:
    print("none among pure blocks; printing all nonzero block associators:")
    for X in keys:
     for Y in keys:
      for Zk in keys:
        D=assoc(blocks[X],blocks[Y],blocks[Zk])
        if not isz(D):
            print(f"  [{X},{Y},{Zk}] = {fmt_cd(D)}")
