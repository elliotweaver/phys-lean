import Phys.Algebra.LorentzContinuumGivensWordExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/- L0: EvC preservation from EvC-orthogonality. -/
theorem evC_preserved_of_orth {k kadj : Module.End Cut STVC}
    (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id) :
    ∀ p q : STVC, EvC (k p) (k q) = EvC p q := by
  intro p q
  have e : kadj (k q) = q := by
    have := congrArg (fun f : Module.End Cut STVC => f q) horth
    simpa only [LinearMap.comp_apply, LinearMap.id_apply] using this
  rw [hadj p (k q), e]

/- L1: spatial image — a time-fixing EvC-orthogonal isometry sends (0,1,0) to (0,x',v'). -/
theorem evCOrth_xaxis_image_time_zero {k kadj : Module.End Cut STVC}
    (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    (k ((0:Cut), (1:Cut), (0:O Cut))).1 = 0 := by
  have hpres := evC_preserved_of_orth hadj horth
  have h := hpres ((1:Cut), (0:Cut), (0:O Cut)) ((0:Cut), (1:Cut), (0:O Cut))
  rw [htime] at h
  -- EvC (1,0,0) w = w.1 ; EvC (1,0,0) (0,1,0) = 0
  have lhs : EvC ((1:Cut), (0:Cut), (0:O Cut)) (k ((0:Cut), (1:Cut), (0:O Cut)))
      = (k ((0:Cut), (1:Cut), (0:O Cut))).1 := by
    unfold EvC; simp only; rw [gFormC_zero_left]; ring
  have rhs : EvC ((1:Cut), (0:Cut), (0:O Cut)) ((0:Cut), (1:Cut), (0:O Cut)) = 0 := by
    unfold EvC; simp only; rw [gFormC_zero_left]; ring
  rw [lhs, rhs] at h
  exact h

/- L2 THE CORE PEEL: IsQvIsomC k, x-axis moved off the pole (v'≠0) ⇒
   JoinedIdQvC (deflate · k) ⇒ JoinedIdQvC k. -/
theorem joinedIdQvC_peel_reduce {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    {x' : Cut} {v' : O Cut}
    (himg : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0)
    (hstab : JoinedIdQvC (deflateNinth x' v' * k)) :
    JoinedIdQvC k := by
  have hnorm : x' ^ 2 + gFormC v' v' = 1 := isom_xaxis_image_norm hk himg
  have hpos : 0 < gFormC v' v' := gFormC_pos_of_ne hv
  have hc : (1:Cut) + x' ≠ 0 := by
    intro h
    have hx : x' = -1 := by linarith
    rw [hx] at hnorm
    nlinarith [hnorm, hpos]
  have hinflate : JoinedIdQvC (inflateNinth x' v') := by
    unfold inflateNinth
    exact joinedIdQvC_axisRotLin _ (deflateNinth_axis_unit hv) x'
      (cutSqrt (gFormC v' v')) (inflateNinth_circle hv hnorm) hc
  rw [deflate_factorization hk himg hv]
  exact joinedIdQvC_mul hinflate hstab

end
end Phys.Algebra
