import Phys.Algebra.LorentzContinuumRealFactor
import Phys.Algebra.LorentzContinuumReseed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

variable {W : Submodule Cut STVC}

/-- Symmetry predicate for an operator on a submodule w.r.t. the AMBIENT EvC on coercions. -/
def IsEvCSymmSub (T : Module.End Cut W) : Prop :=
  ∀ p q : W, EvC ((T p : STVC)) ((q : STVC)) = EvC ((p : STVC)) ((T q : STVC))

/-- Coercion of the operator-quadratic applied to `v`. -/
theorem subQuad_apply_coe (T : Module.End Cut W) (b c : Cut) (v : W) :
    (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC)
      = (T (T v) : STVC) + b • ((T v : STVC)) + c • ((v : STVC)) := by
  have happ : (T*T + b•T + c•(1:Module.End Cut W)) v = T (T v) + b • T v + c • v := by
    simp [LinearMap.add_apply, Module.End.mul_apply, LinearMap.smul_apply, Module.End.one_apply]
  rw [happ]
  push_cast
  ring

/-- The reference-form value on the diagonal. -/
theorem subQuad_form {T : Module.End Cut W} (hT : IsEvCSymmSub T) (b c : Cut) (v : W) :
    EvC (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC) ((v : STVC))
      = EvC ((T v : STVC)) ((T v : STVC)) + b * EvC ((T v : STVC)) ((v : STVC))
        + c * EvC ((v : STVC)) ((v : STVC)) := by
  rw [subQuad_apply_coe, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left, hT (T v) v]

/-- ★★ STRICT POSITIVITY: for `b² < 4c`, `IsEvCSymmSub T`, `v ≠ 0`. -/
theorem subQuad_pos {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) {v : W} (hv : v ≠ 0) :
    0 < EvC (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC) ((v : STVC)) := by
  rw [subQuad_form hT b c v]
  have hvne : ((v : STVC)) ≠ 0 := by
    intro h; exact hv (Subtype.ext (by rw [h]; rfl))
  have hγpos : 0 < EvC ((v : STVC)) ((v : STVC)) :=
    lt_of_le_of_ne (EvC_nonneg _) (fun h => hvne ((EvC_eq_zero_iff _).mp h.symm))
  have hsymm : EvC ((v : STVC)) ((T v : STVC)) = EvC ((T v : STVC)) ((v : STVC)) :=
    EvC_symm _ _
  have hnn : 0 ≤ EvC ((EvC ((v:STVC)) ((v:STVC))) • ((T v : STVC)) - (EvC ((T v:STVC)) ((v:STVC))) • ((v:STVC)))
                    ((EvC ((v:STVC)) ((v:STVC))) • ((T v : STVC)) - (EvC ((T v:STVC)) ((v:STVC))) • ((v:STVC))) :=
    EvC_nonneg _
  simp only [EvC_sub_left, EvC_sub_right, EvC_smul_left, EvC_smul_right, hsymm] at hnn
  have hcs : (EvC ((T v:STVC)) ((v:STVC)))^2 ≤ EvC ((T v:STVC)) ((T v:STVC)) * EvC ((v:STVC)) ((v:STVC)) := by
    nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc, sq_nonneg (2 * EvC ((T v:STVC)) ((v:STVC)) + b * EvC ((v:STVC)) ((v:STVC))),
    mul_pos (show (0:Cut) < 4*c - b^2 by linarith) (mul_pos hγpos hγpos)]

/-- INJECTIVE. -/
theorem subQuad_injective {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Injective (T*T + b•T + c•(1:Module.End Cut W)) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv0
  by_contra hvne
  have hpos := subQuad_pos hT hdisc hvne
  rw [hv0] at hpos
  simp only [ZeroMemClass.coe_zero, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

/-- A UNIT of `Module.End Cut W` (finite-dim ⟹ injective ⟹ bijective ⟹ unit). -/
theorem subQuad_isUnit [Module.Finite Cut W] {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit (T*T + b•T + c•(1:Module.End Cut W)) :=
  (Module.End.isUnit_iff _).mpr
    ⟨subQuad_injective hT hdisc,
     LinearMap.injective_iff_surjective.mp (subQuad_injective hT hdisc)⟩

/-- `aeval T (X² + C b·X + C c) = T*T + b•T + c•1`. -/
theorem subAeval_quad_eq (T : Module.End Cut W) (b c : Cut) :
    (aeval T) (X^2 + C b * X + C c) = T*T + b•T + c•(1:Module.End Cut W) := by
  rw [map_add, map_add, map_mul, map_pow, aeval_X, aeval_C, aeval_C,
      Module.algebraMap_end_eq_smul_id, Module.algebraMap_end_eq_smul_id]
  simp only [sq, smul_mul_assoc, LinearMap.id_comp, Module.End.mul_eq_comp, Module.End.one_eq_id]

theorem subAeval_quad_isUnit [Module.Finite Cut W] {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit ((aeval T) (X^2 + C b * X + C c)) := by
  rw [subAeval_quad_eq]; exact subQuad_isUnit hT hdisc

/-- No pure neg-disc-quadratic charpoly. -/
theorem subSelfadj_no_pure_quad_charpoly [Module.Finite Cut W] {T : Module.End Cut W}
    (hT : IsEvCSymmSub T)
    (qs : List (Cut × Cut)) (hdisc : ∀ p ∈ qs, p.1^2 < 4*p.2)
    (hfact : T.charpoly = (qs.map (fun p => X^2 + C p.1 * X + C p.2)).prod) :
    False := by
  have hCH : (aeval T) T.charpoly = 0 := T.aeval_self_charpoly
  have hUnit : IsUnit ((aeval T) T.charpoly) := by
    rw [hfact, map_list_prod, List.map_map]
    apply isUnitListProd
    intro x hx
    rw [List.mem_map] at hx
    obtain ⟨p, hp, rfl⟩ := hx
    exact subAeval_quad_isUnit hT (hdisc p hp)
  rw [hCH] at hUnit
  exact not_isUnit_zero hUnit

/-- ★★★ THE SUBMODULE REAL-EIGENVALUE SEED: every `EvC`-symmetric operator on a finite-dim
    submodule `W ≤ STVC` has a REAL eigenvalue. The parity-free seed the existence induction needs. -/
theorem submodule_selfadj_has_eigenvalue [Module.Finite Cut W] {T : Module.End Cut W}
    (hT : IsEvCSymmSub T) :
    ∃ μ : Cut, T.HasEigenvalue μ := by
  by_contra hno
  push_neg at hno
  have hnoroot : ∀ μ : Cut, ¬ T.charpoly.IsRoot μ := by
    intro μ hμ
    exact hno μ ((Module.End.hasEigenvalue_iff_isRoot_charpoly T μ).mpr hμ)
  obtain ⟨qs, hqsdisc, hqsprod⟩ := cut_no_root_factors_negDisc T.charpoly_monic hnoroot
  exact subSelfadj_no_pure_quad_charpoly hT qs hqsdisc hqsprod

end

end Phys.Algebra
