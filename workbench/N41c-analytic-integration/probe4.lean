import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow
import Mathlib.Topology.Algebra.InfiniteSum.Ring

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- (smul-compat machinery — proven in probe2/3, assume here via the lift)
structure SmulCompat (R A : Type*) [Mul A] [Add A] [Neg A] [Star A] [SMul R A] : Prop where
  hl : ∀ (c : R) (a b : A), (c • a) * b = c • (a * b)
  hr : ∀ (c : R) (a b : A), a * (c • b) = c • (a * b)
  hstar : ∀ (c : R) (a : A), star (c • a) = c • star a
  hneg : ∀ (c : R) (a : A), c • (-a) = -(c • a)
  hadd : ∀ (c : R) (a b : A), c • (a + b) = c • a + c • b

section Generic
variable {R A : Type*} [Mul A] [Add A] [Neg A] [Star A] [SMul R A]
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
theorem cd_smul_star (H : SmulCompat R A) (c : R) (z : CD A) : star (c • z) = c • star z := by
  ext
  · show star (c • z.re) = c • star z.re; rw [H.hstar]
  · show -(c • z.im) = c • (-z.im); rw [H.hneg]
theorem cd_smul_neg (H : SmulCompat R A) (c : R) (z : CD A) : c • (-z) = -(c • z) := by
  ext
  · show c • (-z.re) = -(c • z.re); rw [H.hneg]
  · show c • (-z.im) = -(c • z.im); rw [H.hneg]
theorem cd_smul_add (H : SmulCompat R A) (c : R) (z w : CD A) : c • (z + w) = c • z + c • w := by
  ext
  · show c • (z.re + w.re) = c • z.re + c • w.re; rw [H.hadd]
  · show c • (z.im + w.im) = c • z.im + c • w.im; rw [H.hadd]
theorem smulCompat_cd (H : SmulCompat R A) : SmulCompat R (CD A) where
  hl := cd_smul_mul_left H
  hr := cd_smul_mul_right H
  hstar := cd_smul_star H
  hneg := cd_smul_neg H
  hadd := cd_smul_add H
end Generic

theorem smulCompat_dbl_cut : SmulCompat Cut (Dbl Cut) where
  hl c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hr c a b := by ext <;> simp [Dbl.smul_re] <;> ring
  hstar c a := by ext <;> simp [Dbl.smul_re]
  hneg c a := by ext <;> simp [Dbl.smul_re] <;> ring
  hadd c a b := by ext <;> simp [Dbl.smul_re] <;> ring

theorem smulCompat_oCut : SmulCompat Cut (O Cut) :=
  smulCompat_cd (smulCompat_cd smulCompat_dbl_cut)

/-- THE VECTOR EXPONENTIAL on `O Cut` for a ℤ-linear endomorphism `D`. -/
def expO (D : Module.End ℤ (O Cut)) (x : O Cut) : O Cut :=
  ∑' n, (1 / (n.factorial : Cut)) • ((D ^ n) x)

/-- THE PER-`n` ALGEBRAIC REWRITE (pure algebra, given smul-central + N41a iterated Leibniz).
    `(1/n!)•(Dⁿ(x·y)) = ∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`. -/
theorem expO_term_antidiag (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) (x y : O Cut) (n : ℕ) :
    (1 / (n.factorial : Cut)) • ((D ^ n) (x * y))
      = ∑ kl ∈ Finset.antidiagonal n,
          ((1 / (kl.1.factorial : Cut)) • ((D ^ kl.1) x)) * ((1 / (kl.2.factorial : Cut)) • ((D ^ kl.2) y)) := by
  rw [iter_leibniz_antidiag D hD x y n, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro kl hkl
  rw [Finset.mem_antidiagonal] at hkl
  -- RHS term: ((1/k!)•Dᵏx)·((1/l!)•Dˡy) = (1/k!)•((1/l!)•(Dᵏx·Dˡy))  [smul-central l,r]
  rw [smulCompat_oCut.hl, smulCompat_oCut.hr, smul_smul]
  -- LHS term: (1/n!)•(C(n,k)•(Dᵏx·Dˡy)) = (C(n,k)/n!)•(...)
  rw [smul_comm (1 / (n.factorial : Cut)) (n.choose kl.1), ← Nat.cast_smul_eq_nsmul Cut, smul_smul]
  congr 1
  -- scalar identity: (1/n!)·C(n,k) = (1/k!)·(1/l!) for k+l=n
  have hk : kl.1 ≤ n := by omega
  have hcmf := Nat.choose_mul_factorial_mul_factorial hk
  rw [show n - kl.1 = kl.2 by omega] at hcmf
  have hk0 : (kl.1.factorial : Cut) ≠ 0 := by positivity
  have hl0 : (kl.2.factorial : Cut) ≠ 0 := by positivity
  have hn0 : (n.factorial : Cut) ≠ 0 := by positivity
  have hcast : (n.choose kl.1 : Cut) * (kl.1.factorial : Cut) * (kl.2.factorial : Cut)
      = (n.factorial : Cut) := by
    have hnat : ((n.choose kl.1 * kl.1.factorial * kl.2.factorial : ℕ) : Cut)
        = ((n.factorial : ℕ) : Cut) := by rw [hcmf]
    push_cast at hnat; linarith [hnat]
  field_simp
  linarith [hcast]

end
