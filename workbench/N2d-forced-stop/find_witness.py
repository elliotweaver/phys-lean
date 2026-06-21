"""
N2d-hard — find the CLEANEST contrapositive witness:
  given a non-associating base triple a,b,c, build x,y in CD A with D(x,y) tied to [a,b,c].

Test candidate (x,y) forms on the actual octonions O (level 3) with RANDOM a,b,c, and
check whether D(x,y) is always a fixed scalar multiple of the associator [a,b,c]
(or a clean combination). Also test the special structured witnesses.
"""
from fractions import Fraction as Fr
import itertools, random

def z0(k): return Fr(0) if k==0 else (z0(k-1),z0(k-1))
def radd(x,y,k): return x+y if k==0 else (radd(x[0],y[0],k-1),radd(x[1],y[1],k-1))
def rneg(x,k): return -x if k==0 else (rneg(x[0],k-1),rneg(x[1],k-1))
def rsub(x,y,k): return radd(x,rneg(y,k),k)
def rstar(x,k): return x if k==0 else (rstar(x[0],k-1),rneg(x[1],k-1))
def rmul(x,y,k):
    if k==0: return x*y
    a,b=x;c,d=y
    return (rsub(rmul(a,c,k-1),rmul(rstar(d,k-1),b,k-1),k-1),
            radd(rmul(d,a,k-1),rmul(b,rstar(c,k-1),k-1),k-1))
def is0(x,k): return x==0 if k==0 else (is0(x[0],k-1) and is0(x[1],k-1))
def eq(x,y,k): return is0(rsub(x,y,k),k)
def basis(k,i):
    if k==0: return Fr(1)
    h=2**(k-1)
    return (basis(k-1,i),z0(k-1)) if i<h else (z0(k-1),basis(k-1,i-h))
def scale(c,x,k): return c*x if k==0 else (scale(c,x[0],k-1),scale(c,x[1],k-1))
def assoc(x,y,w,k): return rsub(rmul(rmul(x,y,k),w,k), rmul(x,rmul(y,w,k),k), k)
def flat(z,k):
    if k==0: return [z]
    return flat(z[0],k-1)+flat(z[1],k-1)

L=3
one3=basis(3,0)
def Nrm(z, kb=L):
    a,b=z
    return radd(rmul(a,rstar(a,kb),kb), rmul(rstar(b,kb),b,kb), kb)
def cd_mul(z,w,kb=L):
    a,b=z;c,d=w
    return (rsub(rmul(a,c,kb),rmul(rstar(d,kb),b,kb),kb),
            radd(rmul(d,a,kb),rmul(b,rstar(c,kb),kb),kb))
def D(x,y,kb=L): return rsub(Nrm(cd_mul(x,y,kb),kb), rmul(Nrm(x,kb),Nrm(y,kb),kb), kb)

def randoct(lo=-2,hi=2): 
    v=z0(L)
    for i in range(8):
        v=radd(v, scale(Fr(random.randint(lo,hi)), basis(L,i), L), L)
    return v

zeroO=z0(L)
# candidate witness forms: components chosen from {0,1,a,b,c,a*,b*,c*}
def comps(a,b,c):
    return {'0':zeroO,'1':one3,'a':a,'b':b,'c':c,
            'A':rstar(a,L),'B':rstar(b,L),'C':rstar(c,L)}

def is_prop_to(d, ref, k):
    """return scalar lam if d == lam*ref (componentwise), else None"""
    dv=flat(d,k); rv=flat(ref,k)
    lam=None
    for di,ri in zip(dv,rv):
        if ri==0:
            if di!=0: return None
        else:
            r=di/ri
            if lam is None: lam=r
            elif r!=lam: return None
    return lam

print("Searching witness forms x=(p,q), y=(r,s) over {0,1,a,b,c,a*,b*,c*}")
print("with D(x,y) == lam * [a,b,c] for FIXED lam across 6 random octonion triples...\n")

# precompute candidate component-keys
keys=['0','1','a','b','c','A','B','C']
# generate random triples
triples=[(randoct(),randoct(),randoct()) for _ in range(6)]
# for non-triviality require [a,b,c]!=0 on at least the test triples; regenerate if needed
def good(t): 
    a,b,c=t; return not is0(assoc(a,b,c,L),L)
triples=[t for t in triples if good(t)]
while len(triples)<6: 
    t=(randoct(),randoct(),randoct())
    if good(t): triples.append(t)

hits=[]
for fa in itertools.product(keys,repeat=4):
    if fa.count('0')>=3: continue
    lam_consistent=True; lam0=None; nonzero_all=True
    for (a,b,c) in triples:
        cm=comps(a,b,c)
        x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        d=D(x,y,L); ref=assoc(a,b,c,L)
        lam=is_prop_to(d,ref,L)
        if lam is None: lam_consistent=False; break
        if lam==0: nonzero_all=False
        if lam0 is None: lam0=lam
        elif lam!=lam0: lam_consistent=False; break
    if lam_consistent and lam0 is not None and lam0!=0:
        hits.append((fa,lam0))

print(f"witness forms with D == lam*[a,b,c] (fixed nonzero lam): {len(hits)}")
for fa,lam in hits[:20]:
    print(f"   x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})   D = {lam} * [a,b,c]")
if not hits:
    print("   none with single [a,b,c]; trying combos [a,b,c] and permutations next")
