import Phys.Algebra.LorentzContinuumOperatorTopology
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- GLUE 1: RIGHT-multiplication by a fixed operator h is continuous in endOpC.
-- (g * h)(v) = g(h v) = eval of g at (h v), which is continuous. TRIVIAL in pointwise topology.
example (h : Module.End Cut STVC) :
    Continuous (fun g : Module.End Cut STVC => g * h) := by
  rw [endOpC_continuous_iff]
  intro v
  -- (g*h) v = g (h v)
  have hrw : (fun g : Module.End Cut STVC => (g * h) v) = (fun g => g (h v)) := by
    funext g; rfl
  rw [hrw]
  exact endOpC_eval_continuous (h v)

-- GLUE 2: compose a continuous path with right-mult by fixed h: t ↦ γ(t) * h continuous.
example (h : Module.End Cut STVC) (γ : Cut → Module.End Cut STVC) (hγ : Continuous γ) :
    Continuous (fun t => γ t * h) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun t => (γ t * h) v) = (fun t => (γ t) (h v)) := by funext t; rfl
  rw [hrw]
  rw [endOpC_continuous_iff] at hγ
  exact hγ (h v)

-- GLUE 3 (harder?): LEFT-multiplication by fixed k.  (k*g)(v) = k(g v).
-- need k continuous as STVC→STVC. Is every Cut-linear End of finite-dim STVC continuous?
example (k : Module.End Cut STVC) :
    Continuous (fun g : Module.End Cut STVC => k * g) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun g : Module.End Cut STVC => (k * g) v) = (fun g => k (g v)) := by
    funext g; rfl
  rw [hrw]
  -- k ∘ (eval at v); need Continuous (k : STVC → STVC)
  sorry

end
end Phys.Algebra
