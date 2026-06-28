import Phys.Cascade.OctonionTopology
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.LorentzContinuumSpectralPath

namespace Phys.Algebra.N152Probe2

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

local instance endOpC : TopologicalSpace (Module.End Cut STVC) :=
  TopologicalSpace.induced (fun (g : Module.End Cut STVC) => (g : STVC → STVC)) inferInstance

theorem coe_cont : Continuous (fun (g : Module.End Cut STVC) => (g : STVC → STVC)) :=
  continuous_induced_dom

theorem eval_cont (v : STVC) : Continuous (fun (g : Module.End Cut STVC) => g v) :=
  (continuous_apply v).comp coe_cont

theorem cont_iff {X : Type*} [TopologicalSpace X] (f : X → Module.End Cut STVC) :
    Continuous f ↔ ∀ v, Continuous (fun x => (f x) v) := by
  rw [continuous_induced_rng, continuous_pi_iff]; rfl

-- THE HEART: per-vector evaluation continuity of the affine spectral path.
theorem specPathOp_eval_cont {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (v : STVC) :
    Continuous (fun t : Cut => (specPathOp c u t) v) := by
  have hrw : (fun t : Cut => (specPathOp c u t) v)
      = (fun t : Cut => ∑ i, (((1 - t) * 1 + t * cutSqrt (c i)) * EvC (u i) v) • u i) := by
    funext t; rw [specPathOp, specOpN_apply]
  rw [hrw]
  apply continuous_finset_sum
  intro i _
  apply Continuous.smul _ continuous_const
  fun_prop

-- FULL continuity of the path operator in the operator topology.
theorem specPathOp_cont {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) :
    Continuous (specPathOp c u) :=
  (cont_iff _).mpr (specPathOp_eval_cont c u)

-- CONNECTEDNESS payoff over the derived Cut.
theorem icc_preconn : IsPreconnected (Set.Icc (0:Cut) 1) := isPreconnected_Icc

-- The IMAGE of the path on Icc 0 1 is preconnected in the operator topology.
theorem specPathOp_image_preconnected {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) :
    IsPreconnected ((specPathOp c u) '' (Set.Icc (0:Cut) 1)) :=
  icc_preconn.image _ (specPathOp_cont c u).continuousOn

end

end Phys.Algebra.N152Probe2
