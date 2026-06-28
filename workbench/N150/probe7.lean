import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

abbrev EXT := ExteriorAlgebra Cut STVC

-- the equivExterior CliffC ≃ₗ EXT
noncomputable abbrev clf2ext : CliffC ≃ₗ[Cut] EXT :=
  CliffordAlgebra.equivExterior QvCQuad

-- transport of contraction: changeForm_contractLeft
-- clf2ext (contractLeft d x) = contractLeft d (clf2ext x)
example (d : Module.Dual Cut STVC) (x : CliffC) :
    clf2ext (CliffordAlgebra.contractLeft d x)
      = CliffordAlgebra.contractLeft d (clf2ext x) := by
  exact CliffordAlgebra.changeForm_contractLeft
    (Q := QvCQuad) (Q' := (0 : QuadraticForm Cut STVC))
    (B := QuadraticMap.associated (-QvCQuad)) CliffordAlgebra.changeForm.associated_neg_proof d x

-- scalars: clf2ext (algebraMap μ) = algebraMap μ ; and the reverse
example (μ : Cut) : clf2ext (algebraMap Cut CliffC μ) = algebraMap Cut EXT μ := by
  simp only [clf2ext, CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply]
  rw [CliffordAlgebra.changeForm_algebraMap]

-- key: an EXT element that IS a scalar pulls back to a CliffC scalar via symm
-- given y = algebraMap μ in EXT, clf2ext.symm y = algebraMap μ in CliffC
example (μ : Cut) : clf2ext.symm (algebraMap Cut EXT μ) = algebraMap Cut CliffC μ := by
  rw [LinearEquiv.symm_apply_eq]
  simp only [clf2ext, CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply]
  rw [CliffordAlgebra.changeForm_algebraMap]

end

end Phys.Algebra
