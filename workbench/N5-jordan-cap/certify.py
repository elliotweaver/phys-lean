"""Certify each pc1 entry's assoc-combo from the BANKED alternating laws as a ℚ-linear
combination of LEVER INSTANCES that are PROVABLY ZERO and available in Lean:
  S12(x,y,z) = assoc(x,y,z)+assoc(y,x,z)      [Alternative.assoc_swap12 = 0]
  S23(x,y,z) = assoc(x,y,z)+assoc(x,z,y)      [Alternative.assoc_swap23 = 0]
  ASW(x,y,z) = assoc(x,y,z)+star(assoc(x,y,z))[PieceB.asw_star = 0]
The target is the entry itself (in monomial space). Solve target = Σ c·lever exactly.
This gives the EXACT linear_combination for the Lean proof. Pool restricted to entry atoms."""
from fractions import Fraction as F
from freesolve import (e_add, e_sub, atom, assoc, e_star, Proj, Xz, pc1, a,b,c,p,q,r)
import solve_assoc as sa

ALL = sa.ALL

def S12(x,y,z): return e_add(assoc(x,y,z), assoc(y,x,z))
def S23(x,y,z): return e_add(assoc(x,y,z), assoc(x,z,y))
def ASW(x,y,z):
    A=assoc(x,y,z); return e_add(A, e_star(A))

def gen_pool(atomnames):
    elems=[(n,ALL[n]) for n in atomnames]
    L=[]
    for (nx,x) in elems:
        for (ny,y) in elems:
            for (nz,z) in elems:
                for tag,fn in [('S12',S12),('S23',S23),('ASW',ASW)]:
                    e=fn(x,y,z)
                    if e: L.append((f"{tag}({nx},{ny},{nz})", e))
    return L

if __name__=="__main__":
    import sys
    for k in range(3):
        M=pc1(Proj(k),Xz(a,b,c),Xz(p,q,r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e=M[i][j]
                if not e: print(f"({i},{j}): 0"); continue
                ats=sa.entry_atoms(e)
                pool=gen_pool(ats)
                sol=sa.solve(e,pool)
                if sol is None:
                    print(f"({i},{j}): NO certificate (atoms {ats})")
                else:
                    used=[(pool[l][0],sol[l]) for l in range(len(pool)) if sol[l]!=0]
                    print(f"({i},{j}): {used}")
