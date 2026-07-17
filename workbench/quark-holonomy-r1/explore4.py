"""Octonion-valued Z3 seeing operator via the regular (left-mult) representation.

Lepton C-line: seeing between generations is trivial scalar transport (C is
  associative), operator = Pcyc+Pcyc^2 on Q^3, turning eigenvalue = -1.

Quark octonion-resolved: the three generations carry Fano directions; the
  transport i<-j is octonion left-mult. Build the 3x3 BLOCK operator over O
  (each block an 8x8 left-mult matrix), giving a 24x24 operator on (O)^3, and
  read its spectrum via trace powers. Compare the turning-sector eigenvalue.
"""
from fractions import Fraction as F

def dbl_mul(z,w): a,b=z;c,d=w;return (a*c-b*d,a*d+b*c)
def dbl_star(z): a,b=z;return (a,-b)
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DBL0=(F(0),F(0));DBL1=(F(1),F(0))
class CD:
    def __init__(s,mul,star,add,neg,zero,one): s.mul=mul;s.star=star;s.add=add;s.neg=neg;s.zero=zero;s.one=one
    def make(s):
        b=s
        def mul(z,w):
            zr,zi=z;wr,wi=w
            re=b.add(b.mul(zr,wr),b.neg(b.mul(b.star(wi),zi)))
            im=b.add(b.mul(wi,zr),b.mul(zi,b.star(wr)))
            return (re,im)
        def star(z): zr,zi=z;return (b.star(zr),b.neg(zi))
        def add(z,w): return (b.add(z[0],w[0]),b.add(z[1],w[1]))
        def neg(z): return (b.neg(z[0]),b.neg(z[1]))
        return CD(mul,star,add,neg,(b.zero,b.zero),(b.one,b.zero))
Dbl=CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DBL0,DBL1);H=Dbl.make();Oh=H.make()
def v2o(v):
    d=lambda i:(v[i],v[i+1]);h=lambda i:(d(i),d(i+2));return (h(0),h(4))
def o2v(o):
    Hr,Hi=o;out=[]
    for hh in (Hr,Hi):
        Dr,Di=hh
        for dd in (Dr,Di): out.append(dd[0]);out.append(dd[1])
    return out
def omul(x,y): return Oh.mul(x,y)
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]
def Lmat(a):
    cols=[o2v(omul(a,E[i])) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]
def mm(A,B):
    n=len(A);m=len(B[0]);k=len(B);return [[sum(A[i][t]*B[t][j] for t in range(k)) for j in range(m)] for i in range(n)]
def madd(*Ms):
    R=[[F(0)]*len(Ms[0][0]) for _ in range(len(Ms[0]))]
    for M in Ms:
        for i in range(len(M)):
            for j in range(len(M[0])): R[i][j]+=M[i][j]
    return R
def trace(A): return sum(A[i][i] for i in range(len(A)))
def zero(n): return [[F(0)]*n for _ in range(n)]
def ident(n): return [[F(1) if i==j else F(0) for j in range(n)] for i in range(n)]

# Build a 24x24 block operator from 3x3 grid of 8x8 blocks
def block(grid):  # grid[i][j] is an 8x8 matrix or None
    N=24;R=[[F(0)]*N for _ in range(N)]
    for bi in range(3):
        for bj in range(3):
            M=grid[bi][bj]
            if M is None: continue
            for i in range(8):
                for j in range(8):
                    R[bi*8+i][bj*8+j]=M[i][j]
    return R

# transport unit for edge i<-j : the octonion carrying direction j to direction i.
# On Fano line e1,e2,e3: we need units t s.t. the FORWARD cycle e1->e2->e3->e1.
# forward step: which single left-unit maps e_j to e_{j+1}? 
f=[E[1],E[2],E[3]]
Z=zero(8)
# Build octonion-valued seeMat: S_ij = L_{u_ij}, diag 0.
# Choose u_ij so that S sends the Fano coherence appropriately.
# The natural transport i<-j = f_i * star(f_j). For imaginary units star=-, so = -f_i*f_j.
def transport(i,j):
    fi,fj=f[i],f[j]
    # f_i * star(f_j)
    sfj=v2o([-x for x in o2v(fj)]); sfj=v2o([o2v(fj)[0]]+[-x for x in o2v(fj)[1:]]) # star: negate imaginary part
    return omul(fi,sfj)
# simpler: use the octonion product edge directly
# Lepton reference operator on Q^3 embedded via scalar (identity block) transport:
# Pcyc+Pcyc^2 on 3 slots, each slot = C (scalar). Turning eigenvalue -1.

# Quark: seeing operator blocks = left-mult by transport units.
grid=[[None]*3 for _ in range(3)]
for i in range(3):
    for j in range(3):
        if i==j: grid[i][j]=Z
        else: grid[i][j]=Lmat(transport(i,j))
S=block(grid)
print("octonion-resolved seeing S: trace=",trace(S))
S2=mm(S,S);S3=mm(S2,S)
print("trace S^2=",trace(S2)," trace S^3=",trace(S3))
# For lepton scalar case, seeMat=Pcyc+Pcyc^2 has eigenvalues {2,-1,-1}; over 8-dim blocks
# scalar transport would give each eigenvalue x8: trace=0, trace S^2 = (4+1+1)*8=48, trace S^3=(8-1-1)*8=48
print("\n(lepton scalar ref: trace=0, traceS^2=48, traceS^3=48 for 8-fold)")
