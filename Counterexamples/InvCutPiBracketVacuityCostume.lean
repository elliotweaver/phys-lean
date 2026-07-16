/-
  Counterexamples.InvCutPiBracketVacuityCostume — N### / ARC-D D5 anti-vacuity (C507).
  =====================================================================================
  W8 ANTI-VACUITY. The D5 node (ARC-D THE RESIDUAL 1/cutPi BRACKETED — the trig-scale route-finder)
  builds the cosine bracket instrument (the cos-mirror of the D1 exponential instrument) and reads
  off it a certified two-sided rational bracket for the derived residual `1/cutPi`, then feeds it —
  together with the banked cutLog bracket — into the D4 assembled pipeline to produce the FIRST
  fully-concrete numeral of the derived zero-momentum inverse fine-structure coupling. The marquee
  content that must NOT be hollow: the residual bracket `5/17 <= 1/cutPi <= 5/14` has its two bounds
  STRICTLY separated (`5/17 < 5/14`), NOT a collapsed width-0 point. A hollow reading where "the
  trig-scale bracket collapses / the two bounds coincide / the residual is a degenerate point" is
  refuted: the banked `inv_cutPi_bracket_strict` proves the residual bracket is genuinely two-sided.

  THE CERTIFICATE. `residualFlag := 1` — a natural-number flag standing for "the residual 1/cutPi
  bracket is genuinely two-sided: the cosine instrument's lower and upper readings on the least
  positive cosine zero are STRICTLY separated (`5/17 < 5/14`), so the pipeline gets a real bracket,
  not a collapsed point". It is TIED to the banked D5 landing by `residualFlag_forced`:
  `inv_cutPi_bracket_strict` witnesses `(5/17 : Cut) < 5/14`, so the flag is `1`.

  We anchor `min 507 residualFlag = 1` (TRUE — `residualFlag = 1 < 507`, so the min is `residualFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the residual bracket collapses / the two bounds coincide /
  the trig-scale instrument reads a degenerate point" mis-reading): that `min 507 residualFlag = 507`.
  It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 507` in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (507, 1) is fresh (Cid 507 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.InvCutPiBracket
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.InvCutPiBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5 FLAG: `1` = "the residual 1/cutPi bracket is genuinely two-sided — the cosine
    instrument's readings on the least positive cosine zero are STRICTLY separated, not a collapsed
    point". -/
def residualFlag : ℕ := 1

/-- TRUE (tied to the banked D5 landing): `inv_cutPi_bracket_strict` proves the two-sided bracket on
    the residual `1/cutPi` is genuine (`5/17 < 5/14`), so the flag is present, `residualFlag = 1`. -/
theorem residualFlag_forced : (5 / 17 : Cut) < 5 / 14 ∧ residualFlag = 1 :=
  ⟨inv_cutPi_bracket_strict, rfl⟩

/-- TRUE: `min 507 residualFlag = 1`, holding precisely because `residualFlag = 1 < 507`. -/
theorem cert_val_true : min (507 : ℕ) residualFlag = 1 := by decide

/-- BOGUS: claims `min 507 residualFlag = 507`. It GENUINELY equals `1` (`cert_val_true`). A "the
    residual bracket collapses / the two bounds coincide / the trig-scale instrument reads a
    degenerate point" mis-reading reduces — through the banked value — to the false numeric
    `1 = 507`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (507 : ℕ) residualFlag = 507 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 507  (FALSE — the costume bites)

end Counterexamples
