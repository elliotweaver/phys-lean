"""
N2d-hard-backward — THE NORMALITY-DEFECT SHORT ROUTE.

Discovery (closing_chain.py): the simplest nonzero norm-defect on CD A is
  D(iota_A m, e2_A) = ( star m * m  -  m * star m , 0_A )    [in A]
i.e. exactly the NORMALITY DEFECT of the base element m in A.  So if we can pick
m in A = CD B that is NON-NORMAL (m*star m != star m*m), the witness
  x = iota_A m,  y = e2_A   in  CD A = CD(CD B)
gives a NONZERO norm-defect, i.e. Nrm not multiplicative -- the WHOLE backward.

Target base A = CD B, B associative *-ring.  A non-associative <=> B non-commutative
(banked iota_iota_e2_assoc_iff).  Question: does B non-commutative force a NON-NORMAL
element m in A = CD B?  Try m = (p,q) = iota_B p + e2_B * (something), i.e. m with
re=p, im=q for a non-commuting pair p,q in B.  Compute normality defect
  ND(m) := star m * m - m * star m   in A = CD B
and express via [p,q].  CLEAN => the entire backward closes with a 1-line witness.
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
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def b_star(x):
    r=defaultdict(int)
    for m,c in x.items():
        r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
Z={}; oneB={():1}
def g(s): return {(s,):1}
p,q=g('p'),g('q')
comm=b_sub(b_mul(p,q),b_mul(q,p))   # [p,q]

# CD B = A
def cmul(z,w):
    a,b=z;c,d=w
    return (b_sub(b_mul(a,c),b_mul(b_star(d),b)), b_add(b_mul(d,a),b_mul(b,b_star(c))))
def cstar(z): return (b_star(z[0]),b_neg(z[1]))
def cadd(z,w): return (b_add(z[0],w[0]),b_add(z[1],w[1]))
def csub(z,w): return (b_sub(z[0],w[0]),b_sub(z[1],w[1]))
def cisz(z): return (not E(z[0])) and (not E(z[1]))

def ND(m):  # normality defect star m * m - m * star m  in A = CD B
    return csub(cmul(cstar(m),m), cmul(m,cstar(m)))

def fmt1(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(mm) if mm else "1"}' for mm,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmtA(z): return f'[ {fmt1(z[0])} ; {fmt1(z[1])} ]'

def clean_comm(coord):
    if not E(coord): return None
    ks=set(); allk=set(coord)|set(comm)
    for k in allk:
        cv=coord.get(k,0); bv=comm.get(k,0)
        if bv==0:
            if cv!=0: return None
        else: ks.add((cv,bv))
    if len(ks)==1:
        cv,bv=ks.pop()
        if cv%bv==0: return cv//bv
    return None

candidates={
 '(p,q)':(p,q),
 '(p,0)':(p,Z),
 '(0,p)':(Z,p),
 '(p,q*)':(p,b_star(q)),
 '(0,pq)':(Z,b_mul(p,q)),
 '(p, q) with im=q':(p,q),
 '(q,p)':(q,p),
 '(1,p)':(oneB,p),
 '(p,1)':(p,oneB),
}
print("base [p,q] =", fmt1(comm),"\n")
print("=== normality defect ND(m) = star m * m - m * star m in A=CD B ===")
for nm,m in candidates.items():
    d=ND(m)
    if cisz(d):
        print(f"  m={nm:14s}: ND=0  (m normal)")
        continue
    tag=""
    k0=clean_comm(d[0]); k1=clean_comm(d[1])
    if k0 is not None and not E(d[1]): tag=f"  == iota_B({k0}*[p,q])  <<< CLEAN, real"
    elif k1 is not None and not E(d[0]): tag=f"  == e2-slot {k1}*[p,q]  <<< CLEAN, imag"
    print(f"  m={nm:14s}: ND={fmtA(d)}{tag}")

print()
print("=== KEY: m=(p,q). Is ND(m) nonzero exactly when [p,q]!=0? ===")
m=(p,q); d=ND(m)
print("  ND((p,q)) =", fmtA(d))
# substitute p,q commuting (collapse to commutative) -> should vanish
def commutative_collapse(x):
    r=defaultdict(int)
    for mm,c in x.items():
        r[tuple(sorted(mm))]+=c
    return E(dict(r))
cc0=commutative_collapse(d[0]); cc1=commutative_collapse(d[1])
print("  under [p,q]=0 collapse: re=",fmt1({''.join(k):v for k,v in cc0.items()}),
      " im=",fmt1({''.join(k):v for k,v in cc1.items()}))
