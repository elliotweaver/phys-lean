"""DECISIVE de-risk for the Lean-portable route.
Strategy: in H3(O), rewrite each below-diagonal star(atom) as  Tx - x  (Tx := x+star x
CENTRAL), and diagonals as central scalars. Then every jdef entry is a sum of
  (central-scalar monomial) * (nonassociative product of BARE atoms a,b,c,p,q,r).
CLAIM: factoring by the central coefficient, each bare-atom polynomial lies in the
Q-span of ALTERNATIVE-law instances (alt_left/right/flex, swap12/23, Moufang). If yes,
the Lean proof = (rewrite stars via centrality) ; (linear_combination of alt laws).
We test span membership per central-coefficient block.
"""
from fractions import Fraction as F
from collections import defaultdict
import time, sys

ATOMS={'a','b','c','p','q','r'}
def is_atom_leaf(m): return isinstance(m,str)
def cmul_keys(c1,c2): return tuple(sorted(c1+c2))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for k,v in x.items(): r[k]+=v
    return {k:v for k,v in r.items() if v!=0}
def neg(x): return {k:-v for k,v in x.items()}
def sub(x,y): return add(x,neg(y))
def scal(c,x): return {k:c*v for k,v in x.items()} if c else {}
def mul(x,y):
    r=defaultdict(F)
    for (c1,b1),v1 in x.items():
        for (c2,b2),v2 in y.items():
            if b1 is None and b2 is None:
                key=(cmul_keys(c1,c2), None)
            elif b1 is None:
                key=(cmul_keys(c1,c2), b2)
            elif b2 is None:
                key=(cmul_keys(c1,c2), b1)
            else:
                key=(cmul_keys(c1,c2), (b1,b2))
            r[key]+=v1*v2
    return {k:v for k,v in r.items() if v!=0}
def central(name): return {((name,),None):F(1)}
def atom(a): return {((),a):F(1)}
def star_atom(a, Tname):
    return sub(central(Tname), atom(a))

ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def Hm(diag, off, Toff):
    d0,d1,d2=diag; o01,o02,o12=off; T01,T02,T12=Toff
    return [[central(d0), atom(o01), atom(o02)],
            [star_atom(o01,T01), central(d1), atom(o12)],
            [star_atom(o02,T02), star_atom(o12,T12), central(d2)]]

A=Hm(('d0','d1','d2'), ('a','b','c'), ('Ta','Tb','Tc'))
B=Hm(('e0','e1','e2'), ('p','q','r'), ('Tp','Tq','Tr'))
D=jdef(A,B)

def degree(m):
    if m is None: return 0
    if is_atom_leaf(m): return 1
    return degree(m[0])+degree(m[1])
def subtrees(m,acc):
    if m is None: return
    if is_atom_leaf(m): acc.add(m); return
    acc.add(m); subtrees(m[0],acc); subtrees(m[1],acc)
def Eb(tree): return {((),tree):F(1)}
def L_left(x,y):  return sub(Eb((x,(x,y))), Eb(((x,x),y)))
def L_right(x,y): return sub(Eb(((x,y),y)), Eb((x,(y,y))))
def L_flex(x,y):  return sub(Eb((x,(y,x))), Eb(((x,y),x)))
def L_swap12(x,y,z): return sub(add(Eb(((x,y),z)),Eb(((y,x),z))), add(Eb((x,(y,z))),Eb((y,(x,z)))))
def L_swap23(x,y,z): return sub(add(Eb(((x,y),z)),Eb(((x,z),y))), add(Eb((x,(y,z))),Eb((x,(z,y)))))
def L_mL(x,y,z):  return sub(Eb((x,(y,(x,z)))), Eb((((x,y),x),z)))
def L_mR(x,y,z):  return sub(Eb((((z,x),y),x)), Eb((z,(x,(y,x)))))
def L_mM(x,y,z):  return sub(Eb(((x,y),(z,x))), Eb((x,((y,z),x))))

def alt_instances(baretrees_target, tgtdeg):
    acc=set()
    for m in baretrees_target: subtrees(m,acc)
    cand=sorted(acc,key=str)
    inst=[]
    def consider(name,args,vec):
        if vec and all(degree(k[1])==tgtdeg for k in vec): inst.append((name,args,vec))
    for x in cand:
        for y in cand:
            if 2*degree(x)+degree(y)==tgtdeg:
                consider("left",(x,y),L_left(x,y)); consider("flex",(x,y),L_flex(x,y))
            if degree(x)+2*degree(y)==tgtdeg:
                consider("right",(x,y),L_right(x,y))
    for x in cand:
        for y in cand:
            for z in cand:
                s=degree(x)+degree(y)+degree(z)
                if s==tgtdeg:
                    consider("swap12",(x,y,z),L_swap12(x,y,z))
                    consider("swap23",(x,y,z),L_swap23(x,y,z))
                if 2*degree(x)+degree(y)+degree(z)==tgtdeg:
                    consider("mL",(x,y,z),L_mL(x,y,z)); consider("mR",(x,y,z),L_mR(x,y,z)); consider("mM",(x,y,z),L_mM(x,y,z))
    seen={}; uniq=[]
    for nm,ar,v in inst:
        sig=tuple(sorted((str(k),val) for k,val in v.items()))
        if not sig or sig in seen: continue
        seen[sig]=True; uniq.append((nm,ar,v))
    return uniq

def lead(v,order): return min(v,key=lambda k:order[k])
def span_test(target_block):
    E_={k:v for k,v in target_block.items()}
    trees=[k[1] for k in E_]
    if not trees: return ("ZERO",0,0)
    tgtdeg=degree(trees[0])
    if any(degree(t)!=tgtdeg for t in trees):
        return ("MIXED-DEG", sorted(set(degree(t) for t in trees)))
    inst=alt_instances(trees,tgtdeg)
    monset=set(E_.keys())
    for _,_,v in inst: monset|=set(v.keys())
    order={m:k for k,m in enumerate(sorted(monset,key=str))}
    pivots={}
    def reduce_vec(v):
        v=dict(v)
        while v:
            lm=lead(v,order)
            if lm in pivots:
                pv=pivots[lm]; f=v[lm]/pv[lm]
                v=add(v,{m:-f*c for m,c in pv.items()})
            else: return v,lm
        return v,None
    for _,_,v in inst:
        rv,lm=reduce_vec(v)
        if rv: pivots[lm]=rv
    rb,_=reduce_vec(E_)
    return (("SOLVED" if not rb else "NO-SOLUTION"), len(inst), len(rb))

if __name__=="__main__":
    t0=time.time()
    for i in range(3):
        for j in range(3):
            E_=D[i][j]
            if not E_: print(f"entry({i},{j}): ZERO"); continue
            blocks=defaultdict(dict)
            for (c,bt),v in E_.items():
                blocks[c][((),bt)]=v
            results={}
            for c,blk in blocks.items():
                results[c]=span_test(blk)
            allsolved=all(r[0] in("SOLVED","ZERO") for r in results.values())
            nblk=len(blocks)
            bad=[(c,r) for c,r in results.items() if r[0] not in("SOLVED","ZERO")]
            print(f"entry({i},{j}): {len(E_)} terms, {nblk} central-blocks -> {'ALL SOLVED' if allsolved else 'FAIL'}")
            for c,r in bad[:8]:
                print(f"     block central={c}: {r}")
    print(f"done {time.time()-t0:.1f}s")
