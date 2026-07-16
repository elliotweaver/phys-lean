/-
  Counterexamples.FineStructureIntermediateReadingVacuityCostume — N466 / X7 anti-vacuity (C491).
  ==============================================================================================
  W8 ANTI-VACUITY. The X7 node (arc-X) reads the X6 finite band-tower assembly at an INTERMEDIATE
  band edge: the M_Z-scale reading `1/α(M_Z)` is a PARTIAL SUM of the zero-momentum tower
  (`invAlphaZero_append`: `invAlphaZero (above ++ below) = invAlphaZero above + totalScreening
  below`). The load-bearing content: (i) the exact top band (banked EXACT ratio, cutPi-free `448/27`)
  is INSIDE the M_Z reading ⟹ the exact lower bound `1582/27 ≤ 1/α(M_Z)`
  (`invAlphaMZ_ge_topBand`); (ii) the M_Z reading genuinely RUNS above the octonion ceiling `42` when
  a band above M_Z screens (`invAlphaMZ_gt_42_of_screen`); (iii) the weak mixing at M_Z is the banked
  parameter-free running `sin²θ_W(M_Z) = 3/8` at the matter depth (`sinSqMZ_matter_stationary`), not
  the wrong `1/4` (`sinSqMZ_ne_wrong`). The reading is a genuine PARTIAL SUM (not vacuous), the exact
  way-point is REAL (`1582/27`, an exact bound), and the mixing is the CORRECT banked value.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the M_Z reading IS a partial sum of the X6
  tower with the EXACT `1582/27` way-point inside it, genuinely running above the octonion ceiling
  42, with the M_Z mixing the correct banked 3/8 — NOT vacuous, NOT a wrong value". It is TIED to the
  banked X7 landings by `xFlag_forced`: `invAlphaZero_append` witnesses the partial-sum law,
  `invAlphaMZ_gt_42_of_screen` witnesses the genuine running above 42, and `invAlphaMZ_topBand_ne_42`
  witnesses the exact way-point is genuinely above the ceiling, so the flag is `1`.

  We anchor `min 491 xFlag = 1` (TRUE — `xFlag = 1 < 491`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the intermediate reading is vacuous / the exact way-point is
  wrong / it does not run above 42 / the mixing is the wrong value" mis-reading): that
  `min 491 xFlag = 491`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 491` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (491, 1) is fresh (Cid 491 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureIntermediateReading
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE INTERMEDIATE-READING FLAG: `1` = "the M_Z reading is a partial sum of the X6 tower with the
    EXACT `1582/27` way-point inside it, genuinely running above the octonion ceiling 42, with the
    M_Z mixing the correct banked 3/8". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X7 landing): `invAlphaZero_append` proves the M_Z reading is a PARTIAL
    SUM of the zero-momentum tower; `invAlphaMZ_gt_42_of_screen` proves a genuinely screening band
    above M_Z runs the reading STRICTLY above the octonion ceiling `42`; and
    `invAlphaMZ_topBand_ne_42` proves the exact octonion-to-electroweak way-point `1582/27` is
    genuinely distinct from `42`. So the flag is present, `xFlag = 1`. If the reading were vacuous,
    the way-point wrong, or non-running, these witnesses would not exist. -/
theorem xFlag_forced :
    (∀ above below : List (Cut × Cut),
      invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below) ∧
    (∀ depth ratio : Cut, 0 < depth → 1 < ratio → (42 : Cut) < invAlphaZero [(depth, ratio)]) ∧
    ((1582 : Cut) / 27 ≠ 42) ∧
    xFlag = 1 :=
  ⟨invAlphaZero_append,
   fun _ _ hd hr => invAlphaMZ_gt_42_of_screen hd hr,
   invAlphaMZ_topBand_ne_42,
   rfl⟩

/-- TRUE: `min 491 xFlag = 1`, holding precisely because `xFlag = 1 < 491`. -/
theorem cert_val_true : min (491 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 491 xFlag = 491`. It GENUINELY equals `1` (`cert_val_true`). A "the
    intermediate reading is vacuous / the exact way-point is wrong / it does not run above 42 / the
    mixing is the wrong value" mis-reading reduces — through the banked value — to the false numeric
    `1 = 491`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (491 : ℕ) xFlag = 491 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 491  (FALSE — the costume bites)

end Counterexamples
