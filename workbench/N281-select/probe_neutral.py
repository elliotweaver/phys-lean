"""
N281 SELECT — final precise measurement of the two-handed Cartan torus's neutral structure,
and an honest test of whether it dissolves the vector-7 GMN failure.
"""
from fractions import Fraction as F
import numpy as np
def R_mul(x,y): return x*y
def R_star(x): return x
def gadd(x,y):
    if isinstance(x,tuple): return (gadd(x[0],y[0]), gadd(x[1],y[1]))
    return x+y
def gsub(x,y):
    if isinstance(x,tuple): return (gsub(x[0],y[0]), gsub(x[1],y[1]))
    return x-y
def make_level(mul, star):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (gsub(mul(a,c),mul(star(d),b)), gadd(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    return lmul,lstar
def neg_gen():
    def n(z):
        if isinstance(z,tuple): return (n(z[0]),n(z[1]))
        return -z
    return n
lneg=neg_gen()
C_mul,C_star=make_level(R_mul,R_star); H_mul,H_star=make_level(C_mul,C_star); O_mul,O_star=make_level(H_mul,H_star)
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd
    return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
def octmul(x,y): return O_mul(x,y)
def leftReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(x,basis(j)))
        for i in range(8): M[i][j]=col[i]
    return M
def rightReg(x):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        col=flat(octmul(basis(j),x))
        for i in range(8): M[i][j]=col[i]
    return M
def mm(A,B):
    C=[[F(0)]*8 for _ in range(8)]
    for i in range(8):
        for k in range(8):
            if A[i][k]==0: continue
            for j in range(8): C[i][j]+=A[i][k]*B[k][j]
    return C
def madd(A,B): return [[A[i][j]+B[i][j] for j in range(8)] for i in range(8)]
def msub(A,B): return [[A[i][j]-B[i][j] for j in range(8)] for i in range(8)]
def msc(s,A): return [[s*A[i][j] for j in range(8)] for i in range(8)]
def show(M,label):
    print(f"--- {label} ---")
    for r in M: print(" ".join(f"{int(x):>2}" if x.denominator==1 else str(x) for x in r))
e=[basis(i) for i in range(8)]
L1,R1=leftReg(e[1]),rightReg(e[1])
V=madd(L1,R1); A=msub(L1,R1)
show(V,"V = L1+R1 (vector, the 'hypercharge-like' neutral combo)")
show(A,"A = L1-R1 (axial = 2*charge on ImO)")
# V action on the core computed cleanly below (matvec).

# GMN honesty test on the spinor: is there a forced relation Q = a*T3_L + b*T3_R + c*(core)?
# On the vector-7: L1=Q, R1=-Q, so Q = (L1-R1)/2 = A/2 on ImO. And T3_L=L1|ImO=Q, T3_R=R1|ImO=-Q.
# So on the charged sector the two hands collapse to +-Q; independence only in the core.
# The honest structural fact: the 2nd neutral direction (V) is entirely in the fold's C-core (real unit + u1),
# INVISIBLE to the vector-7 adjoint rep (which kills e0). THAT is why GMN failed on the vector-7:
# the vector-7 cannot see the real-unit direction where the independent neutral generator lives.
print("\n=== The honest dissolution of the vector-7 GMN failure ===")
print("On ImO (vector-7): L1=Q, R1=-Q  => rank-1, only the charge is visible; the 2nd neutral")
print("direction V=L1+R1 vanishes on ImO (supported on e0=real unit + u1 = the fold C-core N266).")
print("On the SPINOR (fundamental, incl. real unit): {L1,R1} is a genuine RANK-2 torus.")
print("=> the mixing/2nd-neutral structure the vector-7 STRUCTURALLY lacked is present on the spinor,")
print("   because the spinor carries the real-unit core direction the adjoint rep discards.")

# Trace-form Gram, restated, and the eigen-decomposition (vector/axial split)
def tr(M): return sum(M[i][i] for i in range(8))
def B(X,Y): return tr(mm(X,Y))
print("\nGram of {L1,R1} in trace form: [[",B(L1,L1),",",B(L1,R1),"],[",B(R1,L1),",",B(R1,R1),"]]")
print("Eigen-combos: B(V,V)=",B(V,V)," B(A,A)=",B(A,A)," B(V,A)=",B(V,A)," ratio A:V =",B(A,A),":",B(V,V))

# --- clean readout (matvec fix) ---
def matvec(M, v):
    return [sum(M[i][j]*v[j] for j in range(8)) for i in range(8)]
b0=[F(1)]+[F(0)]*7
b1=[F(0),F(1)]+[F(0)]*6
print('\n=== FINAL READOUT ===')
print('V(1)  =',[int(x) for x in matvec(V,b0)])
print('V(u1) =',[int(x) for x in matvec(V,b1)])
V2=mm(V,V)
print('V^2 diag =',[int(V2[i][i]) for i in range(8)])
print('Gram {L1,R1}: B(L1,L1)=',B(L1,L1),' B(L1,R1)=',B(L1,R1),' B(R1,R1)=',B(R1,R1))
print('B(V,V)=',B(V,V),' B(A,A)=',B(A,A),' B(V,A)=',B(V,A),' ratio A:V=',B(A,A),':',B(V,V))
