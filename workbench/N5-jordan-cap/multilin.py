"""multilin (run 51): jdef is LINEAR in B (banked Linear.lean) and CUBIC in A.
Write the zero-diagonal Hermitian X = Ea+Eb+Ec (edge matrices: Ea has only a at (0,1) &
star a at (1,0), etc.), Y = Ep+Eq+Er. Then:
  jdef(X,Y) = sum over (i,j,k in {a,b,c} for the 3 A-slots) x (l in {p,q,r} for B-slot)
of jdef-polarization terms. Linearity in B splits Y into Ep,Eq,Er (3 pieces, banked additive).
A is cubic: jdef(Ea+Eb+Ec, ·) expands by the FULL trilinear polarization into terms
jdefPolar(Ei,Ej,Ek, ·) over multisets {i,j,k}. 
TEST: which (A-support, B-support) combinations give a NONZERO contribution? If each nonzero
piece involves few distinct edges, each is a SMALL matrix obligation (few nonzero octonion
entries) that may ring cheaply per-entry. This is the multilinear-assembly route: close the
small pieces, assemble by banked additivity.
We test the COARSE version: jdef(X,Y) with X having only edges in subset SA, Y only edges in
subset SB. Count nonzero entries / monomials per (SA,SB)."""
from fractions import Fraction as F
from collections import defaultdict
import itertools
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def is_leaf(m): return isinstance(m,str)
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
def mz(): return [[dict(ZERO) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mz()
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
# edge matrices: a at (0,1), b at (0,2), c at (1,2)
POS={'a':(0,1),'b':(0,2),'c':(1,2),'p':(0,1),'q':(0,2),'r':(1,2)}
def edge(name):
    M=mz(); i,j=POS[name]
    M[i][j]=E(name); M[j][i]=E(STAR[name])
    return M
def Xsub(letters): 
    M=mz()
    for L in letters: M=madd(M,edge(L))
    return M
def nonzero_entries(M):
    return [(i,j,len(M[i][j])) for i in range(3) for j in range(3) if M[i][j]]
def total_monomials(M):
    return sum(len(M[i][j]) for i in range(3) for j in range(3))
def iszero(M): return all(not M[i][j] for i in range(3) for j in range(3))
ABC=['a','b','c']; PQR=['p','q','r']
print("Per (A-edges, B-edge) the defect jdef(Xsub_A, edge_B) — nonzero? monomial count?")
print("(Y is a single edge by linearity-in-B; X ranges over edge subsets.)")
for kA in range(1,4):
    for SA in itertools.combinations(ABC,kA):
        for LB in PQR:
            X=Xsub(SA); Y=edge(LB)
            D=jdef(X,Y)
            if not iszero(D):
                print(f"  A-edges={''.join(SA)} B-edge={LB}: nonzero, {total_monomials(D)} monomials, entries={nonzero_entries(D)}")
print("\nKEY: jdef(full X, full Y) = sum over these pieces (banked additivity in B; ")
print("A-cubic expands by trilinear polarization). Each nonzero piece is a separate obligation.")
print("\nNow: which pieces need ALL 3 A-edges (the genuinely 3-generator-mixing hard ones)?")
for LB in PQR:
    X=Xsub(('a','b','c')); Y=edge(LB)
    D=jdef(X,Y)
    print(f"  full-A, B-edge={LB}: {total_monomials(D)} monomials over entries {nonzero_entries(D)}")
