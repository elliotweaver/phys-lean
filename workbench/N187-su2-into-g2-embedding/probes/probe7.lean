/-
  N187 MEASUREMENT PROBE 7 — close injectivity; the embedding kernel on imaginary q is trivial.
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

theorem liftEnd_injective : Function.Injective (liftEnd : (CD B →+ CD B) → Module.End ℤ (CD (CD B))) := by
  intro δ ε h
  refine AddMonoidHom.ext fun a => ?_
  have := congrArg (fun (f : Module.End ℤ (CD (CD B))) => (f (iota a)).re) h
  simpa [liftEnd_apply, CD.iota] using this

theorem adHom_zero' : adHom (0 : CD B) = 0 := by
  refine AddMonoidHom.ext fun x => ?_; simp [adHom_apply]

theorem innerDeriv_zero' : innerDeriv (0 : CD B) = 0 := by
  unfold innerDeriv; rw [adHom_zero']
  refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]

theorem innerDeriv_eq_zero_iff_adHom (q : CD B) : innerDeriv q = 0 ↔ adHom q = 0 := by
  constructor
  · intro h
    have h2 : liftEnd (adHom q) = liftEnd (0 : CD B →+ CD B) := by
      show innerDeriv q = liftEnd 0
      rw [h]; symm
      refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]
    exact liftEnd_injective h2
  · intro h; unfold innerDeriv; rw [h]
    refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]

end

-- On H ℚ: adHom q = 0 means q central = scalar. So on imaginary q, innerDeriv q = 0 → q = 0.
-- Verify the three basis images are nonzero, giving a genuine 3-dim image in g₂.
noncomputable section
attribute [local instance] dblModuleQ cdModuleQ

theorem innerDeriv_hK_ne_zero : innerDeriv (hK : H ℚ) ≠ 0 := by
  rw [innerDeriv_eq_zero_iff_adHom]
  intro h
  have : adHom (hK : H ℚ) hI = 0 := by rw [h]; rfl
  rw [adHom_apply, hK_hI, hI_hK, sub_neg_eq_add] at this
  have := congrArg (fun z : H ℚ => z.im.re) this
  simp [hJ, CD.e2] at this

end

end Phys.Algebra
