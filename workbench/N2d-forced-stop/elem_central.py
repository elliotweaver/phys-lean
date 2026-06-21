"""
N2d-hard — faithful test: hypothesis = "a·star a is central for EVERY element a"
(the trunk's Born positivity, element-level) over an ASSOCIATIVE *-ring.
Polarization (a->a+b) => a·star b + b·star a is central too. Impose BOTH:
  - n_g := g·star g central  (diagonal)
  - p_{gh} := g·star h + h·star g central  (polarized, g<h)
plus star g = c_g - g with c_g central (trace), associativity (flat monomials).
Check the 12-term forward defect reduces to 0.
"""
from collections import defaultdict
def E(d): return {m:v for m,v in d.items() if v}
def iscent(f): return f[0] in ('c','n','p')
def canon(m):
    cs=sorted([f for f in m if iscent(f)]); gs=[f for f in m if not iscent(f)]
    return tuple(cs)+tuple(gs)
def mul0(x,y):
    r=defaultdict(int)
    for mx,cx in x.items():
        for my,cy in y.items(): r[canon(mx+my)]+=cx*cy
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
            sf={(f,):1} if iscent(f) else star_g(f[1])
            cur=mul0(sf,cur)
        res=add(res,cur)
    return res
def cd_mul(z,w):
    a,b=z;c_,d=w
    return (sub(mul0(a,c_),mul0(star(d),b)), add(mul0(d,a),mul0(b,star(c_))))
def Nrm(z):
    a,b=z; return add(mul0(a,star(a)), mul0(star(b),b))
def D(x,y): return sub(Nrm(cd_mul(x,y)), mul0(Nrm(x),Nrm(y)))

# Now build the centrality rewrite: a monomial containing a substring (g_i, star? ...) — too hard.
# Instead: directly substitute the central facts as REWRITES on the residual:
#   g_i · star(g_i) = n_i  (as element) where star g_i = c_i - g_i  => g_i*(c_i-g_i)=c_i g_i - g_i^2 = n_i
#   => g_i^2 = c_i g_i - n_i
#   g_i·star(g_j)+g_j·star(g_i) = p_ij  => (c_j g_i - g_i g_j)+(c_i g_j - g_j g_i) = p_ij
#   => g_i g_j + g_j g_i = c_j g_i + c_i g_j - p_ij     [the anticommutator is central-expressible]
# Apply these two rewrites repeatedly to fully reduce any monomial to a canonical normal form
# (ordered gens, no squares, no high-degree). If D -> 0, hypotheses suffice.
NCANON={}
def reduce_full(m):
    # m: tuple of factors. returns dict element. Repeatedly: kill squares, sort adjacent gens via anticommutator.
    changed=True
    elt={canon(m):1}
    for _ in range(200):
        new=defaultdict(int); changed=False
        for mm,co in elt.items():
            mm=canon(mm)
            done=False
            gs=[i for i,f in enumerate(mm) if f[0]=='g']
            # find adjacent gen pair (in the gen-suffix) to reduce
            # locate gen factors positions (they are at the tail after canon)
            tail=[f for f in mm if f[0]=='g']; head=[f for f in mm if f[0]!='g']
            for i in range(len(tail)-1):
                gi=tail[i][1]; gj=tail[i+1][1]
                if gi==gj:
                    # square -> c g - n
                    left=tail[:i]; right=tail[i+2:]
                    base_head=tuple(head)
                    e1=canon(base_head+(('c',gi),)+tuple(left)+(('g',gi),)+tuple(right))
                    e2=canon(base_head+(('n',gi),)+tuple(left)+tuple(right))
                    new[e1]+=co; new[e2]+=-co; done=True; changed=True; break
                elif gi>gj:
                    # swap using anticommutator: g_i g_j = -(g_j g_i) + c_j g_i + c_i g_j - p_ij
                    left=tail[:i]; right=tail[i+2:]; base_head=tuple(head)
                    pij=('p',min(gi,gj),max(gi,gj))
                    e_swap=canon(base_head+tuple(left)+(('g',gj),('g',gi))+tuple(right))
                    e_a=canon(base_head+(('c',gj),)+tuple(left)+(('g',gi),)+tuple(right))
                    e_b=canon(base_head+(('c',gi),)+tuple(left)+(('g',gj),)+tuple(right))
                    e_p=canon(base_head+(pij,)+tuple(left)+tuple(right))
                    new[e_swap]+=-co; new[e_a]+=co; new[e_b]+=co; new[e_p]+=-co
                    done=True; changed=True; break
            if not done:
                new[canon(mm)]+=co
        elt=E(dict(new))
        if not changed: break
    return elt
def reduce_elt(x):
    res={}
    for m,co in x.items():
        for mm,c2 in reduce_full(m).items():
            res=add(res,{mm:co*c2})
    return res

a,b,c_,d=g(0),g(1),g(2),g(3)
res=reduce_elt(D((a,b),(c_,d)))
print("Forward defect under ELEMENT-LEVEL Born centrality (diagonal n + polarized p + trace c):")
print("  residual terms:", len(res))
if not res:
    print("  ✅ == 0  -> {associative, a·star a central ∀a} SUFFICES for forward direction.")
else:
    for m,v in sorted(res.items(),key=lambda kv:str(kv[0]))[:30]:
        print(f"    {v:+d} {m}")
