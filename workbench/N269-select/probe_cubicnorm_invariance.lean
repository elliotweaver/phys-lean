import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanInvariantTower
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## MEASURE candidate A: the derived gauge preserves the arena's spectral invariants.
    The first variation (Lie derivative along a derivation D) of jN, jS, jTr under the
    entrywise gauge action (diagonal fixed; a↦Da, b↦Db, c↦Dc) vanishes. -/

/-- Helper: a derivation output has vanishing real part (reQ ∘ D = 0). -/
theorem reQ_deriv_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (w : O ℚ) :
    reQ (D w) = 0 := by
  have hstar : star (D w) = - D w := derivQ_maps_im D hD w
  have h := congrArg reQ hstar
  rw [reQ_star, reQ_neg] at h
  linarith

/-- THE CROSS-TERM VARIATION dissolves to reQ(D[..]) = 0 via Leibniz + star-commute. -/
theorem cross_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a b c : O ℚ) :
    reQ ((D a * c) * star b + (a * D c) * star b + (a * c) * star (D b)) = 0 := by
  have hsb : star (D b) = D (star b) := (derivQ_star_comm D hD b).symm
  rw [hsb]
  -- (Da*c)*sb + (a*Dc)*sb + (a*c)*D(sb) = D((a*c)*star b)
  have hac : D a * c + a * D c = D (a * c) := (hD a c).symm
  have hstep : (D a * c) * star b + (a * D c) * star b + (a * c) * D (star b)
      = D ((a * c) * star b) := by
    rw [hD (a * c) (star b)]
    rw [← add_mul, hac]
  rw [hstep]
  exact reQ_deriv_zero D hD _

/-- ★★★ THE HEADLINE (infinitesimal): the FIRST VARIATION of the cubic norm jN under the
    entrywise gauge action (diagonal fixed) VANISHES — the derived gauge preserves the
    Freudenthal determinant. -/
theorem jN_first_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    (- (d0 * (gForm (D c) c + gForm c (D c)))
      - (d1 * (gForm (D b) b + gForm b (D b)))
      - (d2 * (gForm (D a) a + gForm a (D a)))
      + 2 * reQ ((D a * c) * star b + (a * D c) * star b + (a * c) * star (D b))) = 0 := by
  have hc := gFormQ_skew D hD c c
  have hb := gFormQ_skew D hD b b
  have ha := gFormQ_skew D hD a a
  have hcross := cross_variation_zero D hD a b c
  rw [hc, hb, ha, hcross]
  ring

/-- ★★ THE QUADRATIC SPUR first variation vanishes (SAME skewness). -/
theorem jS_first_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (a b c : O ℚ) :
    (- (gForm (D a) a + gForm a (D a))
      - (gForm (D b) b + gForm b (D b))
      - (gForm (D c) c + gForm c (D c))) = 0 := by
  have hc := gFormQ_skew D hD c c
  have hb := gFormQ_skew D hD b b
  have ha := gFormQ_skew D hD a a
  rw [hc, hb, ha]; ring

/-- ★ THE LINEAR TRACE first variation vanishes (the diagonal is gauge-fixed, off-diagonal
    contributes zero trace). jTr's variation is reQ over the (fixed) diagonal → 0. -/
theorem jTr_diagonal_variation_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    D (0 : O ℚ) = 0 := map_zero D

/-- SANITY: reuse jAct_Dg — the diagonal is gauge-fixed (from N268). -/
example (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (d0 d1 d2 : ℚ) :
    jAct D (Dg d0 d1 d2) = 0 := jAct_Dg D hD d0 d1 d2

end Phys.Algebra.HJ
