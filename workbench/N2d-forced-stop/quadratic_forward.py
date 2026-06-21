"""
N2d-hard — DECISIVE: does the QUADRATIC/Hurwitz hypothesis kill the full 12-term defect?

Hypothesis carried on the base A (the trunk's composition structure, DERIVED up the
doubling, not posited):
  star is an involutive anti-automorphism, A associative, and for every a:
     tau(a) := a + star a   is CENTRAL  (trace central)
     nu(a)  := a * star a   is CENTRAL  (norm  central)
  equivalently star a = tau(a) - a with tau(a), nu(a) central scalars and the
  quadratic relation a^2 = tau(a) a - nu(a).

We model this in the FREE associative ring on {a,b,c,d} adjoined with CENTRAL
indeterminates {ta,tb,tc,td, na,nb,nc,nd} (the trace/norm scalars), with:
   star(a) = ta - a   (and star fixes the central scalars)
   reduction rule  a*a -> ta*a - na   (the quadratic relation; squares of a SINGLE
                                        generator only)
Central scalars commute with everything and are star-fixed.

If the norm-defect D reduces to 0 under (associativity + central scalars + the
quadratic squaring rule), the quadratic hypothesis SUFFICES and the Lean proof is a
substitution + ring computation.
"""
from collections import defaultdict

# A monomial is a tuple of factors. A factor is either:
#   ('g', k)        a generator a=0,b=1,c=2,d=3   (NOT starred; star is expanded away)
#   ('s', name)     a central scalar  name in {ta,tb,tc,td,na,nb,nc,nd}
# Central scalars are collected to the FRONT (they commute), generators keep order.
# Coeff: integer.  A ring element is dict[monomial] -> int.

def norm_mono(m):
    """canonicalize: pull central scalars (sorted) to front, keep generator order."""
    scal = sorted([f for f in m if f[0]=='s'])
    gens = [f for f in m if f[0]=='g']
    return tuple(scal+gens)

def padd(x,y):
    r=defaultdict(int,x)
    for m,c in y.items():
        r[m]+=c
        if r[m]==0: del r[m]
    return dict(r)
def pneg(x): return {m:-c for m,c in x.items()}
def psub(x,y): return padd(x,pneg(y))
def pmul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            m=norm_mono(mx+my)
            r[m]+=cx*cy
            if r[m]==0: del r[m]
    return dict(r)

def reduce_squares(x):
    """apply a*a -> ta*a - na for a single generator repeated adjacently, repeatedly."""
    changed=True
    cur=x
    while changed:
        changed=False
        nxt=defaultdict(int)
        for m,c in cur.items():
            # find first adjacent equal generator pair
            done=False
            gens=[i for i,f in enumerate(m) if f[0]=='g']
            for i in range(len(m)-1):
                if m[i][0]=='g' and m[i+1][0]=='g' and m[i][1]==m[i+1][1]:
                    k=m[i][1]
                    tname=('s',f"t{chr(97+k)}")
                    nname=('s',f"n{chr(97+k)}")
                    pre=m[:i]; post=m[i+2:]
                    # replace a a -> t*a - n
                    m1=norm_mono(pre+(tname,m[i])+post)
                    m2=norm_mono(pre+(nname,)+post)
                    nxt[m1]+=c
                    nxt[m2]-=c
                    done=True; changed=True
                    break
            if not done:
                nxt[m]+=c
        cur={m:c for m,c in nxt.items() if c!=0}
    return cur

def gen(k): return {(('g',k),):1}
def star_gen(k): return {(('s',f"t{chr(97+k)}"),):1, (('g',k),):-1}  # ta - a

# build star of an arbitrary element (anti-automorphism): reverse, star each factor
def pstar(x):
    r=defaultdict(int)
    for m,c in x.items():
        # star(prod f_i) = prod star(f_i) reversed
        parts=[]
        for f in m:
            if f[0]=='s': parts.append({(f,):1})          # central scalar star-fixed
            else: parts.append(star_gen(f[1]))            # star(a)=ta-a
        acc={():1}
        for p in reversed(parts):
            acc=pmul(acc,p)
        acc=reduce_squares(acc)
        for mm,cc in acc.items():
            r[mm]+=c*cc
            if r[mm]==0: del r[mm]
    return dict(r)

a,b,c,d=gen(0),gen(1),gen(2),gen(3)

def Nrm_base(z):
    # z=(re,im) elements; Nrm = re*star(re) + star(im)*im
    re,im=z
    return reduce_squares(padd(pmul(re,pstar(re)), pmul(pstar(im),im)))

def cd_mul(z,w):
    (ar,ai),(cr,ci)=z,w
    re=reduce_squares(psub(pmul(ar,cr), pmul(pstar(ci),ai)))
    im=reduce_squares(padd(pmul(ci,ar), pmul(ai,pstar(cr))))
    return (re,im)

x=(a,b); y=(c,d)
Lhs=Nrm_base(cd_mul(x,y))
Rhs=reduce_squares(pmul(Nrm_base(x),Nrm_base(y)))
D=psub(Lhs,Rhs)
print(f"D has {len(D)} surviving terms under (assoc + central scalars + quadratic squaring).")
if not D:
    print("RESULT: D == 0.  The QUADRATIC hypothesis (trace+norm central) SUFFICES. ✓")
else:
    print("RESULT: D != 0 — quadratic hypothesis NOT sufficient as modeled. Surviving:")
    for m,co in sorted(D.items(),key=lambda kv:str(kv[0]))[:40]:
        s=''.join((f[1] if f[0]=='s' else chr(97+f[1])) for f in m)
        print(f"   {co:+d} {s}")
