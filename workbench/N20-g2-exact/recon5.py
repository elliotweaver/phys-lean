# Find the Leibniz instance(s) producing the octonionic constraint
#   C5: (De1).c6 - (De2).c5 + (De4).c3 = 0.
# Search over all single Leibniz instances D(ei*ej)=Dei*ej+ei*Dej, all coords,
# expressed in terms of the 3 generator-derivative coord vars (De1=a, De2=b, De4=d)
# AFTER substituting the generated-element derivatives:
#   De3 = D(e1e2) = a*e2 + e1*b   (so De3 coords are linear in a,b)
#   De5 = D(e1e4) = a*e4 + e1*d
#   De6 = D(e2e4) = b*e4 + e2*d
#   De7 = D(e3e4) = De3*e4 + e3*d = (a*e2+e1*b)*e4 + e3*d
# We want to see how a coordinate of some Leibniz instance reduces (mod the already-known
# skew relations + trace-free c0=0) to exactly C5. Simplest: directly verify C5 is a
# consequence by checking it on the 14-dim solution space is the LAST independent relation.
# Here we just CONFIRM C5 holds for all 14 basis derivations and find a clean Leibniz source.
from fractions import Fraction as F
import pickle
def dbl_mul(z,w): return (z[0]*w[0]-z[1]*w[1], z[0]*w[1]+z[1]*w[0])
def dbl_star(z): return (z[0],-z[1])
def dbl_add(z,w): return (z[0]+w[0],z[1]+w[1])
def dbl_neg(z): return (-z[0],-z[1])
def make_CD(mul,star,add,neg,zero):
    def cd_mul(z,w):
        zr,zi=z; wr,wi=w
        return (add(mul(zr,wr),neg(mul(star(wi),zi))), add(mul(wi,zr),mul(zi,star(wr))))
    def cd_star(z): return (star(z[0]),neg(z[1]))
    def cd_add(z,w): return (add(z[0],w[0]),add(z[1],w[1]))
    def cd_neg(z): return (neg(z[0]),neg(z[1]))
    return cd_mul,cd_star,cd_add,cd_neg,(zero,zero)
DBL=(F(0),F(0))
hm,hs,ha,hn,hz=make_CD(dbl_mul,dbl_star,dbl_add,dbl_neg,DBL)
om,os,oa,on,oz=make_CD(hm,hs,ha,hn,hz)
def ofv(v):
    def d(b):return(v[b],v[b+1])
    def h(b):return(d(b),d(b+2))
    return(h(0),h(4))
def otv(z):
    v=[None]*8
    for oi in(0,1):
        H=z[oi]
        for hi in(0,1):
            D=H[hi]
            for di in(0,1): v[oi*4+hi*2+di]=D[di]
    return v
def b(i):
    v=[F(0)]*8;v[i]=F(1);return ofv(v)
E=[b(i) for i in range(8)]
C=[[otv(om(E[i],E[j])) for j in range(8)] for i in range(8)]
# C[l][j][k] = coeff of e_k in e_l*e_j

# symbolic vars: 24 unknowns = De1.c0..c7 (idx 0..7), De2 (8..15), De4 (16..23)
# build De3,De5,De6,De7 as linear forms; then for a chosen Leibniz instance D(ei ej)
# express residual = (Dei*ej+ei*Dej).ck - (D(ei ej)).ck as a linear form over 24 vars
# where D(em).cl for m in {3,5,6,7} substituted via generation; for m in {1,2,4} direct;
# m=0 -> 0 (trace), and we treat ALL coords of De1,De2,De4 as the 24 vars but impose c0=0.
NV=24
def var(gen,c):  # gen in {1,2,4} -> block; returns index
    return {1:0,2:8,4:16}[gen]+c
def lin_zero(): return [F(0)]*NV
def Dgen_coords(gen):  # returns list of 8 linear forms (each length NV) for D(e_gen)
    forms=[lin_zero() for _ in range(8)]
    if gen in (1,2,4):
        for c in range(8):
            forms[c][var(gen,c)]=F(1)
    elif gen==0:
        pass # D e0 = 0
    return forms
# product of (linear-form vector P over basis) with fixed basis e_j on the right:
def mul_left_fixed(Pforms, j):  # (X*ej) where X has coord forms Pforms -> 8 forms
    out=[lin_zero() for _ in range(8)]
    for k in range(8):
        for l in range(8):
            c=C[l][j][k]
            if c!=0:
                for v in range(NV):
                    out[k][v]+=c*Pforms[l][v]
    return out
def mul_right_fixed(i, Qforms):  # (ei*Y)
    out=[lin_zero() for _ in range(8)]
    for k in range(8):
        for l in range(8):
            c=C[i][l][k]
            if c!=0:
                for v in range(NV):
                    out[k][v]+=c*Qforms[l][v]
    return out
def add_forms(A,B):
    return [[A[k][v]+B[k][v] for v in range(NV)] for k in range(8)]
def fixedvec_forms(vec):  # constant octonion as forms (no vars)
    return [[F(0)]*NV for _ in range(8)]  # constant -> but we need its coords as constants; handle separately

# We'll compute Dgen for composite via generation, building up:
D={}
D[0]=[lin_zero() for _ in range(8)]
D[1]=Dgen_coords(1); D[2]=Dgen_coords(2); D[4]=Dgen_coords(4)
# De3 = D(e1*e2) = De1*e2 + e1*De2
D[3]=add_forms(mul_left_fixed(D[1],2), mul_right_fixed(1,D[2]))
# De5 = D(e1*e4)= De1*e4 + e1*De4
D[5]=add_forms(mul_left_fixed(D[1],4), mul_right_fixed(1,D[4]))
# De6 = D(e2*e4)
D[6]=add_forms(mul_left_fixed(D[2],4), mul_right_fixed(2,D[4]))
# De7 = D(e3*e4) = De3*e4 + e3*De4
D[7]=add_forms(mul_left_fixed(D[3],4), mul_right_fixed(3,D[4]))

# For each pair (i,j), the consistency relation: D(ei*ej) computed via the *value* ei*ej
# (a basis elt em with sign) must equal Dei*ej + ei*Dej. The constraint is:
#  Dei*ej + ei*Dej - D(ei*ej_as_basis) = 0.
# D(ei*ej_as_basis): ei*ej = sum_k C[i][j][k] e_k (single term, sign s, index m):
def Dvalue_of(i,j):  # D applied to the basis value of ei*ej
    out=[lin_zero() for _ in range(8)]
    for m in range(8):
        s=C[i][j][m]
        if s!=0:
            for k in range(8):
                for v in range(NV):
                    out[k][v]+=s*D[m][k][v]
    return out
def residual(i,j):
    lhs=add_forms(mul_left_fixed(D[i],j), mul_right_fixed(i,D[j]))
    rhs=Dvalue_of(i,j)
    return [[lhs[k][v]-rhs[k][v] for v in range(NV)] for k in range(8)]

def fmt(form):
    names=[f"De1.c{c}" for c in range(8)]+[f"De2.c{c}" for c in range(8)]+[f"De4.c{c}" for c in range(8)]
    parts=[]
    for v in range(NV):
        if form[v]!=0:
            c=form[v]
            parts.append(("+" if c>0 else "-")+(f"{abs(c)}*" if abs(c)!=1 else "")+names[v])
    return "".join(parts) or "0"

target=lin_zero()
target[var(1,6)]=F(1); target[var(2,5)]=F(-1); target[var(4,3)]=F(1)  # De1.c6 - De2.c5 + De4.c3
print("TARGET C5: De1.c6 - De2.c5 + De4.c3 = 0")
print("searching all Leibniz residuals for one proportional to C5 (mod trace c0=0)...\n")
import itertools
for (i,j) in itertools.product(range(8),range(8)):
    r=residual(i,j)
    for k in range(8):
        f=r[k]
        if all(x==0 for x in f): continue
        # check proportional to target ignoring c0 vars (idx 0,8,16)
        # zero out c0 components
        ff=f[:]; 
        # test if ff is scalar multiple of target
        # find first nonzero of target
        nz=[v for v in range(NV) if target[v]!=0]
        scal=None; ok=True
        for v in range(NV):
            tv=target[v]; fv=ff[v]
            if tv==0:
                if fv!=0: ok=False;break
            else:
                if scal is None: scal=fv/tv
                elif fv/tv!=scal: ok=False;break
        if ok and scal not in (None,0):
            print(f"  e{i}*e{j} coord c{k}: {fmt(f)}   (= {scal} * C5)")
