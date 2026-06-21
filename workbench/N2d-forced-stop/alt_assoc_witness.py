"""
N2d-hard-backward — find the EXPLICIT CD A element whose left/right alternative-law
defect equals iota(base associator), over the free NON-ASSOCIATIVE *-base.

We implement a FREE non-associative *-ring on anti-self-adjoint generators by tracking
fully-parenthesized monomials as nested tuples. star is the anti-automorphism with
star(generator) = -generator, star(xy)=star(y)star(x).

In CD A we test, for x,y built from iota(gen), e2, and products, the LEFT alternative
defect L(x,y)=x(xy)-(xx)y and RIGHT defect R(x,y)=(yx)x-y(xx).  We look for an instance
that, as a polynomial in the base generators, is iota of a multiple of a base
associator [u,v,w]=(uv)w-u(vw) -- i.e. surfaces base NON-associativity. That instance,
contradicted by 'A associative', is the explicit witness for: CD A alternative => A assoc.
"""
from collections import defaultdict

# Free NON-ASSOCIATIVE *-ring. Monomials: nested-tuple trees of signed generators.
# Represent an algebra element as dict {tree: coeff}. tree = ('g', name) leaf, or
# ('m', left, right) for a product (NON-associative: product order/grouping matters).
def E(d): return {m:v for m,v in d.items() if v}
def add(*xs):
    R=defaultdict(int)
    for x in xs:
        for m,v in x.items(): R[m]+=v
    return E(dict(R))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    R=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            R[('m',mx,my)] += cx*cy
    return E(dict(R))
# star on trees: star(leaf g)= -g ; star(m l r) = star(r) star(l)
def star_tree(t):
    if t[0]=='g':
        return {t: -1}     # star(g) = -g
    # t=('m',l,r): star = star(r)*star(l)
    sl=star_elem({t[1]:1}); sr=star_elem({t[2]:1})
    return mul(sr,sl)
def star_elem(x):
    R=defaultdict(int)
    for t,c in x.items():
        for t2,c2 in star_tree(t).items():
            R[t2]+=c*c2
    return E(dict(R))
def g(name): return {('g',name):1}
u,v,w = g('u'),g('v'),g('w')

# CD over this base
def cmul(z,t):
    a,b=z;c,d=t
    return (sub(mul(a,c), mul(star_elem(d),b)), add(mul(d,a), mul(b,star_elem(c))))
def cstar(z): return (star_elem(z[0]), neg(z[1]))
def cadd(z,t): return (add(z[0],t[0]),add(z[1],t[1]))
def csub(z,t): return cadd(z,(neg(t[0]),neg(t[1])))
def isz(z): return (not E(z[0])) and (not E(z[1]))
Z={}
def iota(x): return (x, Z)
e2=(Z,{('g','__one__'):1})   # need a unit; represent 1 specially
# Actually we need a unit element. Use a formal '1'. Define mul with unit handling:
# Simpler: avoid e2's unit by using e2 = (0, ONE) where ONE is a formal unit leaf.
ONE={('g','1'):1}
def star_tree2(t):
    if t[0]=='g':
        if t[1]=='1': return {t:1}      # star(1)=1
        return {t:-1}
    sl=star_elem2({t[1]:1}); sr=star_elem2({t[2]:1})
    return mul(sr,sl)
def star_elem2(x):
    R=defaultdict(int)
    for t,c in x.items():
        for t2,c2 in star_tree2(t).items():
            R[t2]+=c*c2
    return E(dict(R))
# unit multiplication: 1*x=x, x*1=x. Implement reduce that collapses ('m', 1-leaf, t)->t
def reduce_unit(x):
    R=defaultdict(int)
    def rt(t):
        if t[0]=='g': return t
        l=rt(t[1]); r=rt(t[2])
        if l==('g','1'): return r
        if r==('g','1'): return l
        return ('m',l,r)
    for t,c in x.items():
        R[rt(t)]+=c
    return E(dict(R))
def mul2(x,y): return reduce_unit(mul(x,y))
def cmul2(z,t):
    a,b=z;c,d=t
    return (reduce_unit(sub(mul2(a,c), mul2(star_elem2(d),b))),
            reduce_unit(add(mul2(d,a), mul2(b,star_elem2(c)))))
def cstar2(z): return (star_elem2(z[0]), neg(z[1]))
e2=(Z,ONE)

base_assoc=sub(mul2(mul2(u,v),w), mul2(u,mul2(v,w)))   # [u,v,w]

def L(x,y): return csub(cmul2(x,cmul2(x,y)), cmul2(cmul2(x,x),y))
def Rt(x,y): return csub(cmul2(cmul2(y,x),x), cmul2(y,cmul2(x,x)))
def AS(x,y,z): return csub(cmul2(cmul2(x,y),z), cmul2(x,cmul2(y,z)))

def fmt(x):
    if not E(x): return '0'
    def s(t):
        if t[0]=='g': return t[1]
        return f'({s(t[1])}{s(t[2])})'
    return ' '.join(f'{c:+d}{s(t)}' for t,c in sorted(x.items(),key=lambda kv:str(kv[0])))

# building blocks
iu,iv,iw=iota(u),iota(v),iota(w)
ue2=cmul2(iu,e2); ve2=cmul2(iv,e2); we2=cmul2(iw,e2)
pool={'iu':iu,'iv':iv,'iw':iw,'e2':e2,'ue2':ue2,'ve2':ve2,'we2':we2}
keys=list(pool)

def is_iota_assoc_mult(coord):
    """coord (base elem) == k*[u,v,w]?  compare as polynomials in trees."""
    if not E(coord) or not E(base_assoc): return None
    ks=set(); allk=set(coord)|set(base_assoc)
    for k in allk:
        cv=coord.get(k,0); bv=base_assoc.get(k,0)
        if bv==0:
            if cv!=0: return None
        else: ks.add((cv,bv))
    if len(ks)==1:
        cv,bv=ks.pop()
        if bv!=0 and cv%bv==0: return cv//bv
    return None

print("base [u,v,w] =", fmt(base_assoc))
print()
print("=== LEFT/RIGHT alternative defects surfacing iota([u,v,w]) ===")
found=[]
for X in keys:
  for Y in keys:
    for tag,D in (("L",L(pool[X],pool[Y])),("Rt",Rt(pool[X],pool[Y]))):
        if isz(D): continue
        # check coord0 == k*[u,v,w] and coord1 == 0
        if E(D[1]): 
            k1=is_iota_assoc_mult(D[1])
        else: k1='zero'
        k0=is_iota_assoc_mult(D[0])
        if k0 is not None and (not E(D[1])):
            found.append((tag,X,Y,'re',k0))
            print(f"  {tag}({X},{Y}): re-coord == {k0}*[u,v,w], im=0  <-- CLEAN")
        if E(D[1]):
            k1=is_iota_assoc_mult(D[1])
            if k1 is not None and (not E(D[0])):
                found.append((tag,X,Y,'im',k1))
                print(f"  {tag}({X},{Y}): im-coord == {k1}*[u,v,w], re=0  <-- CLEAN")
print(f"clean alternative-law witnesses surfacing base associator: {len(found)}")
print()
print("=== FULL associators [X,Y,Z] surfacing iota([u,v,w]) with X,Y,Z mixed ===")
cnt=0
for X in keys:
 for Y in keys:
  for Zk in keys:
    D=AS(pool[X],pool[Y],pool[Zk])
    if isz(D): continue
    k0=is_iota_assoc_mult(D[0]) if E(D[0]) else None
    k1=is_iota_assoc_mult(D[1]) if E(D[1]) else None
    if (k0 is not None and not E(D[1])):
        print(f"  [{X},{Y},{Zk}]: re=={k0}*[u,v,w], im=0"); cnt+=1
    elif (k1 is not None and not E(D[0])):
        print(f"  [{X},{Y},{Zk}]: im=={k1}*[u,v,w], re=0"); cnt+=1
    if cnt>=20: break
print(f"(showing up to 20; the clean base-associator full-associator witnesses)")
