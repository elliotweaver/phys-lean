import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

structure SmulCompat (R A : Type*) [Mul A] [Add A] [Neg A] [Star A] [SMul R A] : Prop where
  hl : ∀ (c : R) (a b : A), (c • a) * b = c • (a * b)
  hr : ∀ (c : R) (a b : A), a * (c • b) = c • (a * b)
  hstar : ∀ (c : R) (a : A), star (c • a) = c • star a
  hneg : ∀ (c : R) (a : A), c • (-a) = -(c • a)
  hadd : ∀ (c : R) (a b : A), c • (a + b) = c • a + c • b

-- BASE CASE: SmulCompat Cut (Dbl Cut), where Cut acts componentwise r•z = ⟨r*z.re, r*z.im⟩
-- and Dbl mul is ⟨re*re - im*im, re*im + im*re⟩, star ⟨re,-im⟩.
theorem smulCompat_dbl_cut : SmulCompat Cut (Dbl Cut) where
  hl c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hr c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hstar c a := by ext <;> simp [Dbl.smul_re]
  hneg c a := by ext <;> simp [Dbl.smul_re] <;> ring
  hadd c a b := by ext <;> simp [Dbl.smul_re] <;> ring

end
