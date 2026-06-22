from fractions import Fraction as F
from collections import defaultdict
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r),star_tree(l))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}
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
def Hm_zero(off):
    o01,o02,o12=off
    return [[dict(ZERO), E(o01), E(o02)],
            [E(STAR[o01]), dict(ZERO), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), dict(ZERO)]]
A=Hm_zero(('a','b','c')); B=Hm_zero(('p','q','r'))
D=jdef(A,B)
def leaves(m,acc):
    if is_leaf(m): acc.append(m)
    else: leaves(m[0],acc); leaves(m[1],acc)
def msig(m):
    acc=[]; leaves(m,acc); return tuple(sorted(acc))
def show(m):
    if is_leaf(m): return m
    return "("+show(m[0])+show(m[1])+")"
E_=D[0][1]
bysig=defaultdict(list)
for m,c in E_.items(): bysig[msig(m)].append((m,c))
for sig,items in sorted(bysig.items()):
    print(f"--- block {''.join(sig)} ({len(items)} terms) ---")
    for m,c in sorted(items,key=lambda t:show(t[0])):
        print(f"   {str(c):>4}  {show(m)}")
