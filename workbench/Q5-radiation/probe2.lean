import Mathlib.Tactic
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.Measurement
import Phys.Algebra.CosmicFateEternalApproach

open Phys.Quantum Phys.Algebra
open Phys.Foundation.ContinuumQ

namespace ProbeRad2

noncomputable def nullForm (p : StateFibre) : Cut := p.1 * p.2
noncomputable def radGather (p : StateFibre) : StateFibre := gatherIn p

/-! ## The WELD to the banked J4 gather + the discarded incoming weight. -/

/-- The retarded gather IS the banked J4 gatherIn — definitional (not a bare ∧). -/
theorem radGather_eq_gatherIn (p : StateFibre) : radGather p = gatherIn p := rfl

/-- ★ IDEMPOTENT (repeatability): `radGather ∘ radGather = radGather` (banked `gatherIn_idem`). -/
theorem radGather_idem (p : StateFibre) : radGather (radGather p) = radGather p :=
  gatherIn_idem p

/-- THE INCOMING WEIGHT that the retarded gather discards — the banked Born self-overlap of the
    complementary (outgoing-killed) component `gatherOut`, `wOut`. -/
noncomputable def discardedWeight (p : StateFibre) : Cut := wOut p

/-- ★ the discarded incoming weight is `p.2²` (banked `wOut_eq`). -/
theorem discardedWeight_eq (p : StateFibre) : discardedWeight p = p.2 ^ 2 :=
  wOut_eq p

/-- ★ [W8] non-vacuity: the discarded incoming weight is GENUINELY NONZERO on a state with an
    incoming component (e.g. `eOutward`) — the gather really destroys something. -/
theorem discardedWeight_nonvacuous : discardedWeight eOutward = 1 := by
  rw [discardedWeight_eq]; simp [eOutward]

/-- ★★ THE CROSS FACT (never co-stated): the retarded gather is real-blind to the coherence
    between the two null halves (banked `coherence_real_blind`) AND that coherence is genuinely
    nonzero before the gather (banked `coherence_diag`). The forward gather discards a real
    interference; the reverse would have to recreate it. -/
theorem radGather_discards_real_coherence :
    (∀ p : StateFibre, bornForm (radGather p) (gatherOut p) = 0)
      ∧ coherence (eInward + eOutward) = 1 :=
  ⟨fun p => coherence_real_blind p, coherence_diag⟩

/-! ## THE C6 TIE: the discarded weight, as the initial gap of the eternal-approach flow,
    is never recovered (an un-gather = reaching gap 0 = C6-forbidden). -/

/-- ★★ THE C6-FORBIDDEN UN-GATHER: treat the discarded incoming weight of a state with a genuine
    incoming component as the (positive) initial gap `g₀` of the banked eternal-approach flow
    `coherenceGap` (N383). Then at every finite `t` the gap is STRICTLY POSITIVE (banked
    `heat_death_never_reached`) — the discarded weight is NEVER driven to 0. Recovering it (the
    advanced/un-gather) would be the fixed point the fold's self-blindness forbids. -/
theorem discarded_weight_never_recovered (lam t : Cut) :
    0 < coherenceGap (discardedWeight eOutward) lam t := by
  rw [discardedWeight_nonvacuous]
  exact heat_death_never_reached 1 lam t one_pos

/-- ★★ the un-gather (reaching the recovered fixed point, gap 0) is forbidden at every finite
    epoch for a positive discarded weight (banked `fixed_point_unreachable`). -/
theorem ungather_forbidden (g₀ lam t : Cut) (hg : 0 < g₀) (hl : 0 < lam) :
    -lam * coherenceGap g₀ lam t ≠ 0 :=
  fixed_point_unreachable g₀ lam t hg hl

end ProbeRad2
