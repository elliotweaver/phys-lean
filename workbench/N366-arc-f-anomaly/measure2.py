from itertools import combinations
from fractions import Fraction as F

n = 3
subsets = [frozenset(c) for r in range(n + 1) for c in combinations(range(n), r)]
comp = lambda S: frozenset(range(n)) - S

# --- The full ONE-GENERATION content as the ladder + its Hodge dual (both chiralities). ---
# Furey/Cl(6): one ideal = 8 states of one chirality; the generation is ladder (+) conjugate ladder.
# Electric charge Q=|S|/3 (banked N317).  The SM hypercharge on this ladder (Furey 2018):
#   For the ladder states with |S| colour indices, the U(1)_Y generator is built from the
#   number operator.  Known SM per-generation hypercharges Y (in Q=T3+Y convention, doublets):
#   Q_L(up)=1/6-comp ... let me just test which linear functionals of |S| are Hodge-odd.

print("=== Which functionals f(S) are ODD under Hodge complement S->S^c ? ===")
def is_odd(f):
    return all(f(comp(S)) == -f(S) for S in subsets)
Q = lambda S: F(len(S), n)
for name, f in [
    ("Q=|S|/3",            Q),
    ("Qc=Q-1/2",           lambda S: Q(S) - F(1,2)),
    ("|S|-3/2 (centered)", lambda S: F(len(S)) - F(3,2)),
    ("|S| (raw)",          lambda S: F(len(S))),
]:
    print(f"  {name:22s} odd under complement: {is_odd(f)}   sum={sum(f(S) for S in subsets)}  sum^3={sum(f(S)**3 for S in subsets)}")

print("\n=== GENUINE SM anomaly check with the standard per-generation hypercharge table ===")
# Standard SM one generation, left-handed Weyl (with nu_R), (multiplicity, Y):
#  Q_L: 3 colours x 2 isospin, Y=+1/6 ; u_R^c: 3, Y=-2/3 ; d_R^c: 3, Y=+1/3
#  L:   2 isospin, Y=-1/2 ; e_R^c: 1, Y=+1 ; nu_R^c: 1, Y=0
fields_with_nuR = [
    ("Q_L",   6, F(1,6)),
    ("u_R^c", 3, F(-2,3)),
    ("d_R^c", 3, F(1,3)),
    ("L",     2, F(-1,2)),
    ("e_R^c", 1, F(1)),
    ("nu_R^c",1, F(0)),
]
def anomalies(fields):
    grav = sum(m*Y for _,m,Y in fields)      # grav^2.U(1)_Y  ~ sum Y
    cubic= sum(m*Y**3 for _,m,Y in fields)    # U(1)_Y^3       ~ sum Y^3
    return grav, cubic
g,c = anomalies(fields_with_nuR)
print(f"  WITH nu_R:    sum Y = {g}   sum Y^3 = {c}")
g2,c2 = anomalies([f for f in fields_with_nuR if f[0]!="nu_R^c"])
print(f"  WITHOUT nu_R: sum Y = {g2}   sum Y^3 = {c2}  (nu_R has Y=0 so U(1) unaffected)")

print("\n=== B-L is the U(1) where nu_R MATTERS (seed teeth: fails at -1) ===")
# B-L per field: quarks B=1/3 (B-L=1/3 each, but antiquarks -1/3); leptons L=1 (B-L=-1).
# Left-handed Weyl B-L:  Q_L:+1/3, u_R^c:-1/3, d_R^c:-1/3, L:-1, e_R^c:+1, nu_R^c:+1
bl_fields = [("Q_L",6,F(1,3)),("u_R^c",3,F(-1,3)),("d_R^c",3,F(-1,3)),
             ("L",2,F(-1)),("e_R^c",1,F(1)),("nu_R^c",1,F(1))]
g,c = anomalies(bl_fields)
print(f"  B-L WITH nu_R:    grav.(B-L) = {g}   (B-L)^3 = {c}")
g2,c2 = anomalies([f for f in bl_fields if f[0]!="nu_R^c"])
print(f"  B-L WITHOUT nu_R: grav.(B-L) = {g2}   (B-L)^3 = {c2}   <-- seed teeth: nonzero, fails")
