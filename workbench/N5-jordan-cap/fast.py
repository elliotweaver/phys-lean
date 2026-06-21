"""
Fast octonion via precomputed signed multiplication table, derived from the
EXACT banked CD construction (cd.py). Then search n=4 witnesses efficiently.
"""
from fractions import Fraction as F
from cd import mul, basis, flatten, star, from_coords

# multiplication table: e_p * e_q = MULT[p][q] = (sign, index)
MULT=[[None]*8 for _ in range(8)]
for p in range(8):
    for q in range(8):
        prod=flatten(mul(basis(p),basis(q)))
        nz=[(i,v) for i,v in enumerate(prod) if v!=0]
        assert len(nz)==1, (p,q,prod)
        idx,val=nz[0]
        assert val in (F(1),F(-1)), val
        MULT[p][q]=(1 if val==1 else -1, idx)

# star table: star(e_p) = (sign, p)
STAR=[]
for p in range(8):
    s=flatten(star(basis(p)))
    nz=[(i,v) for i,v in enumerate(s) if v!=0]
    assert len(nz)==1
    idx,val=nz[0]; assert idx==p
    STAR.append(1 if val==1 else -1)

# octonion = list of 8 Fractions
def omul(x,y):
    r=[F(0)]*8
    for p in range(8):
        if x[p]==0: continue
        xp=x[p]
        for q in range(8):
            if y[q]==0: continue
            s,idx=MULT[p][q]
            r[idx]+= s*xp*y[q]
    return r
def oadd(x,y): return [x[i]+y[i] for i in range(8)]
def osub(x,y): return [x[i]-y[i] for i in range(8)]
def oneg(x): return [-v for v in x]
def ostar(x): return [STAR[p]*x[p] for p in range(8)]
def oz(): return [F(0)]*8
def oeq(x,y): return all(x[i]==y[i] for i in range(8))
def ois0(x): return all(v==0 for v in x)
E=[[F(1) if i==k else F(0) for i in range(8)] for k in range(8)]

def assoc(a,b,c): return osub(omul(omul(a,b),c), omul(a,omul(b,c)))

if __name__=="__main__":
    # verify against slow path on a few
    import random
    rng=random.Random(0)
    for _ in range(300):
        xc=[F(rng.randint(-2,2)) for _ in range(8)]
        yc=[F(rng.randint(-2,2)) for _ in range(8)]
        slow=flatten(mul(from_coords(xc),from_coords(yc)))
        fast=omul(xc,yc)
        assert slow==fast, (xc,yc,slow,fast)
    print("fast octonion table verified against banked CD construction.")
    # print which imaginary triples associate / not (a,b,c distinct imaginary)
    import itertools
    nonassoc=0; total=0
    for a,b,c in itertools.product(range(1,8),repeat=3):
        total+=1
        if not ois0(assoc(E[a],E[b],E[c])): nonassoc+=1
    print(f"imaginary basis triples non-associating: {nonassoc}/{total}")
