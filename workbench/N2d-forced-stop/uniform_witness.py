"""
N2d-hard-backward — find a UNIFORM biting witness form over a concrete noncommutative
associative *-algebra N (the quaternions H), inside CD(CD N).

We want x = x(p,q), y = y(p,q) (uniform forms in two base elements p,q of N and
the generators e2) such that
   D(p,q) := Nrm(x*y) - Nrm(x)*Nrm(y)   (an element of CD N)
is NONZERO exactly when [p,q] = pq - qp != 0  (i.e. when N is noncommutative).

N = quaternions over Q with star = conjugation. We test candidate forms on many
random quaternion pairs and report which forms bite (D != 0) precisely on
noncommuting pairs and vanish on commuting pairs.
"""
from fractions import Fraction as Fr
import itertools, random

# ---------- quaternions over Q: (w,x,y,z) ----------
def qadd(a,b): return tuple(ai+bi for ai,bi in zip(a,b))
def qneg(a): return tuple(-ai for ai in a)
def qsub(a,b): return tuple(ai-bi for ai,bi in zip(a,b))
def qmul(a,b):
    w1,x1,y1,z1=a; w2,x2,y2,z2=b
    return (w1*w2-x1*x2-y1*y2-z1*z2,
            w1*x2+x1*w2+y1*z2-z1*y2,
            w1*y2-x1*z2+y1*w2+z1*x2,
            w1*z2+x1*y2-y1*x2+z1*w2)
def qstar(a):
    w,x,y,z=a; return (w,-x,-y,-z)
QZERO=(Fr(0),)*4
QONE=(Fr(1),Fr(0),Fr(0),Fr(0))
def qis0(a): return all(ai==0 for ai in a)

# ---------- CD N over quaternions ----------
def cd_add(z,w): return (qadd(z[0],w[0]), qadd(z[1],w[1]))
def cd_neg(z): return (qneg(z[0]),qneg(z[1]))
def cd_sub(z,w): return cd_add(z,cd_neg(w))
def cd_mul(z,w):
    a,b=z;c,d=w
    return (qsub(qmul(a,c),qmul(qstar(d),b)), qadd(qmul(d,a),qmul(b,qstar(c))))
def cd_star(z): return (qstar(z[0]),qneg(z[1]))
CDZ=(QZERO,QZERO)
def cd_is0(z): return qis0(z[0]) and qis0(z[1])

# ---------- CD(CD N) ----------
def cc_add(u,v): return (cd_add(u[0],v[0]),cd_add(u[1],v[1]))
def cc_neg(u): return (cd_neg(u[0]),cd_neg(u[1]))
def cc_sub(u,v): return cc_add(u,cc_neg(v))
def cc_mul(u,v):
    a,b=u;c,d=v
    return (cd_sub(cd_mul(a,c),cd_mul(cd_star(d),b)), cd_add(cd_mul(d,a),cd_mul(b,cd_star(c))))
def cc_star(u): return (cd_star(u[0]),cd_neg(u[1]))
def Nrm(u): return cc_mul(u,cc_star(u))[0]   # element of CD N
def defect(x,y): return cd_sub(Nrm(cc_mul(x,y)), cd_mul(Nrm(x),Nrm(y)))

# embeddings
def iN(p): return (p,QZERO)         # N -> CD N  (iota)
def iiN(p): return (iN(p),CDZ)      # N -> CD(CD N) (iota.iota)
oneCDN=(QONE,QZERO)
e2N=(QZERO,QONE)                    # e2 of CD N
e2CC=(CDZ,(QONE,QZERO))            # e2 of CD(CD N); 1 of CD N=(QONE,QZERO)
iota_e2N=(e2N,CDZ)                  # iota(e2_N) in CD(CD N)

def randq():
    return tuple(Fr(random.randint(-3,3)) for _ in range(4))

# candidate witness forms: functions (p,q)->(x,y) in CD(CD N)
def F_immp(p,q):  # x=(0; iota p), y=(0; iota q)  [in CD(CD N): re=0(CDN), im=iota p]
    return ((CDZ, iN(p)), (CDZ, iN(q)))
def F_iota_e2(p,q): # x=(0; (iota p)*e2_N ), y=(0; iota q)
    return ((CDZ, cd_mul(iN(p),e2N)), (CDZ, iN(q)))
def F_mixed(p,q):  # x=(iota p; 0)+...
    return ((iN(p),CDZ),(CDZ,iN(q)))
def F_ee(p,q):     # x=(0; iota p), y=(0; e2_N)  -> known [p,star p]
    return ((CDZ, iN(p)), (CDZ, e2N))
def F_pe2_qe2(p,q):
    return ((CDZ, cd_mul(iN(p),e2N)), (CDZ, cd_mul(iN(q),e2N)))
def F_outer(p,q):  # x = iota(iota p)*e2CC ; y = iota(iota q)
    x=cc_mul(iiN(p),e2CC); y=iiN(q); return (x,y)
def F_outer2(p,q):
    x=cc_mul(iiN(p),e2CC); y=cc_mul(iiN(q),e2CC); return (x,y)

forms={'immp':F_immp,'iota_e2':F_iota_e2,'mixed':F_mixed,'ee':F_ee,
       'pe2_qe2':F_pe2_qe2,'outer':F_outer,'outer2':F_outer2}

random.seed(1)
print("form        : bites_on_noncomm / nonzero_total ; vanishes_on_comm?")
for name,F in forms.items():
    bites=0; total=0; comm_fail=0; comm_total=0
    for _ in range(300):
        p,q=randq(),randq()
        x,y=F(p,q)
        d=defect(x,y)
        nz = not cd_is0(d)
        noncomm = not qis0(qsub(qmul(p,q),qmul(q,p)))
        if noncomm:
            total+=1
            if nz: bites+=1
        else:
            comm_total+=1
            if nz: comm_fail+=1
    print(f"{name:12s}: {bites}/{total} bite on noncomm ; comm-pairs nonzero: {comm_fail}/{comm_total}")
