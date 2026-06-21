"""
N2d-hard — THE 'ONE CAUSE' CONCRETE LINK at the cascade.

Build a norm-defect witness in S = CD(O) (level 4) whose COMPONENTS are the elements
of O's non-associating triple, so the SAME non-associativity that breaks associativity
(banked not_associative) also breaks the norm/composition law (the crown's 'one cause').

O level 3 (dim 8). The banked non-assoc triple is (ι(ιJ), ι(e2_H), e2_O).
In tuple form at level 3:
  ιJ in H: J=(0,1) at Dbl level1 -> ιJ = CD.iota(J) = (J,0) = ((0,1),(0,0)) -- that's basis index?
Let me just locate it: e2 of H = (0,1) in CD(Dbl)= ((0,0),(1,0)). ι(ιJ) in O = CD.iota(ιJ)=(ιJ,0).
We don't need exact indices: we test ALL pairs from a small set including the triple elements.
"""
from fractions import Fraction as Fr
import itertools
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
def iota(a,k): return (a, z0(k))            # CD.iota at level k+1 (a at level k)
def e2(k): return (z0(k), one_(k))          # CD.e2 at level k+1
def one_(k): return Fr(1) if k==0 else (one_(k-1),z0(k-1))

# O is level 3 = CD(H), H level 2 = CD(Dbl), Dbl level1=CD(R).
# Dbl.J = (0,1) at level1 = e2(0) basically: J = (Fr0,Fr1)
J = (Fr(0),Fr(1))                # level1 element
iJ_H = iota(J,1)                 # ι J in H (level2)  = ((0,1),(0,0))
e2_H = e2(1)                     # e2 in H (level2)   = ((0,0),(1,0))
# O elements (level3):
p = iota(iJ_H,2)                 # ι(ιJ) in O
q = iota(e2_H,2)                 # ι(e2_H) in O
r = e2(2)                        # e2 in O
# check non-association in O (level3)
def assoc(a,b,c,k): return rsub(rmul(rmul(a,b,k),c,k), rmul(a,rmul(b,c,k),k), k)
print("O triple (p,q,r) non-associates?", not is0(assoc(p,q,r,3),3))

# Now in S=CD(O) level4: norm + defect
L=4
def Nrm(z):
    a,b=z; return radd(rmul(a,rstar(a,3),3), rmul(rstar(b,3),b,3), 3)  # components at level3
def cd_mul(z,w):
    a,b=z;c,d=w
    return (rsub(rmul(a,c,3),rmul(rstar(d,3),b,3),3),
            radd(rmul(d,a,3),rmul(b,rstar(c,3),3),3))
def D(x,y):
    return rsub(Nrm(cd_mul(x,y)), rmul(Nrm(x),Nrm(y),3), 3)
def is0O(x): return is0(x,3)

zeroO=z0(3)
vocab={'0':zeroO,'p':p,'q':q,'r':r}
keys=list(vocab)
print("\nNorm-defect witnesses x,y in S built ONLY from {0,p,q,r} (p,q,r = O's non-assoc triple):")
found=[]
for fa in itertools.product(keys,repeat=4):
    nz=sum(1 for t in fa if t!='0')
    if nz<2: continue
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    if not is0O(D(x,y)):
        found.append((nz,fa))
found.sort()
print(f"  biting witnesses: {len(found)}")
for nz,fa in found[:12]:
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    d=D(x,y)
    print(f"   x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})  -> Nrm(xy)-Nrm x·Nrm y nonzero")
if found:
    nz,fa=found[0]
    x=(vocab[fa[0]],vocab[fa[1]]); y=(vocab[fa[2]],vocab[fa[3]])
    print(f"\n  CLEANEST: x=({fa[0]},{fa[1]}), y=({fa[2]},{fa[3]})")
    print("  Nrm(x)=",Nrm(x)); print("  Nrm(y)=",Nrm(y))
    print("  Nrm(x*y)=",Nrm(cd_mul(x,y)))
