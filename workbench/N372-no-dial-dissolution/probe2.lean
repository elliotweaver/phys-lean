import Phys.Algebra.FoldPotentialCriticality
import Phys.Algebra.StrongCPTheta
import Mathlib.Tactic

/-! N372 probe2 — the NEW content: rigidity teeth + the abstract "one shape" lemma. -/

namespace Phys.Foundation.ContinuumQ

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

/-! ### THE ABSTRACT "ONE SHAPE": a Born self-overlap square has its zero pinned; a dial displaces it. -/

-- A self-overlap square is ≥ 0 with a UNIQUE zero at the self-blind point s=0, and any additive
-- dial Λ₀ displaces the value there to Λ₀ (nonzero iff Λ₀≠0). This is the common shape.
theorem probe_selfOverlap_zero_iff (s : Cut) : s ^ 2 = 0 ↔ s = 0 := by
  constructor
  · intro h; exact pow_eq_zero_iff (by norm_num) |>.mp h
  · intro h; rw [h]; ring

theorem probe_dial_displaces (s Λ₀ : Cut) : s ^ 2 + Λ₀ = Λ₀ ↔ s = 0 := by
  constructor
  · intro h; have : s ^ 2 = 0 := by linarith
    exact (probe_selfOverlap_zero_iff s).mp this
  · intro h; rw [h]; ring

-- THE Λ-RIGIDITY: the fold vacuum energy at closure vanishes iff there is no additive dial.
theorem probe_lambda_rigidity (c Λ₀ : Cut) : plateauApproachPot c 0 + Λ₀ = 0 ↔ Λ₀ = 0 := by
  rw [show plateauApproachPot c 0 = 0 from by
        unfold plateauApproachPot; rw [mul_zero, neg_zero, cutExp_zero]; ring]
  constructor <;> intro h <;> linarith

-- THE HIERARCHY-RIGIDITY (no free m²): the curvature at the min is FORCED to the UNIQUE value 2c²
-- (by derivative-uniqueness) — there is no independent m² to dial.
theorem probe_mass_unique (c : Cut) (hc : c ≠ 0) (m2 : Cut)
    (h : CutHasDerivAt (foldPotentialDeriv c) m2 0) : m2 = 2 * c ^ 2 :=
  h.unique (foldPotential_secondDeriv_origin c hc)

-- THE S_init IDENTIFICATION (flagged): the coherence gap at the self-blind origin is zero — the
-- initial distortion vanishes (blank slate). Weakest leg: this is g(0)=0, an identification.
theorem probe_blank_origin (c : Cut) : foldCoherenceGap c 0 = 0 := by
  unfold foldCoherenceGap; rw [mul_zero, neg_zero, cutExp_zero]; ring

end Phys.Foundation.ContinuumQ
