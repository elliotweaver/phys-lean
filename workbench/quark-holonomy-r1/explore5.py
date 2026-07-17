"""Exact characteristic polynomial of the octonion-resolved Z3 holonomy operator.
Find the turning-mode eigenvalue(s) and whether the deviation from -1 is CLEAN/FORCED.
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
def ostar(x): return v2o([o2v(x)[0]]+[-t for t in o2v(x)[1:]])
def ostarO(x): return Oh.star(x)
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]
def Lmat(a):
    cols=[o2v(omul(a,E[i])) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]

f=[E[1],E[2],E[3]]
def transport(i,j):  # slot i <- slot j : f_i * star(f_j)
    return omul(f[i], Oh.star(f[j]))

def block(grid):
    N=24;R=[[F(0)]*N for _ in range(N)]
    for bi in range(3):
        for bj in range(3):
            M=grid[bi][bj]
            if M is None: continue
            for i in range(8):
                for j in range(8): R[bi*8+i][bj*8+j]=M[i][j]
    return R
Z=[[F(0)]*8 for _ in range(8)]
grid=[[Z if i==j else Lmat(transport(i,j)) for j in range(3)] for i in range(3)]
S=block(grid)

# characteristic polynomial via Faddeev-LeVerrier (exact rational)
def charpoly(A):
    n=len(A)
    I=[[F(1) if i==j else F(0) for j in range(n)] for i in range(n)]
    M=[[F(0)]*n for _ in range(n)]
    c=[F(1)]+[F(0)]*n
    Mk=[row[:] for row in I]  # M_0 = I? use standard algorithm
    # standard FL:
    c=[F(0)]*(n+1); c[0]=F(1)
    Mk=[[F(0)]*n for _ in range(n)]
    for k in range(1,n+1):
        # Mk = A*M_{k-1} + c[k-1]*I
        AM=[[sum(A[i][t]*Mk[t][j] for t in range(n)) for j in range(n)] for i in range(n)]
        Mk=[[AM[i][j]+(c[k-1] if i==j else F(0)) for j in range(n)] for i in range(n)]
        AMk=[[sum(A[i][t]*Mk[t][j] for t in range(n)) for j in range(n)] for i in range(n)]
        tr=sum(AMk[i][i] for i in range(n))
        c[k]=-tr/F(k)
    return c  # coefficients of det(tI - A) = t^n + c[1] t^{n-1} + ... + c[n]

cp=charpoly(S)
print("charpoly coeffs (t^24 + c1 t^23 + ...):")
# print nonzero coeffs
for i,ci in enumerate(cp):
    if ci!=0: print(f"  t^{24-i}: {ci}")
