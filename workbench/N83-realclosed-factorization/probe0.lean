import Phys.Algebra.LorentzContinuumAlgClosure

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

section

-- PROBE 0: the real-closed irreducible-degree bound.
-- An irreducible p ∈ Cut[X] has natDegree ≤ 2, because over the now-alg-closed Cut[i]
-- the mapped p splits, so f.natDegree ∣ finrank Cut Cut[i] = 2.

theorem probe_cut_irreducible_natDegree_le_two {p : Cut[X]} (hp : Irreducible p) :
    p.natDegree ≤ 2 := by
  -- p maps to Cut[i][X] and splits (Cut[i] alg closed)
  have hsplit : ((p.map (algebraMap Cut Cuti))).Splits := IsAlgClosed.splits _
  have hdvd : p.natDegree ∣ Module.finrank Cut Cuti :=
    hp.natDegree_dvd_finrank hsplit
  rw [cuti_finrank_eq_two] at hdvd
  exact Nat.le_of_dvd (by norm_num) hdvd

end

end Phys.Algebra
