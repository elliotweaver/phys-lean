import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationIrreducible
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- MEASURE: the commuting-actions lever. If ⁅I,J⁆=⊥ then imRep images commute in End V.
-- imRep is a Lie hom: imRep ⁅a,b⁆ = ⁅imRep a, imRep b⁆ = imRep a ∘ imRep b - imRep b ∘ imRep a.
example (a b : derivationLieQ) (h : (⁅a, b⁆ : derivationLieQ) = 0) :
    imRep a * imRep b = imRep b * imRep a := by
  have := LieHom.map_lie imRep a b
  rw [h, map_zero] at this
  -- this : 0 = ⁅imRep a, imRep b⁆ = imRep a * imRep b - imRep b * imRep a
  rw [Ring.lie_def] at this
  linarith [this]  -- probably wrong tactic for End; try sub_eq_zero

end
end Phys.Algebra
