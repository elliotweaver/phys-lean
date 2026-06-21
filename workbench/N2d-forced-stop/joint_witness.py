"""
N2d — probe for a CLEAN generic forced-link witness built from iota/e2 embeddings,
mirroring N2c's iota_iota_e2_assoc_iff (the joint connection).

In CD A, try x,y assembled from ι(a), ι(b), e2 (and the base double structure),
and compute the norm-defect Nrm(xy)-Nrm(x)Nrm(y). Look for a fill where the defect
equals (a clean multiple of) the base associator [a,b,c] possibly with central
corrections — giving a generic theorem provable by the same simp+ring style as
iota_iota_e2_assoc_iff.

Free non-assoc *-algebra, imaginary gens (g*=-g, the cascade structure).
"""
from collections import defaultdict
import itertools

ONEM=('one',)
def gen(k): return {('i',k):1}
def aadd(x,y):
    r=defaultdict(int,x)
    for m,c in y.items():
        r[m]+=c
        if r[m]==0: del r[m]
    return dict(r)
def aneg(x): return {m:-c for m,c in x.items()}
def asub(x,y): return aadd(x,aneg(y))
def amul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            if mx==ONEM and my==ONEM: key=ONEM
            elif mx==ONEM: key=my
            elif my==ONEM: key=mx
            else: key=(mx,my)
            r[key]+=cx*cy
            if r[key]==0: del r[key]
    return dict(r)
def star_mono(m):
    if m==ONEM: return (ONEM,1)
    if m[0]=='i': return (m,-1)
    sl,gl=star_mono(m[0]); sr,gr=star_mono(m[1])
    return ((sr,sl),gl*gr)
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm,sg=star_mono(m); r[sm]+=c*sg
        if r[sm]==0: del r[sm]
    return dict(r)

# CD A elements as (re, im) of base elements. e2 = (0,1); iota a = (a,0).
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)),aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z; return aadd(amul(a,astar(a)),amul(astar(b),b))
def D_of(x,y): return asub(Nrm(cd_mul(x,y)),amul(Nrm(x),Nrm(y)))
def assoc(u,v,w): return asub(amul(amul(u,v),w),amul(u,amul(v,w)))

a,b,c=gen(0),gen(1),gen(2)
one={ONEM:1}; zero={}

# build CD A elements from base a,b and e2:  these have base-entries that are
# themselves products. We want x*y to involve a triple product => associator.
# Candidate witnesses (re,im):
cands={
 "x=(a,b),y=(c,0)": ((a,b),(c,zero)),
 "x=(a,b),y=(0,c)": ((a,b),(zero,c)),
 "x=(0,a),y=(b,c)": ((zero,a),(b,c)),
 "x=(a,0),y=(b,c)": ((a,zero),(b,c)),
 "x=(ab,0),y=(0,c)": ((amul(a,b),zero),(zero,c)),
 "x=(0,ab),y=(0,c)": ((zero,amul(a,b)),(zero,c)),
 "x=(0,ab),y=(c,0)": ((zero,amul(a,b)),(c,zero)),
 "x=(0,a),y=(0,bc)": ((zero,a),(zero,amul(b,c))),
}
refs={}
for t in itertools.product([0,1,2],repeat=3):
    refs[t]=assoc(gen(t[0]),gen(t[1]),gen(t[2]))
def match(D):
    out=[]
    for t,rf in refs.items():
        if rf and D==rf: out.append(('+',t))
        if rf and D==aneg(rf): out.append(('-',t))
    return out
for nm,(x,y) in cands.items():
    D=D_of(x,y)
    print(f"{nm:20s}: D {len(D)} terms; assoc-match={match(D)}")
    if 0 < len(D) <= 4:
        for m,co in sorted(D.items(),key=lambda kv:str(kv[0])):
            print(f"        {co:+d} * {m}")
