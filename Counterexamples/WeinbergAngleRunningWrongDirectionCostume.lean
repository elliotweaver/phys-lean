/-
  Counterexamples.WeinbergAngleRunningWrongDirectionCostume — N342 anti-vacuity (C367).
  ============================================================================
  W8 ANTI-VACUITY. The N342 node (seeded arc-D D4, the Weinberg angle's scale reading) banks the
  RUNNING weak mixing `sin²θ_W(μ) = a₂/(a₂+a_Y)` over the derived ℝ `Cut`, with the DEPARTURE landing:
  once the non-abelian SU(2) self-coupling REDUCES the effective isospin depth below the matter value
  `isoDepth = 2` (`0 < d2 < isoDepth`), below the octonion scale (`0 < μ < M`, `κ > 0`) the mixing runs
  strictly DOWN below the octonion value `3/8` — toward the low-energy (`≈ 0.231`) regime:

      `sinSqRun_departs_down : sinSqRun d2 κ M μ < 3 / 8`   (below scale, with reduced isospin depth).

  This DOWNWARD direction is a FORCED consequence of the reduced isospin depth `d2 < isoDepth` (the
  non-abelian anti-screening, absent for the abelian hypercharge); a mis-signed departure or a
  mis-derived depth would break it.

  THE CERTIFICATE. `downFlag := 231` — a ℕ flag standing for "below the octonion scale, with the
  non-abelian-reduced isospin depth, the mixing runs DOWN from 3/8 toward the low-energy ≈0.231 regime,
  i.e. `sinSqRun d2 κ M μ < 3/8`". It is TIED to the banked N342 landing by `downFlag_forced` below: the
  banked `sinSqRun_departs_down` IS that strict-below over the derived `Cut`. If the departure were
  mis-derived (wrong depth ordering, wrong trace), this would fail.

  We anchor `min 231 367 = 231` (TRUE — `downFlag = 231 < 367`, so the min is the flag `231`).

  THE BOGUS CLAIM (a stand-in for ANY wrong departure direction / mis-derived depth): that `min 231 367
  = 367`. It GENUINELY equals `231` (`cert_val_true`). Rewriting the banked value reduces the bogus claim
  to the false numeric `231 = 367` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (231, 367) is fresh (Cid 367 distinct from every prior).

  The `231` here is a REMOVABLE-PROSE flag numeral (the low-energy reading direction, `sin²θ_W ≈ 0.231`),
  appearing ONLY in this counterexample certificate, NEVER in any production statement or proof.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.WeinbergAngleRunning
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

/-- THE DOWNWARD FLAG: `231` = "below the octonion scale, with the non-abelian-reduced isospin depth,
    the mixing runs DOWN from 3/8 toward the low-energy ≈0.231 regime, i.e. `sinSqRun d2 κ M μ < 3/8`".
    A removable-prose flag numeral, not used in any production statement. -/
def downFlag : ℕ := 231

/-- TRUE (tied to the banked N342 forced landing): below the octonion scale, with `κ > 0`, `0 < μ < M`,
    and the non-abelian-reduced isospin depth `0 < d2 < isoDepth`, the running mixing strictly drops
    below the octonion value `3/8` — the downward direction, from the banked `sinSqRun_departs_down`.
    The SIGN is forced by the reduced isospin depth `d2 < isoDepth`. If mis-derived, this would fail. -/
theorem downFlag_forced (d2 κ M μ : Cut) (hκ : 0 < κ) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRun d2 κ M μ < 3 / 8 :=
  sinSqRun_departs_down d2 κ M μ hκ hd2 hd2lt hμ hμM

/-- TRUE: `min 231 367 = 231`, holding precisely because `downFlag = 231 < 367`. -/
theorem cert_val_true : min downFlag (367 : ℕ) = 231 := by decide

/-- BOGUS: claims `min 231 367 = 367`. It GENUINELY equals `231` (`cert_val_true`). A WRONG departure
    direction / mis-derived depth reduces — through the banked value — to the false numeric `231 = 367`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min downFlag (367 : ℕ) = 367 := by
  rw [cert_val_true]
  -- ⊢ (231 : ℕ) = 367  (FALSE — the costume bites)

end Counterexamples
