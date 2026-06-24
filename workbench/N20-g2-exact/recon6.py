# Find Leibniz instances D(ei*ej)=Dei*ej+ei*Dej whose coordinate ck, with the LHS
# D(value) replaced by its trace-free fact ONLY when k=0 (c0=0), gives a relation
# purely in De1,De2,De4 coords — i.e. RHS uses only generators i,j in {1,2,4}.
# For C5 we need an instance with i,j in {1,2,4} (so De_i,De_j are generator-derivs)
# whose coordinate matches C5.  Pairs from {1,2,4}: (1,2),(1,4),(2,4) and diagonal.
# These give C0..C4,C6. C5 needs a DIFFERENT source: the THREE-fold associativity.
# Actually: search pairs (i,j) with i,j in {1,2,4}, ALL coordinates, value-trace-free
# substitution, and report the pure-generator relations.
from fractions import Fraction as F
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

# vars: De_i for i in 0..7, each 8 coords -> 64 vars idx i*8+c. We'll only have De1,De2,De4
# nonzero conceptually but compute symbolically over all then report which appear.
NV=64
def idx(i,c): return i*8+c
names=[f"De{i}.c{c}" for i in range(8) for c in range(8)]
def lin(): return [F(0)]*NV
def mul_left(i,j):  # (De_i * e_j).ck as forms over De_i coords
    out=[lin() for _ in range(8)]
    for k in range(8):
        for l in range(8):
            c=C[l][j][k]
            if c: out[k][idx(i,l)]+=c
    return out
def mul_right(i,j):  # (e_i * De_j).ck
    out=[lin() for _ in range(8)]
    for k in range(8):
        for l in range(8):
            c=C[i][l][k]
            if c: out[k][idx(j,l)]+=c
    return out
def Dvalue(i,j):  # D(ei*ej as basis) coords as forms over De_m
    out=[lin() for _ in range(8)]
    for m in range(8):
        s=C[i][j][m]
        if s:
            for c in range(8):
                out[c][idx(m,c)]+=s
    return out
def fmt(f):
    parts=[]
    for v in range(NV):
        if f[v]:
            c=f[v]
            parts.append(("+" if c>0 else "-")+(f"{abs(c)}*" if abs(c)!=1 else "")+names[v])
    return "".join(parts) or "0"

# We want C5 = De1.c6 - De2.c5 + De4.c3.  Try instance (i,j) and coordinate k where
# the relation  (Dei*ej + ei*Dej).ck = D(ei*ej).ck   (i.e. residual=0) becomes, AFTER
# using trace-free De_m.c0=0 for the value's m, a relation only in De1,De2,De4 coords.
# Diagonal (i,i) for i in {1,2,4}: value = -1, D(-1)=0.
print("=== generator pairs, coordinate forms of (Dei*ej + ei*Dej) ===")
for (i,j) in [(1,2),(1,4),(2,4),(2,1),(4,1),(4,2),(3,4),(1,1),(2,2),(4,4)]:
    L=mul_left(i,j); R=mul_right(i,j)
    val=C[i][j]  # ei*ej = sum
    m=[k for k in range(8) if val[k]!=0][0]; sgn=val[m]
    print(f"\n(e{i},e{j}): e{i}*e{j} = {sgn}*e{m}; D(e{i}*e{j})={sgn}*De{m}")
    for k in range(8):
        f=[L[k][v]+R[k][v] for v in range(NV)]
        # subtract D(value).ck = sgn*De_m.ck
        f[idx(m,k)]-=sgn
        if any(x for x in f):
            # report only those whose nonzero vars are within De1,De2,De4 union De_m
            print(f"   coord c{k}: {fmt(f)} = 0")
