import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! Measure the ABSTRACT ½-mechanism of the twice-contracted Bianchi.

  Standard derivation (index form, contracting the second Bianchi with g^{ac}g^{bd}):
    ∇_e R_{abcd} + ∇_c R_{abde} + ∇_d R_{abec} = 0        (cyclic in e,c,d)
  Double metric-trace (a↔c via g^{ac}, b↔d via g^{bd}):
    term1 → ∇_e R          (scalar-curvature gradient)
    term2 → ∇^a Ric_{ae}   (divergence)
    term3 → ∇^a Ric_{ae}   (SAME as term2 by pair symmetry)
  ⇒ ∇_e R + 2·∇^a Ric_{ae} = 0 (with sign conventions ∇_e R = 2 ∇^a Ric_{ae}),
  i.e. the ½: ∇^μ Ric_{μν} = ½ ∇_ν R.

  The ½ = "1 term → gradient, 2 terms → divergence (equal)". Model this combinatorial split
  abstractly with scalar witnesses to confirm the arithmetic, then it is grounded by identifying
  gradTerm = ∇_ν R and divTerm = ∇^μ Ric_μν from the banked traces. -/

/-- THE COMBINATORIAL ½: if a cyclic-3 sum vanishes and, upon double contraction, one term equals
    the scalar-curvature gradient `gradTerm` and the OTHER TWO both equal the divergence `divTerm`,
    then `divTerm = ½ · gradTerm` — provided the overall contracted identity reads
    `gradTerm - divTerm - divTerm = 0` (the sign pattern of the metric contraction: the gradient
    term positive, the two Ricci-divergence terms negative and equal). -/
theorem half_from_two_of_three (gradTerm divTerm : Cut)
    (hcyclic : gradTerm - divTerm - divTerm = 0) :
    divTerm = (2⁻¹ : Cut) * gradTerm := by
  have h : gradTerm = 2 * divTerm := by linarith [hcyclic]
  rw [h]; ring

/-- Sanity: the ½ is genuinely load-bearing — a coefficient ≠ ½ fails the cyclic identity for a
    nonzero gradient. -/
theorem half_load_bearing_arith (gradTerm : Cut) (hg : gradTerm ≠ 0) (c : Cut)
    (hcyc : gradTerm - (c * gradTerm) - (c * gradTerm) = 0) : c = (2⁻¹ : Cut) := by
  have : gradTerm * (1 - 2 * c) = 0 := by ring_nf; linarith [hcyc]
  rcases mul_eq_zero.mp this with h | h
  · exact absurd h hg
  · linarith [h]

end

end Phys.Algebra
