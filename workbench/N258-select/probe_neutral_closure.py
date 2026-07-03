#!/usr/bin/env python3
"""N258 SELECT probe (fast) — neutral-sector algebraic closure + [Q,Y] location."""
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
u1=(hI,h_zero); kap1=basis(4)
def reQ(z): return o_to_vec(z)[0]
def gForm(x,y): return reQ(o_mul(x,o_star(y)))
def octCrossO(a,b): return o_add(o_mul(a,b), o_from_vec([gForm(a,b)]+[F(0)]*7))
def mat(op):
    A=[[F(0)]*7 for _ in range(7)]
    for jc,j in enumerate(ImO):
        out=o_to_vec(op(E[j]))
        for ic,i in enumerate(ImO): A[ic][jc]=out[i]
    return A
def matmul(A,B): return [[sum(A[r][t]*B[t][c] for t in range(7)) for c in range(7)] for r in range(7)]
def sub(A,B): return [[A[r][c]-B[r][c] for c in range(7)] for r in range(7)]
def comm(A,B): return sub(matmul(A,B),matmul(B,A))
def iszero(A): return all(all(x==0 for x in r) for r in A)
def tr(A): return sum(A[i][i] for i in range(7))
def BB(A,C): return tr(matmul(A,C))
def flat(A): return [A[i][j] for i in range(7) for j in range(7)]
def La(a): return mat(lambda x,a=a: o_mul(a,x))
def Ra(a): return mat(lambda x,a=a: o_mul(x,a))

Q  = mat(lambda x: octCrossO(u1,x))
Yh = mat(lambda x: octCrossO(kap1,x))
DI = mat(lambda x: (lambda a,b:(h_add(h_mul(hI,a),h_neg(h_mul(a,hI))),h_add(h_mul(hI,b),h_neg(h_mul(b,hI)))))(x[0],x[1]))
DJ = mat(lambda x: (lambda a,b:(h_add(h_mul(hJ,a),h_neg(h_mul(a,hJ))),h_add(h_mul(hJ,b),h_neg(h_mul(b,hJ)))))(x[0],x[1]))
DK = mat(lambda x: (lambda a,b:(h_add(h_mul(hK,a),h_neg(h_mul(a,hK))),h_add(h_mul(hK,b),h_neg(h_mul(b,hK)))))(x[0],x[1]))

# --- incremental reduced-basis machinery over flat 49-vectors ---
class Basis:
    def __init__(self): self.rows=[]  # each reduced echelon row with leading pivot col
    def reduce(self,v):
        v=v[:]
        for (pc,row) in self.rows:
            if v[pc]!=0:
                f=v[pc]; v=[v[k]-f*row[k] for k in range(len(v))]
        return v
    def add(self,mat):
        v=self.reduce(flat(mat))
        pc=next((k for k in range(len(v)) if v[k]!=0),None)
        if pc is None: return False
        piv=v[pc]; v=[x/piv for x in v]
        # reduce existing rows against new (keep echelon; not strictly needed)
        self.rows.append((pc,v)); return True
    def dim(self): return len(self.rows)
    def contains(self,mat): return self.reduce(flat(mat))==[F(0)]*49

def closure_dim(genmats,cap=25):
    B=Basis(); frontier=[]
    for g in genmats:
        if B.add(g): frontier.append(g)
    allb=list(frontier)
    changed=True
    while changed:
        changed=False
        cur=list(allb)
        for i in range(len(cur)):
            for j in range(i+1,len(cur)):
                c=comm(cur[i],cur[j])
                if B.add(c):
                    allb.append(c); changed=True
                    if B.dim()>=cap: return B.dim()
    return B.dim()

print("=== N258: neutral-sector closure ===")
QY=comm(Q,Yh)
print("[Q,Y]==0?", iszero(QY))
print("[Q,Y] entries:",[(a,b,str(QY[a][b])) for a in range(7) for b in range(a+1,7) if QY[a][b]!=0])
print("BB([Q,Y],[Q,Y])=",BB(QY,QY))
print("[Q,Y] commutes with T3=DI?", iszero(comm(QY,DI)))
print("[Q,Y] commutes with Q?", iszero(comm(QY,Q)))
print("[Q,Y] commutes with Y?", iszero(comm(QY,Yh)))

# build g2 = Der(O) spanning set
gens=[]
for i in range(1,8):
    for j in range(i+1,8):
        gens.append(comm(La(basis(i)),La(basis(j))))
        gens.append(comm(La(basis(i)),Ra(basis(j))))
        gens.append(comm(Ra(basis(i)),Ra(basis(j))))
Bg2=Basis()
for g in gens: Bg2.add(g)
print("\ndim Der(O) spanning set (g2, expect 14):", Bg2.dim())
crossB=[mat(lambda x,a=basis(i): octCrossO(a,x)) for i in range(1,8)]
Bcross=Basis()
for g in crossB: Bcross.add(g)
print("dim crossOp span (fundamental-7, expect 7):", Bcross.dim())
print("[Q,Y] in g2=Der(O)?", Bg2.contains(QY))
print("[Q,Y] in crossOp-7?", Bcross.contains(QY))

print("\n=== closures (so(7)=21, g2=14) ===")
print("gen{Q,Y}       ->", closure_dim([Q,Yh]))
print("gen{T3,Q}      ->", closure_dim([DI,Q]))
print("gen{T3,Y}      ->", closure_dim([DI,Yh]))
print("gen{Q,Y,T3}    ->", closure_dim([Q,Yh,DI]))
print("gen{su2L,Q}    ->", closure_dim([DI,DJ,DK,Q]))
print("gen{su2L,Y}    ->", closure_dim([DI,DJ,DK,Yh]))
print("gen{su2L,Q,Y}  ->", closure_dim([DI,DJ,DK,Q,Yh]))
