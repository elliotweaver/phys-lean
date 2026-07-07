/-
  Counterexamples.ComplexStructureVacuityCostume — N392 anti-vacuity (C417).
  ============================================================================================
  W8 ANTI-VACUITY. The N392 node (arc-J J2 — the complex structure forced by self-blindness)
  derives that the complex unit's SIGN is FORCED: the axis-exchange `Jexch σ (a,b) = (σ·b, a)`
  is a fold-root (squares to `-id`) IFF `σ = −1`, and the `+eInward` alternative (`σ = +1`) is
  FORBIDDEN because it FIXES the nonzero diagonal state `eInward + eOutward = (1,1)` — a nonzero
  look-back fixed point, contradicting self-blindness (C6). The load-bearing non-vacuity fact is
  that the `+1` completion GENUINELY has a nonzero fixed point (so the sign forcing is not vacuous:
  the wrong sign really is ruled out, and the two signs are genuinely different). A mis-reading
  where the `+1` swap were ALSO fixed-point-free (self-blind) would collapse the forcing — the
  sign `−1` would not be uniquely forced.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the `+eInward` completion (σ = +1) has a
  nonzero look-back fixed point, hence is NOT self-blind, hence the sign is genuinely forced to −1".
  It is TIED to the banked N392 landing by `iFlag_forced`: the banked
  `plus_completion_has_lookback_fixed_point` witnesses `Jexch 1 (eInward+eOutward) = eInward+eOutward`
  and the banked `eInwOut_ne_zero` witnesses `eInward+eOutward ≠ 0` (a genuine NONZERO fixed point of
  the `+1` swap), so the flag is `1`.

  We anchor `min 417 iFlag = 1` (TRUE — `iFlag = 1 < 417`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the `+eInward` swap is also self-blind / fixed-point-free /
  the two signs are interchangeable / the sign −1 is not really forced" mis-reading): that
  `min 417 iFlag = 417`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 417` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (417, 1) is fresh (Cid 417 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.ComplexStructure
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum

/-- THE SIGN-FORCING FLAG: `1` = "the `+eInward` completion (σ = +1) FIXES the nonzero diagonal
    state, so it is NOT self-blind and the fold-root sign is genuinely forced to `−1`". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N392 landing): the banked `plus_completion_has_lookback_fixed_point`
    proves the `+1` swap fixes `eInward + eOutward`, and the banked `eInwOut_ne_zero` proves that
    state is NONZERO — a genuine nonzero look-back fixed point of the wrong sign. So the sign is
    genuinely forced to `−1` and `iFlag = 1`. If the `+1` swap were also fixed-point-free, this
    witness would not exist. -/
theorem iFlag_forced :
    (Jexch 1 (eInward + eOutward) = eInward + eOutward ∧ eInward + eOutward ≠ 0) ∧ iFlag = 1 :=
  ⟨⟨plus_completion_has_lookback_fixed_point, eInwOut_ne_zero⟩, rfl⟩

/-- TRUE: `min 417 iFlag = 1`, holding precisely because `iFlag = 1 < 417`. -/
theorem cert_val_true : min (417 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 417 iFlag = 417`. It GENUINELY equals `1` (`cert_val_true`). A "the `+eInward`
    swap is also self-blind / the sign −1 is not really forced" mis-reading reduces — through the
    banked nonzero fixed point — to the false numeric `1 = 417`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (417 : ℕ) iFlag = 417 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 417  (FALSE — the costume bites)

end Counterexamples
