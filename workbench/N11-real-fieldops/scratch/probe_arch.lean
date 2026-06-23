import Phys.Foundation.OrderedTower
import Mathlib.Tactic
import Mathlib.Algebra.Order.Archimedean.Basic

namespace Phys.Foundation
open Phys.Foundation

theorem step_eq_add_one (a : Re) : Re.step a = a + 1 := rfl

theorem Z.ofRe_step (a : Re) : Z.ofRe (Re.step a) = Z.ofRe a + 1 := by
  rw [step_eq_add_one, Z.ofRe_add, Z.ofRe_one]

def Re.toNat (a : Re) : ℕ := Re.iterate 0 Nat.succ a
@[simp] theorem Re.toNat_void : Re.toNat Re.void = 0 := rfl
@[simp] theorem Re.toNat_step (a : Re) : Re.toNat (Re.step a) = (Re.toNat a) + 1 := rfl

theorem Z.ofRe_eq_natCast (a : Re) : Z.ofRe a = ((Re.toNat a : ℕ) : Z) := by
  induction a with
  | void => rfl
  | step k ih => rw [Z.ofRe_step, ih, Re.toNat_step]; push_cast; ring

theorem Z.le_ofRe (a b : Re) : Z.mk a b ≤ Z.ofRe a := by
  refine ⟨b, ?_⟩
  rw [Z.ofRe_def]; apply Z.sound; ring

theorem Z.exists_nat_ge (x : Z) : ∃ n : ℕ, x ≤ (n : Z) := by
  refine Z.ind (fun a b => ?_) x
  exact ⟨Re.toNat a, by rw [← Z.ofRe_eq_natCast]; exact Z.le_ofRe a b⟩

theorem Z.one_le_of_pos {y : Z} (hy : 0 < y) : 1 ≤ y := by
  obtain ⟨n, hn⟩ := le_of_lt hy
  rw [zero_add] at hn
  have hn0 : n ≠ 0 := by rintro rfl; rw [Z.ofRe_zero] at hn; exact (ne_of_lt hy) hn.symm
  cases n with
  | void => exact absurd rfl hn0
  | step m => exact ⟨m, by rw [hn, Z.ofRe_step]; ring⟩

instance : Archimedean Z := by
  constructor
  intro x y hy
  obtain ⟨n, hn⟩ := Z.exists_nat_ge x
  have h1 : (1:Z) ≤ y := Z.one_le_of_pos hy
  refine ⟨n, le_trans hn ?_⟩
  calc (n:Z) = n • (1:Z) := by rw [nsmul_eq_mul, mul_one]
    _ ≤ n • y := nsmul_le_nsmul_right h1 n

theorem Q.natCast_eq_ofZ (n : ℕ) : ((n : ℕ) : Q) = Q.ofZ ((n : ℕ) : Z) := by
  induction n with
  | zero => rw [Nat.cast_zero, Nat.cast_zero, Q.ofZ_zero]
  | succ k ih => push_cast; rw [ih, Q.ofZ_add, Q.ofZ_one]

instance : Archimedean Q := by
  rw [archimedean_iff_nat_le]
  refine Q.ind (fun p q => ?_)
  have hd0 : q.1 ≠ 0 := q.2
  have hd2 : 0 < q.1 * q.1 := mul_self_pos.mpr hd0
  obtain ⟨n, hn⟩ := Archimedean.arch (p * q.1) hd2
  rw [nsmul_eq_mul] at hn
  refine ⟨n, ?_⟩
  rw [Q.natCast_eq_ofZ, Q.le_def, Q.ofZ_def, sub_eq_add_neg, Q.neg_mk, Q.mk_add_mk,
    Q.nonneg_mk, NZ.mul_val, NZ.one_val]
  nlinarith [hn]

end Phys.Foundation
