/-
  Counterexamples.TowerWorldMapIndivisibleWrongValueCostume — N265 anti-vacuity (C296).
  ===========================================================================
  W8 ANTI-VACUITY. The N265 node banks MATTER IS ONE INDIVISIBLE WHOLE, AND ITS INDIVISIBILITY IS
  THE CASCADE STOP: over the derived octonion rung `O ℚ = CD (H ℚ)`, the matter carrier has NO ZERO
  DIVISORS (`octNoZeroDivisors` / `octMul_ne_zero`), is irreducible under the fold's worldMap
  (`worldMap_irreducible`), and this indivisibility is the same multiplicativity boundary that stops
  the cascade (`division_boundary`, the mirror of `forced_stop_boundary`).

  The load-bearing QUANTITATIVE fact underneath no-zero-divisors is the BANKED Born COMPOSITION LAW
  `gForm_comp`: `gForm (x·y)(x·y) = gForm x x · gForm y y` (the multiplicativity that survives to the
  octonion rung and forces indivisibility). Read at the orthonormal pair `(u1, u2)`
  (`gForm u1 u1 = 1`, `gForm u2 u2 = 1`, banked `gForm_u1`/`gForm_u2_u2`), the self-overlap of the
  product `u1 · u2` is exactly `gForm (u1·u2)(u1·u2) = gForm u1 u1 · gForm u2 u2 = 1·1 = 1`. Being
  nonzero (`1 ≠ 0`), it witnesses `u1 · u2 ≠ 0` — the no-zero-divisor content the node banks (two
  nonzero standpoints multiply to a nonzero, `octMul_ne_zero`).

  We anchor the clean scalar `gForm (u1 * u2) (u1 * u2) = 1` (TRUE via `gForm_comp` + `gForm_u1` +
  `gForm_u2_u2`), packaged as `min 296 (gForm (u1 * u2) (u1 * u2)) = 1`, and TIED to the node's
  content via `product_selfoverlap_true` below which computes it through the banked composition law.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the composition law fails / the product has a
  different self-overlap / `u1·u2` could be a zero divisor / matter is divisible): that
  `min 296 (gForm (u1 * u2) (u1 * u2))` equals `296`. It GENUINELY equals `1`
  (`product_selfoverlap_scale_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `1 = 296` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the orthonormal pair `gForm u1 u1 = gForm u2 u2
  = 1`, the composition law gives `gForm (u1·u2)(u1·u2) = 1`, and claiming it equals `296` is
  genuinely FALSE (1 ≠ 296).

  DISTINCT from the banked battery: the pair (296, 1) is fresh (RHS 296 distinct from every prior
  right-hand value: …, 292, 293, 294, 295). The LHS anchor is the N265 composition-law self-overlap
  `1` — the multiplicativity witnessing no zero divisors — tied to the node via `gForm_comp`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapIndivisible

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- TRUE (tied to the node's composition law): the self-overlap of the product `u1 · u2` is the
    product of the self-overlaps `= 1·1 = 1`, via the BANKED Born composition law `gForm_comp` (the
    multiplicativity that forces no zero divisors) + `gForm_u1` + `gForm_u2_u2`. -/
theorem product_selfoverlap_true :
    gForm (u1 * u2) (u1 * u2) = 1 := by
  rw [gForm_comp, gForm_u1, gForm_u2_u2]; norm_num

/-- TRUE: `min 296 (gForm (u1 * u2) (u1 * u2)) = 1`, holding precisely because the composition law
    gives the product self-overlap `1` (nonzero — so `u1 · u2 ≠ 0`, the no-zero-divisor content). -/
theorem product_selfoverlap_scale_true :
    min (296 : ℚ) (gForm (u1 * u2) (u1 * u2)) = 1 := by
  rw [product_selfoverlap_true]; norm_num

/-- BOGUS: claims `min 296 (gForm (u1 * u2) (u1 * u2)) = 296`. It GENUINELY equals `1`
    (`product_selfoverlap_scale_true`). The WRONG reading (composition law fails / different
    self-overlap / `u1·u2` a zero divisor / matter divisible) reduces — through the banked value —
    to the false numeric `1 = 296`, so this must NOT compile. -/
theorem product_selfoverlap_scale_wrong_BOGUS :
    min (296 : ℚ) (gForm (u1 * u2) (u1 * u2)) = 296 := by
  rw [product_selfoverlap_scale_true]
  -- ⊢ (1 : ℚ) = 296  (FALSE — the costume bites)

end

end Counterexamples
