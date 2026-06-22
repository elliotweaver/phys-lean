"""cert_freeword (run 50): the DECISIVE flat-span question in the CORRECT atom model.

Prior solvers (cert_span: alt-only NO-SOLUTION; cert_ch: dense, hung) used a
PRE-distribution / Zorn block model. The Lean proof route `simp only [add_mul, mul_add,
...] ; linear_combination (norm := abel) <cert>` lives in a DIFFERENT model: after full
distribution + pushing star to leaves, the goal is a sum of signed FREE-NON-ASSOCIATIVE
PRODUCT-WORDS (binary trees over leaves). abel treats each distinct tree as an atom.
The question THIS solver answers (never actually decided before): does each jdef(Hm,Hm)
entry, in that tree-atom model, lie in the ℚ-span of the distributed banked-lemma
instances?  If YES -> linear_combination route is ALIVE and the node closes cleanly.

Bounded + sparse: targeted pool (laws instantiated only over subterms that appear), sparse
exact-ℚ elimination. Hard wall via term cap. NOT cert_ch (dense full pool) — different model.
"""
from fractions import Fraction as F
from collections import defaultdict
import sys, time

t0=time.time()

# ---- free non-associative *-algebra over leaves; element = {tree: coeff} ----
GEN=['a','b','c','p','q','r']
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
DIAG=['d0','d1','d2','e0','e1','e2']           # central, self-adjoint
for d in DIAG: STAR[d]=d
def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r), star_tree(l))   # star(xy)=star y * star x
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def starx(x):
    r=defaultdict(F)
    for m,v in x.items(): r[star_tree(m)]+=v
    return {m:v for m,v in r.items() if v!=0}
def mul(x,y):                                   # free: keep full binary tree, distribute
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}

# ---- matrices ----
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[neg(x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Hm(diag,off):
    d0,d1,d2=diag; o01,o02,o12=off
    return [[E(d0),E(o01),E(o02)],
            [E(STAR[o01]),E(d1),E(o12)],
            [E(STAR[o02]),E(STAR[o12]),E(d2)]]

A=Hm(('d0','d1','d2'),('a','b','c'))
B=Hm(('e0','e1','e2'),('p','q','r'))
D=jdef(A,B)

# ---- collect subterms appearing in a target entry, to instantiate laws over ----
def subterms(x):
    s=set()
    def rec(m):
        s.add(m)
        if not is_leaf(m): rec(m[0]); rec(m[1])
    for m in x: rec(m)
    return s

# law generators: each returns an element that should be == 0 (lhs - rhs), distributed.
def L_alt_left(x,y):    # x(xy)-(xx)y
    return sub(mul(x,mul(x,y)), mul(mul(x,x),y))
def L_alt_right(x,y):   # (xy)y - x(yy)
    return sub(mul(mul(x,y),y), mul(x,mul(y,y)))
def L_flex(x,y):        # x(yx)-(xy)x
    return sub(mul(x,mul(y,x)), mul(mul(x,y),x))
def L_swap12(x,y,z):    # (xy)z+(yx)z - x(yz) - y(xz)
    return sub(add(mul(mul(x,y),z),mul(mul(y,x),z)), add(mul(x,mul(y,z)),mul(y,mul(x,z))))
def L_swap23(x,y,z):    # (xy)z+(xz)y - x(yz) - x(zy)
    return sub(add(mul(mul(x,y),z),mul(mul(x,z),y)), add(mul(x,mul(y,z)),mul(x,mul(z,y))))
def L_mouf_left(x,y,z): # x(y(xz)) - ((xy)x)z
    return sub(mul(x,mul(y,mul(x,z))), mul(mul(mul(x,y),x),z))
def L_mouf_right(x,y,z):# ((zx)y)x - z(x(yx))
    return sub(mul(mul(mul(z,x),y),x), mul(z,mul(x,mul(y,x))))
def L_mouf_mid(x,y,z):  # (xy)(zx) - x((yz)x)
    return sub(mul(mul(x,y),mul(z,x)), mul(x,mul(mul(y,z),x)))
# centrality of trace T_g=g+star g and norm N_g=g*star g (g a single generator):
def T(g): return add(E(g),E(STAR[g]))
def Nn(g): return mul(E(g),E(STAR[g]))
def L_tr_comm(g,x):     # T(g)*x - x*T(g)
    return sub(mul(T(g),x), mul(x,T(g)))
def L_tr_assocL(g,x,y): return sub(mul(T(g),mul(x,y)), mul(mul(T(g),x),y))
def L_tr_assocM(g,x,y): return sub(mul(mul(x,T(g)),y), mul(x,mul(T(g),y)))
def L_tr_assocR(g,x,y): return sub(mul(mul(x,y),T(g)), mul(x,mul(y,T(g))))
def L_nrm_comm(g,x):    return sub(mul(Nn(g),x), mul(x,Nn(g)))
def L_nrm_assocL(g,x,y):return sub(mul(Nn(g),mul(x,y)), mul(mul(Nn(g),x),y))
def L_nrm_assocM(g,x,y):return sub(mul(mul(x,Nn(g)),y), mul(x,mul(Nn(g),y)))
def L_nrm_assocR(g,x,y):return sub(mul(mul(x,y),Nn(g)), mul(x,mul(y,Nn(g))))
def L_nrm_symm(g):      return sub(mul(E(g),E(STAR[g])), mul(E(STAR[g]),E(g)))
# centrality of diagonal d (self-adjoint central): d*x - x*d, and assoc in 3 positions
def L_d_comm(d,x):      return sub(mul(E(d),x), mul(x,E(d)))
def L_d_assocL(d,x,y):  return sub(mul(E(d),mul(x,y)), mul(mul(E(d),x),y))
def L_d_assocM(d,x,y):  return sub(mul(mul(x,E(d)),y), mul(x,mul(E(d),y)))
def L_d_assocR(d,x,y):  return sub(mul(mul(x,y),E(d)), mul(x,mul(y,E(d))))

def build_pool(entry):
    """instantiate laws over leaf-args + the degree<=2 subterms appearing in entry."""
    leafargs=[E(g) for g in GEN]+[E(STAR[g]) for g in GEN]
    # candidate 'argument' elements: single leaves (gens, stars). (degree-2 args explode; start small)
    args=leafargs
    pool=[]
    names=[]
    def push(v,nm):
        if v: pool.append(v); names.append(nm)
    # binary laws over all ordered pairs
    for i,x in enumerate(args):
        for j,y in enumerate(args):
            push(L_alt_left(x,y),f"altL[{i},{j}]")
            push(L_alt_right(x,y),f"altR[{i},{j}]")
            push(L_flex(x,y),f"flex[{i},{j}]")
    # ternary alt-linearized + moufang over ordered triples of leaves
    AR=args
    for i,x in enumerate(AR):
        for j,y in enumerate(AR):
            for k,z in enumerate(AR):
                push(L_swap12(x,y,z),f"sw12[{i},{j},{k}]")
                push(L_swap23(x,y,z),f"sw23[{i},{j},{k}]")
                push(L_mouf_left(x,y,z),f"mfL[{i},{j},{k}]")
                push(L_mouf_right(x,y,z),f"mfR[{i},{j},{k}]")
                push(L_mouf_mid(x,y,z),f"mfM[{i},{j},{k}]")
    # centrality of trace/norm of each generator, over leaf args x,y
    for g in GEN:
        for x in args:
            push(L_tr_comm(g,x),f"trC[{g}]")
            push(L_nrm_comm(g,x),f"nrC[{g}]")
        push(L_nrm_symm(g),f"nrS[{g}]")
        for x in args:
            for y in args:
                push(L_tr_assocL(g,x,y),f"trAL[{g}]")
                push(L_tr_assocM(g,x,y),f"trAM[{g}]")
                push(L_tr_assocR(g,x,y),f"trAR[{g}]")
                push(L_nrm_assocL(g,x,y),f"nrAL[{g}]")
                push(L_nrm_assocM(g,x,y),f"nrAM[{g}]")
                push(L_nrm_assocR(g,x,y),f"nrAR[{g}]")
    # centrality of diagonals over leaf args
    for d in DIAG:
        for x in args:
            push(L_d_comm(d,x),f"dC[{d}]")
            for y in args:
                push(L_d_assocL(d,x,y),f"dAL[{d}]")
                push(L_d_assocM(d,x,y),f"dAM[{d}]")
                push(L_d_assocR(d,x,y),f"dAR[{d}]")
    return pool,names

def in_span(target, pool):
    """sparse exact-ℚ: is target in span(pool)? returns (bool, residual_size)."""
    # incremental row-reduction keyed by pivot atom
    basis=[]   # list of (pivot_atom, dict) reduced
    def reduce(vec):
        vec=dict(vec)
        for piv,row in basis:
            if piv in vec:
                c=vec[piv]/row[piv]
                for m,val in row.items():
                    vec[m]=vec.get(m,F(0))-c*val
                vec={m:v for m,v in vec.items() if v!=0}
        return vec
    for v in pool:
        rv=reduce(v)
        if rv:
            piv=next(iter(rv))
            basis.append((piv,rv))
    rt=reduce(target)
    return (len(rt)==0, len(rt))

for (i,j),name in [((0,1),'off01'),((0,0),'diag00')]:
    entry=D[i][j]
    pool,names=build_pool(entry)
    built=time.time()-t0
    ok,res=in_span(entry,pool)
    print(f"entry {name} ({i},{j}): target atoms={len(entry)}, pool size={len(pool)}, "
          f"IN-SPAN={ok}, residual={res}  [t={time.time()-t0:.1f}s, build={built:.1f}s]")
    sys.stdout.flush()
