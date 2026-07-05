import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Algebra.Ring.Parity

open Finset

theorem sum_range_odd_split (m : ℕ) (g : ℕ → ℤ) :
    ∑ j ∈ range (2*m+1), g j
      = (∑ k ∈ range (m+1), g (2*k)) + ∑ k ∈ range m, g (2*k+1) := by
  induction m with
  | zero => simp
  | succ p ih =>
    have e : 2*(p+1)+1 = (2*p+1) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2*p+1)+1), sum_range_succ _ (2*p+1), ih]
    rw [sum_range_succ (fun k => g (2*k)) (p+1), sum_range_succ (fun k => g (2*k+1)) p]
    simp only [show 2*(p+1) = 2*p+1+1 from by ring]
    ring

theorem even_choose_eq_odd_choose (m : ℕ) (hm : m ≠ 0) :
    (∑ k ∈ range (m+1), ((2*m).choose (2*k) : ℤ))
      = ∑ k ∈ range m, ((2*m).choose (2*k+1) : ℤ) := by
  have halt : (∑ j ∈ range (2*m+1), ((-1)^j * (2*m).choose j : ℤ)) = 0 :=
    Int.alternating_sum_range_choose_of_ne (by omega)
  rw [sum_range_odd_split m (fun j => (-1)^j * (2*m).choose j)] at halt
  have heven : (∑ k ∈ range (m+1), ((-1)^(2*k) * (2*m).choose (2*k) : ℤ))
      = ∑ k ∈ range (m+1), ((2*m).choose (2*k) : ℤ) := by
    apply sum_congr rfl; intro k _; rw [pow_mul]; norm_num
  have hodd : (∑ k ∈ range m, ((-1)^(2*k+1) * (2*m).choose (2*k+1) : ℤ))
      = -(∑ k ∈ range m, ((2*m).choose (2*k+1) : ℤ)) := by
    rw [← sum_neg_distrib]; apply sum_congr rfl; intro k _; rw [pow_succ, pow_mul]; norm_num
  rw [heven, hodd] at halt
  linarith [halt]
