"""
N2d-hard-backward — KEY IDEA: place the non-commuting pair p,q in the IMAGINARY
slots of CD(CD B), where star only flips SIGN (never conjugates). Then the norm
defect is a polynomial in p,q alone (no star p, star q), so the commutator [p,q]
can appear cleanly and "pq=qp" makes the defect vanish.

CD(CD B): flat coordinates (b0,b1,b2,b3), b0 the fully-real slot.
  star = (star b0, -b1, -b2, -b3).
Restrict witness components: b0-slot in {0,1}; p,q live in slots 1,2,3.

Goal: find explicit x,y with defect D(x,y) (in CD B) whose flat components are
multiples of [p,q]=pq-qp (and 0 otherwise), so D=0 forces pq=qp. Over a FREE
ASSOCIATIVE *-ring B on p,q (no centrality assumed) -- the cleanest possible.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def nadd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def nneg(x): return {m:-v for m,v in x.items()}
def nsub(x,y): return nadd(x,nneg(y))
def nmul(x,y):
    r=defaultdict(Fr)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def nstar(x):
    r=defaultdict(Fr)
    for m,c in x.items(): r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def ng(s): return {(s,):Fr(1)}
NZ={}; nOne={():Fr(1)}
p,q=ng('p'),ng('q')
comm=nsub(nmul(p,q),nmul(q,p))

def A_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def A_star(z): return (nstar(z[0]),nneg(z[1]))
def A_sub(z,w): return (nsub(z[0],w[0]),nsub(z[1],w[1]))
def C_mul(u,v):
    a,b=u;c,d=v
    return (A_sub(A_mul(a,c),A_mul(A_star(d),b)),
            (nadd(A_mul(d,a)[0],A_mul(b,A_star(c))[0]),
             nadd(A_mul(d,a)[1],A_mul(b,A_star(c))[1])))
def C_star(u): return (A_star(u[0]),(nneg(u[1][0]),nneg(u[1][1])))
def Nrm(u): return C_mul(u,C_star(u))[0]    # element of A=CD B = (B-pair)
def defect(x,y):
    n_xy=Nrm(C_mul(x,y)); nx=Nrm(x); ny=Nrm(y)
    prod=A_mul(nx,ny)
    return A_sub(n_xy,prod)   # element of A=CD B: a pair (b,b)
def A0(z): return (not E(z[0])) and (not E(z[1]))

# flat CD(CD B): ((b0,b1),(b2,b3))
def mk(b0,b1,b2,b3): return ((b0,b1),(b2,b3))
Bvoc={'0':NZ,'1':nOne,'p':p,'q':q}
bk=list(Bvoc.keys())

def flat_defect(d):
    # d is A=CD B element = (slotRe, slotIm), each a B-poly
    return (d[0],d[1])
def slot_class(s):
    if not E(s): return ('0',)
    c1=s.get(('p','q'),Fr(0)); c2=s.get(('q','p'),Fr(0))
    rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
    if not rem and c1==-c2 and c1!=0: return ('comm',c1)
    return ('OTHER', dict(s))

# enumerate witnesses: b0 in {0,1}; b1,b2,b3 in {0,1,p,q}; non-zero
def elems():
    out=[]
    for b0 in ['0','1']:
        for b1 in bk:
            for b2 in bk:
                for b3 in bk:
                    x=mk(Bvoc[b0],Bvoc[b1],Bvoc[b2],Bvoc[b3])
                    if A0(x[0]) and A0(x[1]): continue
                    out.append((x,(b0,b1,b2,b3)))
    return out
els=elems()
print(f"witness pool: {len(els)}")

clean=[]
for x,xl in els:
    for y,yl in els:
        d=defect(x,y)
        if A0(d): continue
        c0=slot_class(d[0]); c1=slot_class(d[1])
        if c0[0] in ('0','comm') and c1[0] in ('0','comm'):
            clean.append((xl,yl,c0,c1,d))
print(f"witnesses with BOTH slots in {{0, comm}}: {len(clean)}")
for xl,yl,c0,c1,d in clean[:25]:
    print(f"  x={xl} y={yl}  re:{c0} im:{c1}")
