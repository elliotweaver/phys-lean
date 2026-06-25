import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- I-invariance: N stable under imRep (I.incl x) since that operator ∈ A_I acts on N.
example (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (x : I) (v : ImO) (hv : v ∈ N) : imRep (I.incl x) v ∈ N := by
  -- imRep (I.incl x) is a generator, so it's in A_I; the A_I-action on N maps N to N.
  set A_I := Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))
  have hgen : imRep (I.incl x) ∈ A_I := by
    apply Algebra.subset_adjoin
    exact ⟨x, rfl⟩
  -- the element a := ⟨imRep (I.incl x), hgen⟩ : A_I acts on v ∈ N, landing in N
  have : (⟨imRep (I.incl x), hgen⟩ : A_I) • v ∈ N := N.smul_mem _ hv
  -- and (a • v : ImO) = imRep (I.incl x) v
  convert this using 1
end
end Phys.Algebra
