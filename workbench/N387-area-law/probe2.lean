import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- A. ℚ→Cut cast: positivity preserved?
example (q : ℚ) (hq : 0 < q) : (0 : Cut) < (q : Cut) := by exact_mod_cast hq
example (q : ℚ) (hq : 0 ≤ q) : (0 : Cut) ≤ (q : Cut) := by exact_mod_cast hq

-- B. gForm v v > 0 iff v ≠ 0
example (v : O ℚ) (hv : v ≠ 0) : 0 < gForm v v := by
  rcases (gForm_self_nonneg v).lt_or_eq with h | h
  · exact h
  · exact absurd (gForm_self_eq_zero.mp h.symm) hv

-- C. plaquette factor cutExp(-s)^N strictly decreasing for s>0 (0<w<1)
example (w : Cut) (hw0 : 0 < w) (hw1 : w < 1) (m n : ℕ) (hmn : m < n) : w ^ n < w ^ m := by
  exact pow_lt_pow_right_of_lt_one₀ hw0 hw1 hmn

-- D. Finset.prod_const over grid
example (m n : ℕ) (c : Cut) : ∏ _p ∈ (Finset.univ : Finset (Fin m × Fin n)), c = c ^ (m * n) := by
  rw [Finset.prod_const, Finset.card_univ, Fintype.card_prod, Fintype.card_fin, Fintype.card_fin]

-- E. nsmul_eq_mul on Cut: (n • s) = (n:Cut) * s
example (n : ℕ) (s : Cut) : n • s = (n : Cut) * s := by rw [nsmul_eq_mul]

-- F. cutExp(-s)^N = cutExp(-((N:Cut)*s))
example (s : Cut) (N : ℕ) : cutExp (-s) ^ N = cutExp (-((N : Cut) * s)) := by
  induction N with
  | zero => simp [cutExp_zero]
  | succ k ih =>
    rw [pow_succ, ih, cutExp_add]
    congr 1
    push_cast
    ring

end
end Phys.Algebra
