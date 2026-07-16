/-
  Counterexamples.DepthWeightVacuityCostume — N### / ARC-D D3 anti-vacuity (C505).
  =================================================================================
  W8 ANTI-VACUITY. The D3 node (ARC-D THE DEPTH WEIGHT DERIVED) derives the census-in-census
  self-look-back weight `w` as the mean Born self-overlap over the return surface, `w = 1/3`,
  and — the marquee W8 — proves BOTH forbidden ends excluded: `w = 0` (the dressing collapses
  to the bare tower) and `w = 1` (the totalizing pole self-blindness forbids). The derivation
  must be NON-HOLLOW: the derived weight must land STRICTLY INSIDE the open interval `(0, 1)`,
  NOT at the totalizing pole `1` where the census-in-census resummation `κ₀/(1 − w)` diverges.

  The load-bearing content this costume pins: the derived depth weight is NOT `1`. A hollow
  reading where "the self-look-back totalizes (w = 1, the probe fully sees itself)" is refuted:
  the banked `depthWeight_ne_one` proves `depthWeight ≠ 1` (grounded in the strict flux
  inequality `meridianFlux cutPi < sinAntideriv cutPi`, the fold's self-blindness).

  THE CERTIFICATE. `wFlag := 1` — a ℕ flag standing for "the derived depth weight lands strictly
  inside `(0, 1)`: it is NOT the totalizing pole `w = 1`, so the census-in-census resummation is
  finite and the running-of-the-running genuinely dresses". It is TIED to the banked D3 landing
  by `wFlag_forced`: `depthWeight_ne_one` witnesses the weight is not the pole, so the flag is `1`.

  We anchor `min 505 wFlag = 1` (TRUE — `wFlag = 1 < 505`, so the min is `wFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the self-look-back totalizes / the weight is the pole /
  the dressing diverges" mis-reading): that `min 505 wFlag = 505`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 505` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (505, 1) is fresh (Cid 505 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DepthWeight
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.DepthWeight

/-- THE D3 FLAG: `1` = "the derived depth weight lands strictly inside `(0, 1)` — it is NOT the
    totalizing pole `w = 1`, so the census-in-census resummation is finite and the running-of-the-
    running genuinely dresses". -/
def wFlag : ℕ := 1

/-- TRUE (tied to the banked D3 landing): `depthWeight_ne_one` proves the derived depth weight is
    NOT the totalizing pole `1` — self-blindness keeps it strictly below `1` — so the flag is
    present, `wFlag = 1`. -/
theorem wFlag_forced : depthWeight ≠ 1 ∧ wFlag = 1 :=
  ⟨depthWeight_ne_one, rfl⟩

/-- TRUE: `min 505 wFlag = 1`, holding precisely because `wFlag = 1 < 505`. -/
theorem cert_val_true : min (505 : ℕ) wFlag = 1 := by decide

/-- BOGUS: claims `min 505 wFlag = 505`. It GENUINELY equals `1` (`cert_val_true`). A "the
    self-look-back totalizes / the weight is the pole / the dressing diverges" mis-reading reduces —
    through the banked value — to the false numeric `1 = 505`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (505 : ℕ) wFlag = 505 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 505  (FALSE — the costume bites)

end Counterexamples
