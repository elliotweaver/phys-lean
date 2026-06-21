"""
N2d-hard-backward — REVERSE-ENGINEER the generic witness from the banked concrete
zdX, zdY (S = CD(O Q) = CD(CD(H Q))), abstracting the non-commuting quaternion pair
i,j to a free pair p,q in a general associative *-ring B.

Abstracted witness (B = role of H):
   x = ((p,0),(q,0))  in CD(CD B)
   y = ((0,p),(0,q))  in CD(CD B)
Claim under test: defect D = Nrm(x*y) - Nrm(x)*Nrm(y)  (valued in CD B) is a CLEAN
function of [p,q] = pq - qp  (and its star), nonzero iff p,q do not commute.

B = free associative *-ring on p,q.  star is an anti-automorphism; we treat p,q as
GENERAL (NOT self-adjoint): star p = P, star q = Q, with P,Q independent generators
(star(pq)=QP, star(P)=p, etc).  Monomials = tuples of letters in {p,q,P,Q}.
"""
from collections import defaultdict

STAR = {'p':'P','q':'Q','P':'p','Q':'q'}
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
        r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
Z={}
oneB={():1}
def g(s): return {(s,):1}
p,q = g('p'),g('q')
comm = b_sub(b_mul(p,q),b_mul(q,p))   # [p,q] = pq - qp

# CD over a *-ring with given (add,neg,mul,star)
def mkCD(add,neg,sub,mul,star,zero):
    def cadd(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cneg(z): return (neg(z[0]),neg(z[1]))
    def csub(z,w): return cadd(z,cneg(w))
    def cmul(z,w):
        a,b=z;c,d=w
        return (sub(mul(a,c),mul(star(d),b)), add(mul(d,a),mul(b,star(c))))
    def cstar(z): return (star(z[0]),neg(z[1]))
    return cadd,cneg,csub,cmul,cstar,(zero,zero)

# level 1: CD B
c1add,c1neg,c1sub,c1mul,c1star,c1zero = mkCD(b_add,b_neg,b_sub,b_mul,b_star,Z)
# level 2: CD(CD B)
c2add,c2neg,c2sub,c2mul,c2star,c2zero = mkCD(c1add,c1neg,c1sub,c1mul,c1star,c1zero)

def Nrm(u):  # u in CD(CD B); returns element of CD B
    return c2mul(u, c2star(u))[0]
def defect(x,y):
    return c1sub(Nrm(c2mul(x,y)), c1mul(Nrm(x),Nrm(y)))

def fmt_b(x):
    if not E(x): return '0'
    return ' '.join(f'{c:+d}{"".join(m) if m else "1"}' for m,c in
                    sorted(x.items(),key=lambda kv:(len(kv[0]),kv[0])))
def fmt_cd(z): return f'[ {fmt_b(z[0])} ; {fmt_b(z[1])} ]'

# the reverse-engineered witness
x = ((p, Z), (q, Z))   # ((p,0),(q,0))
y = ((Z, p), (Z, q))   # ((0,p),(0,q))
D = defect(x,y)
print("witness  x=((p,0),(q,0))   y=((0,p),(0,q))")
print("defect D = Nrm(xy) - Nrm x Nrm y  (in CD B):")
print("  ", fmt_cd(D))
print()
print("[p,q] = pq - qp =", fmt_b(comm))
print("[q,p] = qp - pq =", fmt_b(b_neg(comm)))
print()

# Test: is each coordinate of D a clean multiple of [p,q] or [P,Q]?
commPQ = b_sub(b_mul(g('P'),g('Q')), b_mul(g('Q'),g('P')))  # [P,Q]=PQ-QP
for ci,coord in enumerate(D):
    print(f"coord {ci}: {fmt_b(coord)}")
    # try to express as a*[p,q] + b*[P,Q]
    for desc, basis in (("[p,q]",comm),("[q,p]",b_neg(comm)),
                        ("[P,Q]",commPQ),("[p,q]+[P,Q]",b_add(comm,commPQ)),
                        ("[p,q]-[P,Q]",b_sub(comm,commPQ))):
        # check proportionality: coord == k*basis for some integer k
        if not E(coord) and not E(basis): 
            continue
        keys = set(coord)|set(basis)
        ratios=set()
        ok=True
        for k in keys:
            cv=coord.get(k,0); bv=basis.get(k,0)
            if bv==0:
                if cv!=0: ok=False;break
            else:
                ratios.add((cv,bv))
        if ok and len(ratios)==1:
            cv,bv=ratios.pop()
            print(f"     == ({cv}/{bv}) * {desc}")
