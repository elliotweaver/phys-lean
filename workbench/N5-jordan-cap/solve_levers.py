"""Solve each pc1(Proj_k)(Xz)(Xz) entry as a ℚ-linear combination of lever instances
asw_star(x,y,z) and ka(x,y,w), x,y,z,w ranging over the 6 atoms {a,b,c,p,q,r} and
their stars. Linear algebra over formal monomials (Gaussian elimination over ℚ)."""
from fractions import Fraction as F
from freesolve import (e_add, e_sub, e_smul, atom, asw_star, ka, assoc, e_star, e_mul,
                       Proj, Xz, pc1, a,b,c,p,q,r)
from itertools import product as iproduct

ATOMS = {'a':a,'b':b,'c':c,'p':p,'q':q,'r':r}
SATOMS = {('s'+n): e_star(v) for n,v in ATOMS.items()}
ALL = dict(ATOMS); ALL.update(SATOMS)

def gen_levers():
    """Generate a pool of lever instances; return list of (name, element-dict)."""
    levers = []
    names = list(ATOMS.keys())  # use base atoms; star handled inside levers
    elems = list(ATOMS.values())
    # asw_star(x,y,z): pick x,y,z from atoms AND star-atoms (the FINDINGS diag form uses
    # things like asw(b, star c, star p)). Use full ALL set but cap pool size.
    pool_atoms = list(ALL.items())
    for (nx,x) in pool_atoms:
        for (ny,y) in pool_atoms:
            for (nz,z) in pool_atoms:
                L = asw_star(x,y,z)
                if L: levers.append((f"asw({nx},{ny},{nz})", L))
    for (nx,x) in pool_atoms:
        for (ny,y) in pool_atoms:
            for (nw,w) in pool_atoms:
                L = ka(x,y,w)
                if L: levers.append((f"ka({nx},{ny},{nw})", L))
    return levers

def solve_entry(target, levers):
    """Find ℚ coeffs c_l with Σ c_l lever_l = target. Gaussian elimination over monomials."""
    # collect all monomials
    monos = set(target.keys())
    for _, L in levers: monos |= set(L.keys())
    monos = sorted(monos, key=lambda m: str(m))
    idx = {m:i for i,m in enumerate(monos)}
    n = len(monos)
    # Build augmented: columns = levers, rhs = target. Solve A x = t.
    import numpy as np  # use exact via fractions manually instead
    # Manual rational least-structure: set up matrix rows=monos, cols=levers
    A = [[F(0)]*len(levers) for _ in range(n)]
    for j,(_,L) in enumerate(levers):
        for m,cf in L.items():
            A[idx[m]][j] = cf
    t = [F(0)]*n
    for m,cf in target.items(): t[idx[m]] = cf
    # Solve via column-reduction (find any solution). Augment [A | t], row reduce.
    # We solve A x = t with x over levers. Do Gaussian elimination on rows.
    rows = [row[:] + [t[i]] for i,row in enumerate(A)]
    ncol = len(levers)
    pivots = []
    r = 0
    for col in range(ncol):
        piv = None
        for rr in range(r, n):
            if rows[rr][col] != 0: piv = rr; break
        if piv is None: continue
        rows[r], rows[piv] = rows[piv], rows[r]
        pv = rows[r][col]
        rows[r] = [x/pv for x in rows[r]]
        for rr in range(n):
            if rr != r and rows[rr][col] != 0:
                f = rows[rr][col]
                rows[rr] = [a-f*b for a,b in zip(rows[rr], rows[r])]
        pivots.append((r,col)); r += 1
        if r == n: break
    # check consistency: any row all-zero in A-part but nonzero rhs -> no solution
    for rr in range(n):
        if all(rows[rr][col]==0 for col in range(ncol)) and rows[rr][ncol]!=0:
            return None
    # back out solution: free vars = 0
    x = [F(0)]*ncol
    for (rr,col) in pivots:
        x[col] = rows[rr][ncol]
    return x

if __name__ == "__main__":
    levers = gen_levers()
    print(f"lever pool size: {len(levers)}")
    for k in range(3):
        M = pc1(Proj(k), Xz(a,b,c), Xz(p,q,r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e = M[i][j]
                if not e:
                    print(f"  ({i},{j}): 0 (empty)"); continue
                sol = solve_entry(e, levers)
                if sol is None:
                    print(f"  ({i},{j}): NO SOLUTION in lever pool ({len(e)} monomials)")
                else:
                    used = [(levers[l][0], sol[l]) for l in range(len(levers)) if sol[l]!=0]
                    print(f"  ({i},{j}): {len(used)} levers: {used}")
