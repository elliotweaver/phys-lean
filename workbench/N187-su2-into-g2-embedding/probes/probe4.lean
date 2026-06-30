/-
  N187 MEASUREMENT PROBE 4 — image in Der(O), structure constants, non-vacuity, injectivity.
  Base B := Dbl ℚ, so CD B = H ℚ, CD (CD B) = O ℚ. innerDeriv (q : H ℚ) : End ℤ (O ℚ).
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationHDim
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- re-state the levers from probe3 (locally) so this probe is self-contained
variable {B : Type*} [CommRing B] [StarRing B]
theorem liftEnd_mul' (δ ε : CD B →+ CD B) :
    (liftEnd δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
  refine LinearMap.ext fun z => ?_
  show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
  ext <;> simp [liftEnd_apply]
theorem liftEnd_sub' (δ ε : CD B →+ CD B) :
    liftEnd δ - liftEnd ε = liftEnd (δ - ε) := by
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, liftEnd_apply, AddMonoidHom.sub_apply]
  ext <;> simp [sub_eq_add_neg, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im]
theorem adHom_comp_comm' (p q : CD B) :
    (adHom p).comp (adHom q) - (adHom q).comp (adHom p) = adHom (p * q - q * p) := by
  refine AddMonoidHom.ext fun x => ?_
  simp only [AddMonoidHom.sub_apply, AddMonoidHom.comp_apply, adHom_apply]
  noncomm_ring
theorem innerDeriv_bracket' (p q : CD B) :
    ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p * q - q * p) := by
  show innerDeriv p * innerDeriv q - innerDeriv q * innerDeriv p = innerDeriv (p * q - q * p)
  unfold innerDeriv
  rw [liftEnd_mul', liftEnd_mul', liftEnd_sub', adHom_comp_comm']

-- ============ (a) hI/hJ/hK imaginary ⟹ innerDeriv lands in Der(O ℚ) = g₂ ============
example : star (hI : H ℚ) = -hI := by
  unfold hI; ext <;> simp [CD.iota, Dbl.star_J]
example : star (hJ : H ℚ) = -hJ := e2_imag_H
example : star (hK : H ℚ) = -hK := by
  rw [hK_def]; ext <;> simp [Dbl.star_J]

-- innerDeriv hI ∈ Der(O ℚ)
example : IsDeriv (innerDeriv (hI : H ℚ)) :=
  innerDeriv_isDeriv hI (by unfold hI; ext <;> simp [CD.iota, Dbl.star_J])

-- ============ (b) structure-constant transfer: ⁅innerDeriv hI, innerDeriv hJ⁆ = 2 • innerDeriv hK ============
example : ⁅innerDeriv (hI : H ℚ), innerDeriv hJ⁆ = (2 : ℤ) • innerDeriv hK := by
  rw [innerDeriv_bracket']
  -- need: innerDeriv (hI*hJ - hJ*hI) = 2 • innerDeriv hK,  hI*hJ - hJ*hI = hK - (-hK) = 2*hK
  have hmul : (hI : H ℚ) * hJ - hJ * hI = (2:ℤ) • hK := by
    rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]
  rw [hmul]
  -- innerDeriv (2 • hK) = 2 • innerDeriv hK  (innerDeriv ℤ-linear in q? liftEnd∘adHom)
  sorry

end

end Phys.Algebra
