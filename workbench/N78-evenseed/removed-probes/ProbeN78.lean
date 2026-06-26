import Phys.Algebra.LorentzContinuumRealClosed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem selfadj_negDisc_quad_apply_form {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (b c : Cut) (v : STVC) :
    EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v
      = EvC (g v) (g v) + b * EvC (g v) v + c * EvC v v := by
  have happ : (g*g + b•g + c•(1:Module.End Cut STVC)) v = g (g v) + b • (g v) + c • v := by
    simp [LinearMap.add_apply, Module.End.mul_apply, LinearMap.smul_apply, Module.End.one_apply]
  rw [happ, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left]
  rw [hg (g v) v]

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
  have hcs : (EvC (g v) v)^2 ≤ EvC (g v) (g v) * EvC v v := by
    nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc,
    sq_nonneg (2 * EvC (g v) v + b * EvC v v),
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

theorem selfadj_negDisc_quad_bijective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Bijective (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  ⟨selfadj_negDisc_quad_injective hg hdisc,
   LinearMap.injective_iff_surjective.mp (selfadj_negDisc_quad_injective hg hdisc)⟩

-- the UNIT form the re-seeding/CH product consumes
theorem selfadj_negDisc_quad_isUnit {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  (Module.End.isUnit_iff _).mpr (selfadj_negDisc_quad_bijective hg hdisc)

-- non-vacuity: STVC is nontrivial, so the injective quadratic does NOT vanish on it (an injective
-- map on a nontrivial space is not the zero map — it sends some nonzero vector to a nonzero one).
theorem selfadj_negDisc_quad_ne_zero {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    (g*g + b•g + c•(1:Module.End Cut STVC)) ≠ 0 := by
  obtain ⟨v, hv⟩ := exists_ne (0 : STVC)
  intro hzero
  have hpos := selfadj_negDisc_quad_pos hg hdisc hv
  rw [hzero] at hpos
  simp only [LinearMap.zero_apply, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

-- concrete instance check: identity is EvC-symm; with b=0,c=1: id² + 1 invertible
example : IsEvCSymm (1 : Module.End Cut STVC) := by
  intro p q; simp [Module.End.one_apply]

end

end Phys.Algebra
