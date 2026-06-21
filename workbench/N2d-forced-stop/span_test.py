"""
N2d-hard — THE DECISIVE BACKWARD-DIRECTION TEST.

Question: is the base associator [a,b,c] a FINITE LINEAR COMBINATION (over Z, or with
central-coefficient multiples) of norm-defect values D(x,y) where x,y range over CD A
elements with components in a small vocabulary {0,1,a,b,c,a*,b*,c*}?

If YES: backward direction is CLEAN — [a,b,c] = sum_i lam_i * D(x_i,y_i), so
        Nrm-mult (all D=0) ==> [a,b,c]=0 ==> A associative.  Extract the combination.
If NO (associator NOT in the linear span of defects): the backward direction genuinely
        needs more than a linear extraction (true Hurwitz depth) -> dissolution child.

Free associative *-ring would make D vanish (assoc base). We need the NON-associative
free *-ring, so the associator is a genuine extra generator. Monomials = binary trees
of (gen,conj) leaves; products do NOT flatten.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

# element: dict over FROZEN binary-tree monomials -> Fraction coeff
# leaf: (k, conj)  ; node: (L, R) ; scalar unit: ()
def leaf(k,conj=False): return {((k,conj),):1}   # wrap leaf as 1-tuple to distinguish from node
# Represent: leaf -> ('L',k,conj); node -> ('N',left,right); unit -> ('1',)
def Lf(k,conj=False): return ('L',k,conj)
UNIT=('1',)
def mono_mul(m1,m2):
    if m1==UNIT: return m2
    if m2==UNIT: return m1
    return ('N',m1,m2)
def E(d): return {m:c for m,c in d.items() if c!=0}
def add(x,y):
    r=defaultdict(int,x)
    for m,c in y.items(): r[m]+=c
    return E(r)
def neg(x): return {m:-c for m,c in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(int)
    for m1,c1 in x.items():
        for m2,c2 in y.items():
            r[mono_mul(m1,m2)]+=c1*c2
    return E(r)
def star_mono(m):
    if m==UNIT: return UNIT
    if m[0]=='L': return ('L',m[1], not m[2])
    return ('N', star_mono(m[2]), star_mono(m[1]))  # anti-auto
def star(x):
    r=defaultdict(int)
    for m,c in x.items(): r[star_mono(m)]+=c
    return E(r)
def g(k): return {Lf(k):1}
a,b,c=g(0),g(1),g(2)
one={UNIT:1}; zero={}
def Nrm(z):
    re,im=z; return add(mul(re,star(re)), mul(star(im),im))
def cd_mul(z,w):
    ar,ai=z;cr,ci=w
    return (sub(mul(ar,cr),mul(star(ci),ai)), add(mul(ci,ar),mul(ai,star(cr))))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))
def assoc(u,v,w): return sub(mul(mul(u,v),w), mul(u,mul(v,w)))

target = assoc(a,b,c)   # [a,b,c]
print("associator [a,b,c] monomials:", len(target))

# Build defect vectors
vocab={'0':zero,'1':one,'a':a,'b':b,'c':c,'A':star(a),'B':star(b),'C':star(c)}
keys=list(vocab.keys())
defects=[]
labels=[]
for fa in itertools.product(keys,repeat=4):
    if fa.count('0')>=3: continue
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    d=D(x,y)
    if d:
        defects.append(d); labels.append(fa)

# collect all monomials appearing in target or any defect
allmon=set(target.keys())
for d in defects: allmon|=set(d.keys())
allmon=sorted(allmon, key=str)
idx={m:i for i,m in enumerate(allmon)}
ncol=len(allmon)
print(f"defect vectors: {len(defects)}, ambient monomial dim: {ncol}")

# Solve: is target in Z-span (or Q-span) of defects? Set up rational linear system.
# Build matrix rows = defects, solve target = sum lam_i * defect_i  via Gaussian elim over Q.
# Represent each defect as Q-vector.
def vec(d):
    v=[Fr(0)]*ncol
    for m,co in d.items(): v[idx[m]]=Fr(co)
    return v
A=[vec(d) for d in defects]   # list of row-vectors (each a defect)
tvec=vec(target)

# We want coefficients lam s.t. sum lam_i A[i] = tvec  => solve A^T lam = tvec (columns=defects)
# Build augmented system: variables lam_0..lam_{m-1}; equations per monomial coordinate.
# matrix M (ncol x ndef): M[j][i] = A[i][j]; solve M lam = tvec.
ndef=len(A)
M=[[A[i][j] for i in range(ndef)] for j in range(ncol)]
# Gaussian elimination on [M | tvec]
aug=[row[:]+[tvec[j]] for j,row in enumerate(M)]
rows=len(aug); cols=ndef
pr=0
pivcols=[]
for col in range(cols):
    piv=None
    for r_ in range(pr,rows):
        if aug[r_][col]!=0: piv=r_;break
    if piv is None: continue
    aug[pr],aug[piv]=aug[piv],aug[pr]
    pv=aug[pr][col]
    aug[pr]=[x/pv for x in aug[pr]]
    for r_ in range(rows):
        if r_!=pr and aug[r_][col]!=0:
            f=aug[r_][col]
            aug[r_]=[aug[r_][k]-f*aug[pr][k] for k in range(cols+1)]
    pivcols.append(col); pr+=1
    if pr==rows: break
# check consistency: any row with all-zero coeff cols but nonzero rhs => inconsistent
solvable=True
for r_ in range(rows):
    if all(aug[r_][k]==0 for k in range(cols)) and aug[r_][cols]!=0:
        solvable=False;break
print()
if solvable:
    print("✅ [a,b,c] IS in the Q-linear span of norm defects D(x,y).")
    print("   => BACKWARD direction is CLEAN: associator = finite combination of defects.")
    print("   => Nrm-mult (all D=0) forces [a,b,c]=0 forces A associative. PROVABLE generically.")
else:
    print("❌ [a,b,c] is NOT in the Q-linear span of norm defects over {0,1,a,b,c,a*,b*,c*}.")
    print("   => no linear extraction; backward direction is genuine Hurwitz depth.")
