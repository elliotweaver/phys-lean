import Phys.Algebra.OctonionJordanCubicNorm
import Phys.Algebra.OctonionJordanInvariantTower
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## MEASURE the FINITE version: the derived gauge GROUP Aut(O)=G₂ preserves the arena's
    spectral invariants EXACTLY. φ acts on the off-diagonal entries (fixing the real diagonal). -/

/-- ★★★ THE FINITE HEADLINE — the derived gauge GROUP preserves the CUBIC NORM (Freudenthal
    determinant): for an algebra automorphism φ of `O ℚ`, transforming the off-diagonal
    entries by φ (the diagonal fixed) leaves `jN` unchanged. The observable spectrum is
    gauge-invariant. -/
theorem jN_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c := by
  unfold jN
  rw [aut_gForm h c c, aut_gForm h b b, aut_gForm h a a]
  -- cross term: reQ((φa·φc)·star(φb)) = reQ(φ((a·c)·star b)) = reQ((a·c)·star b)
  rw [← h.1 a c, ← aut_star h b, ← h.1 (a * c) (star b), aut_reQ h]

/-- ★★ THE QUADRATIC SPUR preserved by the finite gauge group. -/
theorem jS_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jS d0 d1 d2 (φ a) (φ b) (φ c) = jS d0 d1 d2 a b c := by
  unfold jS
  rw [aut_gForm h a a, aut_gForm h b b, aut_gForm h c c]

/-- ★★ THE CHARACTERISTIC POLYNOMIAL preserved: the eigenvalue-spectrum is gauge-invariant.
    (Using jN_charpoly which expresses det(λ−A) via jN with negated off-diagonals.) -/
theorem jN_charpoly_aut_invariant {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ)
    (d0 d1 d2 lam : ℚ) (a b c : O ℚ) :
    jN (lam - d0) (lam - d1) (lam - d2) (-(φ a)) (-(φ b)) (-(φ c))
      = jN (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c) := by
  rw [← map_neg φ a, ← map_neg φ b, ← map_neg φ c]
  exact jN_aut_invariant h (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c)

end Phys.Algebra.HJ
