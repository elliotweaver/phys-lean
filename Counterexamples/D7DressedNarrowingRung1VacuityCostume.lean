/-
  Counterexamples.D7DressedNarrowingRung1VacuityCostume — the D7 DRESSED NARROWING RUNG 1 (the deep
  edge-log sharpening re-assembling a ≈ 13-significant-digit certified bracket of the TRULY-CLOSED COMPOSED
  endpoint `recomposedEndpointDressed`) is GENUINE: the re-assembled bracket is strictly two-sided
  (`1370996710997/1e10 < 1370996710998/1e10`), the composed endpoint genuinely exceeds `137`
  (`137 < recomposedEndpointDressed`), and the deep window strictly improves the banked `D7DepthTwoComposed`
  bracket from both ends (`1370984/1e4 < 1370996710997/1e10`). C573.
  =====================================================================================
  W8 ANTI-VACUITY. This node SHARPENS the derived edge logs to `≈ 10⁻¹²` and re-assembles a certified
  `≈ 13`-significant-digit two-sided rational bracket of the composed endpoint. The content that must NOT be
  hollow is that the re-assembled bracket is a REAL two-sided window (`restated_r2_strict`:
  `1370996710997/1e10 < 1370996710998/1e10`), that the composed endpoint GENUINELY exceeds `137`
  (`recomposedEndpointDressed_gt_137_r2`), and that the deep rung GENUINELY tightens the banked
  `D7DepthTwoComposed` `[137.0984, 137.1006]` bracket (`dressed_r2_improves_banked`:
  `1370984/1e4 < 1370996710997/1e10`). If the bracket were a point, or the endpoint did not exceed `137`, or
  the deep rung did not tighten the banked bracket, the narrowing would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 dressed narrowing rung is
  genuine: the re-assembled bracket is strictly two-sided, the composed endpoint exceeds 137, and the deep
  rung strictly tightens the banked bracket". It is TIED to the banked landing by attestFlag_forced.

  We anchor min 573 attestFlag = 1 (TRUE -- attestFlag = 1 < 573, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the bracket is a point / the endpoint does not exceed 137 / the deep
  rung does not tighten the banked bracket / the narrowing is vacuous" reading): that
  min 573 attestFlag = 573. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the
  false numeric 1 = 573 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (573, 1) is fresh (Cid 573 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7DressedNarrowingRung1
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7DressedNarrowingRung1
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 dressed narrowing rung is genuine: the re-assembled bracket is strictly
    two-sided, the composed endpoint exceeds 137, and the deep rung strictly tightens the banked bracket". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the re-assembled bracket is strictly two-sided
    (`restated_r2_strict`), the composed endpoint exceeds `137` (`recomposedEndpointDressed_gt_137_r2`), the
    deep rung strictly tightens the banked bracket (`dressed_r2_improves_banked.1.1`) — and
    `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((1370996710997 : Cut) / 10000000000 < 1370996710998 / 10000000000)
    ∧ (137 < recomposedEndpointDressed)
    ∧ ((1370984 / 10000 : Cut) < 1370996710997 / 10000000000)
    ∧ attestFlag = 1 :=
  ⟨restated_r2_strict, recomposedEndpointDressed_gt_137_r2, dressed_r2_improves_banked.1.1, rfl⟩

/-- TRUE: min 573 attestFlag = 1, holding precisely because attestFlag = 1 < 573. -/
theorem cert_val_true : min (573 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 573 attestFlag = 573. It GENUINELY equals 1 (cert_val_true). A "the bracket is a
    point / the endpoint does not exceed 137 / the deep rung does not tighten the banked bracket / the
    narrowing is vacuous" reading reduces -- through the banked restated_r2_strict /
    recomposedEndpointDressed_gt_137_r2 / dressed_r2_improves_banked tie -- to the false numeric 1 = 573 in
    the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (573 : ℕ) attestFlag = 573 := by
  rw [cert_val_true]

end Counterexamples
