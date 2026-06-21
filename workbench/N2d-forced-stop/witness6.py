"""
N2d — corrected witness hunt + the clean generic selfMul identity.

(1) selfMul identity (GENERIC, no assoc/comm): for z=(a,b) in CD A,
        z·star z = ι(a·star a + star b·b),   im part EXACTLY 0.
    Verify symbolically over the free NON-assoc *-ring.

(2) HARD-direction witness on the ACTUAL base O (level 3): scan x=(e_a,e_b),
    y=(e_c,e_d) over ALL 7 imaginary octonion units (N2c uses e1,e2,e5,e6 — FOUR
    distinct units), find the A-valued defect that is nonzero on O and identify the
    associator triple responsible.
"""
from fractions import Fraction as Fr
import itertools, sympy as sp

# ---------- (1) symbolic selfMul over free non-assoc *-ring ----------
a_,b_ = sp.symbols('a_ b_', commutative=False)
aS,bS = sp.symbols('aS bS', commutative=False)
stmap={a_:aS,b_:bS,aS:a_,bS:b_}
def starNC(expr):
    expr=sp.expand(expr); out=0
    for term in sp.Add.make_args(expr):
        coeff,factors=term.as_coeff_mul(); nc=[]
        for f in factors:
            if f.is_commutative: coeff*=f
            else:
                base,e=f.as_base_exp()
                for _ in range(int(e)): nc.append(base)
        prod=coeff
        for g in [stmap[g] for g in reversed(nc)]: prod=prod*g
        out+=prod
    return sp.expand(out)
# z = (a_, b_); star z = (starNC a_, -b_); product re/im:
zre, zim = a_, b_
wre, wim = starNC(a_), -b_
prod_re = sp.expand(zre*wre - starNC(wim)*zim)   # a·star a - star(-b)·b = a·star a + star b·b
prod_im = sp.expand(wim*zre + zim*starNC(wre))   # (-b)·a + b·star(star a) = -b·a + b·a = 0
print("(1) selfMul identity over free NON-assoc *-ring:")
print("    (z·star z).re =", prod_re)
print("    (z·star z).im =", prod_im, " -> im is identically 0:", prod_im==0)
print("    => z·star z = ι(a·star a + star b·b)  GENERICALLY (Born self-overlap is 'real')")
print()

# ---------- (2) numeric octonion base, 4 distinct units ----------
def z0(L): return Fr(0) if L==0 else (z0(L-1),z0(L-1))
def radd(x,y,L): return x+y if L==0 else (radd(x[0],y[0],L-1),radd(x[1],y[1],L-1))
def rneg(x,L): return -x if L==0 else (rneg(x[0],L-1),rneg(x[1],L-1))
def rstar(x,L): return x if L==0 else (rstar(x[0],L-1),rneg(x[1],L-1))
def rmul(x,y,L):
    if L==0: return x*y
    a,b=x;c,d=y
    return (radd(rmul(a,c,L-1),rneg(rmul(rstar(d,L-1),b,L-1),L-1),L-1),
            radd(rmul(d,a,L-1),rmul(b,rstar(c,L-1),L-1),L-1))
def is0(x,L): return x==0 if L==0 else (is0(x[0],L-1) and is0(x[1],L-1))
def basis(L,k):
    if L==0: return Fr(1)
    h=2**(L-1)
    return (basis(L-1,k),z0(L-1)) if k<h else (z0(L-1),basis(L-1,k-h))
def assoc(x,y,w,L):
    return radd(rmul(rmul(x,y,L),w,L),rneg(rmul(x,rmul(y,w,L),L),L),L)
# A-valued Nrm: CD(O)->O ;  base level 3, double level 4
def NrmS(z):
    a,b=z
    return radd(rmul(a,rstar(a,3),3),rmul(rstar(b,3),b,3),3)
def cd_mulS(z,w):
    a,b=z;c,d=w
    return (radd(rmul(a,c,3),rneg(rmul(rstar(d,3),b,3),3),3),
            radd(rmul(d,a,3),rmul(b,rstar(c,3),3),3))
def D_S(x,y):
    return radd(NrmS(cd_mulS(x,y)),rneg(rmul(NrmS(x),NrmS(y),3),3),3)

imag=list(range(1,8))
print("(2) scan x=(e_a,e_b), y=(e_c,e_d), imaginary octonion units; A-valued defect on O:")
biting=[]
for a4 in itertools.product(imag,repeat=4):
    x=(basis(3,a4[0]),basis(3,a4[1])); y=(basis(3,a4[2]),basis(3,a4[3]))
    if not is0(D_S(x,y),3):
        biting.append(a4)
print(f"    biting index-quadruples: {len(biting)}/{7**4}")
print("    examples:", biting[:8])
# confirm N2c's own quad e1,e2,e5,e6 bites
n2c=(1,2,5,6)
x=(basis(3,1),basis(3,2)); y=(basis(3,5),basis(3,6))
print("    N2c quad (1,2,5,6) bites:", not is0(D_S(x,y),3), " (zdX·zdY=0, Nrm(0)=0 vs Nrm·Nrm≠0)")
# for a biting quad, exhibit the responsible non-associating triple of base units
if biting:
    qd=biting[0]
    print(f"    simplest biting quad: {qd}")
    # the four base units involved are e_{qd}; check which triples among them fail assoc
    units=set(qd)
    fails=[t for t in itertools.product(units,repeat=3) if not is0(assoc(basis(3,t[0]),basis(3,t[1]),basis(3,t[2]),3),3)]
    print(f"      non-associating base-unit triples among {sorted(units)}: {len(fails)} e.g. {fails[:4]}")
