"""Explore octonion-resolved Z3 loop holonomy: find the forced turning eigenvalue.

N308 lepton case: seeMat = Pcyc + Pcyc^2 (pure Q-permutation on 3 slots).
Turning mode eigenvalue = omega + omega^2 = -1 (omega = cube root of unity).
Balance (1-T)*2 + T*(-1) = 0 -> T=2/3, delta_B = T(1-T) = 2/9.

Quark case: promote the transport to be octonion-resolved on the Fano triple.
The three generation slots carry the Fano directions f0,f1,f2 (a genuine 3-dim
imaginary structure, NOT collinear like the lepton C-line). We want the turning
eigenvalue of the octonion-resolved holonomy and how it deviates from -1.
"""
from fractions import Fraction as F
import itertools

# ---- octonion machinery (same as oct.py) ----
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
def ostar(x): return Oh.star(x)
E=[v2o([F(1) if k==i else F(0) for k in range(8)]) for i in range(8)]

def Lmat(a):
    # 8x8 matrix of left-multiplication by a: columns = a*e_i
    cols=[o2v(omul(a,E[i])) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]
def Rmat(a):
    cols=[o2v(omul(E[i],a)) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]

def matmul(A,B):
    n=len(A);m=len(B[0]);k=len(B)
    return [[sum(A[i][t]*B[t][j] for t in range(k)) for j in range(m)] for i in range(n)]
def matvec(A,v): return [sum(A[i][j]*v[j] for j in range(len(v))) for i in range(len(A))]

# Fano directions: use e1,e2,e3 (the banked triple u1=e1,u2=e2, octCross u1 u2=e3)
e1=E[1];e2=E[2];e3=E[3]
# multiplication table on the Fano line:
print("e1*e2 =",o2v(omul(e1,e2)))
print("e2*e3 =",o2v(omul(e2,e3)))
print("e3*e1 =",o2v(omul(e3,e1)))
print("e2*e1 =",o2v(omul(e2,e1)))

# The three Fano directions as generation carriers
f=[e1,e2,e3]

# ---- Candidate A: octonion seeing operator as a 3x3 matrix over O ---- 
# seeO[i][j] = edge phase from j to i for i!=j, 0 on diag.
# Natural edge phase: the unit rotating f_j into f_i = f_i * star(f_j).
def edge(i,j):
    return omul(f[i], ostar(f[j]))
print("\nedge phases (f_i * star f_j):")
for i in range(3):
    for j in range(3):
        if i!=j: print(f"  e{i}<-e{j}:",o2v(edge(i,j)))

# Loop holonomy: product around the cycle 0->1->2->0
# transport 1<-0, 2<-1, 0<-2
h_loop = omul(edge(0,2), omul(edge(2,1), edge(1,0)))
print("\nloop holonomy edge(0,2)*(edge(2,1)*edge(1,0)) =", o2v(h_loop))
h_loop2 = omul(omul(edge(0,2),edge(2,1)),edge(1,0))
print("loop holonomy ((e02*e21)*e10) =", o2v(h_loop2))
print("associator defect of loop =", [a-b for a,b in zip(h_loop,h_loop2)])
