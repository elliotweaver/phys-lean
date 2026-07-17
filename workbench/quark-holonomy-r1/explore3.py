"""The octonion-RESOLVED Z3 loop holonomy as composite of left-multiplication maps.

Lepton case: turning transport = multiply by omega on the C-line (1,u1);
  forward L_omega + backward L_omega^2 -> eigenvalue on turning mode = -1.

Quark case: the three generation directions are the Fano triple e1,e2,e3
  (u1,u2,octCross u1 u2 up to labeling). The Z3 cycle e1->e2->e3->e1 is realized
  by octonion LEFT-multiplication (genuinely octonion-valued transport):
     e3 . e1 = e2,  e1 . e2 = e3,  e2 . e3 = e1  (cyclic)
  So forward transport = L_{cyc}. Left-mults DON'T compose associatively.
  Compute the holonomy operator (forward+backward loop transport) on the full
  8-dim octonion space and read its spectrum -> the octonion-resolved turning eigenvalue.
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
def Rmat(a):
    cols=[o2v(omul(E[i],a)) for i in range(8)]
    return [[cols[j][i] for j in range(8)] for i in range(8)]
def mm(A,B):
    n=len(A);m=len(B[0]);k=len(B)
    return [[sum(A[i][t]*B[t][j] for t in range(k)) for j in range(m)] for i in range(n)]
def madd(A,B): return [[A[i][j]+B[i][j] for j in range(len(A[0]))] for i in range(len(A))]
def smul(c,A): return [[c*A[i][j] for j in range(len(A[0]))] for i in range(len(A))]
def trace(A): return sum(A[i][i] for i in range(len(A)))

e1,e2,e3=E[1],E[2],E[3]

# forward transport of the Fano cycle e1->e2->e3->e1:
# e3.e1=e2 ; e1.e2=e3 ; e2.e3=e1. There isn't ONE left-mult doing all three.
# The natural "cyclic generator" C such that C(e_k)=e_{k+1} within span{e1,e2,e3}:
# C e1=e2, C e2=e3, C e3=e1. Realize as octonion op? 
# Try left-mult by a single unit q with q.e1=e2, q.e2=e3, q.e3=e1?
for q in range(8):
    a=E[q]
    if o2v(omul(a,e1))==o2v(e2) and o2v(omul(a,e2))==o2v(e3) and o2v(omul(a,e3))==o2v(e1):
        print("single left-unit cyclic generator found: e",q)
# likely none. The cycle is not a single octonion left-mult on the 3 directions.

# The holonomy the seed means: transport around the loop = product of edge units.
# Edge j->j+1 carries the unit u_{j} = the Fano product realizing the step.
# For lepton C-line, forward=omega, back=omega^2, sum=-1.
# For quark, the loop return operator: L_{e1} L_{e2} L_{e3} (compose the three left-mults)
Le1,Le2,Le3=Lmat(e1),Lmat(e2),Lmat(e3)
Re1,Re2,Re3=Rmat(e1),Rmat(e2),Rmat(e3)

def spectrum_note(A,name):
    tr=trace(A)
    A2=mm(A,A)
    tr2=trace(A2)
    A3=mm(A2,A)
    tr3=trace(A3)
    print(f"{name}: trace={tr}, trace(A^2)={tr2}, trace(A^3)={tr3}")

print("\n-- composites of Fano left-mults (loop holonomy candidates) --")
spectrum_note(mm(Le3,mm(Le1,Le2)),"Le3(Le1 Le2)")
spectrum_note(mm(mm(Le3,Le1),Le2),"(Le3 Le1)Le2")
# forward+backward
fwd=mm(Le3,mm(Le1,Le2)); bwd=mm(Le2,mm(Le1,Le3))
spectrum_note(madd(fwd,bwd),"fwd+bwd (Fano loop holonomy, L)")
