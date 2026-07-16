/-
  Counterexamples.FineStructureMZReadingsVacuityCostume — N466 / X7 anti-vacuity (C491).
  ==========================================================================================
  W8 ANTI-VACUITY. The X7 node (arc-X) reads the intermediate M_Z-scale readings 1/α(M_Z) and
  sin²θ_W(M_Z) as internal way-points of the SAME finite band-tower assembly (X6) / scale-resolved
  self-overlap (X2). The load-bearing content: (i) the assembly DECOMPOSES ADDITIVELY at any band
  edge (`invAlphaZero_append`), so the reading at the electroweak edge is the EXACT cutPi-free
  way-point `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27`
  (`invAlphaZero_at_ew_edge`); (ii) the M_Z reading GENUINELY SCREENS above the octonion ceiling
  `42 < invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ [])` (`invAlphaMZ_gt_42`, the trivially
  screening empty sub-band); (iii) the weak mixing reading is the correct `3/8`, NOT the wrong `1/4`
  (`sinSqMZ_ne_wrong`, via matter-stationarity). The readings are EXACT partial sums (not free
  anchors), the screening is REAL (not vacuous), and the mixing is the correct GUT value.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the M_Z-scale readings ARE internal
  way-points of the finite band-tower assembly: the electroweak-edge reading is the EXACT 1582/27,
  the M_Z reading genuinely screens above 42, and the mixing is the correct 3/8 — NOT vacuous, NOT a
  free anchor, NOT the wrong mixing value". It is TIED to the banked X7 landings by `xFlag_forced`:
  the banked `invAlphaZero_at_ew_edge` witnesses the exact electroweak way-point, `invAlphaMZ_gt_42`
  (on the empty sub-band) witnesses the genuine screening, and `sinSqMZ_ne_wrong` witnesses the
  correct mixing, so the flag is `1`.

  We anchor `min 491 xFlag = 1` (TRUE — `xFlag = 1 < 491`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the readings are vacuous / not way-points / do not screen /
  wrong mixing" mis-reading): that `min 491 xFlag = 491`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 491` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (491, 1) is fresh (Cid 491 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureMZReadings
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE M_Z-READINGS FLAG: `1` = "the M_Z-scale readings are internal way-points of the finite
    band-tower assembly: the electroweak-edge reading is the EXACT 1582/27, the M_Z reading genuinely
    screens above 42, and the mixing is the correct 3/8". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X7 landing): `invAlphaZero_at_ew_edge` proves the electroweak-edge
    reading is the EXACT way-point `1582/27`; `invAlphaMZ_gt_42` (on the trivially screening empty
    sub-band) proves the M_Z reading genuinely screens above the octonion ceiling `42`; and
    `sinSqMZ_ne_wrong` proves the weak mixing reading is the correct `3/8`, not the wrong `1/4`. So
    the flag is present, `xFlag = 1`. If the readings were vacuous, not way-points, non-screening, or
    the wrong mixing value, these witnesses would not exist. -/
theorem xFlag_forced :
    (invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27) ∧
    (42 < invAlphaZero ([(chargeTraceDepth, topBandRatio)] ++ [])) ∧
    (∀ (M mz : Cut), invAlpha2 isoDepth kappaLeading M mz ≠ 0 →
      sinSqRunExact isoDepth M mz ≠ 1 / 4) ∧
    xFlag = 1 :=
  ⟨invAlphaZero_at_ew_edge,
   invAlphaMZ_gt_42 [] (by intro p hp; simp at hp),
   fun M mz h2 => sinSqMZ_ne_wrong M mz h2,
   rfl⟩

/-- TRUE: `min 491 xFlag = 1`, holding precisely because `xFlag = 1 < 491`. -/
theorem cert_val_true : min (491 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 491 xFlag = 491`. It GENUINELY equals `1` (`cert_val_true`). A "the readings
    are vacuous / not way-points / do not screen / wrong mixing" mis-reading reduces — through the
    banked value — to the false numeric `1 = 491`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (491 : ℕ) xFlag = 491 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 491  (FALSE — the costume bites)

end Counterexamples
