import Phys.Algebra.DerivationAutExp
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped Topology BigOperators
noncomputable section

theorem expTerm_antidiagonal (A B : Matrix (Fin 8) (Fin 8) Cut) (h : Commute A B) (n : ℕ) :
    ∑ kl ∈ Finset.antidiagonal n, expTerm A kl.1 * expTerm B kl.2 = expTerm (A + B) n := by
  unfold expTerm
  rw [h.add_pow' n, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro kl hkl
  rw [Finset.mem_antidiagonal] at hkl
  have hk : kl.1 ≤ n := by omega
  rw [Matrix.smul_mul, Matrix.mul_smul, smul_smul]
  rw [← Nat.cast_smul_eq_nsmul Cut (n.choose kl.1) (A ^ kl.1 * B ^ kl.2), smul_smul]
  congr 1
  have hcmf := Nat.choose_mul_factorial_mul_factorial hk
  rw [show n - kl.1 = kl.2 by omega] at hcmf
  have hk0 : (kl.1.factorial : Cut) ≠ 0 := by positivity
  have hl0 : (kl.2.factorial : Cut) ≠ 0 := by positivity
  have hn0 : (n.factorial : Cut) ≠ 0 := by positivity
  have hcast : (n.choose kl.1 : Cut) * (kl.1.factorial : Cut) * (kl.2.factorial : Cut) = (n.factorial : Cut) := by
    have : ((n.choose kl.1 * kl.1.factorial * kl.2.factorial : ℕ) : Cut) = ((n.factorial : ℕ) : Cut) := by rw [hcmf]
    push_cast at this; linarith [this]
  field_simp
  linarith [hcast]

#check @expTerm_antidiagonal
