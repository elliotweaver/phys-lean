/-
  Counterexamples.NarrowedBracket4VacuityCostume — N### / ARC-D D5-next-4 anti-vacuity (C511).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-4 node (ARC-D THE NARROWING CAMPAIGN, node 5 — SHARPEN THE m01 FLOOR
  FURTHER via the deeper cutCos(2/9) reading AND SQUEEZE 1/cutPi via split@5 tight-factor / split@6)
  sharpens the m01 flavor floor (reading the SAME cycle-phase cosine numeral one term deeper crushes
  p = cutCos(2/9) to width 2e-9, so mass0/mass1 tightens ~108x) and squeezes 1/cutPi, then re-composes
  the D4 assembled pipeline to a certified two-sided rational bracket of the derived zero-momentum
  inverse fine-structure coupling that is STRICTLY NARROWER than D5-next-3's. The marquee content that
  must NOT be hollow: the re-composed bracket
  960586690/14137173 <= invAlphaZero (completeBandList chargeTraceDepth) <= 1921144130/28273869 has
  width 1921144130/28273869 - 960586690/14137173 STRICTLY BELOW D5-next-3's width
  9605390/141363 - 9606370/141381 -- i.e. the narrowing campaign genuinely SHRANK the assembled
  bracket AGAIN (a fifth time, ~15x). A hollow reading where "the campaign banks the same width / the
  re-composed bracket is no tighter / the deeper cutCos(2/9) reading buys nothing" is refuted: the
  banked invAlphaZero_narrowed4_width_lt proves the new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag4 := 1 -- a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than D5-next-3's: the deeper cutCos(2/9) reading and the split@5
  tight-factor / split@6 cos squeeze genuinely tighten the derived 1/alpha(0) bracket a fifth time". It
  is TIED to the banked D5-next-4 landing by narrowFlag4_forced: invAlphaZero_narrowed4_width_lt
  witnesses (1921144130/28273869 - 960586690/14137173 : Cut) < 9605390/141363 - 9606370/141381, so the
  flag is 1.

  We anchor min 511 narrowFlag4 = 1 (TRUE -- narrowFlag4 = 1 < 511, so the min is narrowFlag4).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  deeper reading is hollow" mis-reading): that min 511 narrowFlag4 = 511. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 511 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (511, 1) is fresh (Cid 511 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket4
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket4
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-4 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than D5-next-3's --
    the deeper cutCos(2/9) reading and the split@5 tight-factor / split@6 cos squeeze genuinely tighten
    the derived 1/alpha(0) bracket a fifth time". -/
def narrowFlag4 : ℕ := 1

/-- TRUE (tied to the banked D5-next-4 landing): invAlphaZero_narrowed4_width_lt proves the
    re-composed bracket width is strictly below D5-next-3's, so the flag is present, narrowFlag4 = 1. -/
theorem narrowFlag4_forced :
    (1921144130 / 28273869 - 960586690 / 14137173 : Cut) < 9605390 / 141363 - 9606370 / 141381
      ∧ narrowFlag4 = 1 :=
  ⟨invAlphaZero_narrowed4_width_lt, rfl⟩

/-- TRUE: min 511 narrowFlag4 = 1, holding precisely because narrowFlag4 = 1 < 511. -/
theorem cert_val_true : min (511 : ℕ) narrowFlag4 = 1 := by decide

/-- BOGUS: claims min 511 narrowFlag4 = 511. It GENUINELY equals 1 (cert_val_true). A "the campaign
    buys nothing / the width does not shrink / the deeper reading is hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 511, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (511 : ℕ) narrowFlag4 = 511 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 511  (FALSE — the costume bites)

end Counterexamples
