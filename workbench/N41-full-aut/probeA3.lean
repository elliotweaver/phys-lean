import Phys.Algebra.Derivation
import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Sum

open Phys.Algebra Phys.Cascade Finset
open scoped BigOperators

noncomputable section
attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

-- the pure Pascal ℕ-smul identity (proved in probeB)
theorem pascal_smul_sum {M : Type*} [AddCommMonoid M] (g : ℕ → M) (N : ℕ) :
    (∑ m ∈ range (N + 1), (N.choose m) • g (m + 1))
      + (∑ m ∈ range (N + 1), (N.choose m) • g m)
    = ∑ m ∈ range (N + 2), ((N+1).choose m) • g m := by
  rw [Finset.sum_range_succ' (fun m => ((N+1).choose m) • g m) (N+1)]
  simp only [Nat.choose_zero_right, one_nsmul]
  have hpascal : ∀ m ∈ range (N+1),
      ((N+1).choose (m+1)) • g (m+1)
        = (N.choose m) • g (m+1) + (N.choose (m+1)) • g (m+1) := by
    intro m _
    rw [Nat.choose_succ_succ' N m, add_nsmul]
  rw [Finset.sum_congr rfl hpascal, Finset.sum_add_distrib, add_assoc]
  congr 1
  rw [Finset.sum_range_succ' (fun m => (N.choose m) • g m) N]
  simp only [Nat.choose_zero_right, one_nsmul]
  congr 1
  rw [Finset.sum_range_succ (fun m => (N.choose (m+1)) • g (m+1)) N]
  simp [Nat.choose_succ_self]

section
variable (D : Module.End ℤ (CD (CD B)))

theorem dpow_succ_apply (x : CD (CD B)) (n : ℕ) : (D ^ (n+1)) x = D ((D ^ n) x) := by
  rw [_root_.pow_succ']; rfl

theorem dterm_split (hD : IsDeriv D) (x y : CD (CD B)) (c : ℕ) (k l : ℕ) :
    D (c • ((D ^ k) x * (D ^ l) y))
      = c • ((D ^ (k+1)) x * (D ^ l) y) + c • ((D ^ k) x * (D ^ (l+1)) y) := by
  rw [map_nsmul, hD ((D ^ k) x) ((D ^ l) y), ← dpow_succ_apply, ← dpow_succ_apply, smul_add]

-- ★ THE ITERATED LEIBNIZ BINOMIAL (range form).
theorem iter_leibniz_range (hD : IsDeriv D) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ m ∈ range (n + 1), (n.choose m) • ((D ^ m) x * (D ^ (n - m)) y) := by
  induction n with
  | zero => simp
  | succ N ih =>
      rw [dpow_succ_apply, ih, map_sum]
      -- split each term
      have hsplit : ∀ m ∈ range (N+1),
          D ((N.choose m) • ((D ^ m) x * (D ^ (N - m)) y))
            = (N.choose m) • ((D ^ (m+1)) x * (D ^ (N - m)) y)
              + (N.choose m) • ((D ^ m) x * (D ^ (N - m + 1)) y) := by
        intro m _
        rw [dterm_split D hD x y (N.choose m) m (N - m)]
      rw [Finset.sum_congr rfl hsplit, Finset.sum_add_distrib]
      -- Now goal: [∑ C(N,m)•(D^{m+1}x·D^{N-m}y)] + [∑ C(N,m)•(D^m x·D^{N-m+1}y)]
      --         = ∑_{range(N+2)} C(N+1,m)•(D^m x·D^{N+1-m}y)
      -- Define g m := D^m x · D^{N+1-m} y.  Then:
      --   D^{m+1}x · D^{N-m}y = g (m+1)   (since N+1-(m+1)=N-m)
      --   D^m x · D^{N-m+1}y = g m        (since N+1-m=N-m+1)
      -- and match RHS.
      have hL1 : (∑ m ∈ range (N+1), (N.choose m) • ((D ^ (m+1)) x * (D ^ (N - m)) y))
          = ∑ m ∈ range (N+1), (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) (m+1)) := by
        apply Finset.sum_congr rfl
        intro m hm
        rw [mem_range] at hm
        have : N + 1 - (m + 1) = N - m := by omega
        simp only [this]
      have hL2 : (∑ m ∈ range (N+1), (N.choose m) • ((D ^ m) x * (D ^ (N - m + 1)) y))
          = ∑ m ∈ range (N+1), (N.choose m) • ((fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) m) := by
        apply Finset.sum_congr rfl
        intro m hm
        rw [mem_range] at hm
        have : N + 1 - m = N - m + 1 := by omega
        simp only [this]
      rw [hL1, hL2, pascal_smul_sum (fun k => (D ^ k) x * (D ^ (N + 1 - k)) y) N]
end
