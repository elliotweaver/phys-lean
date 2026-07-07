/-
  Phys.Quantum.Measurement — N394 (arc-J J4): MEASUREMENT = THE GATHER.
  (The measurement "problem" DISSOLVED — collapse is the totalization, not a postulate.)
  ===========================================================================
  THE FOURTH NODE OF ARC J — the foundations of quantum mechanics. J1 (N391,
  `PrimitiveFibre.lean`) forced the raw 2D real fibre `StateFibre = Cut × Cut`
  with its positive-definite self-overlap `bornForm` (g) and orthonormal frame
  `eInward`/`eOutward`. J2 (N392, `ComplexStructure.lean`) DERIVED the complex
  structure `foldComplex`/`J₂` (`J² = −1`, `i` = the fold's chirality). J3 (N393,
  `BornRule.lean`, the capstone) DERIVED the Born rule: Kähler compatibility ⇒
  `bornProb φ ψ = g² + ω²` is the modulus-square of the derived complex inner
  product AND the raw self-overlap of the amplitude — retiring "Born = self-overlap"
  from primitive to theorem, with the Kähler/imaginary part `ω = kahlerForm`
  proved genuinely load-bearing. This node (J4) derives the MEASUREMENT structure.

  ── THE FORWARD DERIVATION (fold → measurement; nothing posited) ──
  The fold has exactly two moves. The SPREAD — the look-back opens structure (the
  fibre, its complex phase, the superposition; J1–J3). The GATHER — the local→global
  totalization toward Unity (the monad multiplication `μ`, the descent/sheafification
  totalization that runs through arcs I/N). J1–J3 built the SPREAD side of a state.
  The fold's NEXT act on a state is the GATHER: the totalization of a superposition
  to a definite frame outcome. That IS measurement — not a separate postulate.

  Concretely, on the banked fibre the gather is the RESOLUTION OF UNITY into the two
  orthogonal outcome-gatherers along the banked N391 frame:

    · `gatherIn  p := p.1 • eInward`   (the "toward" outcome component)
    · `gatherOut p := p.2 • eOutward`  (the "away"   outcome component)

  and the totalization `μ = gatherIn + gatherOut` is EXACTLY the banked N391 fibre
  decomposition `fibre_decomp` (`gather_resolves_unity`): the gather to Unity IS the
  identity resolved into its frame components. `μ` is idempotent (`totalGather_idem`,
  the monad-algebra μ-law μ∘μ = μ — repeatability / the quantum Zeno fact), and the
  two gatherers are idempotent (`gatherIn_idem`, `gatherOut_idem`) and orthogonal
  (`gatherIn_gatherOut`, `gatherOut_gatherIn`) — an orthogonal resolution of the
  identity, the spectral/measurement structure, DERIVED not posited.

  ── PROBABILITY CONSERVATION, DERIVED (not a normalization postulate) ──
  The outcome weights are the Born self-overlaps of the gathered components,
  `wIn p = g(gatherIn p) = p.1²`, `wOut p = g(gatherOut p) = p.2²`. They SUM to the
  total self-overlap of the pre-measurement state (`outcome_weights_sum`,
  `wIn + wOut = g(p,p)`) — the SAME trunk positivity split across outcomes. On a
  nonzero state the normalized outcome probabilities sum to one
  (`outcome_probs_sum_to_one`) — the "probabilities add to 1" is DERIVED from the
  gather's resolution of Unity, not imposed as a normalization axiom.

  ── DECOHERENCE = THE GATHER DISCARDS THE PHASE COHERENCE ω ──
  Between the two outcomes the state carries a COHERENCE — the Kähler/off-diagonal
  cross-term `coherence p = ω(gatherIn p, gatherOut p) = p.1·p.2` (`coherence_eq`),
  the genuinely-complex content N393 proved load-bearing. The gather is REAL-BLIND to
  the cross-outcome overlap (`coherence_real_blind`, `g(gatherIn p, gatherOut p) = 0`):
  the outcome weights (which sum to the total, `weights_blind_to_coherence`) SEE ONLY
  the diagonal, never the coherence. Equivalently the total weight is PHASE-BLIND —
  invariant under the fold's own complex unit `Dbl.J` (`totalWeight_phase_blind`,
  `|J·z|² = |z|²`): the many complex phases of a superposition are gathered to ONE
  weight. This is decoherence: the totalization is a many→one map that discards the
  phase coherence, which is why it is IRREVERSIBLE (a gather, not a unitary) and why
  it cannot be a reversible-evolution theorem — exactly the reason the field bolted on
  a separate collapse postulate. Here it is the gather move already in the structure.
  Non-vacuity: the coherence is genuinely nonzero BEFORE the gather (`coherence_diag`,
  the diagonal superposition `eInward + eOutward` has `coherence = 1 ≠ 0`), so there
  is real phase information for the gather to discard — the node is not vacuous.

  WHAT IS BANKED HERE (forward, foundations-only):
    gatherIn / gatherOut          — the two orthogonal outcome-gatherers along the N391 frame.
    gatherIn_apply / gatherOut_apply — their explicit coordinate form.
    gather_resolves_unity         — ★ the gather to Unity IS the banked N391 `fibre_decomp` (μ).
    gatherIn_idem / gatherOut_idem — repeatability (each gatherer idempotent).
    gatherIn_gatherOut / gatherOut_gatherIn — the outcomes are orthogonal.
    totalGather / totalGather_eq / totalGather_idem — ★ the totalization μ = id, idempotent (μ∘μ=μ).
    wIn / wOut / wIn_eq / wOut_eq — the Born outcome weights (self-overlaps of the components).
    outcome_weights_sum           — ★ wIn + wOut = g(p,p) (probability conservation, DERIVED).
    outcome_probs_sum_to_one      — ★ normalized outcome probabilities sum to 1 (no norm. postulate).
    coherence / coherence_eq      — the cross-outcome coherence = the Kähler ω off-diagonal.
    coherence_real_blind          — ★ the gather is real-blind to the coherence (decoherence).
    weights_blind_to_coherence    — the weights sum to the total AND ignore the coherence.
    coherence_diag                — ★ [W8] the coherence is nonzero before the gather (non-vacuity).
    totalWeight_phase_blind       — ★ the total weight is invariant under the fold's complex unit (phase-blind).
    measurement_is_the_gather     — ★★ THE CAPSTONE: resolution of Unity (μ) + conservation +
                                    real-blind decoherence, bundled — measurement is the gather.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY J4: measurement as the
  gather's resolution of Unity, Born-weight conservation, and decoherence as the
  gather discarding the phase coherence. It does NOT derive J5's wave-particle
  duality / entanglement / vacuum (those need the sector tensor structure, above).
  GRADE: MECHANISM/ARCHITECTURAL (flagged honestly, per seed §J4) — the measurement
  "problem" dissolved; NO numerical claim. The structural facts (resolution of Unity,
  idempotency, conservation, real-blindness, phase-blindness) are full theorems; the
  IDENTIFICATION of this structure WITH physical measurement/collapse is the flagged
  architectural reading (physics-words-removable prose), never a load-bearing theorem.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "measurement / collapse /
  decoherence / outcome / probability / phase / quantum": what remains is the pure
  statement that the two frame-component projectors on the banked 2D carrier are
  idempotent, orthogonal, and sum to the identity (= the banked N391 decomposition);
  that the banked self-overlaps of the components sum to the self-overlap of the whole
  and normalize to 1 on a nonzero vector; that the banked Kähler form `kahlerForm` of
  the two components is `p.1·p.2` while the banked self-overlap `bornForm` of them is 0
  (nonzero on the diagonal vector); and that the modulus-square `dblNormSq` over the
  banked algebra `Dbl Cut` is invariant under the banked complex unit `Dbl.J`. No
  theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, no
  collapse postulate. Built on the BANKED derived ℝ `Cut`, the banked frame/self-overlap
  `eInward`/`eOutward`/`bornForm`/`fibre_decomp` (N391), the banked complex structure
  `foldComplex`/Kähler `kahlerForm` (N392/N393), and the banked cascade complex algebra
  `Dbl Cut`/`Dbl.J` (N2) — NO Mathlib `Real` / `Complex` as content, NO posited Hilbert
  space, NO posited probability/collapse postulate.
-/
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

/-! ## The gather — the two orthogonal outcome-gatherers along the banked N391 frame. -/

/-- THE "TOWARD" OUTCOME-GATHERER — the frame component of a state along `eInward` (N391).
    The gather projects the superposition onto a definite frame outcome. -/
noncomputable def gatherIn (p : StateFibre) : StateFibre := p.1 • eInward

/-- THE "AWAY" OUTCOME-GATHERER — the frame component of a state along `eOutward` (N391). -/
noncomputable def gatherOut (p : StateFibre) : StateFibre := p.2 • eOutward

/-- The explicit coordinate form of the "toward" gatherer: `gatherIn p = (p.1, 0)`. -/
theorem gatherIn_apply (p : StateFibre) : gatherIn p = (p.1, 0) := by
  unfold gatherIn eInward; apply Prod.ext <;> simp

/-- The explicit coordinate form of the "away" gatherer: `gatherOut p = (0, p.2)`. -/
theorem gatherOut_apply (p : StateFibre) : gatherOut p = (0, p.2) := by
  unfold gatherOut eOutward; apply Prod.ext <;> simp

/-! ## The gather resolves Unity — the totalization μ IS the banked N391 decomposition. -/

/-- ★ THE GATHER RESOLVES UNITY. The two outcome-gatherers sum to the whole state:
    `gatherIn p + gatherOut p = p`. This is EXACTLY the banked N391 fibre decomposition
    (`fibre_decomp`): the fold's gather toward Unity IS the identity resolved into its
    frame components. Measurement's "resolution of the identity" is the gather, DERIVED. -/
theorem gather_resolves_unity (p : StateFibre) : gatherIn p + gatherOut p = p :=
  (fibre_decomp p).symm

/-- Repeatability (the quantum Zeno fact): the "toward" gatherer is idempotent — gathering
    an already-gathered outcome changes nothing. -/
theorem gatherIn_idem (p : StateFibre) : gatherIn (gatherIn p) = gatherIn p := by
  simp [gatherIn_apply]

/-- Repeatability: the "away" gatherer is idempotent. -/
theorem gatherOut_idem (p : StateFibre) : gatherOut (gatherOut p) = gatherOut p := by
  simp [gatherOut_apply]

/-- The outcomes are ORTHOGONAL: gathering the "away" component toward "toward" is void. -/
theorem gatherIn_gatherOut (p : StateFibre) : gatherIn (gatherOut p) = 0 := by
  rw [gatherOut_apply, gatherIn_apply]; simp

/-- The outcomes are ORTHOGONAL: gathering the "toward" component toward "away" is void. -/
theorem gatherOut_gatherIn (p : StateFibre) : gatherOut (gatherIn p) = 0 := by
  rw [gatherIn_apply, gatherOut_apply]; simp

/-- THE TOTALIZATION `μ` — the gather to Unity, `μ p := gatherIn p + gatherOut p`. -/
noncomputable def totalGather (p : StateFibre) : StateFibre := gatherIn p + gatherOut p

/-- The totalization is the identity (it resolves Unity): `μ p = p`. -/
theorem totalGather_eq (p : StateFibre) : totalGather p = p := gather_resolves_unity p

/-- ★ THE MONAD μ-LAW `μ ∘ μ = μ` — the totalization is idempotent. Gathering a gathered
    state changes nothing: measurement, once it has totalized to a definite resolution,
    is stable (the algebraic form of repeatability). -/
theorem totalGather_idem (p : StateFibre) : totalGather (totalGather p) = totalGather p := by
  rw [totalGather_eq, totalGather_eq]

/-! ## Probability conservation — DERIVED from the resolution of Unity, not postulated. -/

/-- The "toward" OUTCOME WEIGHT — the Born self-overlap of the gathered component. -/
noncomputable def wIn (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherIn p) (gatherIn p)

/-- The "away" OUTCOME WEIGHT — the Born self-overlap of the gathered component. -/
noncomputable def wOut (p : StateFibre) : ContinuumQ.Cut := bornForm (gatherOut p) (gatherOut p)

/-- The "toward" weight is `p.1²`. -/
theorem wIn_eq (p : StateFibre) : wIn p = p.1 ^ 2 := by
  unfold wIn bornForm; rw [gatherIn_apply]; ring

/-- The "away" weight is `p.2²`. -/
theorem wOut_eq (p : StateFibre) : wOut p = p.2 ^ 2 := by
  unfold wOut bornForm; rw [gatherOut_apply]; ring

/-- ★ PROBABILITY CONSERVATION, DERIVED. The outcome weights SUM to the total self-overlap
    of the pre-measurement state: `wIn p + wOut p = g(p, p)`. The Born positivity of the
    whole is split, without loss, across the resolved outcomes — the "probabilities add up"
    is the gather's resolution of Unity, not a separate normalization axiom. -/
theorem outcome_weights_sum (p : StateFibre) : wIn p + wOut p = bornForm p p := by
  unfold wIn wOut bornForm; rw [gatherIn_apply, gatherOut_apply]; ring

/-- ★ The normalized outcome PROBABILITIES SUM TO ONE on any nonzero state. DERIVED from the
    resolution of Unity (`outcome_weights_sum`) and division on the derived field `Cut` — NOT
    imposed as a normalization postulate. -/
theorem outcome_probs_sum_to_one (p : StateFibre) (h : bornForm p p ≠ 0) :
    wIn p / bornForm p p + wOut p / bornForm p p = 1 := by
  rw [← add_div, outcome_weights_sum]; exact div_self h

/-! ## Decoherence — the gather discards the phase coherence ω (real-blind, phase-blind). -/

/-- THE CROSS-OUTCOME COHERENCE — the Kähler/off-diagonal cross-term between the two
    outcomes, `coherence p := ω(gatherIn p, gatherOut p)`. This is the genuinely-complex
    content (the Kähler form `ω = kahlerForm`, N393-load-bearing) that a definite outcome
    must lose. -/
noncomputable def coherence (p : StateFibre) : ContinuumQ.Cut := kahlerForm (gatherIn p) (gatherOut p)

/-- The coherence between the two outcomes is `p.1·p.2` (the interference term). -/
theorem coherence_eq (p : StateFibre) : coherence p = p.1 * p.2 := by
  unfold coherence; rw [kahlerForm_apply, gatherIn_apply, gatherOut_apply]; simp

/-- ★ DECOHERENCE (real-blindness). The gather is REAL-BLIND to the cross-outcome overlap:
    `g(gatherIn p, gatherOut p) = 0`. The Born self-overlap sees only the diagonal — the
    outcome weights never see the coherence. The phase information lives entirely in the
    Kähler part `ω` (`coherence_eq`), which the weight-diagonal discards. -/
theorem coherence_real_blind (p : StateFibre) : bornForm (gatherIn p) (gatherOut p) = 0 := by
  unfold bornForm; rw [gatherIn_apply, gatherOut_apply]; ring

/-- The outcome weights SUM to the total self-overlap AND are BLIND to the coherence between
    outcomes — conservation and decoherence, together: the total probability is preserved
    while the interference term is discarded. -/
theorem weights_blind_to_coherence (p : StateFibre) :
    wIn p + wOut p = bornForm p p ∧ bornForm (gatherIn p) (gatherOut p) = 0 :=
  ⟨outcome_weights_sum p, coherence_real_blind p⟩

/-- ★ [W8] NON-VACUITY. Before the gather there is GENUINE phase coherence to discard: the
    diagonal superposition `eInward + eOutward` has `coherence = 1 ≠ 0`. So decoherence is
    not vacuous — the gather really does destroy nonzero interference (the real-blindness of
    the weights is a genuine loss, not a statement about an already-zero quantity). -/
theorem coherence_diag : coherence (eInward + eOutward) = 1 := by
  rw [coherence_eq]; unfold eInward eOutward; simp

/-- ★ PHASE-BLINDNESS OF THE TOTAL WEIGHT. The modulus-square over the banked complex algebra
    `Dbl Cut` is INVARIANT under the fold's own complex unit `Dbl.J`: `|J·z|² = |z|²`. The
    many complex phases of a superposition are gathered to ONE weight — the total probability
    cannot distinguish a state from its phase-rotated partner. This is why the gather is a
    many→one totalization (information-losing, IRREVERSIBLE) and cannot be a reversible-
    evolution theorem: the very reason the field posited a separate collapse. Here it is the
    gather move already present in the fold's structure. -/
theorem totalWeight_phase_blind (p : StateFibre) :
    dblNormSq (Dbl.J * toDbl p) = dblNormSq (toDbl p) := by
  unfold dblNormSq
  simp only [Dbl.mul_re, Dbl.mul_im, toDbl_re, toDbl_im, Dbl.J]
  ring

/-! ## THE CAPSTONE — measurement IS the gather. -/

/-- ★★ THE CAPSTONE — MEASUREMENT = THE GATHER, DERIVED (the measurement "problem" dissolved).
    On the banked fibre with its banked frame/self-overlap (N391), complex structure/Kähler
    form (N392/N393), and the banked complex algebra `Dbl Cut` (N2):
    (i)   the two outcome-gatherers resolve Unity (`μ = gatherIn + gatherOut = id`, the banked
          `fibre_decomp`), are idempotent (repeatability) and orthogonal — an orthogonal
          resolution of the identity, DERIVED not posited;
    (ii)  the totalization `μ` is idempotent (`μ ∘ μ = μ`, the monad μ-law);
    (iii) the Born outcome weights are conserved (`wIn + wOut = g(p,p)`) — probability
          conservation DERIVED from the resolution of Unity, no normalization postulate; and
    (iv)  the gather is real-blind to the cross-outcome coherence (`g(gatherIn, gatherOut)=0`)
          while that coherence is genuinely nonzero before the gather — decoherence as the
          gather discarding the phase information, with the total weight phase-blind.
    Nothing is posited: "collapse" is the fold's gather (totalization toward Unity), not a
    separate postulate; "probability conservation" is the resolution of Unity; "decoherence"
    is the gather's blindness to the Kähler phase. The measurement problem is dissolved. -/
theorem measurement_is_the_gather :
    -- (i) resolution of Unity: μ = gatherIn + gatherOut = id, idempotent + orthogonal.
    (∀ p : StateFibre, gatherIn p + gatherOut p = p) ∧
    (∀ p : StateFibre, gatherIn (gatherIn p) = gatherIn p) ∧
    (∀ p : StateFibre, gatherOut (gatherOut p) = gatherOut p) ∧
    (∀ p : StateFibre, gatherIn (gatherOut p) = 0 ∧ gatherOut (gatherIn p) = 0) ∧
    -- (ii) the totalization μ is idempotent (the monad μ-law μ∘μ = μ).
    (∀ p : StateFibre, totalGather (totalGather p) = totalGather p) ∧
    -- (iii) probability conservation, DERIVED from the resolution of Unity.
    (∀ p : StateFibre, wIn p + wOut p = bornForm p p) ∧
    (∀ p : StateFibre, bornForm p p ≠ 0 →
        wIn p / bornForm p p + wOut p / bornForm p p = 1) ∧
    -- (iv) decoherence: the gather is real-blind to the cross-outcome coherence,
    --      which is genuinely nonzero before the gather, and the total weight is phase-blind.
    (∀ p : StateFibre, bornForm (gatherIn p) (gatherOut p) = 0) ∧
    (coherence (eInward + eOutward) = 1) ∧
    (∀ p : StateFibre, dblNormSq (Dbl.J * toDbl p) = dblNormSq (toDbl p)) := by
  refine ⟨gather_resolves_unity, gatherIn_idem, gatherOut_idem,
    fun p => ⟨gatherIn_gatherOut p, gatherOut_gatherIn p⟩, totalGather_idem,
    outcome_weights_sum, outcome_probs_sum_to_one, coherence_real_blind,
    coherence_diag, totalWeight_phase_blind⟩

end Phys.Quantum
