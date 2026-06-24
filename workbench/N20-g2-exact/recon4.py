# Symbolic extraction: for an abstract a=(a0..a7), compute coords of a*ej + ej*a and
# the off-diagonal symmetric combos, to find EXACTLY which Leibniz instance + coordinate
# yields each of the 7 constraints C0..C6. Uses the exact structure constants C[i][j][k].
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
# C[l][j][k] = coeff of e_k in e_l * e_j

cn=["a","b","d"]; gidx={1:"a",2:"b",4:"d"}
def coeffs_product_left(l_is_a, j):
    # (X * ej).ck where X has symbolic coords; returns dict k-> list of (coord_l) coeffs
    # (X*ej).ck = sum_l X.cl * C[l][j][k]
    res={}
    for k in range(8):
        terms=[(l, C[l][j][k]) for l in range(8) if C[l][j][k]!=0]
        res[k]=terms
    return res
def coeffs_product_right(i, ):
    # (ei * Y).ck = sum_l Y.cl * C[i][l][k]
    res={}
    for k in range(8):
        terms=[(l, None) for l in range(8)]  # placeholder
    return res

def fmt_terms(terms, varname):
    parts=[]
    for l,c in terms:
        if c==0: continue
        s=("+" if c>0 else "-")+(f"{abs(c)}*" if abs(c)!=1 else "")+f"{varname}.c{l}"
        parts.append(s)
    return "".join(parts) or "0"

# Diagonal: a*ei + ei*a = 0 (from D(ei*ei)=D(-1)=0). coord k:
def diag_combo(i, var):
    # (X*ei + ei*X).ck = sum_l X.cl (C[l][i][k] + C[i][l][k])
    out={}
    for k in range(8):
        terms=[(l, C[l][i][k]+C[i][l][k]) for l in range(8)]
        terms=[(l,c) for l,c in terms if c!=0]
        out[k]=terms
    return out

print("=== DIAGONAL  X*ei + ei*X = 0  (from D(ei^2)=D(-1)=0) ===")
for i,var in [(1,"a"),(2,"b"),(4,"d")]:
    print(f"-- e{i} (var {var}=De{i}):")
    dd=diag_combo(i,var)
    for k in range(8):
        if dd[k]:
            print(f"   coord c{k}: {fmt_terms(dd[k],var)} = 0")

# Off-diagonal symmetric: (a*ej + ei*b) + (b*ei + ej*a) = 0 from hD ei ej + hD ej ei,
# using ei*ej = -ej*ei so D(ei*ej)+D(ej*ei)=0.
# (X*ej + ei*Y + Y*ei + ej*X).ck = sum_l X.cl(C[l][j][k]+C[j][l][k]) + sum_l Y.cl(C[i][l][k]+C[l][i][k])
def offdiag_combo(i,j,vi,vj):
    out={}
    for k in range(8):
        tX=[(l, C[l][j][k]+C[j][l][k]) for l in range(8)]
        tX=[(l,c) for l,c in tX if c!=0]
        tY=[(l, C[i][l][k]+C[l][i][k]) for l in range(8)]
        tY=[(l,c) for l,c in tY if c!=0]
        out[k]=(tX,tY)
    return out

print("\n=== OFF-DIAGONAL  De_i*e_j+e_i*De_j+De_j*e_i+e_j*De_i = 0 (hD ei ej + hD ej ei) ===")
for (i,j,vi,vj) in [(1,2,"a","b"),(1,4,"a","d"),(2,4,"b","d")]:
    print(f"-- (e{i},e{j}) (vars {vi}=De{i},{vj}=De{j}):")
    od=offdiag_combo(i,j,vi,vj)
    for k in range(8):
        tX,tY=od[k]
        if tX or tY:
            print(f"   coord c{k}: {fmt_terms(tX,vi)} {fmt_terms(tY,vj)} = 0")
