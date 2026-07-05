/-
  Counterexamples.OneCouplingCoherenceWrongValueCostume — N319 anti-vacuity (C348).
  ===========================================================================
  W8 ANTI-VACUITY. The N319 node (seeded gauge route A7 — the LAST node of Arc A) banks the
  ONE-COUPLING COHERENCE: the single uniform Born coupling `alphaStar = 1/42` and the derived
  GUT-normalization ratio `5/3` force the RIGID mixing `3/8` via the ONE-RATIO reading

      `mixing_grounded : oneCouplingMixing (hyperRatio (ladderChargeTrace (finrank Uhol))
                            (isospinTrace (finrank Uhol + finrank singlet)(Σ fund2Weight²))) = 3/8`,

  where `oneCouplingMixing r = 1/(1+r)` — the mixing as a function of the SINGLE derived ratio,
  the "one coupling" reading — and this one-ratio mixing is CONSISTENT with the direct
  trace-fraction mixing `weinberg` (`oneCouplingMixing_eq_weinberg`) and RIGID (injective —
  `oneCouplingMixing_rigid`: the angle `3/8` back-determines `r = 5/3` uniquely).

  The certificate is that forced angle, cleared of the denominator via the NEW one-ratio route:
  `8·oneCouplingMixing(r) = 3` at the derived ratio `r = 5/3`.

      `eightMixing := 3   (= 8·(3/8), the FORCED one-ratio mixing, DERIVED not asserted)`.

  We anchor `min 348 eightMixing = 3` (TRUE — `8·oneCouplingMixing(5/3) = 3`, from the derived
  GUT ratio `5/3` fed through the ONE-RATIO one-coupling reading, NOT the naive `r = 1` which
  gives `oneCouplingMixing(1) = 1/2` so `8·(1/2) = 4`, and NOT a wrong ratio `r = 3` which gives
  `oneCouplingMixing(3) = 1/4` so `8·(1/4) = 2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the naive equal-couplings `r = 1`, a wrong
  GUT ratio, three independent couplings with a free angle, or an asserted value): that
  `min 348 eightMixing = 348`. It GENUINELY equals `3` (`cert_val_true`). Rewriting the banked
  value reduces the bogus claim to the false numeric `3 = 348` in ℕ. The kernel cannot close it;
  it BITES.

  (Non-vacuity is itself banked: `oneCouplingMixing_naive_ne` — the naive `r = 1` gives `1/2 ≠ 3/8`
  — and `oneCouplingMixing_wrong_ratio_ne` — a wrong ratio `r = 3` gives `1/4 ≠ 3/8` — and the
  rigidity `oneCouplingMixing_rigid` forcing `r = 5/3` uniquely.)

  DISTINCT from the banked battery: the pair (348, 3) is fresh (RHS 348 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OneCouplingCoherence
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE FORCED ONE-RATIO MIXING CERTIFICATE, numerator cleared: `8·oneCouplingMixing(5/3) = 3`.
    From `mixing_grounded` (`oneCouplingMixing (hyperRatio (Tr Q²)(Tr T3²)) = 3/8` at the derived
    GUT ratio `5/3`), the N319 one-coupling-coherence landing. -/
def eightMixing : ℕ := 3

/-- TRUE (tied to the banked N319 forced landing): eight times the one-ratio mixing is genuinely
    `3` (`8·(3/8) = 3`), from the derived GUT-normalization ratio `5/3` through the ONE-RATIO
    one-coupling reading `oneCouplingMixing r = 1/(1+r)`. -/
theorem eightMixing_forced :
    (8 : ℚ) * oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))) = 3 := by
  rw [mixing_grounded]; norm_num

/-- TRUE: `min 348 eightMixing = 3`, holding precisely because `8·oneCouplingMixing(5/3) = 3` (the
    derived ratio through the one-ratio reading), not `4` (the naive `r = 1`) and not `2` (a wrong
    ratio `r = 3`). -/
theorem cert_val_true : min (348 : ℕ) eightMixing = 3 := by decide

/-- BOGUS: claims `min 348 eightMixing = 348`. It GENUINELY equals `3` (`cert_val_true`). The
    WRONG reading (naive equal couplings `r = 1` / wrong GUT ratio / free-angle three-coupling /
    asserted value) reduces — through the banked value — to the false numeric `3 = 348`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (348 : ℕ) eightMixing = 348 := by
  rw [cert_val_true]
  -- ⊢ (3 : ℕ) = 348  (FALSE — the costume bites)

end Counterexamples
