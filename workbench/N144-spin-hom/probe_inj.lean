import Phys.Algebra.LorentzContinuumCliffordSpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- OBLIGATION (A): iota-injectivity over the derived Cut.
-- Route: equivExterior (Invertible 2) + changeForm_ι + ExteriorAlgebra.ι_inj.

theorem cliff_iota_injective_probe :
    Function.Injective (CliffordAlgebra.ι (R := Cut) QvCQuad) := by
  haveI : Invertible (2 : Cut) := invertibleOfNonzero two_ne_zero
  intro x y h
  have hx : CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad x)
          = CliffordAlgebra.equivExterior QvCQuad (CliffordAlgebra.ι QvCQuad y) := by rw [h]
  -- equivExterior = changeFormEquiv ; changeForm_ι sends ι Q → ι (exterior) at form 0
  simp only [CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply,
    CliffordAlgebra.changeForm_ι] at hx
  exact (ExteriorAlgebra.ι_inj Cut x y).mp hx

end

end Phys.Algebra
