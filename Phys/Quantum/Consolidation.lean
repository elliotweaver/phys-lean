/-
  Phys.Quantum.Consolidation — N396 (arc-J J6): ONE OPERATOR, ONE CAUSE — the
  consolidation of arc J (the foundations of quantum mechanics) + the arc-K handoff.
  ===========================================================================
  THE SIXTH AND LAST NODE OF ARC J. The whole quantum-mechanical face of physics —
  the primitive state space (J1, N391), the complex structure `i` (J2, N392), the
  Born rule (J3, N393), measurement / decoherence (J4, N394), and wave-particle
  duality / entanglement / the vacuum (J5, N395) — is the SAME derived Kähler
  geometry of the fold's 2D look-back fibre, driven by the SAME cause: the fold's
  self-blindness (C6, N1). One operator, one cause, one geometry — read through five
  physics names.

  ── WHY THIS IS NOT AN EMPTY-AND (the hollow-∧ trap, REJECTED — N390 standard) ──
  A bare conjunction of the five banked capstones (`fibre_forced`, `born_rule_derived`,
  `measurement_is_the_gather`, `j5_derived`) would derive NOTHING new. Instead this
  node banks THREE genuine NEVER-BANKED cross-ties — shared objects/numbers welding
  two arc-J nodes together that no prior module's TYPE states:

    • WELD 1 — THE ONE OPERATOR. The complex structure `foldComplex` (= the banked
      cascade unit `J₂`, N2) that GENERATES the wave face `ω` (J3:
      `kahlerForm x y = bornForm (foldComplex x) y`) is the SAME phase the Born
      weight is BLIND to (J4): the Born modulus-square over the derived complex
      algebra is INVARIANT under applying the fibre's own complex structure,
      `|toDbl(J p)|² = |toDbl p|²` (`bornWeight_foldComplex_invariant`). J3's phase
      generator and J4's discarded phase are ONE operator. No prior TYPE welds them.

    • WELD 2 — THE ONE VACUUM. Two INDEPENDENT trunk facts pick out the SAME state.
      Born POSITIVITY (J1: `bornForm p p = 0 ↔ p = 0`, N391 positive-definiteness)
      and self-blindness C6 (J2/J5: `foldComplex p = p ↔ p = 0`, the unique
      look-back fixed point) are DIFFERENT properties — one metric, one dynamical —
      yet `bornForm p p = 0 ↔ foldComplex p = p` (`null_iff_self_blind`): the
      Born-null state IS the self-blind fixed state. The vacuum's positivity face and
      its self-blindness face coincide. No prior TYPE welds them.

    • WELD 3 — THE ONE ω (duality = decoherence). The transition probability between
      the two MEASUREMENT outcome components (J4) is EXACTLY the discarded coherence
      SQUARED (J5's WAVE face), `bornProb (gatherIn p) (gatherOut p) = coherence p²`
      (`outcome_prob_is_coherence_sq`): the interference the gather throws away (J4
      decoherence) IS the pure-wave overlap of duality's two faces (J5). The particle
      face between the outcomes vanishes (`coherence_real_blind`); all the probability
      is carried by `ω`. Duality (J5) and decoherence (J4) are the one Kähler form
      read twice. No prior TYPE welds them.

  ── THE ONE CAUSE, spelled ── The fold is self-look-back; its self-blindness (C6,
  N1: the look-back has no nonzero fixed point) is the SINGLE engine. It FORCES the
  complex sign (J2: `+e₁` gives a fixed point, forbidden ⇒ `J(e₂) = −e₁`), and it
  SINGLES OUT the unique vacuum (J5: `foldComplex p = p ↔ p = 0`). Via WELD 2 the
  SAME vacuum is the Born-positivity-null state. The SAME `foldComplex` (via WELD 1)
  is the phase the Born weight discards, and (via WELD 3) the wave face whose square
  is the discarded interference. One self-blindness → the complex structure → the
  Kähler form → the Born rule → measurement → duality/entanglement/the vacuum.

  WHAT IS BANKED HERE (forward, foundations-only):
    bornWeight_foldComplex_invariant — ★ WELD 1: J3's ω-generator IS J4's discarded phase.
    null_iff_self_blind              — ★ WELD 2: Born-null ↔ self-blind fixed (one vacuum).
    outcome_prob_is_coherence_sq     — ★ WELD 3: outcome overlap = discarded coherence² (one ω).
    outcome_prob_diag                — [W8] the welded outcome overlap is `1 ≠ 0` (non-vacuity).
    duality_is_decoherence_split     — the two duality faces = kept/discarded measurement split.
    vacuum_two_characterizations     — the vacuum, via all three of its banked characterizations.
    arc_J_consolidation              — ★★ THE CAPSTONE: the three welds + the representative
                                       banked landings of J1–J5, over the concrete banked objects.

  GRADE: CONSOLIDATION (assembly of banked theorems into three never-banked cross-ties
  over the concrete banked objects). No numerical claim. The IDENTIFICATION that this
  derived Kähler geometry IS quantum mechanics is the arc's architectural reading
  (physics-words-removable prose), never a load-bearing theorem; the three welds are
  full theorems.

  physics-words-removable (docs/STANDARD.md §2): delete "quantum / Born / measurement /
  decoherence / duality / entanglement / vacuum / wave / particle" — the theorems stand
  as pure statements about the banked 2D carrier `StateFibre`: the modulus-square
  `dblNormSq ∘ toDbl` is invariant under the banked operator `foldComplex`; the banked
  form `bornForm` is self-null exactly where `foldComplex` fixes the vector; and the
  banked `bornProb` of the two frame-component projections of a vector equals the square
  of the banked `kahlerForm` of those projections (with their `bornForm` overlap `0`).
  No theorem STATEMENT needs a physics word to be true.

  NOT free-floating (docs/STANDARD.md §3): every type mentions the banked derived
  objects — `foldComplex`/`J₂`, `bornForm`, `kahlerForm`, `bornProb`, `toDbl`/`dblNormSq`
  over `Dbl Cut`, `gatherIn`/`gatherOut`/`coherence`, `StateFibre` over the derived ℝ
  `Cut` — none generic.

  ℝ-vigilance (docs/STANDARD.md §3): only the BANKED derived ℝ `Cut` + the banked
  fold/cascade/fibre objects. No Mathlib `Real` / `Complex` as content.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.

  Successor: ONE directed child → `SEED_QFT_DYNAMICS.md` target K1 (unitarity from
  monad idempotency — the S-matrix / QFT dynamics, on the banked colour-singlet sheaves
  with the derived Born-square amplitudes).
-/
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement
import Phys.Quantum.Composite

namespace Phys.Quantum.ArcJConsolidation

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum
open scoped TensorProduct

/-! ## §1 — WELD 1: THE ONE OPERATOR (ω-generator = discarded phase). -/

/-- ★★★ WELD 1 — THE ONE OPERATOR. The complex structure `foldComplex` (= the banked
    cascade complex unit `J₂`, N2) plays two jobs that J3 and J4 stated separately:
      (J3) it GENERATES the wave face `ω`: `kahlerForm x y = bornForm (foldComplex x) y`;
      (J4) it is the phase the Born weight is BLIND to.
    Here they are welded: the Born modulus-square over the derived complex algebra
    `Dbl Cut` is INVARIANT under applying the fibre's own complex structure,
    `|toDbl (foldComplex p)|² = |toDbl p|²`. The generator of the phase and the phase
    the weight discards are ONE operator. (Proof: `foldComplex` IS multiplication by
    `Dbl.J` on `toDbl` (J3 `toDbl_foldComplex`), and the modulus-square is `Dbl.J`-
    invariant (J4 `totalWeight_phase_blind`).) No prior module's TYPE welds them. -/
theorem bornWeight_foldComplex_invariant (p : StateFibre) :
    dblNormSq (toDbl (foldComplex p)) = dblNormSq (toDbl p) := by
  rw [toDbl_foldComplex]; exact totalWeight_phase_blind p

/-! ## §2 — WELD 2: THE ONE VACUUM (Born-null = self-blind fixed). -/

/-- ★★★ WELD 2 — THE ONE VACUUM. Two INDEPENDENT trunk facts single out the SAME state:
      (J1) Born POSITIVITY — `bornForm p p = 0 ↔ p = 0` (positive-definiteness, N391);
      (J2/J5) SELF-BLINDNESS C6 — `foldComplex p = p ↔ p = 0` (the unique look-back
              fixed point, `vacuum_unique_J_fixed`).
    These are different properties — one metric, one dynamical — yet the Born-null
    state IS the self-blind fixed state: `bornForm p p = 0 ↔ foldComplex p = p`. The
    vacuum's positivity face and its self-blindness face coincide. No prior TYPE welds
    them. -/
theorem null_iff_self_blind (p : StateFibre) :
    bornForm p p = 0 ↔ foldComplex p = p := by
  rw [vacuum_unique_zero p, ← vacuum_unique_J_fixed p]

/-- The vacuum through ALL THREE of its banked characterizations at once: the void
    state `0` is the unique Born-null state, the unique `foldComplex`-fixed state, AND
    the unique zero of the raw self-overlap — one state, three faces. -/
theorem vacuum_two_characterizations (p : StateFibre) :
    (bornForm p p = 0 ↔ p = foldVacuum) ∧
    (foldComplex p = p ↔ p = foldVacuum) ∧
    (bornForm p p = 0 ↔ foldComplex p = p) :=
  ⟨vacuum_unique_zero p, vacuum_unique_J_fixed p, null_iff_self_blind p⟩

/-! ## §3 — WELD 3: THE ONE ω (wave-particle duality = decoherence). -/

/-- The two faces of the ONE complex overlap between the two measurement outcome
    components: the WAVE face is the discarded coherence, the PARTICLE face vanishes.
    Duality's kept/discarded split (J5) IS the measurement's kept/discarded split (J4). -/
theorem duality_is_decoherence_split (p : StateFibre) :
    waveFace (gatherIn p) (gatherOut p) = coherence p ∧
      particleFace (gatherIn p) (gatherOut p) = 0 :=
  ⟨rfl, coherence_real_blind p⟩

/-- ★★★ WELD 3 — THE ONE ω. The transition probability between the two MEASUREMENT
    outcome components (J4 `gatherIn`/`gatherOut`) is EXACTLY the discarded coherence
    SQUARED (J5's WAVE face `ω`): `bornProb (gatherIn p) (gatherOut p) = coherence p²`.
    The interference the gather throws away (J4 decoherence) IS the pure-wave overlap
    of duality's two faces (J5) — the particle (real) face vanishes
    (`coherence_real_blind`), so all the probability is carried by `ω`. Wave-particle
    duality and decoherence are the one Kähler form `ω` read twice. No prior TYPE welds
    them. -/
theorem outcome_prob_is_coherence_sq (p : StateFibre) :
    bornProb (gatherIn p) (gatherOut p) = (coherence p) ^ 2 := by
  rw [born_two_faces]
  rw [(duality_is_decoherence_split p).1, (duality_is_decoherence_split p).2]
  ring

/-! ## §4 — W8 NON-VACUITY: the welds genuinely bite (tie the C421 costume). -/

/-- ★ [W8] NON-VACUITY of WELD 3. On the diagonal superposition `eInward + eOutward`
    the welded outcome overlap is `1 ≠ 0`: there is GENUINE interference for the gather
    to discard, so duality = decoherence is not a statement about an already-zero
    quantity. A "duality and decoherence are unrelated / the discarded coherence is
    vacuously zero" mis-reading would give `0 ≠ 1`. -/
theorem outcome_prob_diag :
    bornProb (gatherIn (eInward + eOutward)) (gatherOut (eInward + eOutward)) = 1 := by
  rw [outcome_prob_is_coherence_sq, coherence_diag]; ring

/-! ## §5 — ★★★ THE ARC-J CAPSTONE: quantum mechanics as ONE derived-object statement. -/

/-- ★★★ THE ARC-J CONSOLIDATION (the whole quantum-mechanics arc as one statement, over
    the banked derived objects). The five faces of quantum mechanics are the SAME derived
    Kähler geometry of the fold's 2D look-back fibre, driven by the SAME self-blindness:

      J1 (state space) — the raw carrier is the forced 2D real fibre (`fibre_finrank = 2`);
      J2 (complex `i`) — `foldComplex² = −id` (the complex unit, sign forced by C6);
      ONE OPERATOR (J3↔J4, WELD 1) — the ω-generator `foldComplex` IS the phase the Born
        weight discards (`|toDbl(J p)|² = |toDbl p|²`);
      J3 (Born rule) — the transition probability IS the self-overlap of the amplitude
        (`bornProb = g² + ω²`, retiring the trunk primitive);
      J4 (measurement) — the gather resolves Unity idempotently (`μ ∘ μ = μ`) with the
        Born weights conserved (`wIn + wOut = g(p,p)`);
      ONE ω (J4↔J5, WELD 3) — the discarded interference between outcomes IS the pure-wave
        overlap `bornProb (gatherIn p) (gatherOut p) = coherence p²`;
      J5 (entanglement) — the composite `bell` is NOT any product (`bell_not_product`);
      ONE VACUUM (J1↔J2, WELD 2) — the Born-null state IS the self-blind fixed state
        (`bornForm p p = 0 ↔ foldComplex p = p`).

    THE ONE CAUSE: the fold's self-blindness (C6, N1) forces the complex sign AND singles
    out the vacuum; the one complex structure `foldComplex` runs the phase, the wave face,
    and the discarded coherence. Quantum mechanics is the derived Kähler geometry of the
    fold's 2D look-back fibre. -/
theorem arc_J_consolidation (p : StateFibre) (a b : StateFibre) :
    -- J1: the state space is the forced 2D real fibre.
    (finrank ContinuumQ.Cut StateFibre = 2)
    -- J2: the complex unit (sign forced by self-blindness).
    ∧ (foldComplex (foldComplex p) = -p)
    -- WELD 1 (ONE OPERATOR): the ω-generator IS the discarded phase.
    ∧ (dblNormSq (toDbl (foldComplex p)) = dblNormSq (toDbl p))
    -- J3: the Born rule (probability = self-overlap of the amplitude).
    ∧ (bornProb a b =
        bornForm (bornForm a b, kahlerForm a b) (bornForm a b, kahlerForm a b))
    -- J4: measurement — the gather resolves Unity, idempotent, conserving.
    ∧ (gatherIn p + gatherOut p = p)
    ∧ (totalGather (totalGather p) = totalGather p)
    ∧ (wIn p + wOut p = bornForm p p)
    -- WELD 3 (ONE ω): the discarded interference IS the pure-wave outcome overlap.
    ∧ (bornProb (gatherIn p) (gatherOut p) = (coherence p) ^ 2)
    -- J5: entanglement — `bell` is not any product.
    ∧ (¬ ∃ x y : StateFibre, bell = x ⊗ₜ y)
    -- WELD 2 (ONE VACUUM): Born-null ↔ self-blind fixed.
    ∧ (bornForm p p = 0 ↔ foldComplex p = p) := by
  refine ⟨fibre_finrank, foldComplex_sq p, bornWeight_foldComplex_invariant p,
    bornProb_eq_self_overlap_of_amplitude a b, gather_resolves_unity p,
    totalGather_idem p, outcome_weights_sum p, outcome_prob_is_coherence_sq p,
    bell_not_product, null_iff_self_blind p⟩

end Phys.Quantum.ArcJConsolidation
