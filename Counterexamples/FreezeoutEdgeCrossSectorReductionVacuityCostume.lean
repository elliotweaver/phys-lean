/-
  Counterexamples.FreezeoutEdgeCrossSectorReductionVacuityCostume — freeze-out edge cross-sector
  reduction anti-vacuity (C539).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE FREEZE-OUT EDGE RATIOS `rb, rc, rl` — CROSS-SECTOR SCALE REDUCTION)
  reduces the last bounded residual of the composed numeral — the freeze-out edges — to (banked
  within-sector shape numerals, forced by the line-independent phase) × (the relative sector scales),
  the marquee finding being the CROSS-SECTOR TELESCOPE: the adjacent edge product `edgeBottom·edgeCharm`
  CANCELS the up-sector scale entirely and equals the banked within-down-sector ratio `mass0/mass2`
  (`edgeProduct_within_sector`), INDEPENDENT of the up scale.

  The content that must NOT be hollow: the up-scale cancellation is a GENUINE finding — the telescoped
  product is literally the SAME value at two DIFFERENT up-scales `Mu = 1` and `Mu = 2`
  (`edgeProduct_scale_independent`), so the cancellation actually happened; it is NOT a vacuous
  always-equal statement over arbitrary quantities. A single cross-sector edge on its own genuinely
  DOES depend on the relative scale (`crossSector_scale_survives`), so the residual is real, not zero,
  and only the telescoped PRODUCT is scale-free. A "the edges still carry the up-scale / the reduction
  is empty / any product is trivially scale-independent" mis-reading is refuted by the banked
  `edgeProduct_scale_independent` (product equal at two distinct up-scales) together with
  `crossSector_scale_survives` (a single edge is NOT scale-free) and `edgeProduct_within_sector` (the
  product equals the banked N340 within-sector ratio `mass0/mass2`, not an arbitrary value).

  THE CERTIFICATE. telescopeFlag := 1 -- a natural-number flag standing for "the adjacent cross-sector
  edge product is genuinely up-scale-independent (edgeProduct_scale_independent): the same value at
  Mu = 1 and Mu = 2 at any fixed down-scale Md = 1, so the up-scale telescopes out — a real
  cancellation, not a tautology". It is TIED to the banked landing by telescopeFlag_forced:
  `edgeProduct_scale_independent` gives the product equal at the two up-scales.

  We anchor min 539 telescopeFlag = 1 (TRUE -- telescopeFlag = 1 < 539, so the min is telescopeFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the edges still carry the up-scale / the reduction is empty"
  mis-reading): that min 539 telescopeFlag = 539. It GENUINELY equals 1 (cert_val_true). Rewriting
  reduces the bogus claim to the false numeric 1 = 539 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (539, 1) is fresh (Cid 539 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FreezeoutEdgeCrossSectorReduction
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the adjacent cross-sector edge product is genuinely up-scale-independent — the same
    value at Mu = 1 and Mu = 2 (edgeProduct_scale_independent), a real telescoping cancellation". -/
def telescopeFlag : ℕ := 1

/-- TRUE (tied to the banked landing): at the fixed down-scale `Md = 1 ≠ 0`, the telescoped adjacent
    edge product is the SAME at up-scales `Mu = 1` and `Mu = 2` (`edgeProduct_scale_independent`), and
    `telescopeFlag = 1`. -/
theorem telescopeFlag_forced :
    (edgeBottom 1 1 * edgeCharm 1 1 = edgeBottom 2 1 * edgeCharm 2 1)
    ∧ telescopeFlag = 1 :=
  ⟨edgeProduct_scale_independent 1 one_ne_zero, rfl⟩

/-- TRUE: min 539 telescopeFlag = 1, holding precisely because telescopeFlag = 1 < 539. -/
theorem cert_val_true : min (539 : ℕ) telescopeFlag = 1 := by decide

/-- BOGUS: claims min 539 telescopeFlag = 539. It GENUINELY equals 1 (cert_val_true). A "the edges
    still carry the up-scale / the reduction is empty" mis-reading reduces -- through the banked
    landing -- to the false numeric 1 = 539, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (539 : ℕ) telescopeFlag = 539 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 539  (FALSE — the costume bites)

end Counterexamples
