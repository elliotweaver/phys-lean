from fractions import Fraction as Fr
import itertools
def z0(k): return Fr(0) if k==0 else (z0(k-1),z0(k-1))
def radd(x,y,k): return x+y if k==0 else (radd(x[0],y[0],k-1),radd(x[1],y[1],k-1))
def rneg(x,k): return -x if k==0 else (rneg(x[0],k-1),rneg(x[1],k-1))
def rsub(x,y,k): return radd(x,rneg(y,k),k)
def rstar(x,k): return x if k==0 else (rstar(x[0],k-1),rneg(x[1],k-1))
def rmul(x,y,k):
    if k==0: return x*y
    a,b=x;c,d=y
    return (rsub(rmul(a,c,k-1),rmul(rstar(d,k-1),b,k-1),k-1),
            radd(rmul(d,a,k-1),rmul(b,rstar(c,k-1),k-1),k-1))
def is0(x,k): return x==0 if k==0 else (is0(x[0],k-1) and is0(x[1],k-1))
def basis(k,i):
    if k==0: return Fr(1)
    h=2**(k-1)
    return (basis(k-1,i),z0(k-1)) if i<h else (z0(k-1),basis(k-1,i-h))
L=3
def Nrm(z):
    a,b=z; return radd(rmul(a,rstar(a,L),L), rmul(rstar(b,L),b,L), L)
def cd_mul(z,w):
    a,b=z;c,d=w
    return (rsub(rmul(a,c,L),rmul(rstar(d,L),b,L),L),radd(rmul(d,a,L),rmul(b,rstar(c,L),L),L))
def D(x,y): return rsub(Nrm(cd_mul(x,y)), rmul(Nrm(x),Nrm(y),L), L)
def assoc(a,b,c): return rsub(rmul(rmul(a,b,L),c,L), rmul(a,rmul(b,c,L),L), L)
imag=list(range(1,8))
nonassoc=[(i,j,k) for i in imag for j in imag for k in imag if not is0(assoc(basis(L,i),basis(L,j),basis(L,k)),L)]
print("non-assoc triples:",len(nonassoc))
# richer vocab: include products uv, vw, uw, vu, wv, wu
def comps(i,j,kk):
    u,v,w=basis(L,i),basis(L,j),basis(L,kk)
    U,V,W=rstar(u,L),rstar(v,L),rstar(w,L)
    return {'0':z0(L),'u':u,'v':v,'w':w,'U':U,'V':V,'W':W,
            'uv':rmul(u,v,L),'vw':rmul(v,w,L),'uw':rmul(u,w,L),
            'vu':rmul(v,u,L),'wv':rmul(w,v,L),'wu':rmul(w,u,L)}
keys=['0','u','v','w','U','V','W','uv','vw','uw','vu','wv','wu']
# count, for each non-assoc triple, how many triples are covered by SOME form
# but the goal: a SINGLE form biting ALL triples. iterate forms, short-circuit.
found=[]
for fa in itertools.product(keys,repeat=4):
    nz=sum(1 for t in fa if t!='0')
    if nz<2 or nz>3: continue
    allbite=True
    for (i,j,kk) in nonassoc:
        cm=comps(i,j,kk); x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        if is0(D(x,y),L): allbite=False; break
    if allbite: found.append((nz,fa))
found.sort()
print(f"uniform forms (richer vocab) biting ALL {len(nonassoc)} non-assoc triples: {len(found)}")
for nz,fa in found[:20]:
    print(f"   nz={nz} x=({fa[0]},{fa[1]}) y=({fa[2]},{fa[3]})")
# also: does EVERY triple get bitten by AT LEAST ONE form? (existence, non-uniform)
covered=set()
forms=[fa for fa in itertools.product(keys,repeat=4) if 2<=sum(1 for t in fa if t!='0')<=3]
for ti,(i,j,kk) in enumerate(nonassoc):
    cm=comps(i,j,kk)
    for fa in forms:
        x=(cm[fa[0]],cm[fa[1]]); y=(cm[fa[2]],cm[fa[3]])
        if not is0(D(x,y),L): covered.add(ti); break
print(f"triples bitten by SOME form: {len(covered)}/{len(nonassoc)}")
