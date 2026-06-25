import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- L2 (generic): a skew-adjoint T preserving N preserves the gImO-orthogonal of N.
theorem skew_mapsTo_orthogonal (N : Submodule ℚ ImO) (T : Module.End ℚ ImO)
    (hskew : (gBil.restrict ImO).IsSkewAdjoint T)
    (hN : ∀ n ∈ N, T n ∈ N) {x : ImO} (hx : x ∈ (gBil.restrict ImO).orthogonal N) :
    T x ∈ (gBil.restrict ImO).orthogonal N := by
  set B := gBil.restrict ImO with hB
  have hsymm : B.IsSymm := gBil_restrict_symm ImO
  have hsymmeq : ∀ a b : ImO, B a b = B b a := by
    intro a b; have := hsymm.eq a b; simpa using this
  rw [BilinForm.mem_orthogonal_iff]
  intro n hn
  rw [BilinForm.isOrtho_def]
  have hxortho : B (T n) x = 0 := by
    have : B.IsOrtho (T n) x := (BilinForm.mem_orthogonal_iff.mp hx) (T n) (hN n hn)
    rwa [BilinForm.isOrtho_def] at this
  calc B n (T x) = B (T x) n := hsymmeq n (T x)
    _ = B x ((-T) n) := hskew x n
    _ = B x (-(T n)) := by rw [LinearMap.neg_apply]
    _ = -(B x (T n)) := by rw [map_neg]
    _ = -(B (T n) x) := by rw [hsymmeq x (T n)]
    _ = 0 := by rw [hxortho, neg_zero]

end
end Phys.Algebra
