/-
  PROBE AXIOMS (N357) — verify foundations-only on the core new theorems.
-/
import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def HasCovDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) (r : MetricEnd) : Prop :=
  ∃ dH : MetricEnd, HasOpDerivAt0 H dH ∧ r = dH + covTransport k (H 0)

theorem covDeriv_const (C k : MetricEnd) :
    HasCovDerivAt0 (fun _ => C) k (covTransport k C) := by
  refine ⟨0, const_opderiv _, ?_⟩; simp

theorem covDeriv_unique {H : Cut → MetricEnd} {k r₁ r₂ : MetricEnd}
    (h₁ : HasCovDerivAt0 H k r₁) (h₂ : HasCovDerivAt0 H k r₂) : r₁ = r₂ := by
  obtain ⟨d₁, hd₁, hr₁⟩ := h₁; obtain ⟨d₂, hd₂, hr₂⟩ := h₂
  rw [hr₁, hr₂, opderiv_unique hd₁ hd₂]

theorem metricField_covDeriv_zero (k : MetricEnd) :
    HasOpDerivAt0 (fun t => sigOpC + t • k) k
      ∧ k - (lbConnAdj k * sigOpC + sigOpC * lbConn k) = 0 := by
  refine ⟨affine_opderiv sigOpC k, ?_⟩
  rw [metricCompat]; abel

theorem cosmoTerm_covDeriv_zero (Λ : Cut) (k : MetricEnd) :
    HasOpDerivAt0 (fun t => (Λ • sigOpC) + t • (Λ • k)) (Λ • k)
      ∧ (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 := by
  refine ⟨affine_opderiv (Λ • sigOpC) (Λ • k), ?_⟩
  rw [metricCompat]; abel

#print axioms HasCovDerivAt0
#print axioms covDeriv_const
#print axioms covDeriv_unique
#print axioms metricField_covDeriv_zero
#print axioms cosmoTerm_covDeriv_zero

end

end Phys.Algebra
