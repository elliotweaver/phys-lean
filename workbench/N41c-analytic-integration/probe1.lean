import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- PROBE 1: the smul-central compatibility on the generic CD double, then on O Cut.
-- The componentwise action c • z = ⟨c•z.re, c•z.im⟩ ; need (c•z)*w = c•(z*w), z*(c•w)=c•(z*w).

-- First the GENERIC CD-level versions, assuming the base satisfies the two laws + star-smul.
section Generic
variable {R A : Type*} [Mul A] [Add A] [Neg A] [Star A] [SMul R A]

-- left compatibility on CD A given the base laws
theorem cd_smul_mul_left
    (hl : ∀ (c : R) (a b : A), (c • a) * b = c • (a * b))
    (hr : ∀ (c : R) (a b : A), a * (c • b) = c • (a * b))
    (hsub : ∀ (c : R) (a b : A), c • (a + -b) = c • a + -(c • b))
    (hstar : ∀ (c : R) (a : A), star (c • a) = c • star a)
    (hadd : ∀ (c : R) (a b : A), c • (a + b) = c • a + c • b)
    (c : R) (z w : CD A) :
    (c • z) * w = c • (z * w) := by
  ext
  · show (c • z).re * w.re + -(star w.im * (c • z).im) = c • (z.re * w.re + -(star w.im * z.im))
    show c • z.re * w.re + -(star w.im * (c • z.im)) = c • (z.re * w.re + -(star w.im * z.im))
    rw [hl, hr, hsub]
  · show w.im * (c • z).re + (c • z).im * star w.re = c • (w.im * z.re + z.im * star w.re)
    show w.im * (c • z.re) + (c • z.im) * star w.re = c • (w.im * z.re + z.im * star w.re)
    rw [hr, hl, hadd]

end Generic

end
