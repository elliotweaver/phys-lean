"""
N2d-hard-backward — FAST structured 3-element witness search over the concrete tower.

Base A = CD N, N = quaternions/Q (the cascade's associative-noncommutative base).
A = CD N is the first non-associative base. Find x,y in CD A built UNIFORMLY from
p,q,e2 such that defect D = Nrm(xy)-Nrm(x)Nrm(y) in A is nonzero EXACTLY when
[p,q] != 0. Prefilter on 1 noncomm + 1 comm pair, then confirm on a batch.
"""
from fractions import Fraction as Fr
import itertools, random

def qadd(a,b): return tuple(x+y for x,y in zip(a,b))
def qneg(a): return tuple(-x for x in a)
def qsub(a,b): return tuple(x-y for x,y in zip(a,b))
def qmul(a,b):
    w1,x1,y1,z1=a;w2,x2,y2,z2=b
    return (w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2,
            w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2)
def qstar(a): w,x,y,z=a; return (w,-x,-y,-z)
QZ=(Fr(0),)*4; QO=(Fr(1),Fr(0),Fr(0),Fr(0))
def q0(a): return all(x==0 for x in a)
def A_add(z,w): return (qadd(z[0],w[0]),qadd(z[1],w[1]))
def A_neg(z): return (qneg(z[0]),qneg(z[1]))
def A_sub(z,w): return A_add(z,A_neg(w))
def A_mul(z,w):
    a,b=z;c,d=w
    return (qsub(qmul(a,c),qmul(qstar(d),b)), qadd(qmul(d,a),qmul(b,qstar(c))))
def A_star(z): return (qstar(z[0]),qneg(z[1]))
AZ=(QZ,QZ); AO=(QO,QZ)
def A0(z): return q0(z[0]) and q0(z[1])
def C_mul(u,v):
    a,b=u;c,d=v
    return (A_sub(A_mul(a,c),A_mul(A_star(d),b)), A_add(A_mul(d,a),A_mul(b,A_star(c))))
def C_star(u): return (A_star(u[0]),A_neg(u[1]))
def Nrm(u): return C_mul(u,C_star(u))[0]
def defect(x,y): return A_sub(Nrm(C_mul(x,y)), A_mul(Nrm(x),Nrm(y)))

def randq(): return tuple(Fr(random.randint(-2,2)) for _ in range(4))

def alpha(p,q): return (p,QZ)
def beta(p,q):  return (q,QZ)
def gamma(p,q): return (QZ,QO)
def Aone(p,q):  return AO
def Azero(p,q): return AZ
basic={'al':alpha,'be':beta,'ga':gamma,'1':Aone,'0':Azero}
AF=dict(basic)
for n1 in ['al','be','ga']:
    for n2 in ['al','be','ga']:
        AF[f'{n1}{n2}']=(lambda f1,f2:(lambda p,q:A_mul(f1(p,q),f2(p,q))))(basic[n1],basic[n2])
afk=list(AF.keys())
def make(form,p,q): return (AF[form[0]](p,q), AF[form[1]](p,q))

random.seed(7)
# fixed prefilter pair (noncomm) and (comm)
pnc=(Fr(0),Fr(1),Fr(0),Fr(0)); qnc=(Fr(0),Fr(0),Fr(1),Fr(0))   # i, j: noncommute
pc =(Fr(2),Fr(0),Fr(0),Fr(0)); qc =(Fr(0),Fr(0),Fr(3),Fr(0))   # scalar & j: commute? 2 and 3j: 2*3j=6j, 3j*2=6j yes commute
assert not q0(qsub(qmul(pnc,qnc),qmul(qnc,pnc)))
assert q0(qsub(qmul(pc,qmul(QO,QO) if False else qc),qmul(qc,pc)))
batch=[]
for _ in range(60):
    p,q=randq(),randq()
    batch.append((p,q,not q0(qsub(qmul(p,q),qmul(q,p)))))
nb=[b for b in batch if b[2]]; cb=[b for b in batch if not b[2]]

survivors=[]
for r in afk:
  for i in afk:
    xf=(r,i)
    xnc=make(xf,pnc,qnc)
    if A0(xnc[0]) and A0(xnc[1]): continue
    for r2 in afk:
      for i2 in afk:
        yf=(r2,i2)
        ync=make(yf,pnc,qnc)
        if A0(ync[0]) and A0(ync[1]): continue
        # prefilter: must bite on (pnc,qnc) and vanish on (pc,qc)
        if A0(defect(xnc,ync)): continue
        if not A0(defect(make(xf,pc,qc),make(yf,pc,qc))): continue
        survivors.append((xf,yf))
print(f"prefilter survivors: {len(survivors)}")

best=[]
for xf,yf in survivors:
    bites=sum(1 for (p,q,nc) in nb if not A0(defect(make(xf,p,q),make(yf,p,q))))
    cfail=sum(1 for (p,q,nc) in cb if not A0(defect(make(xf,p,q),make(yf,p,q))))
    if bites==len(nb) and cfail==0:
        best.append((xf,yf))
print(f"forms biting ALL {len(nb)} noncomm AND vanishing on all {len(cb)} comm: {len(best)}")
for xf,yf in best[:40]:
    print(f"  x=<{xf[0]}|{xf[1]}>  y=<{yf[0]}|{yf[1]}>")
