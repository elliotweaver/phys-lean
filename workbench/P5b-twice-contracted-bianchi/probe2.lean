import Phys.Algebra.SpacetimeDivergence

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def IsBvCSkew (M : MetricEnd) : Prop := ∀ p q : STVC, BvC (M p) q + BvC p (M q) = 0

def IsBvCSymmOp (M : MetricEnd) : Prop := ∀ p q : STVC, BvC (M p) q = BvC p (M q)

theorem bvc_lbConn_left (k : MetricEnd) (p q : STVC) :
    BvC ((lbConn k) p) q = (2⁻¹ : Cut) * EvC (k p) q := by
  unfold lbConn
  rw [LinearMap.smul_apply, Module.End.mul_apply]
  rw [show BvC ((2⁻¹ : Cut) • sigOpC (k p)) q = (2⁻¹ : Cut) * BvC (sigOpC (k p)) q by
    rw [← BvC_smul_left, ← map_smul]]
  rw [BvC_eq_EvC_sigOpC, sigOpC_isEvCAdjoint_self (k p) (sigOpC q),
    ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

theorem bvc_lbConn_right (k : MetricEnd) (p q : STVC) :
    BvC p ((lbConn k) q) = (2⁻¹ : Cut) * EvC p (k q) := by
  rw [BvC_symm, bvc_lbConn_left, EvC_symm]

end

end Phys.Algebra
