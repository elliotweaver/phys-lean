import Phys.Algebra.LorentzContinuumRealClosed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

-- bring the banked obligations into scope (mirror from probe)
theorem selfadj_negDisc_quad_apply_form {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (b c : Cut) (v : STVC) :
    EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v
      = EvC (g v) (g v) + b * EvC (g v) v + c * EvC v v := by
  have happ : (g*g + b•g + c•(1:Module.End Cut STVC)) v = g (g v) + b • (g v) + c • v := by
    simp [LinearMap.add_apply, Module.End.mul_apply, LinearMap.smul_apply, Module.End.one_apply]
  rw [happ, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left, hg (g v) v]

theorem selfadj_negDisc_quad_pos {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) {v : STVC} (hv : v ≠ 0) :
    0 < EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v := by
  rw [selfadj_negDisc_quad_apply_form hg b c v]
  have hγpos : 0 < EvC v v :=
    lt_of_le_of_ne (EvC_nonneg v) (fun h => hv ((EvC_eq_zero_iff v).mp h.symm))
  have hsymm : EvC v (g v) = EvC (g v) v := EvC_symm v (g v)
  have hnn : 0 ≤ EvC ((EvC v v) • (g v) - (EvC (g v) v) • v)
                    ((EvC v v) • (g v) - (EvC (g v) v) • v) := EvC_nonneg _
  simp only [EvC_sub_left, EvC_sub_right, EvC_smul_left, EvC_smul_right, hsymm] at hnn
  have hcs : (EvC (g v) v)^2 ≤ EvC (g v) (g v) * EvC v v := by nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc, sq_nonneg (2 * EvC (g v) v + b * EvC v v),
    mul_pos (show (0:Cut) < 4*c - b^2 by linarith) (mul_pos hγpos hγpos)]

theorem selfadj_negDisc_quad_injective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Injective (g*g + b•g + c•(1:Module.End Cut STVC)) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv0
  by_contra hvne
  have hpos := selfadj_negDisc_quad_pos hg hdisc hvne
  rw [hv0, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

theorem selfadj_negDisc_quad_isUnit {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  (Module.End.isUnit_iff _).mpr
    ⟨selfadj_negDisc_quad_injective hg hdisc,
     LinearMap.injective_iff_surjective.mp (selfadj_negDisc_quad_injective hg hdisc)⟩

-- the single-factor aeval bridge
theorem aeval_quad_eq {g : Module.End Cut STVC} (b c : Cut) :
    (aeval g) (X^2 + C b * X + C c) = g*g + b•g + c•(1:Module.End Cut STVC) := by
  rw [map_add, map_add, map_mul, map_pow, aeval_X, aeval_C, aeval_C,
      Module.algebraMap_end_eq_smul_id, Module.algebraMap_end_eq_smul_id]
  simp only [sq, smul_mul_assoc, LinearMap.id_comp, Module.End.mul_eq_comp, Module.End.one_eq_id]

-- each neg-disc quadratic factor is a UNIT in the End ring
theorem aeval_quad_isUnit {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit ((aeval g) (X^2 + C b * X + C c)) := by
  rw [aeval_quad_eq]; exact selfadj_negDisc_quad_isUnit hg hdisc

-- helper: product of units in a monoid is a unit (list form, works in the non-comm End ring)
theorem isUnit_list_prod {M : Type*} [Monoid M] (l : List M) (h : ∀ x ∈ l, IsUnit x) :
    IsUnit l.prod := by
  induction l with
  | nil => simp
  | cons a t ih =>
    rw [List.prod_cons]
    exact (h a List.mem_cons_self).mul (ih (fun x hx => h x (List.mem_cons_of_mem a hx)))

-- ★ THE CONDITIONAL EXISTENCE: a self-adjoint g CANNOT have its charpoly equal a PURE product of
-- neg-disc monic quadratics — Cayley–Hamilton forces aeval g charpoly = 0, but the product of the
-- unit factors is a unit, and 0 is not a unit on the nonzero STVC.
theorem selfadj_no_pure_quad_charpoly {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (qs : List (Cut × Cut)) (hdisc : ∀ p ∈ qs, p.1^2 < 4*p.2)
    (hfact : g.charpoly = (qs.map (fun p => X^2 + C p.1 * X + C p.2)).prod) :
    False := by
  have hCH : (aeval g) g.charpoly = 0 := g.aeval_self_charpoly
  have hUnit : IsUnit ((aeval g) g.charpoly) := by
    rw [hfact, map_list_prod, List.map_map]
    apply isUnit_list_prod
    intro x hx
    rw [List.mem_map] at hx
    obtain ⟨pp, hpp, rfl⟩ := hx
    exact aeval_quad_isUnit hg (hdisc pp hpp)
  rw [hCH] at hUnit
  exact not_isUnit_zero hUnit

end

end Phys.Algebra
