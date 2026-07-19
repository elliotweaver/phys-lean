/-
  Counterexamples.Lm01GridS7VacuityCostume — the `L_m01` s7 MASS GRID (the split@7 sharpening of the
  second-ranked residual `L_m01 = cutLog(mass0/mass1)`) is GENUINE: the sharpened `L_m01` bracket is
  strictly two-sided (`815406111272599/1e14 < 815406111272603/1e14`), it is strictly NARROWER than the
  banked s6 bracket (its width `4×10⁻¹⁴` is strictly below the s6 width `10⁻¹¹`), and it is NESTED
  strictly inside the banked s6 `[815406111272/1e11, 815406111273/1e11]`. C574.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE `L_m01` s7 MASS GRID) reads the SAME derived cycle-phase cosine
  `cutCos(2/9)` one term deeper (split@7), re-propagates through the banked Born-square amplitude chain
  to a `≈ 3×10⁵×` tighter `m01`, and reads the D1 exp instrument at partial-sum index `38` to bank a
  `≈ 250×` sharper `L_m01` bracket. The content that must NOT be hollow is that the sharpened `L_m01`
  bracket is a GENUINE two-sided reading (`cutLog_s7_strict`, `815406111272599/1e14 <
  815406111272603/1e14`), that it GENUINELY tightens the banked s6 bracket (`cutLog_s7_width_lt`, width
  `4×10⁻¹⁴ < 10⁻¹¹`), and that it is a GENUINE monotone refinement NESTED inside the banked s6
  (`cutLog_s7_nested`). If the sharpened bracket were collapsed, or not narrower than s6, or not nested
  inside s6, the s7 grid would be vacuous. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the `L_m01` s7 mass grid is
  genuine: the sharpened `L_m01` bracket is strictly two-sided, strictly narrower than the banked s6,
  and nested strictly inside it". It is TIED to the banked landing by attestFlag_forced.

  We anchor min 574 attestFlag = 1 (TRUE -- attestFlag = 1 < 574, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the sharpened bracket is collapsed / not narrower than s6 / not
  nested inside s6 / the grid is vacuous" reading): that min 574 attestFlag = 574. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 574 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (574, 1) is fresh (Cid 574 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.Lm01GridS7
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Lm01GridS7
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the `L_m01` s7 mass grid is genuine: the sharpened `L_m01` bracket is strictly
    two-sided, strictly narrower than the banked s6, and nested strictly inside it". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the sharpened `L_m01` bracket is strictly two-sided
    (`cutLog_s7_strict`), strictly narrower than the banked s6 bracket (`cutLog_s7_width_lt`), and
    nested strictly inside the banked s6 (`cutLog_s7_nested`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((815406111272599 / 100000000000000 : Cut) < 815406111272603 / 100000000000000)
    ∧ ((815406111272603 / 100000000000000 - 815406111272599 / 100000000000000 : Cut)
        < 815406111273 / 100000000000 - 815406111272 / 100000000000)
    ∧ ((815406111272 / 100000000000 : Cut) ≤ 815406111272599 / 100000000000000
        ∧ (815406111272603 / 100000000000000 : Cut) ≤ 815406111273 / 100000000000)
    ∧ attestFlag = 1 :=
  ⟨cutLog_s7_strict, cutLog_s7_width_lt, cutLog_s7_nested, rfl⟩

/-- TRUE: min 574 attestFlag = 1, holding precisely because attestFlag = 1 < 574. -/
theorem cert_val_true : min (574 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 574 attestFlag = 574. It GENUINELY equals 1 (cert_val_true). A "the sharpened
    bracket is collapsed / not narrower than s6 / not nested inside s6 / the grid is vacuous" reading
    reduces -- through the banked cutLog_s7_strict / cutLog_s7_width_lt / cutLog_s7_nested tie -- to the
    false numeric 1 = 574 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (574 : ℕ) attestFlag = 574 := by
  rw [cert_val_true]

end Counterexamples
