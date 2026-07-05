import Phys.Algebra.FineStructureScaleCoupling
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

open scoped BigOperators
namespace Phys.Algebra.ProbeN319
open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

-- C1: the one-ratio mixing consistency (THE HEART)
def oneCouplingMixing (r : ℚ) : ℚ := 1 / (1 + r)

theorem oneCouplingMixing_at_5_3 : oneCouplingMixing (5/3) = 3/8 := by
  unfold oneCouplingMixing; norm_num

-- THE CONSISTENCY: mixing via the single derived GUT ratio = direct weinberg. baked-in Q=T3+Y.
theorem oneCouplingMixing_eq_weinberg (t3 q : ℚ) (ht3 : t3 ≠ 0) (hq : q ≠ 0) :
    oneCouplingMixing (hyperRatio q t3) = weinberg t3 q := by
  unfold oneCouplingMixing hyperRatio weinberg
  have hstep : 1 + (q - t3) / t3 = q / t3 := by field_simp; ring
  rw [hstep, one_div_div]

-- grounded landing
theorem mixing_grounded :
    oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))) = 3 / 8 := by
  rw [hyperRatio_lands_5_3]; exact oneCouplingMixing_at_5_3

-- C2: rigidity / iso-stiffness — the angle uniquely back-determines the ratio
theorem oneCouplingMixing_rigid (r : ℚ) (h1r : 1 + r ≠ 0) :
    oneCouplingMixing r = 3/8 → r = 5/3 := by
  unfold oneCouplingMixing
  intro h
  field_simp at h
  linarith

-- singleCoupling reading
theorem singleCoupling_is_alphaStar : alphaStar = couplingWeight ∧ alphaStar = 1/42 :=
  ⟨rfl, alphaStar_eq⟩

-- W8 teeth
theorem oneCouplingMixing_naive_ne : oneCouplingMixing 1 ≠ 3/8 := by
  unfold oneCouplingMixing; norm_num

theorem oneCouplingMixing_one : oneCouplingMixing 1 = 1/2 := by
  unfold oneCouplingMixing; norm_num

-- costume cert probe
noncomputable def cert : ℚ := 8 * oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)))
theorem cert_eq_3 : cert = 3 := by unfold cert; rw [mixing_grounded]; norm_num

end Phys.Algebra.ProbeN319
