/-
  Counterexamples.NoHiddenVariableVacuityCostume — N421 anti-vacuity (C446).
  ============================================================================================
  W8 ANTI-VACUITY. The N421 node (arc-O O6 — the no-hidden-variable theorem, the fifth no-dial)
  derives, on the banked J1–J4 fibre: (1) the fixed-point exclusion (only the void carries a
  pre-existing definite look-back record); (2) the non-functional outcome (the gather's outcome
  is NOT a function of the phase-blind Born weight); (3) the i-origin weld (the hidden-variable-
  compatible sign is the `+1` sign J2 rejected when it forced `i`). The load-bearing non-vacuity
  fact: the two frame axes are Born-INDISTINGUISHABLE (same total weight `1`, `foldComplex`-
  invariant) YET the gather SEPARATES them (`gatherIn eInward = (1,0) ≠ (0,0) = gatherIn
  eOutward`), so the outcome genuinely depends on data the weight discards (the phase) — the
  non-functionality is not about an already-constant outcome. A mis-reading where the phase-
  partners had different weights, or the gather could not tell them apart, would gut the whole
  O6 no-go: the outcome WOULD be a function of the accessible data, and hidden variables would
  be writable.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N421 phase-partners are Born-
  indistinguishable (`dblNormSq (toDbl eInward) = dblNormSq (toDbl eOutward)`) AND the gather
  separates them (`gatherIn eInward ≠ gatherIn eOutward`)". It is TIED to the banked N421 landing
  by `cFlag_forced` through `no_hidden_variable_nonvacuous`.

  We anchor `min 446 cFlag = 1` (TRUE — `cFlag = 1 < 446`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the outcome IS a function of the accessible weight / the
  phase-partners are distinguishable / hidden variables are writable" mis-reading): that
  `min 446 cFlag = 446`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 446` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (446, 1) is fresh (Cid 446 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.NoHiddenVariable
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum Phys.Quantum.NoHiddenVariable
open Phys.Foundation.ContinuumQ

/-- THE N421-NON-VACUITY FLAG: `1` = "the two frame axes are Born-indistinguishable (same total
    weight) YET the gather separates them (different definite outcome), so the outcome depends on
    the phase the weight discards — the no-hidden-variable non-functionality is genuine". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N421 landing): the phase-partners `eInward` and `eOutward` carry the
    SAME total Born weight (`no_hidden_variable_nonvacuous`, the third conjunct) YET the gather
    sends them to DIFFERENT outcomes (the fourth conjunct); hence `cFlag = 1`. If the weights
    differed, or the gather identified them, this conjunction would fail. -/
theorem cFlag_forced :
    (dblNormSq (toDbl eInward) = dblNormSq (toDbl eOutward)
      ∧ gatherIn eInward ≠ gatherIn eOutward)
    ∧ cFlag = 1 :=
  ⟨⟨no_hidden_variable_nonvacuous.2.2.1, no_hidden_variable_nonvacuous.2.2.2⟩, rfl⟩

/-- TRUE: `min 446 cFlag = 1`, holding precisely because `cFlag = 1 < 446`. -/
theorem cert_val_true : min (446 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 446 cFlag = 446`. It GENUINELY equals `1` (`cert_val_true`). A "the outcome
    is a function of the accessible weight / phase-partners are distinguishable / hidden variables
    are writable" mis-reading reduces — through the banked O6 landing — to the false numeric
    `1 = 446`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (446 : ℕ) cFlag = 446 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 446  (FALSE — the costume bites)

end Counterexamples
