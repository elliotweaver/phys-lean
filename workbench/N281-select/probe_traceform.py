"""
N281 SELECT — decisive measurement: trace-form / normalization structure of the neutral operators
ON THE SPINOR (8-dim, fundamental) vs the vector-7 (adjoint). Does the spinor supply a FORCED
relative normalization that the vector-7 lacked (the ≥11x-deferred ★2 blocker)?
Also: independence & span tests on the spinor (the GMN failure on ImO — does it persist/dissolve?).
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
def tr(A): return sum(A[i][i] for i in range(8))
def trace_form(A,B): return tr(mm(A,B))
def comm(A,B): return msub(mm(A,B),mm(B,A))
def iszero(A): return all(A[i][j]==0 for i in range(8) for j in range(8))
e=[basis(i) for i in range(8)]

# Operators on the SPINOR (8-dim):
L1,L2,L3=leftReg(e[1]),leftReg(e[2]),leftReg(e[3])   # su(2)_L
R1,R2,R3=rightReg(e[1]),rightReg(e[2]),rightReg(e[3]) # su(2)_R
print("=== SPINOR (8-dim) trace forms of the su(2) generators ===")
print("B(L1,L1) =",trace_form(L1,L1),"  B(L2,L2)=",trace_form(L2,L2),"  B(L3,L3)=",trace_form(L3,L3))
print("B(R1,R1) =",trace_form(R1,R1))
print("B(L1,R1) =",trace_form(L1,R1),"  B(L1,L2)=",trace_form(L1,L2))
print("--- contrast vector-7 (adjoint): B(Q,Q)=-6, B(T3,T3)=-16, B(Y,Y)=-6 (N253/N257) ---")

# The two hands on the spinor: axial A = L1-R1, vector V = L1+R1
A_=msub(L1,R1); V_=madd(L1,R1)
print("\n=== axial/vector combos on spinor ===")
print("B(V,V)=",trace_form(V_,V_)," B(A,A)=",trace_form(A_,A_)," B(V,A)=",trace_form(V_,A_))
print("[V,A] zero?",iszero(comm(V_,A_)))
print(">> ratio B(A,A):B(V,V) =", trace_form(A_,A_),":",trace_form(V_,V_))

# GMN-type: is there a forced linear relation among L1, R1, and a third neutral on the spinor?
# The doubling isospin T3=imRep DI lifted to spinor? Need innerDeriv(hI) on 8-dim. 
# innerDeriv(a)(x) = a*x - x*a = (leftReg(a)-rightReg(a))(x). So T3_spinor = L1 - R1 = A_ (adjoint action of u1)!
print("\n=== KEY: isospin T3 = innerDeriv(u1) = leftReg(u1)-rightReg(u1) = A on the spinor ===")
print("So on the spinor: {L1 (su(2)_L Cartan), R1 (su(2)_R Cartan)} rank-2 torus,")
print("   and T3_adjoint = L1-R1, Q_charge-like = ... let's see charge vs these.")
# The 'charge' Q on vector-7 was L1|ImO. On the spinor, what plays Q? 
# Test linear independence of {L1,R1,mm(L1,R1)} etc. Rank of the neutral algebra they generate:
mats=[L1,R1]
# flatten to vectors, compute rank over Q
def flatten(M): return [M[i][j] for i in range(8) for j in range(8)]
import itertools
def rank_over_Q(vs):
    # gaussian elimination over Fractions
    rows=[list(v) for v in vs]; r=0; ncol=len(rows[0])
    for c in range(ncol):
        piv=None
        for i in range(r,len(rows)):
            if rows[i][c]!=0: piv=i;break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]
        pv=rows[r][c]
        rows[r]=[x/pv for x in rows[r]]
        for i in range(len(rows)):
            if i!=r and rows[i][c]!=0:
                f=rows[i][c]; rows[i]=[a-f*b for a,b in zip(rows[i],rows[r])]
        r+=1
    return r
print("\nrank{L1,R1} =",rank_over_Q([flatten(L1),flatten(R1)]))
print("rank{L1,R1,I} =",rank_over_Q([flatten(L1),flatten(R1),flatten([[F(1) if i==j else F(0) for j in range(8)] for i in range(8)])]))
# The Cartan of so(4) is rank 2. Confirm L1,R1 independent + commute = maximal torus of the spinor so(4).
print(">> {L1,R1} = rank-2 maximal torus of the spinor two-handed so(4), commuting on ALL O:",
      not iszero(msub(L1,R1)) and iszero(comm(L1,R1)))
