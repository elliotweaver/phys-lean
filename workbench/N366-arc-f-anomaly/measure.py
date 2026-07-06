from itertools import combinations
from fractions import Fraction as F

n = 3
subsets = [frozenset(c) for r in range(n + 1) for c in combinations(range(n), r)]
Q = lambda S: F(len(S), n)          # banked N317 electric charge = occupation/colour
comp = lambda S: frozenset(range(n)) - S
Qc = lambda S: Q(S) - F(1, 2)       # centered charge (charge - 1/2)

print("=== ONE IDEAL: fixed-point-free Hodge complement S->S^c ===")
fp = [S for S in subsets if comp(S) == S]
print("  fixed points of S->S^c:", fp, "(none => involution is free)")
print("  Qc odd under complement (Qc(S^c) = -Qc(S)) for all S:",
      all(Qc(comp(S)) == -Qc(S) for S in subsets))
print("  => every ODD moment of Qc vanishes over the ideal:")
print("     sum Qc   =", sum(Qc(S) for S in subsets))
print("     sum Qc^3 =", sum(Qc(S) ** 3 for S in subsets))
print("     sum Qc^5 =", sum(Qc(S) ** 5 for S in subsets))

print("\n=== TEETH: remove the |S|=0 state (the ν_R / empty-set colour+isospin singlet) ===")
ideal_minus_empty = [S for S in subsets if len(S) != 0]
print("  states left:", len(ideal_minus_empty))
print("  sum Qc   over ideal-minus-empty =", sum(Qc(S) for S in ideal_minus_empty), "(was 0, now nonzero: teeth)")
print("  sum Qc^3 over ideal-minus-empty =", sum(Qc(S) ** 3 for S in ideal_minus_empty))

print("\n=== B-L structure on the ladder (lepton# = colour-singlet indicator, baryon# = quark) ===")
# In the Cl(6)/Furey ladder: |S|=0 and |S|=3 are COLOUR SINGLETS (leptons); |S|=1,2 are coloured (quarks).
# B-L: leptons carry L=+/-1 (B-L = -/+1), quarks carry B=+/-1/3 (B-L=+/-1/3).
# The complement pairs |S|=0 <-> |S|=3 (the two leptons: nu and e^c) and |S|=1 <-> |S|=2 (quark<->antiquark).
def BL(S):
    k = len(S)
    if k == 0: return F(-1)     # neutrino: lepton, B-L=-1
    if k == 3: return F(1)      # e^c (positron): anti-lepton, B-L=+1
    if k == 1: return F(1,3)    # quark  B-L=+1/3
    if k == 2: return F(-1,3)   # antiquark B-L=-1/3
print("  B-L values:", {len(S): BL(S) for S in subsets})
print("  B-L odd under complement (BL(S^c)=-BL(S)):", all(BL(comp(S)) == -BL(S) for S in subsets))
print("  sum (B-L)   full ideal =", sum(BL(S) for S in subsets), " [grav^2.U(1)_{B-L}]")
print("  sum (B-L)^3 full ideal =", sum(BL(S) ** 3 for S in subsets), " [U(1)_{B-L}^3]")
# Teeth: drop the ν_R.  Which state is ν_R?  In the ladder it's the extra colour+isospin singlet.
# The seed: 'B-L WITHOUT nu_R FAILS at exactly -1'.  Remove the |S|=0 (nu) partner of e^c:
minus_nuR = [S for S in subsets if len(S) != 0]
print("  sum (B-L)   WITHOUT nu_R (drop |S|=0) =", sum(BL(S) for S in minus_nuR), " <-- teeth target -1")
print("  sum (B-L)^3 WITHOUT nu_R (drop |S|=0) =", sum(BL(S) ** 3 for S in minus_nuR))
