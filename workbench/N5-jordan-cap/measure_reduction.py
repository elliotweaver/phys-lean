"""measure_reduction (run 57): is the central-diagonal reduction
    jdef(Dm + Xz)(Em + Yz) = jdef(Xz)(Yz)
provable by CENTRALITY ALONE (no alternativity)?

Test in a model where the scalars d0..e2 are central (commute+associate freely) but the
off-diagonal octonions a..r live in a FREE NON-ASSOCIATIVE algebra (alternativity FAILS).
If the reduction difference is still identically zero as free trees (using only
central-scalar moves), then the Lean reduction needs ONLY ocR-centrality (ocR_comm/assoc)
— cheap, structural, no associator algebra. That makes it the bankable lemma to write first.

Model: free magma on atoms {a,b,c,p,q,r, A,B,C,P,Q,R} (A=star a ...) with NO relations,
plus central scalar symbols {d0,d1,d2,e0,e1,e2}. A central scalar s satisfies, for the
purpose of normal form, s*x = x*s and (s*x)*y = s*(x*y) = x*(s*y)*... i.e. scalars pull
out to a single front coefficient and commute. We represent a monomial as
(scalar_multiset, tree) and a vector as dict[(frozen_scalar_counts, tree)] -> Fraction.
Multiplication of two such: scalars combine (central), trees multiply as free magma.
This faithfully models 'scalars are central, octonions are otherwise free'.
"""
from fractions import Fraction as F
from collections import defaultdict

SCALARS = {'d0','d1','d2','e0','e1','e2'}
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k

# monomial key = (tuple(sorted scalar names with multiplicity), tree)
# tree = leaf str (octonion atom) OR ('*', left, right). Scalars are NEVER in the tree.
def smul(s1, s2): return tuple(sorted(s1 + s2))

def E_oct(atom):   return {((), atom): F(1)}
def E_scal(name):  return {((name,), None): F(1)}   # tree=None means "pure scalar"
ZERO = {}
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for k,v in x.items(): r[k]+=v
    return {k:v for k,v in r.items() if v!=0}
def neg(x): return {k:-v for k,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for (s1,t1),c1 in x.items():
        for (s2,t2),c2 in y.items():
            s = smul(s1,s2)
            # tree multiply: None acts as multiplicative identity (pure scalar)
            if t1 is None and t2 is None: t = None
            elif t1 is None: t = t2
            elif t2 is None: t = t1
            else: t = ('*', t1, t2)
            r[(s,t)] += c1*c2
    return {k:v for k,v in r.items() if v!=0}

def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def Dm(d0,d1,d2): return [[E_scal(d0),dict(ZERO),dict(ZERO)],
                          [dict(ZERO),E_scal(d1),dict(ZERO)],
                          [dict(ZERO),dict(ZERO),E_scal(d2)]]
def Xz(a,b,c): return [[dict(ZERO),E_oct(a),E_oct(b)],
                       [E_oct(STAR[a]),dict(ZERO),E_oct(c)],
                       [E_oct(STAR[b]),E_oct(STAR[c]),dict(ZERO)]]
def msub(A,B): return madd(A, mneg(B))

A_full = madd(Dm('d0','d1','d2'), Xz('a','b','c'))
B_full = madd(Dm('e0','e1','e2'), Xz('p','q','r'))
X = Xz('a','b','c'); Y = Xz('p','q','r')

diff = msub(jdef(A_full,B_full), jdef(X,Y))
print("=== central-diagonal reduction: jdef(Dm+Xz)(Em+Yz) - jdef(Xz)(Yz) ===")
print("(model: scalars central, octonions FREE non-associative)\n")
allzero=True; tot=0
for i in range(3):
    for j in range(3):
        n=len(diff[i][j]); tot+=n
        allzero = allzero and (n==0)
        print(f"  ({i},{j}): residual monomials = {n}")
print(f"\n  TOTAL residual = {tot}")
print(f"  REDUCTION HOLDS BY CENTRALITY ALONE (no alternativity needed): {allzero}")
if not allzero:
    print("\n  --> reduction needs MORE than scalar-centrality. Sample residual (0,1):")
    for k,v in list(diff[0][1].items())[:8]:
        print("       ", v, k)
