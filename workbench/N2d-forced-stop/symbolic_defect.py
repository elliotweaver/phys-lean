"""
N2d-hard-backward — symbolic defect over the FREE *-ring, for the survivor witness
forms, to find the one whose defect is a CLEAN function of the commutator [p,q].

Target abstract theorem: B [Ring][StarRing], p q : B, p*q != q*p
   ==> exists x y : CD(CD B), Nrm(x*y) != Nrm x * Nrm y.
For the Lean proof we want a witness whose defect D (an element of A=CD B) has a
B-component that equals (a unit multiple of) p*q - q*p MODULO terms that simp/ring
can clearly handle -- ideally EXACTLY p*q - q*p so D=0 forces p*q=q*p.

B = free associative *-ring on p,q; star anti-automorphism, star p=P, star q=Q
(P,Q independent symbols, NO centrality imposed).
"""
from collections import defaultdict

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
p,q=ng('p'),ng('q')
comm=nsub(nmul(p,q),nmul(q,p))

# A = CD N (=CD B)
def A_add(z,w): return (nadd(z[0],w[0]),nadd(z[1],w[1]))
def A_neg(z): return (nneg(z[0]),nneg(z[1]))
def A_sub(z,w): return A_add(z,A_neg(w))
def A_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def A_star(z): return (nstar(z[0]),nneg(z[1]))
AZ=(NZ,NZ); AO=(nOne,NZ)
def A0(z): return (not E(z[0])) and (not E(z[1]))
# CD A
def C_mul(u,v):
    a,b=u;c,d=v
    return (A_sub(A_mul(a,c),A_mul(A_star(d),b)), A_add(A_mul(d,a),A_mul(b,A_star(c))))
def C_star(u): return (A_star(u[0]),A_neg(u[1]))
def Nrm(u): return C_mul(u,C_star(u))[0]
def defect(x,y): return A_sub(Nrm(C_mul(x,y)), A_mul(Nrm(x),Nrm(y)))

# base-A elements
alpha=(p,NZ); beta=(q,NZ); gamma=(NZ,nOne); Aone=AO; Azero=AZ
basic={'al':alpha,'be':beta,'ga':gamma,'1':Aone,'0':Azero}
AF=dict(basic)
for n1 in ['al','be','ga']:
    for n2 in ['al','be','ga']:
        AF[f'{n1}{n2}']=A_mul(basic[n1],basic[n2])
def make(form): return (AF[form[0]],AF[form[1]])

def fmt_n(x):
    if not E(x): return '0'
    return ''.join(f'{c:+d}{"".join(m) if m else "I"}' for m,c in sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_a(z): return f'<{fmt_n(z[0])} | {fmt_n(z[1])}>'

# the survivor forms found over quaternions (a representative subset incl. simplest)
survivors=[
 (('al','be'),('alga','bega')),
 (('al','be'),('alga','gabe')),
 (('al','be'),('bega','alga')),
 (('al','ga'),('albe','bega')),
 (('al','bega'),('be','alga')),
 (('al','bega'),('ga','albe')),
 (('al','ga'),('beal','bega')),
]
# also test very simplest 3-elt forms directly
extra=[
 (('al','be'),('ga','0')),
 (('al','be'),('0','ga')),
 (('al','ga'),('be','0')),
 (('alga','0'),('be','0')),
 (('al','0'),('be','ga')),
 (('al','0'),('bega','0')),
 (('al','be'),('ga','ga')),
]
def commclass(z):
    """describe z relative to comm [p,q]=pq-qp"""
    def slot(s):
        if not E(s): return '0'
        c1=s.get(('p','q'),0); c2=s.get(('q','p'),0)
        rem={m:v for m,v in s.items() if m not in (('p','q'),('q','p'))}
        if not rem and c1==-c2 and c1!=0: return f'{c1}[p,q]'
        if not rem and c1==c2 and c1!=0 and len(s)==2: return f'{c1}(pq+qp)'
        return 'OTHER'
    return (slot(z[0]),slot(z[1]))

print("=== free-*-ring defects of candidate witnesses ===")
for xf,yf in survivors+extra:
    d=defect(make(xf),make(yf))
    print(f"x={xf} y={yf}")
    print(f"   D = {fmt_a(d)}")
    print(f"   class = {commclass(d)}")
