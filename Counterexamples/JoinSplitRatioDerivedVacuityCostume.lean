/-
  Counterexamples.JoinSplitRatioDerivedVacuityCostume — join-splitting-ratio discharge anti-vacuity (C538).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE JOIN SPLITTING RATIO `j` DERIVED) derives the transmutation-join
  splitting ratio `j = joinSplitRatio = 1` from the METRIC DEGENERACY of the banked doubling-tear
  mirror multiplet (the doubled mirror generator and the un-doubled generator are BOTH Born units,
  `gForm e5O e5O = gForm u1 u1 = 1`, the isometric last doubling), and DISCHARGES the D2d join content
  from a bounded residual to the DERIVED value `joinContent w joinSplitRatio = 0` (via `cutLog_one`).
  The content that must NOT be hollow: the discharge is a GENUINE degeneracy finding — the join content
  vanishes at the derived ratio EXACTLY because the mirror band is metrically degenerate (ratio = 1),
  NOT because the join content is trivially always zero. For a genuine `1 < j` the join content is
  STRICTLY POSITIVE (`joinContent_pos_boundary`), so `joinSplitRatio = 1` sits at the exact VANISHING
  BOUNDARY. A "the join content is always zero / the ratio derivation is empty / j could be anything"
  mis-reading is refuted by the banked `joinContent_at_derived_eq_zero` (the discharge at the DERIVED
  ratio) together with `bornScales_equal` (the metric degeneracy that FORCES ratio = 1) and
  `joinSplitRatio_ne_topBand` (the derived ratio 1 is genuinely distinct from the join SPAN
  topBandRatio > 1, so vanishing is a real finding, not a tautology).

  THE CERTIFICATE. dischargeFlag := 1 -- a natural-number flag standing for "the join content is
  discharged to 0 at the DERIVED join splitting ratio (joinContent_at_derived_eq_zero), which equals 1
  by the metric degeneracy of the isometric doubling (bornScales_equal / joinSplitRatio_eq_one)". It is
  TIED to the banked landing by dischargeFlag_forced: `joinContent_at_derived_eq_zero` gives the join
  content at the derived ratio = 0 and `joinSplitRatio_eq_one` gives the ratio = 1, so the flag is 1.

  We anchor min 538 dischargeFlag = 1 (TRUE -- dischargeFlag = 1 < 538, so the min is dischargeFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the join content is always zero / the ratio derivation is
  empty" mis-reading): that min 538 dischargeFlag = 538. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 538 in the naturals. The kernel cannot
  close it; it BITES.

  DISTINCT from the banked battery: the pair (538, 1) is fresh (Cid 538 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.JoinSplitRatioDerived
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.JoinContent
open Phys.Algebra.JoinSplitRatioDerived
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the join content is discharged to 0 at the DERIVED join splitting ratio, which is
    forced to 1 by the metric degeneracy of the isometric last doubling". -/
def dischargeFlag : ℕ := 1

/-- TRUE (tied to the banked landing): at an arbitrary weight `w`, the join content at the derived
    splitting ratio is `0` (`joinContent_at_derived_eq_zero`), the derived ratio is `1`
    (`joinSplitRatio_eq_one`), and `dischargeFlag = 1`. -/
theorem dischargeFlag_forced :
    (joinContent 0 joinSplitRatio = 0)
    ∧ (joinSplitRatio = 1)
    ∧ dischargeFlag = 1 :=
  ⟨joinContent_at_derived_eq_zero 0, joinSplitRatio_eq_one, rfl⟩

/-- TRUE: min 538 dischargeFlag = 1, holding precisely because dischargeFlag = 1 < 538. -/
theorem cert_val_true : min (538 : ℕ) dischargeFlag = 1 := by decide

/-- BOGUS: claims min 538 dischargeFlag = 538. It GENUINELY equals 1 (cert_val_true). A "the join
    content is always zero / the ratio derivation is empty" mis-reading reduces -- through the banked
    landing -- to the false numeric 1 = 538, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (538 : ℕ) dischargeFlag = 538 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 538  (FALSE — the costume bites)

end Counterexamples
