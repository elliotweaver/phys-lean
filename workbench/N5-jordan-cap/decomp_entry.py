"""decomp_entry (run 58): for a chosen building-block entry, find its explicit associator
decomposition. Strategy: the entry is a sum of (xy)z and x(yz) monomials. Group by atom-word
(the flattened leaf sequence); within each atom-word the bracketings differ by associators.
Express entry = sum of associators [u,v,w], then identify each associator as a transport
lever provable by bounded ext;ring (a "ka-sibling").

We compute the entry in the FREE non-associative algebra, then GREEDILY extract associators:
repeatedly pick a monomial, find its associator partner (same atom-word, adjacent bracketing),
subtract the associator. Print the residual associator list.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys

def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}
def E_(x): return {x:F(1)}
ZERO={}
def mzero(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            s=dict(ZERO)
            for k in range(3): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: E_(s) if s else dict(ZERO)
    return [[dict(ZERO), z(o01), z(o02)],
            [star(E_(o01)) if o01 else dict(ZERO), dict(ZERO), z(o12)],
            [star(E_(o02)) if o02 else dict(ZERO), star(E_(o12)) if o12 else dict(ZERO), dict(ZERO)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)

def flat(m):
    if isinstance(m,str): return (m,)
    return flat(m[0])+flat(m[1])
def degree(m): return len(flat(m))

# print per-entry: group monomials by atom-word
i,j = int(sys.argv[1]), int(sys.argv[2])
E=D[i][j]
print(f"entry ({i},{j}): {len(E)} monomials, degree {degree(next(iter(E)))}")
groups=defaultdict(list)
for m,v in E.items():
    groups[flat(m)].append((m,v))
print(f"  {len(groups)} atom-words:")
for word,mons in sorted(groups.items(),key=lambda kv:str(kv[0])):
    csum=sum(v for _,v in mons)
    print(f"   {''.join(word)} (coeffsum={csum}): {len(mons)} bracketings")
    for m,v in mons:
        print(f"       {v:+}  {m}")
