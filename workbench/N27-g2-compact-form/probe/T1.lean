import Phys.Algebra.DerivationIrreducible
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- gBil restricted to W: separating-left from anisotropy
example (W : Submodule ℚ (O ℚ)) : (gBil.restrict W).SeparatingLeft := by
  intro x hx
  have hxx : gBil.restrict W x x = 0 := hx x
  have h0 : gForm (x : O ℚ) (x : O ℚ) = 0 := by
    simpa [BilinForm.restrict, gBil_apply] using hxx
  exact Subtype.ext (gForm_self_eq_zero.mp h0)

-- restriction nondegenerate: need both halves. Use the symmetric structure.
example (W : Submodule ℚ (O ℚ)) : (gBil.restrict W).Nondegenerate := by
  have hsymm : (gBil.restrict W).IsSymm := by
    constructor
    intro x y
    simp only [BilinForm.restrict, gBil_apply, LinearMap.restrict_apply,
      LinearMap.domRestrict_apply]
    exact gForm_symm _ _
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm (x : O ℚ) (x : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm (y : O ℚ) (y : O ℚ) = 0 := by
      have := hy y
      have hsy : gBil.restrict W y y = 0 := by
        rw [hsymm.eq y y] at this; exact this
      simpa [BilinForm.restrict, gBil_apply] using hsy
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

end
end Phys.Algebra
