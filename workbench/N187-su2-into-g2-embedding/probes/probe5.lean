/-
  N187 MEASUREMENT PROBE 5 — close the zsmul step + non-vacuity + injectivity.
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationHDim
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

variable {B : Type*} [CommRing B] [StarRing B]

-- adHom additive in q
theorem adHom_add' (p q : CD B) : adHom (p + q) = adHom p + adHom q := by
  refine AddMonoidHom.ext fun x => ?_
  simp only [adHom_apply, AddMonoidHom.add_apply, add_mul, mul_add]; abel

-- liftEnd additive
theorem liftEnd_add' (δ ε : CD B →+ CD B) : liftEnd (δ + ε) = liftEnd δ + liftEnd ε := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [liftEnd_apply]

-- innerDeriv additive in q
theorem innerDeriv_add' (p q : CD B) : innerDeriv (p + q) = innerDeriv p + innerDeriv q := by
  unfold innerDeriv; rw [adHom_add', liftEnd_add']

-- innerDeriv 2-zsmul
theorem innerDeriv_two_zsmul (q : CD B) : innerDeriv ((2:ℤ) • q) = (2:ℤ) • innerDeriv q := by
  rw [two_zsmul, two_zsmul, innerDeriv_add']

-- non-vacuity: innerDeriv hK ≠ 0 on O ℚ.  hK = ⟨0, Dbl.J⟩, imaginary; ad_{hK} nonzero because
-- hK and hI do not commute (hK*hI = hJ ≠ hI*hK = -hJ). Lift preserves this on re-component.
-- Witness: innerDeriv hK (iota hI) has re = adHom hK hI = hK*hI - hI*hK = hJ-(-hJ)=2hJ ≠ 0
example : adHom (hK : H ℚ) hI ≠ 0 := by
  rw [adHom_apply, hK_hI, hI_hK, sub_neg_eq_add]
  intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp [hJ, CD.e2] at this

end

end Phys.Algebra
