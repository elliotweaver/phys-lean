import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field

open Phys.Foundation ContinuumQ
open scoped BigOperators

noncomputable example : CharZero Cut := inferInstance
noncomputable example : RatCast Cut := inferInstance

-- ratCast preserves squares-sum = 1 ⟹ each entry |·| ≤ 1 over Cut
example (f : Fin 8 → ℚ) (h : ∑ i, (f i)^2 = 1) (i : Fin 8) :
    |((f i : Cut))| ≤ 1 := by
  -- over ℚ: (f i)^2 ≤ 1 ; cast up
  have hq : (f i)^2 ≤ 1 := by
    have := Finset.single_le_sum (f := fun i' => (f i')^2) (fun _ _ => sq_nonneg _) (Finset.mem_univ i)
    rw [h] at this; exact this
  have habs : |f i| ≤ 1 := by nlinarith [abs_nonneg (f i), sq_abs (f i)]
  rw [show |(f i : Cut)| = ((|f i| : ℚ) : Cut) by exact_mod_cast rfl]
  exact_mod_cast habs

-- ratCast preserves the orthonormality sum: ∑ (f i * g i) maps to Cut
example (f g : Fin 8 → ℚ) (c : ℚ) (h : ∑ i, f i * g i = c) :
    ∑ i, (f i : Cut) * (g i : Cut) = (c : Cut) := by
  rw [← h]; push_cast; ring
