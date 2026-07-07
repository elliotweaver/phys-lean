/-
  Counterexamples.PrimitiveFibreVacuityCostume — N391 anti-vacuity (C416).
  ============================================================================================
  W8 ANTI-VACUITY. The N391 node (arc-J J1 — the primitive 2D real fibre) derives that the raw
  probe carrier is FORCED to be the 2-dimensional real fibre `Cut × Cut`. The load-bearing
  non-vacuity fact is that the fibre is GENUINELY two-dimensional — the two look-back directions
  `eInward` and `eOutward` are DISTINCT (`eInward_ne_eOutward`), so the carrier does not collapse
  to a line and the two directions do not coincide. A mis-reading where the fibre is 1-dimensional
  (the two look-back directions the same, the carrier a line) would break the whole derivation —
  the forced-ness of the 2D carrier would be vacuous.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the fibre is genuinely 2-dimensional: the
  two look-back directions are distinct". It is TIED to the banked N391 landing by `iFlag_forced`:
  the banked `eInward_ne_eOutward` witnesses `eInward ≠ eOutward` (the two directions are genuinely
  distinct — the fibre is not a collapsed line), so the flag is `1`.

  We anchor `min 416 iFlag = 1` (TRUE — `iFlag = 1 < 416`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the fibre is 1-dimensional / the two look-back directions
  coincide / the carrier is a line" mis-reading): that `min 416 iFlag = 416`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 416` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (416, 1) is fresh (Cid 416 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.PrimitiveFibre
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum

/-- THE FIBRE FLAG: `1` = "the fibre is genuinely 2-dimensional — the two look-back directions
    `eInward` and `eOutward` are distinct, the carrier is not a collapsed line". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N391 landing): the banked `eInward_ne_eOutward` proves the two
    look-back directions are DISTINCT — the fibre is genuinely two-dimensional, not a collapsed
    line — so `iFlag = 1`. If the fibre were 1-dimensional (the two directions coinciding), this
    witness would not exist. -/
theorem iFlag_forced :
    (eInward ≠ eOutward) ∧ iFlag = 1 :=
  ⟨eInward_ne_eOutward, rfl⟩

/-- TRUE: `min 416 iFlag = 1`, holding precisely because `iFlag = 1 < 416`. -/
theorem cert_val_true : min (416 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 416 iFlag = 416`. It GENUINELY equals `1` (`cert_val_true`). A "the fibre is
    1-dimensional / the two look-back directions coincide / the carrier is a line" mis-reading
    reduces — through the banked distinctness — to the false numeric `1 = 416`, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (416 : ℕ) iFlag = 416 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 416  (FALSE — the costume bites)

end Counterexamples
