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

-- P1: A_I forms cleanly (re-confirm, fast). Subalgebra of End ℚ ↥ImO.
example (I : LieIdeal ℚ derivationLieQ) : Subalgebra ℚ (Module.End ℚ ImO) :=
  Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))

-- P2: is ↥ImO a module over ↥A_I automatically?
example (A : Subalgebra ℚ (Module.End ℚ ImO)) : Module A ImO := by
  infer_instance

-- P3: gImO = gBil.restrict ImO ; is it reflexive / nondegenerate (from banked)?
example : (gBil.restrict ImO).IsRefl := (gBil_restrict_symm ImO).isRefl
example : (gBil.restrict ImO).Nondegenerate := gBil_restrict_nondegenerate ImO

-- P4: restrictOp ImO _ D defeq imRep D ?  (so restrictOp_skew transports to imRep)
example (D : derivationLieQ) :
    restrictOp ImO (fun D x hx => derivLieQ_mapsTo D x hx) D = imRep D := by
  rfl

-- P5: the complement-from-nondegenerate-restriction lemma, applied to gImO and a ℚ-subspace.
example (N : Submodule ℚ ImO) :
    IsCompl N ((gBil.restrict ImO).orthogonal N) :=
  (gBil.restrict ImO).isCompl_orthogonal_of_restrict_nondegenerate
    ((gBil_restrict_symm ImO).isRefl)
    (by
      -- restriction of a nondegenerate-on-restrict form to a further subspace
      exact?)

end
end Phys.Algebra
