"""Fast per-entry solver using ASSOC instances only (assoc(x,y,z) = (xy)z - x(yz)),
x,y,z over the atoms appearing in the entry (incl stars). Plus we know assoc is
ALTERNATING, so the entry should be a ℚ-combo of assoc instances that itself vanishes
by the alternating laws. We solve entry = Σ c·assoc(...) and report; then separately
note which alternating identity kills the resulting assoc-combo.

Pool: assoc(x,y,z) for x,y,z in the entry's atom set. Small (<=6 atoms -> <=216, but
entries use 3-4 distinct atoms -> manageable)."""
from fractions import Fraction as F
from freesolve import (e_add, e_sub, atom, assoc, e_star, Proj, Xz, pc1, a,b,c,p,q,r)

ATOMS = {'a':a,'b':b,'c':c,'p':p,'q':q,'r':r}
ALL = dict(ATOMS)
for n,v in list(ATOMS.items()): ALL['s'+n] = e_star(v)

def leaves(m, acc):
    if isinstance(m, str): acc.add(m)
    elif m != (): leaves(m[0],acc); leaves(m[1],acc)

def entry_atoms(e):
    acc=set()
    for m in e: leaves(m,acc)
    return sorted(acc)  # includes star-atoms as 'sX'

def gen_assoc(atomnames):
    elems = [(n, ALL[n]) for n in atomnames]
    L=[]
    for (nx,x) in elems:
        for (ny,y) in elems:
            for (nz,z) in elems:
                e=assoc(x,y,z)
                if e: L.append((f"assoc({nx},{ny},{nz})", e))
    return L

def solve(target, levers):
    monos=set(target)
    for _,L in levers: monos|=set(L)
    monos=sorted(monos,key=str); idx={m:i for i,m in enumerate(monos)}
    n=len(monos); ncol=len(levers)
    rows=[[F(0)]*(ncol+1) for _ in range(n)]
    for j,(_,L) in enumerate(levers):
        for m,cf in L.items(): rows[idx[m]][j]=cf
    for m,cf in target.items(): rows[idx[m]][ncol]=cf
    piv=[]; r=0
    for col in range(ncol):
        pr=None
        for rr in range(r,n):
            if rows[rr][col]!=0: pr=rr;break
        if pr is None: continue
        rows[r],rows[pr]=rows[pr],rows[r]
        pv=rows[r][col]; rows[r]=[x/pv for x in rows[r]]
        for rr in range(n):
            if rr!=r and rows[rr][col]!=0:
                f=rows[rr][col]; rows[rr]=[u-f*v for u,v in zip(rows[rr],rows[r])]
        piv.append((r,col)); r+=1
        if r==n: break
    for rr in range(n):
        if all(rows[rr][col]==0 for col in range(ncol)) and rows[rr][ncol]!=0: return None
    x=[F(0)]*ncol
    for (rr,col) in piv: x[col]=rows[rr][ncol]
    return x

if __name__=="__main__":
    for k in range(3):
        M=pc1(Proj(k),Xz(a,b,c),Xz(p,q,r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e=M[i][j]
                if not e: print(f"({i},{j}): 0"); continue
                ats=entry_atoms(e)
                lev=gen_assoc(ats)
                sol=solve(e,lev)
                if sol is None: print(f"({i},{j}): NO assoc-combo (atoms {ats}, {len(e)} mon)")
                else:
                    used=[(lev[l][0],sol[l]) for l in range(len(lev)) if sol[l]!=0]
                    print(f"({i},{j}): {used}")
