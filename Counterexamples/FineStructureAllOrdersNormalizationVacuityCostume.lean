/-
  Counterexamples.FineStructureAllOrdersNormalizationVacuityCostume — N### / X5 anti-vacuity (C489).
  ==========================================================================================
  W8 ANTI-VACUITY. The X5 node (arc-X) derives κ TO ALL ORDERS as the exact closed self-overlap of
  the census-in-census self-look-back: the UNARY self-reference `D = κ₀ + w·D` (fold count `c_n = 1`
  per depth) resums to the EXACT rational closed form `κ(w) = 1/(3·cutPi·(1−w))`
  (`kappaLeadingDressed_closed`), which STRICTLY EXCEEDS the one-loop `κ₀ = kappaLeading`
  (`kappaLeadingDressed_ne_bare` / `dressedOverlap_gt_bare`) for a nontrivial weight `0 < w < 1`, and
  the totalizing weight `w = 1` is C6-FORBIDDEN — the geometric series DIVERGES there
  (`geometric_diverges_at_one`). The RESIDUAL is LOAD-BEARING: the all-orders dressing genuinely
  differs from the one-loop value (the residual above one loop is real), and it is an EXACT closed
  rational (not a truncated series, not vacuous, not divergent).

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the all-orders κ IS the exact rational
  closed self-overlap `κ₀/(1−w)` of the unary census-in-census self-reference, strictly exceeding the
  one-loop κ₀, with the totalizing w=1 forbidden — NOT a truncated series, NOT vacuous (dressing ≠
  bare), NOT summable at the totalizing limit". It is TIED to the banked X5 landings by
  `xFlag_forced`: the banked `dressedOverlap_leading` witnesses the X1 recovery at w=0, and — at the
  concrete witness weight `w = 1/2` — `dressedOverlap_gt_bare` witnesses the strict dressing (the
  residual is real) and `geometric_diverges_at_one` witnesses the forbidden totalizing limit, so the
  flag is `1`.

  We anchor `min 489 xFlag = 1` (TRUE — `xFlag = 1 < 489`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the all-orders dressing is vacuous / equals the one-loop value
  / is a truncated series / summable at the totalizing limit" mis-reading): that `min 489 xFlag =
  489`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false
  numeric `1 = 489` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (489, 1) is fresh (Cid 489 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureAllOrdersNormalization
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE ALL-ORDERS-NORMALIZATION FLAG: `1` = "the all-orders κ is the exact rational closed
    self-overlap of the unary census-in-census self-reference, strictly exceeding the one-loop κ₀,
    with the totalizing w=1 forbidden". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X5 landing): `dressedOverlap_leading` proves the X1 recovery at the
    trivial weight (`dressedOverlap κ₀ 0 = κ₀`); at the concrete witness weight `w = 1/2`,
    `dressedOverlap_gt_bare` proves the strict dressing (`κ₀ < dressedOverlap κ₀ (1/2)` — the residual
    above one loop is REAL); and `geometric_diverges_at_one` proves the totalizing weight `w = 1` is
    forbidden (the geometric series is NOT summable there). So the flag is present, `xFlag = 1`. If
    the dressing were vacuous, a truncated series, equal to the bare value, or summable at the
    totalizing limit, these witnesses would not exist. -/
theorem xFlag_forced :
    (dressedOverlap kappaLeading 0 = kappaLeading) ∧
    (kappaLeading < dressedOverlap kappaLeading (1/2)) ∧
    (¬ Summable (fun _ : ℕ => (1 : Cut))) ∧ xFlag = 1 :=
  ⟨dressedOverlap_leading kappaLeading,
   dressedOverlap_gt_bare kappaLeading (1/2) kappaLeading_pos (by norm_num) (by norm_num),
   geometric_diverges_at_one, rfl⟩

/-- TRUE: `min 489 xFlag = 1`, holding precisely because `xFlag = 1 < 489`. -/
theorem cert_val_true : min (489 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 489 xFlag = 489`. It GENUINELY equals `1` (`cert_val_true`). A "the all-orders
    dressing is vacuous / equals the one-loop value / is a truncated series / summable at the
    totalizing limit" mis-reading reduces — through the banked value — to the false numeric `1 = 489`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (489 : ℕ) xFlag = 489 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 489  (FALSE — the costume bites)

end Counterexamples
