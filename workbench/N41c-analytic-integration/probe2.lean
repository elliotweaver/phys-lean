import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

/-- A bundle of the five base-level smul-compatibility laws needed to lift through a CD double. -/
structure SmulCompat (R A : Type*) [Mul A] [Add A] [Neg A] [Star A] [SMul R A] : Prop where
  hl : ∀ (c : R) (a b : A), (c • a) * b = c • (a * b)
  hr : ∀ (c : R) (a b : A), a * (c • b) = c • (a * b)
  hstar : ∀ (c : R) (a : A), star (c • a) = c • star a
  hneg : ∀ (c : R) (a : A), c • (-a) = -(c • a)
  hadd : ∀ (c : R) (a b : A), c • (a + b) = c • a + c • b

section Generic
variable {R A : Type*} [Mul A] [Add A] [Neg A] [Star A] [SMul R A]

-- CD-level smul-mul-left from base bundle
theorem cd_smul_mul_left (H : SmulCompat R A) (c : R) (z w : CD A) :
    (c • z) * w = c • (z * w) := by
  ext
  · show (c • z.re) * w.re + -(star w.im * (c • z.im)) = c • (z.re * w.re + -(star w.im * z.im))
    rw [H.hl, H.hr, H.hadd, H.hneg]
  · show w.im * (c • z.re) + (c • z.im) * star w.re = c • (w.im * z.re + z.im * star w.re)
    rw [H.hr, H.hl, H.hadd]

theorem cd_smul_mul_right (H : SmulCompat R A) (c : R) (z w : CD A) :
    z * (c • w) = c • (z * w) := by
  ext
  · show z.re * (c • w.re) + -(star (c • w.im) * z.im) = c • (z.re * w.re + -(star w.im * z.im))
    rw [H.hr, H.hstar, H.hl, H.hadd, H.hneg]
  · show (c • w.im) * z.re + z.im * star (c • w.re) = c • (w.im * z.re + z.im * star w.re)
    rw [H.hl, H.hstar, H.hr, H.hadd]

theorem cd_smul_star (H : SmulCompat R A) (c : R) (z : CD A) :
    star (c • z) = c • star z := by
  ext
  · show star (c • z.re) = c • star z.re; rw [H.hstar]
  · show -(c • z.im) = c • (-z.im); rw [H.hneg]

theorem cd_smul_neg (H : SmulCompat R A) (c : R) (z : CD A) : c • (-z) = -(c • z) := by
  ext
  · show c • (-z.re) = -(c • z.re); rw [H.hneg]
  · show c • (-z.im) = -(c • z.im); rw [H.hneg]

theorem cd_smul_add (H : SmulCompat R A) (c : R) (z w : CD A) :
    c • (z + w) = c • z + c • w := by
  ext
  · show c • (z.re + w.re) = c • z.re + c • w.re; rw [H.hadd]
  · show c • (z.im + w.im) = c • z.im + c • w.im; rw [H.hadd]

/-- ★ THE LIFT: a base bundle yields a CD-level bundle. -/
theorem smulCompat_cd (H : SmulCompat R A) : SmulCompat R (CD A) where
  hl := cd_smul_mul_left H
  hr := cd_smul_mul_right H
  hstar := cd_smul_star H
  hneg := cd_smul_neg H
  hadd := cd_smul_add H

end Generic

end
