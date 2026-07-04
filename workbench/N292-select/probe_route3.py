"""
N292 — find the CLEANEST provable route for [kAB,kBC]=famB, given kAB is NOT a general derivation.
kAB = [Lmul(sA u1), Lmul(sB 1)],  kBC = [Lmul(sB u1), Lmul(sC 1)].
Route options (all use banked jb-slot lemmas, NO coordinate bash):
 (a) DIRECT: [kAB,kBC] as End = expand via Lie/Jacobi into a sum of [Lmul X, Lmul Y] = innerMul X Y
     over slot products. How many terms? Are all slot products banked (jb_slotX_slotY)?
 (b) The specific mixed-Leibniz [kAB, Lmul(sBu1)] and [kAB, Lmul(sC1)] as operators.
Measure the term structure so the Lean proof is a fixed sequence of banked rewrites.
"""
import numpy as np
from fractions import Fraction as F
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)),add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
Cc=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*Cc); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]; I8=np.eye(8)
T=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): T[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',T,x,y)
def ostar(x): return Sst.T@x
u1=I8[1].copy()
def mat_mul(A,B):
    R=np.zeros((3,3,8))
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb(A,B): return mat_mul(A,B)+mat_mul(B,A)
def slotmat(i,j,c):
    M=np.zeros((3,3,8)); M[i,j]=c.copy(); M[j,i]=ostar(c); return M
fullbasis=[]
for i in range(3):
    for j in range(3):
        for c in range(8):
            M=np.zeros((3,3,8)); M[i,j]=I8[c]; fullbasis.append(M)
def m2v(M): return M.reshape(-1)
def v2m(v): return v.reshape(3,3,8)
def Lmul(A): return np.array([m2v(jb(A,B)) for B in fullbasis]).T
def innerMul(A,B):
    LA,LB=Lmul(A),Lmul(B); return LA@LB-LB@LA
sA=lambda c: slotmat(0,1,c); sB=lambda c: slotmat(0,2,c); sC=lambda c: slotmat(1,2,c)
def op_apply(op,M): return v2m(op@m2v(M))
def comm(X,Y): return X@Y-Y@X
def showslot(M,label):
    # decompose M into diag + slotA/B/C octonion parts
    parts={}
    for i in range(3):
        if np.max(np.abs(M[i,i]))>1e-9: parts[f"d{i}"]=np.round(M[i,i],2)
    for (i,j),nm in [((0,1),"A"),((0,2),"B"),((1,2),"C")]:
        if np.max(np.abs(M[i,j]))>1e-9: parts[f"slot{nm}"]=np.round(M[i,j],2)
    print(f"  {label}: {parts}")

kAB=innerMul(sA(u1),sB(I8[0])); kBC=innerMul(sB(u1),sC(I8[0]))
sBu1,sC1=sB(u1),sC(I8[0])

print("=== the specific mixed brackets [kAB, Lmul C] on the 5 relevant inputs ===")
# [kAB,kBC] applied to a general X = kAB(kBC X) - kBC(kAB X). Instead use operator route.
# Route (b): [kAB, kBC] = [kAB, [Lmul sBu1, Lmul sC1]]
#          = [[kAB,Lmul sBu1], Lmul sC1] + [Lmul sBu1, [kAB,Lmul sC1]]   (Jacobi, always true)
LsBu1,LsC1=Lmul(sBu1),Lmul(sC1)
br1=comm(kAB,LsBu1)   # = [kAB, Lmul(slotB u1)]
br2=comm(kAB,LsC1)    # = [kAB, Lmul(slotC 1)]
print("[kAB, Lmul(slotB u1)] == Lmul(kAB.(slotB u1))=Lmul(-slotA 1)?",np.max(np.abs(br1-Lmul(op_apply(kAB,sBu1)))))
print("[kAB, Lmul(slotC 1)] == Lmul(kAB.(slotC 1))=Lmul(0)=0?",np.max(np.abs(br2)))
# so [kAB,kBC] = [Lmul(-slotA 1), Lmul(slotC 1)] + [Lmul(slotB u1), 0]
#             = innerMul(-slotA 1)(slotC 1) = -innerMul(slotA 1)(slotC 1)
reconstruct = comm(Lmul(op_apply(kAB,sBu1)),LsC1) + comm(LsBu1,br2)
print("reconstruct == [kAB,kBC]?",np.max(np.abs(reconstruct-comm(kAB,kBC))))

print("\n=== THE CRUX: is [kAB, Lmul C] = Lmul(kAB C) provable? Test C=slotB u1, slotC 1 as OPERATORS ===")
# This specific mixed Leibniz. WHY does it hold? kAB=[Lmul(sA u1),Lmul(sB 1)].
# [kAB, Lmul C] = [[Lmul(sA u1),Lmul(sB 1)], Lmul C]
#  = [Lmul(sA u1),[Lmul(sB 1),Lmul C]] + [[Lmul(sA u1),Lmul C],Lmul(sB 1)]  (Jacobi)
#  = [Lmul(sA u1), innerMul(sB 1) C] + [innerMul(sA u1) C, Lmul(sB 1)]  -- messy
# BETTER: directly reduce. Let's just measure kAB.(slotB u1)=-slotA 1 via jb-slot chain.
# kAB.(slotB u1) = jb(sA u1)(jb(sB 1)(sB u1)) - jb(sB 1)(jb(sA u1)(sB u1))
step1=jb(sB(I8[0]),sB(u1)); showslot(step1,"jb(slotB 1)(slotB u1)")
step2=jb(sA(u1),step1); showslot(step2,"jb(slotA u1)(jb(slotB 1)(slotB u1))")
step3=jb(sA(u1),sB(u1)); showslot(step3,"jb(slotA u1)(slotB u1)")
step4=jb(sB(I8[0]),step3); showslot(step4,"jb(slotB 1)(jb(slotA u1)(slotB u1))")
result=step2-step4; showslot(result,"kAB.(slotB u1) = step2 - step4")
print("  == -slotA 1?",np.max(np.abs(result+sA(I8[0])))<1e-9)
