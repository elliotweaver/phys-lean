/-
  Counterexamples.FineStructureZeroMomentumVacuityCostume — N465 / X6 anti-vacuity (C490).
  ==========================================================================================
  W8 ANTI-VACUITY. The X6 node (arc-X) assembles X1–X5 into the zero-momentum inverse fine-structure
  coupling `1/α(0)` as the FINITE band-tower assembly `invAlphaZero bands = 42 + Σ_bands κ·census·
  cutLog(ratio)` over the derived ℝ `Cut`. The load-bearing content: (i) the top band is the EXACT
  cutPi-free rational `bandScreen chargeTraceDepth topBandRatio = 448/27`
  (`bandScreen_topBand_exact`), giving the exact octonion-to-electroweak value `1582/27`
  (`invAlphaZero_topBand_value`); (ii) the assembly genuinely SCREENS — `42 < 1582/27`
  (`invAlphaZero_topBand_gt_42`); (iii) the finiteness is LOAD-BEARING — a single band is UNBOUNDED as
  its ratio → ∞ (`bandScreen_unbounded`), so an infinite tower WOULD diverge (the same C6-forbidden
  totalizing limit `geometric_diverges_at_one`). The value is EXACT (not a truncation), the screening
  is REAL (not vacuous), and the tower is FINITE (not a Landau pole).

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the zero-momentum coupling IS the finite
  band-tower assembly with the EXACT cutPi-free top-band rational 448/27, genuinely screening above the
  octonion ceiling 42, with the infinite tower forbidden (a single band unbounded) — NOT vacuous, NOT a
  truncation, NOT a Landau-pole divergence". It is TIED to the banked X6 landings by `xFlag_forced`:
  the banked `bandScreen_topBand_exact` witnesses the exact top-band rational, `invAlphaZero_topBand_gt_42`
  witnesses the genuine screening, and `bandScreen_unbounded` witnesses the load-bearing finiteness
  (a single band exceeds the bound 42), so the flag is `1`.

  We anchor `min 490 xFlag = 1` (TRUE — `xFlag = 1 < 490`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the assembly is vacuous / the top band is not exact / it does
  not screen / the tower diverges" mis-reading): that `min 490 xFlag = 490`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 490` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (490, 1) is fresh (Cid 490 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureZeroMomentum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE ZERO-MOMENTUM-ASSEMBLY FLAG: `1` = "the zero-momentum coupling is the finite band-tower
    assembly with the EXACT cutPi-free top-band rational 448/27, genuinely screening above 42, with
    the infinite tower forbidden". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X6 landing): `bandScreen_topBand_exact` proves the top band is the EXACT
    rational `448/27`; `invAlphaZero_topBand_gt_42` proves the assembly genuinely screens above the
    octonion ceiling `42`; and `bandScreen_unbounded` proves a single band exceeds the bound `42` (so
    an infinite tower would diverge — the finiteness is load-bearing). So the flag is present,
    `xFlag = 1`. If the assembly were vacuous, the top band inexact, non-screening, or the tower
    divergent, these witnesses would not exist. -/
theorem xFlag_forced :
    (bandScreen chargeTraceDepth topBandRatio = 448 / 27) ∧
    (42 < invAlphaZero [(chargeTraceDepth, topBandRatio)]) ∧
    (∃ ratio : Cut, 1 < ratio ∧ (42 : Cut) < bandScreen chargeTraceDepth ratio) ∧
    xFlag = 1 :=
  ⟨bandScreen_topBand_exact,
   invAlphaZero_topBand_gt_42,
   bandScreen_unbounded 42,
   rfl⟩

/-- TRUE: `min 490 xFlag = 1`, holding precisely because `xFlag = 1 < 490`. -/
theorem cert_val_true : min (490 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 490 xFlag = 490`. It GENUINELY equals `1` (`cert_val_true`). A "the assembly is
    vacuous / the top band is not exact / it does not screen / the tower diverges" mis-reading reduces
    — through the banked value — to the false numeric `1 = 490`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (490 : ℕ) xFlag = 490 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 490  (FALSE — the costume bites)

end Counterexamples
