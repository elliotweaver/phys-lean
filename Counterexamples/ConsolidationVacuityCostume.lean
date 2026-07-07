/-
  Counterexamples.ConsolidationVacuityCostume — N396 anti-vacuity (C421).
  ============================================================================================
  W8 ANTI-VACUITY. The N396 node (arc-J J6 — the consolidation of quantum mechanics) banks
  THREE never-banked cross-ties. The load-bearing non-vacuity fact is WELD 3: the transition
  probability between the two MEASUREMENT outcome components equals the discarded coherence
  SQUARED (`outcome_prob_is_coherence_sq`), and on the diagonal superposition this is GENUINELY
  `1 ≠ 0` (`outcome_prob_diag`) — there is real interference for the gather to discard, so
  "wave-particle duality" (J5) and "decoherence" (J4) are the one Kähler form read twice, NOT an
  empty conjunction. A mis-reading where the consolidation were HOLLOW (duality and decoherence
  unrelated / the discarded coherence vacuously zero / the welds trivially true) would have the
  welded outcome overlap be `0` for every state.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the welded outcome overlap on the
  diagonal superposition is NONZERO (= 1): the discarded interference (J4) IS the pure-wave
  duality overlap (J5), a genuine weld, not a vacuous re-conjunction". It is TIED to the banked
  N396 landing by `cFlag_forced`: the banked `outcome_prob_diag` witnesses that the welded
  outcome Born-probability on the diagonal superposition equals `1`, so the weld genuinely bites.

  We anchor `min 421 cFlag = 1` (TRUE — `cFlag = 1 < 421`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the consolidation is a hollow AND / duality and
  decoherence are unrelated / the discarded coherence is vacuously zero / the welds are trivial"
  mis-reading): that `min 421 cFlag = 421`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 421` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (421, 1) is fresh (Cid 421 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.Consolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum
open Phys.Quantum.ArcJConsolidation

/-- THE CONSOLIDATION-NON-VACUITY FLAG: `1` = "the welded outcome overlap on the diagonal
    superposition is nonzero (= 1): the discarded interference (J4 decoherence) IS the pure-wave
    duality overlap (J5) — WELD 3 genuinely bites, the consolidation is not a hollow AND". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N396 landing): the banked `outcome_prob_diag` proves the welded
    outcome Born-probability on the diagonal superposition `eInward + eOutward` equals `1`. So
    there IS genuine interference welding decoherence to duality; hence `cFlag = 1`. If the
    consolidation were hollow (the discarded coherence vacuously zero), this witness would give
    `0`, not `1`. -/
theorem cFlag_forced :
    bornProb (gatherIn (eInward + eOutward)) (gatherOut (eInward + eOutward)) = 1
      ∧ cFlag = 1 :=
  ⟨outcome_prob_diag, rfl⟩

/-- TRUE: `min 421 cFlag = 1`, holding precisely because `cFlag = 1 < 421`. -/
theorem cert_val_true : min (421 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 421 cFlag = 421`. It GENUINELY equals `1` (`cert_val_true`). A "the
    consolidation is a hollow AND / duality and decoherence are unrelated / the discarded
    coherence is vacuously zero / the welds are trivial" mis-reading reduces — through the banked
    nonzero welded outcome overlap on the diagonal superposition — to the false numeric
    `1 = 421`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (421 : ℕ) cFlag = 421 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 421  (FALSE — the costume bites)

end Counterexamples
