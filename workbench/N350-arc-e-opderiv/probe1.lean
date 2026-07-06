import Phys.Algebra.SpacetimeCurvatureScalar
import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Phys.Algebra.ProbeN350

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE 1: endOpC resolves as the topology on MetricEnd = Module.End Cut STVC
example : TopologicalSpace MetricEnd := endOpC

-- MEASURE 2: the Tendsto pointwise-reduction lemma for endOpC.
-- A family into operators tends to g in endOpC  ⟺  each per-vector evaluation tends to g v.
example {X : Type*} {l : Filter X} (f : X → MetricEnd) (g : MetricEnd) :
    Tendsto f l (𝓝 g) ↔ ∀ v, Tendsto (fun x => f x v) l (𝓝 (g v)) := by
  constructor
  · intro h v
    exact (endOpC_eval_continuous v).continuousAt.tendsto.comp h
  · intro h
    rw [nhds_induced, tendsto_comap_iff]
    rw [tendsto_pi_nhds]
    intro v
    exact h v

end

end Phys.Algebra.ProbeN350
