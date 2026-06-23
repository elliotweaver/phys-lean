"""For each pc1 entry's assoc-combo, VERIFY it vanishes in the faithful octonion model,
and find which alternating identity certifies it:
  swap12: assoc(x,y,z) + assoc(y,x,z) = 0
  swap23: assoc(x,y,z) + assoc(x,z,y) = 0
  alt_left: assoc(x,x,y)=0 ; alt_right: assoc(x,y,y)=0 ; alt_flex: assoc(x,y,x)=0
We test if the assoc-combo is a ℚ-combination of swap/alt instances => certifies =0
purely from the banked alternating laws (no asw_star needed for off-diag), OR needs asw_star.
Faithful-model check first."""
import random
from fractions import Fraction as F
from cd import mul, add, sub, star, from_coords, is_zero, Ozero

def rand(): return from_coords([F(random.randint(-4,4)) for _ in range(8)])
def A(x,y,z): return sub(mul(mul(x,y),z), mul(x,mul(y,z)))  # assoc

# entries as lists of (coeff, (slot0,slot1,slot2)) with slots in {'a','b','c','p','q','r','sa',...}
from freesolve import Proj, Xz, pc1, atom, e_star
import freesolve as fs

ENTRIES = {}  # filled from solve_assoc output, but recompute here directly
# Build numeric atom map per trial.
def make_atoms():
    vals = {n: rand() for n in ['a','b','c','p','q','r']}
    for n in list(vals): vals['s'+n] = star(vals[n])
    return vals

# parse the solve_assoc results programmatically by re-deriving with freesolve, then
# matching: but simpler -- just verify the FULL entry = 0 (already known) AND that the
# assoc-combo equals the entry. We trust solve_assoc. Here we test each assoc-combo's
# vanishing + classify.
import importlib
sa = importlib.import_module('solve_assoc')

def combo_value(used, vals):
    """used = list of (name 'assoc(x,y,z)', coeff). Evaluate Σ coeff·A(vals[x],vals[y],vals[z])."""
    tot = Ozero()
    for name, cf in used:
        inside = name[len('assoc('):-1]
        x,y,z = inside.split(',')
        term = A(vals[x], vals[y], vals[z])
        # scale by cf (rational): repeat add / use from_coords scaling
        # multiply octonion by rational cf:
        from cd import flatten
        fl = flatten(term)
        scaled = from_coords([cf*v for v in fl])
        tot = add(tot, scaled)
    return tot

if __name__ == "__main__":
    random.seed(5)
    for k in range(3):
        M = pc1(Proj(k), Xz(sa.a,sa.b,sa.c), Xz(sa.p,sa.q,sa.r))
        print(f"=== Proj{k} ===")
        for i in range(3):
            for j in range(3):
                e = M[i][j]
                if not e: continue
                ats = sa.entry_atoms(e); lev = sa.gen_assoc(ats); sol = sa.solve(e,lev)
                used = [(lev[l][0], sol[l]) for l in range(len(lev)) if sol[l]!=0]
                ok = True
                for _ in range(30):
                    vals = make_atoms()
                    if not is_zero(combo_value(used, vals)): ok=False; break
                print(f"({i},{j}): assoc-combo vanishes={ok}  [{len(used)} terms]")
