import numpy as np
# Build O = CD(H), H = CD(C), C = CD(R) with CD product convention.
# element as length-8 real vector. We'll implement conjugation and product recursively.
# CD: (a,b)*(c,d) = (a c - conj(d) b, d a + b conj(c))   [one standard convention]
# represent level by dimension; use nested via 8-vectors with block ops.
def conj_n(x):
    # conjugation: negate all but first coordinate
    y=x.copy(); y[1:]=-y[1:]; return y
def mul_cd(x,y,n):
    # n = dimension (power of 2)
    if n==1:
        return np.array([x[0]*y[0]])
    h=n//2
    a,b=x[:h],x[h:]
    c,d=y[:h],y[h:]
    ac=mul_cd(a,c,h)
    db=mul_cd(conj_n(d),b,h)
    da=mul_cd(d,a,h)
    bc=mul_cd(b,conj_n(c),h)
    return np.concatenate([ac-db, da+bc])
def mul(x,y): return mul_cd(x,y,8)
def basis(i):
    v=np.zeros(8); v[i]=1; return v
E=[basis(i) for i in range(8)]  # E[0]=1, E[1..7]=imaginary units
# crossOp(a)(y) for imaginary a,y = imaginary part of a*y; gForm(a,y)=<a,y>
def gform(a,b): return float(np.dot(a[1:],b[1:]))  # inner product on imaginary part (unit norm basis)
def crossOp_col(a,y):
    p=mul(a,y)
    return p  # full product; imaginary part = p with p[0] handled
# Check: crossOp(E1)(Ej) imaginary part vs Cmat. E1=u1. In banked idx, imaginary basis c1..c7 = E1..E7.
# Cmat (from N253): columns j=1..7 give crossOp(u1)(e_j)
Cmat=np.array([
 [0,0,0,0,0,0,0],
 [0,0,-1,0,0,0,0],
 [0,1,0,0,0,0,0],
 [0,0,0,0,-1,0,0],
 [0,0,0,1,0,0,0],
 [0,0,0,0,0,0,1],
 [0,0,0,0,0,-1,0]])
# our crossOp(u1)(e_j) imaginary part:
ok=True
myC=np.zeros((7,7))
for j in range(1,8):
    p=mul(E[1],E[j])
    myC[:,j-1]=p[1:]   # imaginary coords
print("Our crossOp(u1) matrix (imag):\n", myC.astype(int))
print("Matches Cmat?", np.allclose(myC,Cmat))

print("\n===== DOUBLET PROBE: su(2)_L via LEFT-REGULAR quaternion action on the SPINOR O =====")
# H-imaginary units in O: hI=u1=E1, hJ=e2=E2, hK=e3=E3 (TL=ImH, N277)
def Lmat(a):
    # left multiplication L_a on 8-dim O, as 8x8 matrix
    A=np.zeros((8,8))
    for j in range(8):
        A[:,j]=mul(a,E[j])
    return A
LI,LJ,LK = Lmat(E[1]),Lmat(E[2]),Lmat(E[3])
def comm(A,B): return A@B-B@A
print("[L_hI,L_hJ] = 2 L_hK ?", np.allclose(comm(LI,LJ),2*LK))
print("[L_hJ,L_hK] = 2 L_hI ?", np.allclose(comm(LJ,LK),2*LI))
print("L_hI^2 = -I ?", np.allclose(LI@LI,-np.eye(8)))
# Casimir of left su(2): (LI^2+LJ^2+LK^2)
Cas = LI@LI+LJ@LJ+LK@LK
print("Casimir L^2 = c*I ?", np.allclose(Cas, Cas[0,0]*np.eye(8)), " value=", Cas[0,0])
# The half-generators J_i = LI/2 etc give spin. Casimir/4 = -3/4 * I means spin-1/2 (j(j+1)=3/4) on ALL of O.
print("Casimir/4 =", Cas[0,0]/4, " (spin-1/2 has j(j+1)=0.75, so -0.75 => doublet)")
# Decompose O under this left su(2): find invariant subspaces. The algebra <LI,LJ,LK> Lie-closes to su(2) (dim 3).
# O(8-dim) as su(2)-module: 8 = 4 doublets? or with the RIGHT action commuting, 2 doublets x 2 mult.
# Check: does the WHOLE O split as H + Hℓ, each invariant under left-H-mult?
# H = span{1,E1,E2,E3}; Hℓ = span{E4,E5,E6,E7}. left mult by ImH:
Hidx=[0,1,2,3]; Hlidx=[4,5,6,7]
def invariant(sub_idx, gens):
    P=np.zeros((8,8))
    for i in sub_idx: P[i,i]=1
    for g in gens:
        for i in sub_idx:
            col=g@E[i]
            # is col in span of sub_idx?
            comp=col.copy()
            for i2 in sub_idx: comp[i2]=0
            if not np.allclose(comp,0): return False
    return True
print("H (span 1,hI,hJ,hK) left-su(2)-invariant?", invariant(Hidx,[LI,LJ,LK]))
print("Hℓ (span E4..E7) left-su(2)-invariant?", invariant(Hlidx,[LI,LJ,LK]))
