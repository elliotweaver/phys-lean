import Phys.Algebra.LorentzContinuumRotation
import Phys.Algebra.DerivationOExp
import Mathlib.Tactic
import Mathlib.Algebra.Lie.OfAssociative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- (P1) Module.End Cut STVC typechecks, has a bracket, LieSubalgebra is a valid type.
example : Ring (Module.End Cut STVC) := inferInstance
example (S T : Module.End Cut STVC) : Module.End Cut STVC := ⁅S, T⁆
example : Type _ := LieSubalgebra Cut (Module.End Cut STVC)

-- (P2) reQC / gFormC biadditivity + symmetry over Cut (mirror the ℚ proofs).
theorem reQC_add (a b : O Cut) : reQC (a + b) = reQC a + reQC b := by
  simp [reQC, CD.add_re, Dbl.add_re]

theorem reQC_neg (a : O Cut) : reQC (-a) = - reQC a := by
  simp [reQC, CD.neg_re, Dbl.neg_re]

theorem reQC_star (z : O Cut) : reQC (star z) = reQC z := by
  simp [reQC, CD.star_re, Dbl.star_re']

theorem gFormC_symm (v w : O Cut) : gFormC v w = gFormC w v := by
  unfold gFormC; rw [← reQC_star (v * star w), star_mul, star_star]

theorem gFormC_add_right (v w₁ w₂ : O Cut) :
    gFormC v (w₁ + w₂) = gFormC v w₁ + gFormC v w₂ := by
  unfold gFormC; rw [star_add, mul_add_na, reQC_add]

theorem gFormC_add_left (v₁ v₂ w : O Cut) :
    gFormC (v₁ + v₂) w = gFormC v₁ w + gFormC v₂ w := by
  rw [gFormC_symm, gFormC_add_right, gFormC_symm v₁ w, gFormC_symm v₂ w]

theorem gFormC_zero_right (v : O Cut) : gFormC v 0 = 0 := by
  unfold gFormC; rw [star_zero, mul_zero]; rfl

-- (P3) the polarized skew identity, via gFormC_comp.  Target:
--   gFormC (a*v) w + gFormC v (a*w) = 2 * gFormC a 1 * gFormC v w     (one_mul: a*1=a etc)
-- step A: left-scaling  gFormC (a*v) (a*w) = gFormC a a * gFormC v w   (polarize gFormC_comp in v-slot)
theorem gFormC_leftscale (a v w : O Cut) :
    gFormC (a * v) (a * w) + gFormC (a * w) (a * v)
      = gFormC a a * gFormC v w + gFormC a a * gFormC w v := by
  have h := gFormC_comp a (v + w)
  rw [mul_add_na] at h
  -- gFormC (a*v + a*w) (a*v + a*w) = gFormC a a * gFormC (v+w) (v+w)
  sorry

end
end Phys.Algebra
