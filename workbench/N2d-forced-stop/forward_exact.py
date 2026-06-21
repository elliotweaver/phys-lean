"""
N2d-hard — NAIL the exact forward cancellation so the Lean proof is a transcription.

Hypotheses on the base A (DERIVED on CD B up the doubling, see below; here modeled as
a free ASSOCIATIVE *-ring on {a,b,c,d} PLUS the two trunk relations as rewrite rules):
  (assoc)   free associative monomials (so associativity is automatic)
  (star)    involutive anti-automorphism on the FREE generators (formal)
  (sigma)   for every generator g: g·star(g) is CENTRAL  (the Born self-overlap is central)
  (sym)     for every generator g: star(g)·g = g·star(g)

We compute D = Nrm(xy) - Nrm(x)Nrm(y) for x=(a,b), y=(c,d) and REDUCE using only:
  - associativity (free monomials, automatic)
  - moving a central self-overlap block (g·g*) or (g*·g) past adjacent factors
  - rewriting g*·g -> g·g*  (sym)
We DO NOT assume the quadratic/trace relation (that was too weak). We assume EXACTLY the
two trunk facts. Goal: D reduces to 0, and we print the cancellation pairing for Lean.
"""
from collections import defaultdict

# monomial = tuple of factors; factor = (k, conj_bool). Associative free product.
def gen(k): return {((k,False),):1}
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
            r[mx+my]+=cx*cy
            if r[mx+my]==0: del r[mx+my]
    return dict(r)
def sfac(f): return (f[0],not f[1])
def astar(x):
    r=defaultdict(int)
    for m,c in x.items():
        sm=tuple(sfac(f) for f in reversed(m)); r[sm]+=c
        if r[sm]==0: del r[sm]
    return dict(r)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (asub(amul(a,c),amul(astar(d),b)),aadd(amul(d,a),amul(b,astar(c))))
def Nrm(z):
    a,b=z;return aadd(amul(a,astar(a)),amul(astar(b),b))
a,b,c,d=gen(0),gen(1),gen(2),gen(3)

def fmt(m): return ''.join(f"{'*' if f[1] else ''}{chr(97+f[0])}" for f in m) if m else "1"

# A "self-overlap block" is a length-2 monomial-factor-pair (g,g*) or (g*,g) for a SINGLE k.
def is_so_pair(f1,f2):
    return f1[0]==f2[0] and f1[1]!=f2[1]   # same generator, opposite conj

def reduce_central(x, maxpass=2000):
    """Repeatedly: (a) rewrite (g*,g)->(g,g*) via sym; (b) move a self-overlap block
       (g,g*) leftwards/rightwards to a canonical leftmost position, since it's central.
       Canonicalization: bubble every self-overlap block to the FRONT of its monomial
       (central => commutes with everything), and order multiple blocks by generator."""
    changed=True; cur=x; passes=0
    while changed and passes<maxpass:
        changed=False; passes+=1
        nxt=defaultdict(int)
        for m,co in cur.items():
            m=list(m); did=False
            # (a) sym: any adjacent (g*,g) -> (g,g*)
            for i in range(len(m)-1):
                if m[i][0]==m[i+1][0] and m[i][1]==True and m[i+1][1]==False:
                    m[i],m[i+1]=(m[i][0],False),(m[i+1][0],True)
                    did=True; break
            if not did:
                # (b) find a self-overlap block (g,g*) not already at front; bubble it left
                for i in range(len(m)-1):
                    if is_so_pair(m[i],m[i+1]) and m[i][1]==False and m[i+1][1]==True:
                        # this is (g,g*) central block at position i; if i>0, swap block past m[i-1]
                        if i>0:
                            blk=m[i:i+2]; pre=m[:i]; 
                            # move block before pre[-1]
                            m=pre[:-1]+blk+[pre[-1]]+m[i+2:]
                            did=True; break
                # canonical ordering of two adjacent front blocks by generator
            if did:
                changed=True
            nxt[tuple(m)]+=co
            if nxt[tuple(m)]==0: del nxt[tuple(m)]
        cur={m:c for m,c in nxt.items() if c!=0}
    return cur

x=(a,b);y=(c,d)
D=asub(Nrm(cd_mul(x,y)),amul(Nrm(x),Nrm(y)))
print(f"raw D: {len(D)} terms")
Dr=reduce_central(D)
print(f"after central-reduction: {len(Dr)} terms")
for m,co in sorted(Dr.items(),key=lambda kv:str(kv[0])):
    print(f"   {co:+d} {fmt(m)}")
if not Dr:
    print("\nRESULT: D == 0 under {assoc + self-overlap central + sym}. Forward hypothesis SUFFICES. ✓")
