/- N45 PROBE 2 — measure the BONUS gForm-composition (W9). KILL=60s. -/
import Phys.Algebra.SpacetimeSignature
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

namespace N45Probe2

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- THE gForm COMPOSITION LAW from the banked Born multiplicativity `Nrm_mul_on_O`. -/
theorem gForm_comp (x y : O ℚ) : gForm (x * y) (x * y) = gForm x x * gForm y y := by
  have hnrm := Nrm_mul_on_O x y          -- Nrm (x*y) = Nrm x * Nrm y  (in H ℚ)
  -- gForm z z = reQ (z * star z) = (Nrm z).re.re  since Nrm z = (z*star z).re, reQ w = w.re.re.re
  have key : ∀ z : O ℚ, gForm z z = (CD.Nrm z).re.re := by
    intro z; rfl
  -- Nrm z = (gForm z z) • (1 : H ℚ)  via selfMul_eq_smul
  have hsm : ∀ z : O ℚ, CD.Nrm z = (gForm z z) • (1 : H ℚ) := by
    intro z
    have h := selfMul_eq_smul z          -- z * star z = (gForm z z) • (1 : O ℚ)
    show (z * star z).re = _
    rw [h]; rfl
  rw [key, hnrm, hsm x, hsm y]
  -- ((gForm x x)•(1:H)) * ((gForm y y)•(1:H)) = (gForm x x * gForm y y)•(1:H), take .re.re
  rw [smul_mul_smul_comm, mul_one]
  simp only [cd_qsmul_re, Dbl.smul_re, smul_eq_mul]
  show gForm x x * gForm y y * (1 : ℚ) = _
  ring

#print axioms gForm_comp

end

end N45Probe2
