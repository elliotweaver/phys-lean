import Phys.Algebra.StrongCPTheta
import Phys.Algebra.ChiralGenerationIsospinTrace
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

open scoped BigOperators
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ

namespace P4Probe

attribute [local instance] CD.narCD CD.srCD

/-! ## PIECE A — the gauge-θ: θ-weight ≡ 1, −I ∉ Aut. -/

/-- The θ-weight of a matter configuration: the imaginary (phase) part of the reduced determinant. -/
noncomputable def thetaWeight (d0 d1 d2 : ℚ) (a b c : O ℚ) : O ℚ :=
  detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c))

/-- θ-weight ≡ 0 (trivial): every configuration carries the trivial phase weight 1. -/
theorem thetaWeight_trivial (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    thetaWeight d0 d1 d2 a b c = 0 :=
  theta_det_phase_zero d0 d1 d2 a b c

/-- The negation map on the terminal algebra as a ℚ-linear equiv. -/
noncomputable def negId : O ℚ ≃ₗ[ℚ] O ℚ := LinearEquiv.neg ℚ

theorem negId_apply (x : O ℚ) : negId x = -x := LinearEquiv.neg_apply x

/-- (−1 : O ℚ) ≠ 1. -/
theorem negOne_ne_one : (-1 : O ℚ) ≠ 1 := by
  intro h
  have := congrArg reQ h
  rw [reQ_neg, reQ_one] at this
  norm_num at this

/-- −I is NOT an algebra automorphism: it fails unitality (−1 ≠ 1). -/
theorem negId_not_isAlgAut : ¬ IsAlgAut negId := by
  intro h
  have h1 : negId 1 = 1 := h.2
  rw [negId_apply] at h1
  exact negOne_ne_one h1

/-- jN is degree-3 homogeneous: full negation flips the determinant's sign (the would-be θ=π). -/
theorem jN_neg_all (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN (-d0) (-d1) (-d2) (-a) (-b) (-c) = - jN d0 d1 d2 a b c := by
  unfold jN
  have hg1 : gForm (-c) (-c) = gForm c c := by
    unfold gForm; rw [star_neg, neg_mul_neg]
  have hg2 : gForm (-b) (-b) = gForm b b := by
    unfold gForm; rw [star_neg, neg_mul_neg]
  have hg3 : gForm (-a) (-a) = gForm a a := by
    unfold gForm; rw [star_neg, neg_mul_neg]
  have hcross : reQ ((-a) * (-c) * star (-b)) = - reQ (a * c * star b) := by
    rw [star_neg, neg_mul_neg, mul_neg, reQ_neg]
  rw [hg1, hg2, hg3, hcross]; ring

end P4Probe
