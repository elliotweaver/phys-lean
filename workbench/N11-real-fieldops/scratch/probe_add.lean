import Phys.Foundation.ContinuumDerived
import Mathlib.Tactic
import Mathlib.Algebra.Order.Archimedean.Basic

namespace Phys.Foundation
open Phys.Foundation

/-! Archimedean Q (from probe_arch, condensed). -/
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
  refine ⟨b, ?_⟩; rw [Z.ofRe_def]; apply Z.sound; ring
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
  constructor; intro x y hy
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
  have hd2 : 0 < q.1 * q.1 := mul_self_pos.mpr q.2
  obtain ⟨n, hn⟩ := Archimedean.arch (p * q.1) hd2
  rw [nsmul_eq_mul] at hn
  refine ⟨n, ?_⟩
  rw [Q.natCast_eq_ofZ, Q.le_def, Q.ofZ_def, sub_eq_add_neg, Q.neg_mk, Q.mk_add_mk,
    Q.nonneg_mk, NZ.mul_val, NZ.one_val]
  nlinarith [hn]

/-! ## INC-1: the additive structure on Cut. -/
namespace ContinuumQ
open ContinuumQ

/-- ADDITION of cuts: the pointwise sum set `{a+b | a∈x, b∈y}`. -/
def addS (x y : Cut) (q : Q) : Prop := ∃ a b, x.S a ∧ y.S b ∧ q = a + b

theorem addGather (x y : Cut) : IsGather (addS x y) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨a, ha⟩ := x.isG.ne
    obtain ⟨b, hb⟩ := y.isG.ne
    exact ⟨a + b, a, b, ha, hb, rfl⟩
  · obtain ⟨p, hp⟩ := x.isG.proper
    obtain ⟨r, hr⟩ := y.isG.proper
    refine ⟨p + r, ?_⟩
    rintro ⟨a, b, ha, hb, hq⟩
    have hap : a < p := by
      rcases le_or_gt p a with h | h
      · exact absurd (x.isG.down ha h) hp
      · exact h
    have hbr : b < r := by
      rcases le_or_gt r b with h | h
      · exact absurd (y.isG.down hb h) hr
      · exact h
    linarith [hq]
  · rintro p q ⟨a, b, ha, hb, hq⟩ hpq
    -- p ≤ a + b. Write p = a + (p - a), and p - a ≤ b so in y.
    refine ⟨a, p - a, ha, ?_, by ring⟩
    apply y.isG.down hb
    linarith [hq]
  · rintro q ⟨a, b, ha, hb, hq⟩
    obtain ⟨a', ha', haa'⟩ := x.isG.nomax a ha
    exact ⟨a' + b, ⟨a', b, ha', hb, rfl⟩, by linarith [hq]⟩

instance : Add Cut := ⟨fun x y => ⟨addS x y, addGather x y⟩⟩

theorem add_S (x y : Cut) (q : Q) : (x + y).S q ↔ ∃ a b, x.S a ∧ y.S b ∧ q = a + b := Iff.rfl

/-- ZERO = the rational cut of 0. -/
instance : Zero Cut := ⟨Qcut 0⟩
theorem zero_S (q : Q) : (0 : Cut).S q ↔ q < 0 := Iff.rfl

/-- NEGATION: reflect the upper complement. `(-x).S q` iff some upper bound `r ∉ x`
    has `q < -r`. -/
def negS (x : Cut) (q : Q) : Prop := ∃ r, q < -r ∧ ¬ x.S r

theorem negGather (x : Cut) : IsGather (negS x) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨p, hp⟩ := x.isG.proper
    exact ⟨-p - 1, p, by linarith, hp⟩
  · obtain ⟨a, ha⟩ := x.isG.ne
    refine ⟨-a, ?_⟩
    rintro ⟨r, hr, hnr⟩
    have : r < a := by linarith
    exact hnr (x.isG.down ha (le_of_lt this))
  · rintro p q ⟨r, hr, hnr⟩ hpq
    exact ⟨r, by linarith, hnr⟩
  · rintro q ⟨r, hr, hnr⟩
    refine ⟨(q + -r) / 2, ⟨r, by linarith, hnr⟩, by linarith⟩

instance : Neg Cut := ⟨fun x => ⟨negS x, negGather x⟩⟩
theorem neg_S (x : Cut) (q : Q) : (-x).S q ↔ ∃ r, q < -r ∧ ¬ x.S r := Iff.rfl

/-- ★ THE CUT-APPROXIMATION LEMMA (Archimedean). For any `ε>0`, there is an element
    `a ∈ x` and an upper bound `r ∉ x` within `ε`. -/
theorem approx (x : Cut) (ε : Q) (hε : 0 < ε) :
    ∃ a r, x.S a ∧ ¬ x.S r ∧ r - a < ε := by
  obtain ⟨a0, ha0⟩ := x.isG.ne
  obtain ⟨p, hp⟩ := x.isG.proper
  set δ : Q := ε / 2 with hδdef
  have hδ : 0 < δ := by rw [hδdef]; linarith
  have hex : ∃ k : ℕ, ¬ x.S (a0 + k • δ) := by
    obtain ⟨n, hn⟩ := Archimedean.arch (p - a0) hδ
    rw [nsmul_eq_mul] at hn
    refine ⟨n, fun hxn => ?_⟩
    have hple : p ≤ a0 + n • δ := by rw [nsmul_eq_mul]; linarith
    exact hp (x.isG.down hxn hple)
  classical
  have hm : ¬ x.S (a0 + (Nat.find hex) • δ) := Nat.find_spec hex
  have hm0 : Nat.find hex ≠ 0 := by
    intro h
    apply hm; rw [h, zero_nsmul, add_zero]; exact ha0
  obtain ⟨m', hm'eq⟩ := Nat.exists_eq_succ_of_ne_zero hm0
  rw [hm'eq] at hm
  have hm'in : x.S (a0 + m' • δ) := by
    by_contra h
    exact Nat.find_min hex (by rw [hm'eq]; exact Nat.lt_succ_self m') h
  refine ⟨a0 + m' • δ, a0 + (m'+1) • δ, hm'in, hm, ?_⟩
  have hdiff : (a0 + (m'+1) • δ) - (a0 + m' • δ) = δ := by rw [succ_nsmul]; ring
  rw [hdiff, hδdef]; linarith

/-- ★★ THE ADDITIVE INVERSE: `x + (-x) = 0`. The reverse direction is where the
    cut-approximation (Archimedean) is forced. -/
theorem add_neg_self (x : Cut) : x + (-x) = 0 := by
  apply Cut.ext'
  intro q
  rw [add_S, zero_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩
    rw [neg_S] at hb
    obtain ⟨r, hbr, hnr⟩ := hb
    have har : a < r := by
      rcases le_or_gt r a with h | h
      · exact absurd (x.isG.down ha h) hnr
      · exact h
    linarith [hq]
  · intro hq
    obtain ⟨a, r, ha, hnr, hlt⟩ := approx x (-q) (by linarith)
    refine ⟨a, q - a, ha, ?_, by ring⟩
    rw [neg_S]
    exact ⟨r, by linarith, hnr⟩

#check @add_neg_self

end ContinuumQ
end Phys.Foundation
