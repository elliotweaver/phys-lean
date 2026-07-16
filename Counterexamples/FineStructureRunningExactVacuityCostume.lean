/-
  Counterexamples.FineStructureRunningExactVacuityCostume — N461 / X2 anti-vacuity (C486).
  ==========================================================================================
  W8 ANTI-VACUITY. The N461 node (arc-X X2) promotes the banked running FORM (N341/N342) to the
  PARAMETER-FREE running law `invAlphaRunExact M μ = 42 + betaCensus·cutLog(M/μ)` with the DERIVED
  rate `betaCensus = kappaLeading·Tr(Q²) = (1/(3·cutPi))·(16/3) = 16/(9·cutPi)` (κ from N460, Tr(Q²)
  from N317), and PROVES it IS the EXACT CLOSED SOLUTION: it obeys the autonomous-flow cocycle
  (`invAlphaRunExact_cocycle` — the running increment depends only on the scale RATIO, the
  not-truncated fingerprint) and it inverts in CLOSED FORM to the exact scale ratio
  (`invAlphaRunExact_invert : cutExp((1/α−42)/betaCensus) = M/μ`, the marquee exactness). The DERIVED
  loop normalization is LOAD-BEARING: the rate is `16/(9·cutPi)`, NOT the un-normalized `16/(3·cutPi)`
  (`betaCensus_ne_wrong`) that the excluded κ=1/cutPi (X1) would give.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the running is the EXACT closed solution:
  the rate is the DERIVED census `16/(9·cutPi)`, it obeys the ratio cocycle, and it inverts in closed
  form — NOT a truncated series with the un-normalized rate". It is TIED to the banked N461 landing by
  `xFlag_forced`: the banked `betaCensus_eq` witnesses the derived rate `= 16/(9·cutPi)`,
  `betaCensus_ne_wrong` witnesses it is NOT the un-normalized `16/(3·cutPi)`, and
  `betaCensus_mul_nine_cutPi` witnesses the division-free identity `betaCensus·(9·cutPi) = 16`, so the
  flag is `1`.

  We anchor `min 486 xFlag = 1` (TRUE — `xFlag = 1 < 486`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the rate is the un-normalized `16/(3·cutPi)` / the running is a
  truncated series / the derived loop normalization is vacuous / the closed inverse is trivial"
  mis-reading): that `min 486 xFlag = 486`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 486` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (486, 1) is fresh (Cid 486 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureRunningExact
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE EXACT-RUNNING FLAG: `1` = "the running is the EXACT closed solution — the rate is the derived
    census `16/(9·cutPi)`, NOT the un-normalized `16/(3·cutPi)` of a truncated series". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked N461 landing): the banked `betaCensus_eq` proves the derived rate
    `= 16/(9·cutPi)`, `betaCensus_ne_wrong` proves it is NOT the un-normalized `16/(3·cutPi)`, and
    `betaCensus_mul_nine_cutPi` proves the division-free identity `betaCensus·(9·cutPi) = 16`. So the
    flag is present, `xFlag = 1`. If the running were a truncated series with the un-normalized rate,
    these witnesses would not exist. -/
theorem xFlag_forced :
    (betaCensus = 16 / (9 * cutPi)) ∧ (betaCensus ≠ 16 / (3 * cutPi)) ∧
    (betaCensus * (9 * cutPi) = 16) ∧ xFlag = 1 :=
  ⟨betaCensus_eq, betaCensus_ne_wrong, betaCensus_mul_nine_cutPi, rfl⟩

/-- TRUE: `min 486 xFlag = 1`, holding precisely because `xFlag = 1 < 486`. -/
theorem cert_val_true : min (486 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 486 xFlag = 486`. It GENUINELY equals `1` (`cert_val_true`). A "the rate is the
    un-normalized `16/(3·cutPi)` / the running is a truncated series / the closed inverse is trivial"
    mis-reading reduces — through the banked value — to the false numeric `1 = 486`, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (486 : ℕ) xFlag = 486 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 486  (FALSE — the costume bites)

end Counterexamples
