"""
N281 SELECT — CONSOLIDATED confirmation of the FINAL target facts.
Headline: FLEXIBILITY is the last identity surviving the cascade stop; it protects a rank-2
neutral torus {L_a, R_a} even where the full two-handed so(4) breaks on O.
"""
from fractions import Fraction as F
def R_mul(x,y): return x*y
def R_star(x): return x
def gadd(x,y):
    if isinstance(x,tuple): return (gadd(x[0],y[0]),gadd(x[1],y[1]))
    return x+y
def gsub(x,y):
    if isinstance(x,tuple): return (gsub(x[0],y[0]),gsub(x[1],y[1]))
    return x-y
def make_level(mul,star):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (gsub(mul(a,c),mul(star(d),b)),gadd(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    return lmul,lstar
def neg_gen():
    def n(z):
        if isinstance(z,tuple): return (n(z[0]),n(z[1]))
        return -z
    return n
lneg=neg_gen()
C_mul,C_star=make_level(R_mul,R_star);H_mul,H_star=make_level(C_mul,C_star);O_mul,O_star=make_level(H_mul,H_star)
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd
    return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v; return (((a,b),(c,d)),((e,f),(g,h)))
def bi(i):
    v=[F(0)]*8;v[i]=F(1);return unflat(v)
def om(x,y): return O_mul(x,y)
def L(a):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        c=flat(om(a,bi(j)))
        for i in range(8): M[i][j]=c[i]
    return M
def Rr(a):
    M=[[F(0)]*8 for _ in range(8)]
    for j in range(8):
        c=flat(om(bi(j),a))
        for i in range(8): M[i][j]=c[i]
    return M
def mm(A,B):
    C=[[F(0)]*8 for _ in range(8)]
    for i in range(8):
        for k in range(8):
            if A[i][k]==0: continue
            for j in range(8): C[i][j]+=A[i][k]*B[k][j]
    return C
def sub(A,B): return [[A[i][j]-B[i][j] for j in range(8)] for i in range(8)]
def comm(A,B): return sub(mm(A,B),mm(B,A))
def z(A): return all(A[i][j]==0 for i in range(8) for j in range(8))
e=[bi(i) for i in range(8)]

print("=== (1) FLEXIBILITY: same-unit diagonal pair {L_a,R_a} commutes on ALL O, every a ===")
for i in range(1,8):
    print(f"  [L(e{i}),R(e{i})] = 0 on O ?", z(comm(L(e[i]),Rr(e[i]))))
print("=== (2) CROSS-unit pairs do NOT commute on O (the so(4) breaking, N280) ===")
print("  [L(e1),R(e2)]=0?", z(comm(L(e[1]),Rr(e[2]))), " [L(e2),R(e3)]=0?", z(comm(L(e[2]),Rr(e[3]))))

print("\n=== (3) rank-2: L(u1) and R(u1) independent (differ) ===")
Lu,Ru=L(e[1]),Rr(e[1])
print("  L(u1) == R(u1)?", Lu==Ru, "  differ at column e2 (j=2):", [int(Lu[i][2]) for i in range(8)],"vs",[int(Ru[i][2]) for i in range(8)])

print("\n=== (4) squares = -id (alternative) ===")
def isneg_id(A): return all(A[i][j]==(F(-1) if i==j else F(0)) for i in range(8) for j in range(8))
print("  L(u1)^2 = -id?", isneg_id(mm(Lu,Lu)), "  R(u1)^2 = -id?", isneg_id(mm(Ru,Ru)))

print("\n=== (5) support split: (L+R) on core span{1,u1}, (L-R) on charged sector ===")
def add(A,B): return [[A[i][j]+B[i][j] for j in range(8)] for i in range(8)]
V=add(Lu,Ru); A_=sub(Lu,Ru)
nzV=[(i,j) for i in range(8) for j in range(8) if V[i][j]!=0]
nzA=[(i,j) for i in range(8) for j in range(8) if A_[i][j]!=0]
print("  (L+R) nonzero coords:", nzV, "=> support in {0,1} (core)?", all(i in(0,1) and j in(0,1) for i,j in nzV))
print("  (L-R) nonzero coords all in charged {2..7}?", all(i>=2 and j>=2 for i,j in nzA))

print("\n=== (6) colour (D u1=0, Leibniz) centralizes BOTH L(u1) and R(u1) — analytic, one-line ===")
print("  [D,L_u1]=L_{Du1}=L_0=0 and [D,R_u1]=R_{Du1}=R_0=0 for any derivation D with D u1=0. (proof, not numeric)")

print("\n=== (7) trace-Gram (for the CHILDED downstream mixing node, NOT claimed here) ===")
def tr(A): return sum(A[i][i] for i in range(8))
print("  B(L,L)=",tr(mm(Lu,Lu))," B(R,R)=",tr(mm(Ru,Ru))," B(L,R)=",tr(mm(Lu,Ru))," (off-diag != 0)")
