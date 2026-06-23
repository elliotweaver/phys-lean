"""Per-entry lever solve with a SMALL, entry-relevant lever pool. For each entry, collect
the atoms appearing in its monomials, build asw_star/ka instances only over those atoms,
and solve. Much smaller pools => fast."""
from fractions import Fraction as F
from freesolve import (e_add, e_sub, atom, asw_star, ka, e_star, Proj, Xz, pc1,
                       a,b,c,p,q,r)

ATOMS = {'a':a,'b':b,'c':c,'p':p,'q':q,'r':r}
def starname(n): return n[1:] if n.startswith('s') else 's'+n
ALL = dict(ATOMS)
for n,v in list(ATOMS.items()):
    ALL['s'+n] = e_star(v)

def leaves(m, acc):
    if isinstance(m, str): acc.add(m)
    elif m == (): pass
    else:
        leaves(m[0], acc); leaves(m[1], acc)

def entry_atoms(e):
    acc = set()
    for m in e: leaves(m, acc)
    # map 'sa'->base 'a' etc; return base names present
    bases = set()
    for x in acc:
        bases.add(x[1:] if x.startswith('s') else x)
    return bases

def gen_levers(bases):
    # atoms = base + star for each base present
    names = []
    for bn in sorted(bases):
        names.append((bn, ALL[bn])); names.append(('s'+bn, ALL['s'+bn]))
    levers = []
    for (nx,x) in names:
        for (ny,y) in names:
            for (nz,z) in names:
                L = asw_star(x,y,z)
                if L: levers.append((f"asw({nx},{ny},{nz})", L))
    for (nx,x) in names:
        for (ny,y) in names:
            for (nw,w) in names:
                L = ka(x,y,w)
                if L: levers.append((f"ka({nx},{ny},{nw})", L))
    return levers

def solve_entry(target, levers):
    monos = set(target.keys())
    for _, L in levers: monos |= set(L.keys())
    monos = sorted(monos, key=lambda m: str(m))
    idx = {m:i for i,m in enumerate(monos)}
    n = len(monos); ncol = len(levers)
    rows = [[F(0)]*ncol + [F(0)] for _ in range(n)]
    for j,(_,L) in enumerate(levers):
        for m,cf in L.items(): rows[idx[m]][j] = cf
    for m,cf in target.items(): rows[idx[m]][ncol] = cf
    pivots=[]; r=0
    for col in range(ncol):
        piv=None
        for rr in range(r,n):
            if rows[rr][col]!=0: piv=rr;break
        if piv is None: continue
        rows[r],rows[piv]=rows[piv],rows[r]
        pv=rows[r][col]; rows[r]=[x/pv for x in rows[r]]
        for rr in range(n):
            if rr!=r and rows[rr][col]!=0:
                f=rows[rr][col]; rows[rr]=[u-f*v for u,v in zip(rows[rr],rows[r])]
        pivots.append((r,col)); r+=1
        if r==n: break
    for rr in range(n):
        if all(rows[rr][col]==0 for col in range(ncol)) and rows[rr][ncol]!=0:
            return None
    x=[F(0)]*ncol
    for (rr,col) in pivots: x[col]=rows[rr][ncol]
    return x

if __name__ == "__main__":
    for k in range(3):
        M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e = M[i][j]
                if not e: print(f"  ({i},{j}): 0"); continue
                bases = entry_atoms(e)
                levers = gen_levers(bases)
                sol = solve_entry(e, levers)
                if sol is None:
                    print(f"  ({i},{j}): NO SOLUTION ({len(e)} mon, {len(levers)} levers, atoms {sorted(bases)})")
                else:
                    used = [(levers[l][0], sol[l]) for l in range(len(levers)) if sol[l]!=0]
                    print(f"  ({i},{j}): {used}")
