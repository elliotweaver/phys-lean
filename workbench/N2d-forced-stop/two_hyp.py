"""
N2d-hard — verify the EXACT 2-hypothesis package for the forward direction.
Free associative *-ring. Impose BOTH:
  (TR) a + star a is central       [trace-central]
  (NM) a * star a is central       [norm-central]
Model: introduce, for each generator g, central symbols c_g (=g+star g) and n_g (=g·star g).
Relations: star g = c_g - g ;  g·g = c_g·g - n_g  (since g·star g = g·c_g - g² = c_g g - g² = n_g
           => g² = c_g g - n_g).  Both c_g,n_g central.
Reduce the 12-term defect D and check ==0.
"""
from collections import defaultdict
def E(d): return {m:v for m,v in d.items() if v}
def cscore(f): return f[0] in ('c','n')
def canon(m):
    cs=sorted([f for f in m if cscore(f)]); gs=[f for f in m if not cscore(f)]
    return tuple(cs)+tuple(gs)
def reduce_sq(m):
    # replace first adjacent ('g',k)('g',k) with c_k*g_k - n_k ; return list of (mono,coeff)
    for i in range(len(m)-1):
        if m[i][0]=='g' and m[i+1][0]=='g' and m[i][1]==m[i+1][1]:
            k=m[i][1]; left=m[:i]; right=m[i+2:]
            out=[]
            for mm,cc in reduce_sq(canon(left+(('c',k),('g',k))+right)): out.append((mm,cc))
            for mm,cc in reduce_sq(canon(left+(('n',k),)+right)): out.append((mm,-cc))
            return out
    return [(canon(m),1)]
def mul(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items():
            for mm,cc in reduce_sq(canon(mx+my)): r[mm]+=cx*cy*cc
    return E(dict(r))
def add(x,y):
    r=defaultdict(int,x)
    for m,v in y.items(): r[m]+=v
    return E(dict(r))
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def g(k): return {(('g',k),):1}
def cc(k): return {(('c',k),):1}
def star_g(k): return sub(cc(k), g(k))
def star(x):
    res={}
    for m,co in x.items():
        cur={():co}
        for f in m:
            sf = {(f,):1} if f[0] in('c','n') else star_g(f[1])
            cur=mul(sf,cur)
        res=add(res,cur)
    return res
def cd_mul(z,w):
    a,b=z;c_,d=w
    return (sub(mul(a,c_),mul(star(d),b)), add(mul(d,a),mul(b,star(c_))))
def Nrm(z):
    a,b=z; return add(mul(a,star(a)), mul(star(b),b))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul(Nrm(x),Nrm(y)))
a,b,c_,d=g(0),g(1),g(2),g(3)
res=D((a,b),(c_,d))
print("Forward defect, base = assoc *-ring with TRACE-central + NORM-central:")
print("  residual terms:", len(res))
if not res:
    print("  ✅ == 0  -> {associative, trace-central, norm-central} SUFFICES (symmetry follows from trace).")
else:
    for m,v in sorted(res.items(),key=lambda kv:str(kv[0]))[:40]:
        print(f"    {v:+d} {m}")
