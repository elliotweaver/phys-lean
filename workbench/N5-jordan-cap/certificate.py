"""
CERTIFICATE SOLVER for N5c (the genuinely-untried, abel-closable route).

Goal: express each H_3 Jordan-defect entry (over the free NON-ASSOCIATIVE *-algebra
on the matrix-entry octonions) as an explicit ℚ-LINEAR COMBINATION of INSTANCES of the
laws banked in Phys/Algebra/Alternative.lean:
    mul_swap12 (x y z): (x*y)*z + (y*x)*z = x*(y*z) + y*(x*z)
    mul_swap23 (x y z): (x*y)*z + (x*z)*y = x*(y*z) + x*(z*y)
    mul_mul_left (x y):  x*(x*y) = (x*x)*y
    mul_mul_right(x y):  (x*y)*y = x*(y*y)
    mul_flex (x y):      x*(y*x) = (x*y)*x
    moufang_left (x y z):  x*(y*(x*z)) = ((x*y)*x)*z
    moufang_right(x y z):  ((z*x)*y)*x = z*(x*(y*x))
    moufang_mid (x y z):  (x*y)*(z*x) = x*((y*z)*x)
Each law is an equality L=R; as a free-algebra vector, (L - R) spans the relation space.
If jdef_entry = Σ cᵢ (Lᵢ - Rᵢ), then in Lean:
    linear_combination (norm := abel) Σ cᵢ * (lawᵢ arg-instance)
closes the goal CHEAPLY (abel = additive only; NO ring blowup).

Strategy: build the difference-vectors for all relevant law instances (arguments drawn
from the SUBTREES appearing in the entry's monomials, all degrees), assemble the matrix,
and solve jdef_entry ∈ span via exact ℚ Gaussian elimination.
"""
from fractions import Fraction as F
from collections import defaultdict
import itertools, sys

# ---------- free non-associative algebra: monomial = leaf str | (l,r) ----------
def leaf(n): return {n: F(1)}
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

CONJ={}
def reg(g,gc): CONJ[g]=gc; CONJ[gc]=g
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def star(x): return {star_mon(m):v for m,v in x.items()}

ZERO={}
def mzero(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B):
    n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mzero(n)
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

# ---------- build the zero-diagonal Hermitian 3x3 (the hard off-diagonal core) ----------
reg('p','pc'); reg('q','qc'); reg('r','rc')   # A off-diagonals (0,1),(0,2),(1,2)
reg('s','sc'); reg('t','tc'); reg('u','uc')   # B off-diagonals
def herm3z(o01,o02,o12):
    return [[dict(ZERO),o01,o02],
            [star(o01),dict(ZERO),o12],
            [star(o02),star(o12),dict(ZERO)]]
A=herm3z(leaf('p'),leaf('q'),leaf('r'))
B=herm3z(leaf('s'),leaf('t'),leaf('u'))
D=jdef(A,B)

# ---------- law difference-vectors as functions of monomial-arguments ----------
def m_mul(*ms):
    # left-fold product of monomial trees (each a single monomial, coeff 1)
    acc=ms[0]
    for m in ms[1:]: acc=(acc,m)
    return acc
def as_elt(m): return {m:F(1)}

def law_swap12(x,y,z):  # (xy)z+(yx)z - x(yz) - y(xz)
    return sub(add(as_elt(((x,y),z)), as_elt(((y,x),z))),
               add(as_elt((x,(y,z))), as_elt((y,(x,z)))))
def law_swap23(x,y,z):  # (xy)z+(xz)y - x(yz) - x(zy)
    return sub(add(as_elt(((x,y),z)), as_elt(((x,z),y))),
               add(as_elt((x,(y,z))), as_elt((x,(z,y)))))
def law_mul_left(x,y):  # x(xy) - (xx)y
    return sub(as_elt((x,(x,y))), as_elt(((x,x),y)))
def law_mul_right(x,y): # (xy)y - x(yy)
    return sub(as_elt(((x,y),y)), as_elt((x,(y,y))))
def law_flex(x,y):      # x(yx) - (xy)x
    return sub(as_elt((x,(y,x))), as_elt(((x,y),x)))
def law_mouf_left(x,y,z):   # x(y(xz)) - ((xy)x)z
    return sub(as_elt((x,(y,(x,z)))), as_elt((((x,y),x),z)))
def law_mouf_right(x,y,z):  # ((zx)y)x - z(x(yx))
    return sub(as_elt((((z,x),y),x)), as_elt((z,(x,(y,x)))))
def law_mouf_mid(x,y,z):    # (xy)(zx) - x((yz)x)
    return sub(as_elt(((x,y),(z,x))), as_elt((x,((y,z),x))))

# ---------- collect candidate argument monomials: all subtrees occurring in an entry ----------
def subtrees(m, acc):
    acc.add(m)
    if isinstance(m,tuple):
        subtrees(m[0],acc); subtrees(m[1],acc)
def entry_subtrees(E):
    acc=set()
    for m in E: subtrees(m,acc)
    return acc

def degree(m):
    if isinstance(m,str): return 1
    return degree(m[0])+degree(m[1])

def solve_entry(i,j,verbose=False):
    E=D[i][j]
    if not E:
        return ("ZERO", [])
    subs=entry_subtrees(E)
    # argument pool: all subtrees of degree 1..3 (so law instances reach degree<=4)
    pool=sorted([m for m in subs if degree(m)<=3], key=lambda m:(degree(m),str(m)))
    g1=[m for m in pool if degree(m)==1]
    g2=[m for m in pool if degree(m)==2]
    # generate law instances; keep those whose monomials are degree==deg(entry monomials)==4
    target_deg=degree(next(iter(E)))
    instances=[]  # (name, args, vector)
    def consider(name,args,vec):
        if not vec: return
        if all(degree(m)==target_deg for m in vec):
            instances.append((name,args,vec))
    # binary laws: args from g1∪g2
    binpool=g1+g2
    for x in binpool:
        for y in binpool:
            consider("mul_left",(x,y),law_mul_left(x,y))
            consider("mul_right",(x,y),law_mul_right(x,y))
            consider("flex",(x,y),law_flex(x,y))
    # ternary laws: args from g1 (+ allow one g2 to hit degree 4)
    ternpool=g1+g2
    for x in ternpool:
        for y in ternpool:
            for z in ternpool:
                consider("swap12",(x,y,z),law_swap12(x,y,z))
                consider("swap23",(x,y,z),law_swap23(x,y,z))
                consider("mouf_left",(x,y,z),law_mouf_left(x,y,z))
                consider("mouf_right",(x,y,z),law_mouf_right(x,y,z))
                consider("mouf_mid",(x,y,z),law_mouf_mid(x,y,z))
    # build monomial index (rows) = union of entry monomials and all instance monomials
    monset=set(E.keys())
    for _,_,v in instances: monset|=set(v.keys())
    mons=sorted(monset,key=str)
    midx={m:k for k,m in enumerate(mons)}
    nrows=len(mons); ncols=len(instances)
    # target vector b = E
    b=[F(0)]*nrows
    for m,v in E.items(): b[midx[m]]=v
    # matrix columns
    cols=[]
    for _,_,v in instances:
        col=[F(0)]*nrows
        for m,c in v.items(): col[midx[m]]=c
        cols.append(col)
    # solve cols * x = b via Gaussian elimination (augment). Find any solution.
    # Build augmented matrix rows = nrows, cols = ncols + 1
    import copy
    M=[[cols[c][rr] for c in range(ncols)]+[b[rr]] for rr in range(nrows)]
    # forward elimination
    pivcols=[]
    rr=0
    for cc in range(ncols):
        # find pivot
        piv=None
        for r2 in range(rr,nrows):
            if M[r2][cc]!=0: piv=r2; break
        if piv is None: continue
        M[rr],M[piv]=M[piv],M[rr]
        pv=M[rr][cc]
        M[rr]=[x/pv for x in M[rr]]
        for r2 in range(nrows):
            if r2!=rr and M[r2][cc]!=0:
                f=M[r2][cc]
                M[r2]=[M[r2][k]-f*M[rr][k] for k in range(ncols+1)]
        pivcols.append((rr,cc)); rr+=1
        if rr==nrows: break
    # check consistency: any row with all-zero coeff but nonzero RHS => no solution
    for r2 in range(nrows):
        if all(M[r2][k]==0 for k in range(ncols)) and M[r2][ncols]!=0:
            return ("NO-SOLUTION", None)
    # extract a solution
    xsol=[F(0)]*ncols
    for (rrp,cc) in pivcols:
        xsol[cc]=M[rrp][ncols]
    # collect nonzero coefficients
    cert=[(instances[c][0],instances[c][1],xsol[c]) for c in range(ncols) if xsol[c]!=0]
    return ("SOLVED", cert)

if __name__=="__main__":
    for i in range(3):
        for j in range(3):
            E=D[i][j]
            if not E:
                print(f"entry({i},{j}): identically zero")
                continue
            status,cert=solve_entry(i,j)
            if status=="SOLVED":
                print(f"entry({i},{j}): {len(E)} terms  ->  SOLVED with {len(cert)} law-instances")
            else:
                print(f"entry({i},{j}): {len(E)} terms  ->  {status}")
