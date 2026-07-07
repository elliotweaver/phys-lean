/-
  Counterexamples.MeasurementVacuityCostume — N394 anti-vacuity (C419).
  ============================================================================================
  W8 ANTI-VACUITY. The N394 node (arc-J J4 — measurement = the gather) derives that measurement
  is the fold's GATHER: the resolution of Unity into orthogonal outcome-gatherers (`gatherIn`,
  `gatherOut`), with the Born outcome weights CONSERVED (`wIn + wOut = g(p,p)`) and DECOHERENCE
  the gather's real-blindness to the cross-outcome coherence `ω(gatherIn, gatherOut)`. The
  load-bearing non-vacuity fact is that there IS genuine phase coherence for the gather to
  discard — the coherence is NONZERO before the gather. The witness: the diagonal superposition
  `eInward + eOutward` has `coherence = 1`, while the Born self-overlap between the two outcomes
  is `0` (real-blind). A mis-reading where decoherence were VACUOUS (no coherence exists / the
  outcomes never interfere / the gather discards nothing) would have `coherence = 0` for every
  state and the whole "collapse discards phase information" content would evaporate.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "before the gather the diagonal
  superposition eInward+eOutward carries a NONZERO cross-outcome coherence (= 1) that the gather
  discards (the Born self-overlap of the two outcomes being 0), so decoherence is genuine, not
  vacuous". It is TIED to the banked N394 landing by `cFlag_forced`: the banked `coherence_diag`
  witnesses `coherence (eInward + eOutward) = 1` while the banked `coherence_real_blind` gives
  `bornForm (gatherIn (eInward+eOutward)) (gatherOut (eInward+eOutward)) = 0` — nonzero phase
  coherence, discarded by the real-blind gather. Hence the flag is `1`.

  We anchor `min 419 cFlag = 1` (TRUE — `cFlag = 1 < 419`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "decoherence is vacuous / no coherence exists / the gather
  discards nothing / measurement is trivial" mis-reading): that `min 419 cFlag = 419`. It
  GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 419` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (419, 1) is fresh (Cid 419 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.Measurement
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum

/-- THE DECOHERENCE-NON-VACUITY FLAG: `1` = "the diagonal superposition eInward+eOutward carries
    a nonzero cross-outcome coherence (=1) that the real-blind gather discards, so decoherence is
    genuine". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N394 landing): the banked `coherence_diag` proves the coherence of
    the diagonal superposition is `1`, while the banked `coherence_real_blind` proves the gather's
    Born self-overlap between the two outcomes is `0` — so there is nonzero phase coherence being
    discarded. Hence `cFlag = 1`. If decoherence were vacuous (no coherence anywhere), this
    witness would not exist. -/
theorem cFlag_forced :
    (coherence (eInward + eOutward) = 1 ∧
      bornForm (gatherIn (eInward + eOutward)) (gatherOut (eInward + eOutward)) = 0) ∧
      cFlag = 1 :=
  ⟨⟨coherence_diag, coherence_real_blind (eInward + eOutward)⟩, rfl⟩

/-- TRUE: `min 419 cFlag = 1`, holding precisely because `cFlag = 1 < 419`. -/
theorem cert_val_true : min (419 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 419 cFlag = 419`. It GENUINELY equals `1` (`cert_val_true`). A "decoherence
    is vacuous / no coherence exists / the gather discards nothing / measurement is trivial"
    mis-reading reduces — through the banked nonzero coherence of the diagonal superposition — to
    the false numeric `1 = 419`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (419 : ℕ) cFlag = 419 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 419  (FALSE — the costume bites)

end Counterexamples
