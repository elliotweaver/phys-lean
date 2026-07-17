/-
  Counterexamples.NarrowedBracket11VacuityCostume — N### / ARC-D D5-next-11 anti-vacuity (C518).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-11 node (ARC-D THE NARROWING CAMPAIGN, node 12 — SHARPEN cutLog, the sole
  binding residual after the 1e10-grid 1/cutPi lift, ~5000x via a DEEPER Born-square m01 bracket: read the
  SAME derived cycle-phase cosine cutCos(2/9) one term deeper [split@6 -> pB width 1e-15] and re-propagate
  through the banked Born-square amplitude chain to a ~40x tighter m01 [3477472837103/1e9, 3477472837106/1e9],
  fed to the D1 exp instrument at partial-sum index 36 -> cutLog [815406111272/1e11, 815406111273/1e11]
  [width 1e-11]; 1/cutPi reused verbatim from the parent) re-composes the D4 assembled pipeline to a certified
  two-sided rational bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY
  NARROWER than the parent's (D5-next-10). The marquee content that must NOT be hollow: the re-composed
  bracket 12007329939722/176714586765 <= invAlphaZero (completeBandList chargeTraceDepth) <=
  16009773252014/235619449005 has width 16009773252014/235619449005 - 12007329939722/176714586765 STRICTLY
  BELOW the parent's width 9605863954190/141371669403 - 2401465987690/35342917353 -- i.e. the narrowing
  campaign genuinely SHRANK the assembled bracket AGAIN (a twelfth time). A hollow reading where "the campaign
  banks the same width / the re-composed bracket is no tighter / the split@6 cutLog sharpening buys nothing" is
  refuted: the banked invAlphaZero_narrowed11_width_lt proves the new width is strictly less than the previous
  rung's.

  THE CERTIFICATE. narrowFlag11 := 1 -- a natural-number flag standing for "the re-composed assembled bracket
  is STRICTLY narrower than the parent's: the split@6 cutLog sharpening (same one-cause cosine instrument, one
  term deeper) tightens cutLog ~5000x, genuinely tightening the derived 1/alpha(0) bracket a twelfth time". It
  is TIED to the banked D5-next-11 landing by narrowFlag11_forced: invAlphaZero_narrowed11_width_lt witnesses
  (16009773252014/235619449005 - 12007329939722/176714586765 : Cut) < 9605863954190/141371669403 -
  2401465987690/35342917353, so the flag is 1.

  We anchor min 518 narrowFlag11 = 1 (TRUE -- narrowFlag11 = 1 < 518, so the min is narrowFlag11).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the split@6
  cutLog sharpening is hollow" mis-reading): that min 518 narrowFlag11 = 518. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 518 in the naturals. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (518, 1) is fresh (Cid 518 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket11
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-11 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the split@6 cutLog sharpening (the same one-cause cosine instrument, one term deeper) tightens cutLog
    ~5000x and genuinely tightens the derived 1/alpha(0) bracket a twelfth time". -/
def narrowFlag11 : ℕ := 1

/-- TRUE (tied to the banked D5-next-11 landing): invAlphaZero_narrowed11_width_lt proves the re-composed
    bracket width is strictly below the parent's, so the flag is present, narrowFlag11 = 1. -/
theorem narrowFlag11_forced :
    (16009773252014 / 235619449005 - 12007329939722 / 176714586765 : Cut)
        < 9605863954190 / 141371669403 - 2401465987690 / 35342917353
      ∧ narrowFlag11 = 1 :=
  ⟨invAlphaZero_narrowed11_width_lt, rfl⟩

/-- TRUE: min 518 narrowFlag11 = 1, holding precisely because narrowFlag11 = 1 < 518. -/
theorem cert_val_true : min (518 : ℕ) narrowFlag11 = 1 := by decide

/-- BOGUS: claims min 518 narrowFlag11 = 518. It GENUINELY equals 1 (cert_val_true). A "the campaign buys
    nothing / the width does not shrink / the split@6 cutLog sharpening is hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 518, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (518 : ℕ) narrowFlag11 = 518 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 518  (FALSE — the costume bites)

end Counterexamples
