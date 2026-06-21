"""
N2d-hard-backward — THE DECISIVE LINEAR-SPAN TEST for the clean abstract target:

  Target: B [Ring][StarRing], p*q != q*p  ==>  Nrm NOT mult on CD(CD B).
  Question: is the commutator [p,q] = pq - qp in the Q-LINEAR SPAN of the norm
  defects D(x,y) = Nrm(x*y) - Nrm(x)Nrm(y), x,y in CD(CD B), components drawn from
  {0,1,p,q,star p,star q}?

  If YES: Nrm mult (all D=0) forces [p,q]=0 forces B commutative -> the clean
          abstract backward is PROVABLE (extract the finite combination).
  If NO : the abstract backward over a bare Ring is FALSE/unprovable-by-linear-means;
          the honest target must carry the Born central-self-overlap structure
          (alternativity route) -> possibly a further dissolution ticket.

B = free associative *-ring on p,q (star p = P, star q = Q independent). Defect lives
in A = CD B = pair of B; flatten to B-monomials over both slots.
"""
from collections import defaultdict
from fractions import Fraction as Fr
import itertools

STAR={'p':'P','q':'Q','P':'p','Q':'q'}
def E(d): return {m:v for m,v in d.items() if v}
def nadd(*xs):
    r=defaultdict(Fr)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return E(dict(r))
def nneg(x): return {m:-v for m,v in x.items()}
def nsub(x,y): return nadd(x,nneg(y))
def nmul(x,y):
    r=defaultdict(Fr)
    for mx,cx in x.items():
        for my,cy in y.items(): r[mx+my]+=cx*cy
    return E(dict(r))
def nstar(x):
    r=defaultdict(Fr)
    for m,c in x.items(): r[tuple(STAR[s] for s in reversed(m))]+=c
    return E(dict(r))
def ng(s): return {(s,):Fr(1)}
NZ={}; nOne={():Fr(1)}
p,q=ng('p'),ng('q')
comm=nsub(nmul(p,q),nmul(q,p))

def A_mul(z,w):
    a,b=z;c,d=w
    return (nsub(nmul(a,c),nmul(nstar(d),b)), nadd(nmul(d,a),nmul(b,nstar(c))))
def A_star(z): return (nstar(z[0]),nneg(z[1]))
def A_sub(z,w): return (nsub(z[0],w[0]),nsub(z[1],w[1]))
def A_add(z,w): return (nadd(z[0],w[0]),nadd(z[1],w[1]))
def C_mul(u,v):
    a,b=u;c,d=v
    re=A_sub(A_mul(a,c),A_mul(A_star(d),b))
    im=A_add(A_mul(d,a),A_mul(b,A_star(c)))
    return (re,im)
def C_star(u): return (A_star(u[0]),(nneg(u[1][0]),nneg(u[1][1])))
def Nrm(u): return C_mul(u,C_star(u))[0]
def defect(x,y): return A_sub(Nrm(C_mul(x,y)), A_mul(Nrm(x),Nrm(y)))
def A0(z): return (not E(z[0])) and (not E(z[1]))

Bvoc={'0':NZ,'1':nOne,'p':p,'q':q,'P':nstar(p),'Q':nstar(q)}
bk=list(Bvoc.keys())
def mk(b0,b1,b2,b3): return ((Bvoc[b0],Bvoc[b1]),(Bvoc[b2],Bvoc[b3]))

# build all witnesses with <=2 nonzero slots (keep dimension manageable)
def witnesses():
    out=[]
    labs=[]
    # 1 nonzero slot
    for pos in range(4):
        for v in bk:
            if v=='0': continue
            comps=['0','0','0','0']; comps[pos]=v
            out.append(mk(*comps)); labs.append(tuple(comps))
    # 2 nonzero slots
    for pos in itertools.combinations(range(4),2):
        for v1 in bk:
            if v1=='0': continue
            for v2 in bk:
                if v2=='0': continue
                comps=['0','0','0','0']; comps[pos[0]]=v1; comps[pos[1]]=v2
                out.append(mk(*comps)); labs.append(tuple(comps))
    return out,labs
ws,labs=witnesses()
print(f"witness elements: {len(ws)}")

# collect defects
defs=[]
for x in ws:
    for y in ws:
        if A0(x[0]) and A0(x[1]): continue
        if A0(y[0]) and A0(y[1]): continue
        d=defect(x,y)
        if A0(d): continue
        defs.append(d)
print(f"nonzero defects: {len(defs)}")

# flatten A=CD B element (re,im in B) to vector over (slot,monomial)
allmon=set()
def flat(d):
    out={}
    for slot,poly in (('r',d[0]),('i',d[1])):
        for m,c in poly.items(): out[(slot,m)]=c
    return out
for d in defs: allmon|=set(flat(d).keys())
tflat=flat((comm,NZ))   # target [p,q] in re-slot
allmon|=set(tflat.keys())
allmon=sorted(allmon,key=str)
idx={m:i for i,m in enumerate(allmon)}
ncol=len(allmon)

def vec(fd):
    v=[Fr(0)]*ncol
    for m,c in fd.items(): v[idx[m]]=c
    return v
rows=[vec(flat(d)) for d in defs]
tvec=vec(tflat)

# is tvec in Q-span of rows? Gaussian elimination on transpose system.
# Solve sum lam_i rows[i] = tvec. Build matrix M[coord][i]=rows[i][coord]; augment tvec.
ndef=len(rows)
M=[[rows[i][j] for i in range(ndef)]+[tvec[j]] for j in range(ncol)]
nr=len(M); nc=ndef
pr=0
for col in range(nc):
    piv=None
    for r in range(pr,nr):
        if M[r][col]!=0: piv=r;break
    if piv is None: continue
    M[pr],M[piv]=M[piv],M[pr]
    pv=M[pr][col]; M[pr]=[x/pv for x in M[pr]]
    for r in range(nr):
        if r!=pr and M[r][col]!=0:
            f=M[r][col]; M[r]=[M[r][k]-f*M[pr][k] for k in range(nc+1)]
    pr+=1
    if pr==nr: break
incons=any(all(M[r][k]==0 for k in range(nc)) and M[r][nc]!=0 for r in range(nr))
print()
if incons:
    print("[NO]  [p,q] is NOT in the Q-span of norm defects over a bare associative *-ring.")
    print("      => the abstract Ring backward is not provable by linear extraction;")
    print("         the honest target needs the Born central-self-overlap structure.")
else:
    print("[YES] [p,q] IS in the Q-span of norm defects over a bare associative *-ring.")
    print("      => clean abstract backward is provable: Nrm mult forces [p,q]=0.")
