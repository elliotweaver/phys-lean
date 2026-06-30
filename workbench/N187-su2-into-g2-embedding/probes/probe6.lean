/-
  N187 MEASUREMENT PROBE 6 — injectivity / kernel of innerDeriv, and LieHom packaging feasibility.
  The lift δ ↦ liftEnd δ is injective (componentwise), and on H ℚ, q ↦ adHom q has kernel = centre.
  So innerDeriv q = 0 ⟺ adHom q = 0 ⟺ q ∈ centre (ℚ·1). On imaginary q, that means q = 0.
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

-- liftEnd injective (componentwise on re/im)
theorem liftEnd_injective : Function.Injective (liftEnd : (CD B →+ CD B) → Module.End ℤ (CD (CD B))) := by
  intro δ ε h
  refine AddMonoidHom.ext fun a => ?_
  -- evaluate h at iota a, read re-component
  have := congrArg (fun (f : Module.End ℤ (CD (CD B))) => (f (iota a)).re) h
  simpa [liftEnd_apply, CD.iota] using this

-- innerDeriv q = 0 ⟺ adHom q = 0  (via liftEnd injectivity; innerDeriv 0 = liftEnd (adHom 0) = liftEnd 0 = 0)
theorem adHom_zero' : adHom (0 : CD B) = 0 := by
  refine AddMonoidHom.ext fun x => ?_; simp [adHom_apply]

theorem innerDeriv_zero' : innerDeriv (0 : CD B) = 0 := by
  unfold innerDeriv; rw [adHom_zero']
  refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]

example (q : CD B) (h : innerDeriv q = 0) : adHom q = 0 := by
  have : liftEnd (adHom q) = liftEnd (0 : CD B →+ CD B) := by
    rw [← innerDeriv_zero']; exact h
  exact liftEnd_injective this

end

end Phys.Algebra
