import Phys.Algebra.LorentzContinuumRealClosed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- sanity: finite dimensionality of STVC
example : Module.Finite Cut STVC := by infer_instance
example : FiniteDimensional Cut STVC := by infer_instance

-- application unfolding of the quadratic operator
example (g : Module.End Cut STVC) (b c : Cut) (v : STVC) :
    (g*g + b•g + c•(1:Module.End Cut STVC)) v = g (g v) + b • (g v) + c • v := by
  simp [LinearMap.add_apply, LinearMap.mul_apply, LinearMap.smul_apply, LinearMap.one_apply]

-- obligation 1: the EvC quadratic-form identity
theorem selfadj_negDisc_quad_apply_form {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (b c : Cut) (v : STVC) :
    EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v
      = EvC (g v) (g v) + b * EvC (g v) v + c * EvC v v := by
  have happ : (g*g + b•g + c•(1:Module.End Cut STVC)) v = g (g v) + b • (g v) + c • v := by
    simp [LinearMap.add_apply, LinearMap.mul_apply, LinearMap.smul_apply, LinearMap.one_apply]
  rw [happ, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left]
  rw [hg (g v) v]

-- obligation 2: the discriminant key — strict positivity
theorem selfadj_negDisc_quad_pos {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) {v : STVC} (hv : v ≠ 0) :
    0 < EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v := by
  rw [selfadj_negDisc_quad_apply_form hg b c v]
  set α := EvC (g v) (g v) with hαdef
  set β := EvC (g v) v with hβdef
  set γ := EvC v v with hγdef
  have hγpos : 0 < γ :=
    lt_of_le_of_ne (EvC_nonneg v) (fun h => hv ((EvC_eq_zero_iff v).mp h.symm))
  -- Cauchy–Schwarz via the nonneg reference form on  γ•(g v) − β•v
  have hcs : β^2 ≤ α * γ := by
    have hnn : 0 ≤ EvC (γ • (g v) - β • v) (γ • (g v) - β • v) := EvC_nonneg _
    rw [EvC_sub_left, EvC_sub_right, EvC_sub_right,
        EvC_smul_left, EvC_smul_left, EvC_smul_right, EvC_smul_right,
        EvC_smul_left, EvC_smul_right] at hnn
    rw [EvC_symm v (g v)] at hnn
    -- hnn : 0 ≤ γ*(γ*α) - γ*(β*β) - β*(γ*β) + β*(β*γ)   (modulo the symm rewrites)
    nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc, sq_nonneg (2*β + b*γ),
    mul_pos (show (0:Cut) < 4*c - b^2 by linarith) (mul_pos hγpos hγpos)]

-- obligation 3: injective
theorem selfadj_negDisc_quad_injective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Injective (g*g + b•g + c•(1:Module.End Cut STVC)) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv0
  by_contra hvne
  have hpos := selfadj_negDisc_quad_pos hg hdisc hvne
  rw [hv0, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

-- obligation 4: bijective on the finite-dim STVC
theorem selfadj_negDisc_quad_bijective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Bijective (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  ⟨selfadj_negDisc_quad_injective hg hdisc,
   LinearMap.injective_iff_surjective.mp (selfadj_negDisc_quad_injective hg hdisc)⟩

end

end Phys.Algebra
