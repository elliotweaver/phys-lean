import Phys.Algebra.DerivationOFlow
import Phys.Algebra.Derivation

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- (A) derivMatrix is multiplicative on composition (ring hom on the End ring)
theorem derivMatrix_mul (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (D' * E') = derivMatrix D' * derivMatrix E' := by
  unfold derivMatrix
  rw [map_mul (LinearEquiv.conjRingEquiv coordOCut), LinearMap.toMatrix'_mul]

-- (B) derivMatrix is additive
theorem derivMatrix_add (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (D' + E') = derivMatrix D' + derivMatrix E' := by
  unfold derivMatrix
  rw [map_add (LinearEquiv.conjRingEquiv coordOCut), map_add]

-- (C) operator-commute → matrix-commute
theorem derivMatrix_commute (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    Commute (derivMatrix D') (derivMatrix E') := by
  unfold Commute SemiconjBy
  rw [← derivMatrix_mul, ← derivMatrix_mul, h.eq]

-- bracket = 0 ↔ Commute  (the Lie-bracket form of the hypothesis, connecting isDeriv_bracket)
theorem commute_of_lie_zero (D' E' : Module.End Cut (O Cut)) (h : ⁅D', E'⁆ = 0) :
    Commute D' E' := by
  have : D' * E' - E' * D' = 0 := h
  exact (sub_eq_zero.mp this)

-- (D) THE COMMUTING-GENERATOR PRODUCT LAW (pointwise)
theorem expOLin_comm_flow_apply (D' E' : Module.End Cut (O Cut)) (h : Commute D' E')
    (x : O Cut) :
    expOLin D' (expOLin E' x) = expOLin (D' + E') x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix E')) (coordOCut x)
        = expMap (derivMatrix E') *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix D'))
          (expMap (derivMatrix E') *ᵥ coordOCut x)
        = expMap (derivMatrix D') *ᵥ (expMap (derivMatrix E') *ᵥ coordOCut x) from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix (D' + E'))) (coordOCut x)
        = expMap (derivMatrix (D' + E')) *ᵥ coordOCut x from rfl,
    Matrix.mulVec_mulVec,
    expMap_mul_of_commute (derivMatrix D') (derivMatrix E') (derivMatrix_commute D' E' h),
    ← derivMatrix_add]

-- (D') the LinearMap.comp form
theorem expOLin_comm_flow (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    (expOLin D').comp (expOLin E') = expOLin (D' + E') :=
  LinearMap.ext (fun x => expOLin_comm_flow_apply D' E' h x)

-- (E) THE FLOWS COMMUTE: commuting generators give commuting flows
theorem expOLin_comm_flow_comm (D' E' : Module.End Cut (O Cut)) (h : Commute D' E')
    (x : O Cut) :
    expOLin D' (expOLin E' x) = expOLin E' (expOLin D' x) := by
  rw [expOLin_comm_flow_apply D' E' h, expOLin_comm_flow_apply E' D' h.symm, add_comm]

-- bundled: the one-parameter subgroup product for commuting generators
theorem expOEquiv_comm_flow (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    (expOEquiv E').trans (expOEquiv D') = expOEquiv (D' + E') := by
  refine LinearEquiv.toLinearMap_injective (LinearMap.ext (fun x => ?_))
  simp only [LinearEquiv.coe_trans, LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [expOEquiv_apply, expOEquiv_apply, expOEquiv_apply, ← expOLin_apply, ← expOLin_apply,
    ← expOLin_apply, expOLin_comm_flow_apply D' E' h]

-- W8 non-vacuity: the product law on a concrete commuting pair (D'=E'=0)
theorem expOLin_comm_flow_zero (x : O Cut) :
    expOLin (0 : Module.End Cut (O Cut)) (expOLin (0 : Module.End Cut (O Cut)) x)
      = expOLin ((0 : Module.End Cut (O Cut)) + 0) x :=
  expOLin_comm_flow_apply 0 0 (Commute.all 0 0) x

#print axioms derivMatrix_mul
#print axioms derivMatrix_add
#print axioms derivMatrix_commute
#print axioms commute_of_lie_zero
#print axioms expOLin_comm_flow_apply
#print axioms expOLin_comm_flow
#print axioms expOLin_comm_flow_comm
#print axioms expOEquiv_comm_flow
#print axioms expOLin_comm_flow_zero

end

end Phys.Algebra
