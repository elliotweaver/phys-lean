import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
-- An A_I-submodule N of ImO: restrict to ℚ, then map into O ℚ via ImO.subtype.
example (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO) : True := by
  -- N as a ℚ-subspace of ImO
  let Nq : Submodule ℚ ImO := N.restrictScalars ℚ
  -- W := image in O ℚ
  let W : Submodule ℚ (O ℚ) := Nq.map ImO.subtype
  have hWle : W ≤ ImO := by
    rintro _ ⟨z, _, rfl⟩; exact z.2
  trivial

end
end Phys.Algebra
