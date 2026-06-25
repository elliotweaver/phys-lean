import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
example (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (x : I) (v : ImO) (hv : v ∈ N) : imRep (I.incl x) v ∈ N := by
  have hgen : imRep (I.incl x) ∈ Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) :=
    Algebra.subset_adjoin ⟨x, rfl⟩
  have hsmul : (⟨imRep (I.incl x), hgen⟩ :
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) • v ∈ N := N.smul_mem _ hv
  -- (a • v) = imRep (I.incl x) v  (the A_I-scalar action is the operator application)
  have hcoe : (⟨imRep (I.incl x), hgen⟩ :
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) • v = imRep (I.incl x) v := rfl
  rwa [hcoe] at hsmul
end
end Phys.Algebra
