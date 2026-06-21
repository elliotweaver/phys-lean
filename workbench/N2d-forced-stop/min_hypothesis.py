"""
N2d-hard — DECISIVE: pin the exact minimal hypothesis for the easy direction,
and the cleanest contrapositive.

Search small ASSOCIATIVE *-algebras for a counterexample to each candidate
easy-direction hypothesis H ==> "Nrm multiplicative on CD A":
   H1: A associative                              (expect: HAS counterexample -> 2x2 mat)
   H2: A associative + self-overlaps central      (the trunk Born property)
   H3: A associative + self-overlaps central + base-Nrm multiplicative on A
We test on a battery of concrete associative *-algebras.
"""
from fractions import Fraction as Fr
import itertools, random

# ---- generic associative *-algebra interface: element ops + star ----
# We test several concrete algebras. Each provides: zero, add, neg, mul, star, eq, rand, one.

def make_matrix_algebra(nstar):
    """2x2 rational matrices; involution: transpose (nstar='T') or symplectic adjugate (nstar='S')."""
    def zero(): return ((Fr(0),Fr(0)),(Fr(0),Fr(0)))
    def add(A,B): return tuple(tuple(A[i][j]+B[i][j] for j in range(2)) for i in range(2))
    def neg(A): return tuple(tuple(-A[i][j] for j in range(2)) for i in range(2))
    def mul(A,B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
    if nstar=='T':
        def star(A): return tuple(tuple(A[j][i] for j in range(2)) for i in range(2))
    else:  # symplectic: [[a,b],[c,d]]* = [[d,-b],[-c,a]]  (this is the 'conjugate', a quaternion-like involution)
        def star(A): return ((A[1][1],-A[0][1]),(-A[1][0],A[0][0]))
    def eq(A,B): return A==B
    def rand(): return tuple(tuple(Fr(random.randint(-2,2)) for _ in range(2)) for _ in range(2))
    one=((Fr(1),Fr(0)),(Fr(0),Fr(1)))
    return dict(zero=zero,add=add,neg=neg,mul=mul,star=star,eq=eq,rand=rand,one=one,name=f"2x2mat[{nstar}]")

def make_cd_algebra(L):
    """recursive Cayley-Dickson over Q to level L (1 C, 2 H, 3 O). associative for L<=2."""
    def z0(k): return Fr(0) if k==0 else (z0(k-1),z0(k-1))
    def radd(x,y,k): return x+y if k==0 else (radd(x[0],y[0],k-1),radd(x[1],y[1],k-1))
    def rneg(x,k): return -x if k==0 else (rneg(x[0],k-1),rneg(x[1],k-1))
    def rstar(x,k): return x if k==0 else (rstar(x[0],k-1),rneg(x[1],k-1))
    def rmul(x,y,k):
        if k==0: return x*y
        a,b=x;c,d=y
        return (radd(rmul(a,c,k-1),rneg(rmul(rstar(d,k-1),b,k-1),k-1),k-1),
                radd(rmul(d,a,k-1),rmul(b,rstar(c,k-1),k-1),k-1))
    def is0(x,k): return x==0 if k==0 else (is0(x[0],k-1) and is0(x[1],k-1))
    def rand(k):
        return Fr(random.randint(-2,2)) if k==0 else (rand(k-1),rand(k-1))
    def one_(k): return Fr(1) if k==0 else (one_(k-1),z0(k-1))
    return dict(zero=lambda:z0(L),add=lambda A,B:radd(A,B,L),neg=lambda A:rneg(A,L),
                mul=lambda A,B:rmul(A,B,L),star=lambda A:rstar(A,L),
                eq=lambda A,B:is0(radd(A,rneg(B,L),L),L),rand=lambda:rand(L),one=one_(L),
                name={1:"C",2:"H",3:"O"}[L])

def make_group_algebra(elements, mult_table, star_perm):
    """Q[G] for a small (possibly nonabelian) group; star = inverse-extended involution."""
    n=len(elements)
    def zero(): return tuple(Fr(0) for _ in range(n))
    def add(A,B): return tuple(A[i]+B[i] for i in range(n))
    def neg(A): return tuple(-A[i] for i in range(n))
    def mul(A,B):
        r=[Fr(0)]*n
        for i in range(n):
            if A[i]==0: continue
            for j in range(n):
                if B[j]==0: continue
                r[mult_table[i][j]]+=A[i]*B[j]
        return tuple(r)
    def star(A):
        r=[Fr(0)]*n
        for i in range(n): r[star_perm[i]]+=A[i]
        return tuple(r)
    def eq(A,B): return A==B
    def rand(): return tuple(Fr(random.randint(-1,1)) for _ in range(n))
    one=tuple(Fr(1) if i==0 else Fr(0) for i in range(n))
    return dict(zero=zero,add=add,neg=neg,mul=mul,star=star,eq=eq,rand=rand,one=one,name="Q[G]")

def test_algebra(alg, trials=400):
    add,neg,mul,star,eq,rand,zero=alg['add'],alg['neg'],alg['mul'],alg['star'],alg['eq'],alg['rand'],alg['zero']
    # base Nrm on A: a*a* + ... no: base self-overlap = a*star(a). multiplicative?
    def baseNrm(a): return mul(a,star(a))
    # checks
    assoc_fail=cent_fail=sym_fail=baseN_fail=0
    for _ in range(trials):
        a,b,c=rand(),rand(),rand()
        if not eq(mul(mul(a,b),c), mul(a,mul(b,c))): assoc_fail+=1
        so=baseNrm(a)
        if not eq(mul(so,b),mul(b,so)): cent_fail+=1
        if not eq(so, mul(star(a),a)): sym_fail+=1
        if not eq(baseNrm(mul(a,b)), mul(baseNrm(a),baseNrm(b))): baseN_fail+=1
    # CD Nrm multiplicativity on CD A
    def cdmul(z,w):
        (ar,ai),(cr,ci)=z,w
        return (add(mul(ar,cr),neg(mul(star(ci),ai))), add(mul(ci,ar),mul(ai,star(cr))))
    def cdNrm(z):
        ar,ai=z; return add(mul(ar,star(ar)), mul(star(ai),ai))
    cd_fail=0
    for _ in range(trials):
        x=(rand(),rand()); y=(rand(),rand())
        L=cdNrm(cdmul(x,y)); R=mul(cdNrm(x),cdNrm(y))
        if not eq(L,R): cd_fail+=1
    return dict(assoc=assoc_fail,cent=cent_fail,sym=sym_fail,baseN=baseN_fail,cdNrm=cd_fail)

# S3 group (nonabelian, order 6); star = inverse
S3=[(),(0,1),(0,2),(1,2),(0,1,2),(0,2,1)]  # placeholder labels; build mult by permutation compose
perms=[ (0,1,2),(1,0,2),(2,1,0),(0,2,1),(1,2,0),(2,0,1) ]  # the 6 perms of {0,1,2}
def compose(p,q): return tuple(p[q[i]] for i in range(3))
def inv(p):
    r=[0,0,0]
    for i in range(3): r[p[i]]=i
    return tuple(r)
idx={p:i for i,p in enumerate(perms)}
mt=[[idx[compose(perms[i],perms[j])] for j in range(6)] for i in range(6)]
sp_=[idx[inv(perms[i])] for i in range(6)]

algs=[make_cd_algebra(1),make_cd_algebra(2),make_cd_algebra(3),
      make_matrix_algebra('T'),make_matrix_algebra('S'),
      make_group_algebra(perms,mt,sp_)]
print(f"{'algebra':12s} {'assoc✗':>7s} {'cent✗':>7s} {'sym✗':>6s} {'baseN✗':>7s} {'CD-Nrm✗':>8s}   verdict")
for alg in algs:
    r=test_algebra(alg)
    assocOK=r['assoc']==0; centOK=r['cent']==0; baseOK=r['baseN']==0; cdOK=r['cdNrm']==0
    v=[]
    if assocOK and not cdOK: v.append("H1✗(assoc alone NOT enough)")
    if assocOK and centOK and not cdOK: v.append("H2✗(assoc+central NOT enough)")
    if assocOK and centOK and baseOK and not cdOK: v.append("H3✗")
    if assocOK and centOK and baseOK and cdOK: v.append("H3✓")
    print(f"{alg['name']:12s} {r['assoc']:>7d} {r['cent']:>7d} {r['sym']:>6d} {r['baseN']:>7d} {r['cdNrm']:>8d}   {' '.join(v)}")
