import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

namespace Phys.Algebra.P1Probe

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix

noncomputable section

-- (1) THE AFFINE F₄ CARTAN MATRIX over ℤ (finite exact root-system combinatorics).
-- Node order [0(affine),1,2,3,4]; finite F4: 1-2=>3-4, affine 0 attaches to 1.
-- The double bond sits between rows/cols 2 (long) and 3 (short): A[2][3]=-2, A[3][2]=-1.
def f4AffineCartan : Matrix (Fin 5) (Fin 5) ℤ :=
  !![ 2, -1,  0,  0,  0;
     -1,  2, -1,  0,  0;
      0, -1,  2, -2,  0;
      0,  0, -1,  2, -1;
      0,  0,  0, -1,  2]

-- The comark (dual Kac label) vector.
def comarkVec : Fin 5 → ℤ := ![1, 2, 3, 2, 1]

-- (2) THE NULL-VECTOR THEOREM: the comark vector is annihilated by the affine Cartan matrix.
theorem f4_comark_null : f4AffineCartan.mulVec comarkVec = 0 := by
  funext i
  fin_cases i <;>
    simp [f4AffineCartan, comarkVec, Matrix.mulVec, Matrix.dotProduct,
          Fin.sum_univ_five] <;> ring

-- (3) THE COMARK SUM = 9 (derived, not asserted).
def comarkCount : ℕ := (∑ i : Fin 5, comarkVec i).toNat

theorem comarkCount_eq_nine : comarkCount = 9 := by
  simp [comarkCount, comarkVec, Fin.sum_univ_five]

-- (4) THE WELD: comark count = finrank spaceSub (both 9).
theorem comarkCount_eq_finrank : comarkCount = Module.finrank ℚ spaceSub := by
  rw [comarkCount_eq_nine, finrank_spaceSub]

-- (5) minimal-wrap ratio via the derived comark count equals the banked EW rung.
def ewFromComark : Cut := cutExp (-(rungExponent comarkCount))

theorem ewFromComark_eq : ewFromComark = ewClosureRatio := by
  unfold ewFromComark ewClosureRatio
  rw [comarkCount_eq_finrank]

-- (6) the exponent arrives as 2·cutPi·42/9 (2π·(channel count)/(comark count)).
theorem minimalWrap_exponent :
    rungExponent comarkCount = azimuthalTurn * ((1 / alphaStar : ℚ) : Cut) / (comarkCount : Cut) := by
  unfold rungExponent criticalPhaseNumerator channelCount
  rw [comarkCount_eq_nine]

end

end Phys.Algebra.P1Probe
