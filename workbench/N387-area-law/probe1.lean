import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- 1. Cast ℚ → Cut exists?
example (q : ℚ) : Cut := (q : Cut)

-- 2. cutExp pow: cutExp x ^ n = cutExp (n • x)?
example (x : Cut) (n : ℕ) : cutExp x ^ n = cutExp (n • x) := by
  induction n with
  | zero => simp [cutExp_zero]
  | succ k ih => rw [pow_succ, ih, cutExp_add, succ_nsmul]

-- 3. gForm accessible on O ℚ and the associator?
example (a b x : O ℚ) : ℚ := gForm (assoc a b x) (assoc a b x)

-- 4. gForm_self_nonneg / eq_zero
example (v : O ℚ) : 0 ≤ gForm v v := gForm_self_nonneg v
example (v : O ℚ) : gForm v v = 0 ↔ v = 0 := gForm_self_eq_zero

-- 5. singlet_assoc_vanishes accessible
example {a b : O ℚ} (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) : assoc a b x = 0 :=
  singlet_assoc_vanishes ha hb x

-- 6. assoc_nonvanishing accessible
example : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
  assoc_nonvanishing

-- 7. cutExp of negative < 1 (strict)
example (s : Cut) (hs : 0 < s) : cutExp (-s) < 1 := by
  have := cutExp_strictMono (show -s < 0 by linarith)
  rwa [cutExp_zero] at this

-- 8. cutLog (cutExp (-s)) = -s
example (s : Cut) : cutLog (cutExp (-s)) = -s := cutLog_cutExp (-s)

end

end Phys.Algebra
