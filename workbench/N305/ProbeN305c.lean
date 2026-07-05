import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Trace

/-! Probe N305c — the two DERIVATION cruxes:
    (a) GROUNDING: the self-blind "see the other two" sum equals `1 − Eidem i` on the banked
        cap-forced idempotents + the ℤ₃ cycle — ties the coefficient-space seeing operator to the
        banked generation objects (NOT free-floating).
    (b) FORCING: the "other" fraction T = 2/3 is FORCED by (self-blindness: weighted-eigenvalue
        balance = 0) + (normalization: weights sum to 1) — a LANDING, uniquely, not asserted. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def gcyc : Equiv.Perm (Fin 3) := finRotate 3

-- (a) GROUNDING on the banked idempotents: "see the other two" = 1 − self.
-- gcyc i and gcyc(gcyc i) are the two OTHER generations; their idempotents sum to 1 − Eidem i.
theorem probe_gcyc_vals : gcyc 0 = 1 ∧ gcyc 1 = 2 ∧ gcyc 2 = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;> · simp only [gcyc]; decide

theorem probe_see_others_0 :
    Eidem (gcyc 0) + Eidem (gcyc (gcyc 0)) = 1 - Eidem 0 := by
  obtain ⟨h0, h1, _⟩ := probe_gcyc_vals
  rw [h0, h1, eq_sub_iff_add_eq]
  have : Eidem 1 + Eidem 2 + Eidem 0 = Eidem 0 + Eidem 1 + Eidem 2 := by abel
  rw [this]; exact sum_Eidem
theorem probe_see_others_1 :
    Eidem (gcyc 1) + Eidem (gcyc (gcyc 1)) = 1 - Eidem 1 := by
  obtain ⟨_, h1, h2⟩ := probe_gcyc_vals
  rw [h1, h2, eq_sub_iff_add_eq]
  have : Eidem 2 + Eidem 0 + Eidem 1 = Eidem 0 + Eidem 1 + Eidem 2 := by abel
  rw [this]; exact sum_Eidem
theorem probe_see_others_2 :
    Eidem (gcyc 2) + Eidem (gcyc (gcyc 2)) = 1 - Eidem 2 := by
  obtain ⟨h0, _, h2⟩ := probe_gcyc_vals
  rw [h2, h0, eq_sub_iff_add_eq]
  have : Eidem 0 + Eidem 1 + Eidem 2 = Eidem 0 + Eidem 1 + Eidem 2 := rfl
  exact sum_Eidem

-- (b) FORCING: T = 2/3 is the UNIQUE normalized weight killing the self-view balance.
-- self-blind seeing operator: each generation sees n−1 = 2 others (eigenvalue +2 on Unity),
-- minus itself (eigenvalue −1 on others). Self-view vanishes ⟺ w_unity·2 + w_others·(−1) = 0.
-- With normalization w_unity + w_others = 1, the "others" fraction is forced to 2/3.
theorem probe_born_fraction_forced (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w1 = 2/3 := by
  linarith

-- and the democratic/Unity fraction is forced to 1/3
theorem probe_born_fraction_dem_forced (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w0 = 1/3 := by
  linarith

-- general n form: self-sees n−1 others; the "other" fraction is (n−1)/n
theorem probe_born_fraction_forced_gen (n : ℚ) (hn : n ≠ 0) (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * (n - 1) + w1 * (-1) = 0) : w1 = (n - 1)/n := by
  field_simp
  have : w0 * (n - 1) = w1 := by linarith
  have hw0 : w0 = 1 - w1 := by linarith
  rw [hw0] at this
  nlinarith [this]

end Phys.Algebra.HJ
