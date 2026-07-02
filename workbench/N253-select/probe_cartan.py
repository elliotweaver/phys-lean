#!/usr/bin/env python3
"""
N253 SELECT probe v3 — nail the exact commuting-Cartan structure so the SELECT
decision is grounded, not a story.
Questions:
 (Q1) full g2 commutant of chargeOp = crossOp u1 : is it exactly the 8-dim colour su(3)? (N245)
 (Q2) are chargeOp (in 7) and innerDeriv hI (in 14=g2) linearly independent in so(7)? (yes if
       different summands) and do they span a 2-dim ABELIAN subalgebra?
 (Q3) eigenvalue coefficients: chargeOp gives ±1, innerDeriv hI gives ±2 on shared planes — forced
       given the SAME normalized u1 (gForm u1 u1 = 1). Confirm.
 (Q4) do leftImDeriv/secondSU2 (su(2)_T, su(2)_S from N191-193) give an operator that commutes with
       chargeOp and is OUTSIDE colour? (an alternative independent second U(1))
"""
from fractions import Fraction as F

def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0], z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
DZ=(F(0),F(0))
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
h_mul,h_star,h_add,h_neg,h_zero=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DZ)
o_mul,o_star,o_add,o_neg,o_zero=make_CD(h_mul,h_star,h_add,h_neg,h_zero)
def o_from_vec(v):
    def dbl(b): return (v[b+0],v[b+1])
    def h(b): return (dbl(b+0),dbl(b+2))
    return (h(0),h(4))
def o_to_vec(z):
    v=[None]*8
    for oi in (0,1):
        H=z[oi]
        for hi in (0,1):
            D=H[hi]
            for di in (0,1): v[oi*4+hi*2+di]=D[di]
    return v
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return o_from_vec(v)
E=[basis(i) for i in range(8)]
ImO=list(range(1,8))
hI=((F(0),F(1)),(F(0),F(0))); hJ=((F(0),F(0)),(F(1),F(0))); hK=h_mul(hI,hJ)
u1=(hI,h_zero)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(len(B))) for c in range(len(B[0]))] for r in range(len(A))]
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(len(A[0]))] for r in range(len(A))]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)

# ad on H (componentwise)  and the three families:
def ad_H(P,a): return h_add(h_mul(P,a),h_neg(h_mul(a,P)))
def innerDeriv(P,x):  # <a,b> -> <ad_P a, ad_P b>   (su(2) diagonal, N187)
    a,b=x; return (ad_H(P,a),ad_H(P,b))
def leftImDeriv(Q,x): # <a,b> -> <0, Q*b>   (su(2)_T, N191/192)  [star Q=-Q]
    a,b=x; return (h_zero, h_mul(Q,b))
def secondSU2(P,x):   # innerDeriv P - leftImDeriv P  (su(2)_S)
    a,b=x
    return (ad_H(P,a), h_add(ad_H(P,b), h_neg(h_mul(P,b))))

chargeM=mat(lambda x: octCrossO(u1,x))
gens={
 'inner_hI':mat(lambda x:innerDeriv(hI,x)),
 'inner_hJ':mat(lambda x:innerDeriv(hJ,x)),
 'inner_hK':mat(lambda x:innerDeriv(hK,x)),
 'left_hI':mat(lambda x:leftImDeriv(hI,x)),
 'left_hJ':mat(lambda x:leftImDeriv(hJ,x)),
 'left_hK':mat(lambda x:leftImDeriv(hK,x)),
 'second_hI':mat(lambda x:secondSU2(hI,x)),
 'second_hJ':mat(lambda x:secondSU2(hJ,x)),
 'second_hK':mat(lambda x:secondSU2(hK,x)),
}
print("(Q4) which banked su(2) generators COMMUTE with chargeOp=crossOp u1 ?")
for n,A in gens.items():
    print(f"   [chargeOp, {n}] == 0 ? {iszero(comm(chargeM,A))}")

def rank(A):
    M=[row[:] for row in A]; n=len(M);m=len(M[0]);r=0
    for c in range(m):
        piv=next((i for i in range(r,n) if M[i][c]!=0),None)
        if piv is None: continue
        M[r],M[piv]=M[piv],M[r]; pv=M[r][c]; M[r]=[x/pv for x in M[r]]
        for i in range(n):
            if i!=r and M[i][c]!=0:
                f=M[i][c]; M[i]=[M[i][j]-f*M[r][j] for j in range(m)]
        r+=1
    return r
print("\n(Q3) eigenvalue coefficients on shared planes:")
print("   chargeOp entries max abs:", max(abs(x) for r in chargeM for x in r), " rank", rank(chargeM))
print("   inner_hI entries max abs:", max(abs(x) for r in gens['inner_hI'] for x in r), " rank", rank(gens['inner_hI']))

# (Q2) linear independence of chargeM and inner_hI as skew matrices, and abelian span
def flat(A): return [x for r in A for x in r]
import itertools
fa=flat(chargeM); fb=flat(gens['inner_hI'])
# independent unless one is scalar multiple
prop=None; indep=True
for a,b in zip(fa,fb):
    if b!=0:
        c=a/b
        if prop is None: prop=c
        elif c!=prop: indep=True;break
    elif a!=0:
        indep=True;break
else:
    indep = (prop is None) or False
print("\n(Q2) chargeOp vs inner_hI proportional?", (not indep), " (independent =",indep,")")
print("   [chargeOp, inner_hI]==0 (abelian):", iszero(comm(chargeM,gens['inner_hI'])))

# does chargeOp itself lie in g2 (=Der(O))? test: is crossOp u1 a derivation? (it should NOT be, it's in the 7)
def isDeriv(op):
    for x in E:
        for y in E:
            lhs=o_to_vec(op(o_mul(x,y)))
            rhs=o_to_vec(o_add(o_mul(op(x),y),o_mul(x,op(y))))
            if lhs!=rhs: return False
    return True
# need op on full O for derivation test; extend chargeOp/inner to full O
def opO_charge(x): return octCrossO(u1,x)
def opO_inner(x): return innerDeriv(hI,x)
print("\n crossOp u1 is a derivation of O (in g2)?", isDeriv(opO_charge), " (expect False: it's in the 7)")
print(" innerDeriv hI is a derivation of O (in g2)?", isDeriv(opO_inner), " (expect True: in the 14=g2)")
