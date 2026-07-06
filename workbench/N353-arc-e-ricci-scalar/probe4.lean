import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- The raising relation: T raises the second index of the Ricci form via the derived metric BvC.
def IsRicciRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = ricci G Y Z

-- (A) UNIQUENESS from BvC nondegeneracy — the theory-native well-definedness.
theorem ricciRaise_unique (G : STVC →ₗ[Cut] MetricEnd) (T T' : MetricEnd)
    (hT : IsRicciRaise G T) (hT' : IsRicciRaise G T') : T = T' := by
  refine LinearMap.ext fun Z => ?_
  have hZ : T Z - T' Z = 0 := by
    apply BvC_nondegenerate (T Z - T' Z)
    intro q
    rw [BvC_symm, BvC_sub_right, hT q Z, hT' q Z, sub_self]
  exact sub_eq_zero.mp hZ

end

end Phys.Algebra
