import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- Definitions (production shape)
def plaqFactor (σ : Cut) : Cut := cutExp (-σ)
def wilsonArea (σ : Cut) (m n : ℕ) : Cut := plaqFactor σ ^ (m * n)
def bornAction (a b x : O ℚ) : Cut := ((gForm (assoc a b x) (assoc a b x) : ℚ) : Cut)

-- 1. area law FORM: wilsonArea = cutExp(-(σ·Area))
theorem wilsonArea_form (σ : Cut) (m n : ℕ) :
    wilsonArea σ m n = cutExp (-(σ * ((m * n : ℕ) : Cut))) := by
  unfold wilsonArea plaqFactor
  induction (m * n) with
  | zero => simp [cutExp_zero]
  | succ k ih => rw [pow_succ, ih, cutExp_add]; congr 1; push_cast; ring

-- 2. as a product over the 2-cell (plaquette) index grid
theorem wilsonArea_prod (σ : Cut) (m n : ℕ) :
    wilsonArea σ m n = ∏ _p ∈ (Finset.univ : Finset (Fin m × Fin n)), plaqFactor σ := by
  unfold wilsonArea
  rw [Finset.prod_const, Finset.card_univ, Fintype.card_prod, Fintype.card_fin,
    Fintype.card_fin]

-- 3. positivity
theorem wilsonArea_pos (σ : Cut) (m n : ℕ) : 0 < wilsonArea σ m n := by
  unfold wilsonArea plaqFactor; exact pow_pos (cutExp_pos _) _

-- 4. ≤ 1 for σ ≥ 0
theorem wilsonArea_le_one (σ : Cut) (m n : ℕ) (hσ : 0 ≤ σ) : wilsonArea σ m n ≤ 1 := by
  unfold wilsonArea plaqFactor
  apply pow_le_one₀ (le_of_lt (cutExp_pos _))
  exact cutExp_le_one_of_nonpos _ (by linarith)

-- 5. < 1 for σ > 0, area > 0 (STRICT suppression)
theorem wilsonArea_lt_one (σ : Cut) (m n : ℕ) (hσ : 0 < σ) (hA : 0 < m * n) :
    wilsonArea σ m n < 1 := by
  unfold wilsonArea plaqFactor
  have hw1 : cutExp (-σ) < 1 := by
    have := cutExp_strictMono (show -σ < 0 by linarith); rwa [cutExp_zero] at this
  have hw0 : 0 < cutExp (-σ) := cutExp_pos _
  calc cutExp (-σ) ^ (m*n) < 1 ^ (m*n) := by
        apply pow_lt_pow_left₀ hw1 (le_of_lt hw0); omega
    _ = 1 := one_pow _

-- 6. strictly antitone in area (suppression grows with ENCLOSED AREA)
theorem wilsonArea_strictAnti (σ : Cut) (hσ : 0 < σ) {A1 A2 : ℕ} (h : A1 < A2) :
    cutExp (-σ) ^ A2 < cutExp (-σ) ^ A1 := by
  have hw1 : cutExp (-σ) < 1 := by
    have := cutExp_strictMono (show -σ < 0 by linarith); rwa [cutExp_zero] at this
  exact pow_lt_pow_right_of_lt_one₀ (cutExp_pos _) hw1 h

-- 7. bornAction: nonneg, singlet zero, coloured pos
theorem bornAction_nonneg (a b x : O ℚ) : 0 ≤ bornAction a b x := by
  unfold bornAction; exact_mod_cast gForm_self_nonneg _

theorem bornAction_singlet_zero {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    bornAction a b x = 0 := by
  unfold bornAction
  rw [singlet_assoc_vanishes ha hb x]
  simp only [gForm_self_eq_zero.mpr rfl]
  norm_num

theorem bornAction_coloured_pos :
    0 < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  unfold bornAction
  have hne : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
    assoc_nonvanishing
  have : (0 : ℚ) < gForm (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))
      (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) := by
    rcases (gForm_self_nonneg _).lt_or_eq with h | h
    · exact h
    · exact absurd (gForm_self_eq_zero.mp h.symm) hne
  exact_mod_cast this

-- 8. area-beats-perimeter: for σ>0 and a large square loop (n≥5), area-scaling n²
--    suppresses strictly MORE than perimeter-scaling 4n.
theorem area_beats_perimeter (σ : Cut) (hσ : 0 < σ) {n : ℕ} (hn : 5 ≤ n) :
    wilsonArea σ n n < cutExp (-(σ * ((4 * n : ℕ) : Cut))) := by
  rw [wilsonArea_form]
  apply cutExp_strictMono
  have hlt : (4 * n : ℕ) < n * n := by nlinarith
  have : ((4 * n : ℕ) : Cut) < ((n * n : ℕ) : Cut) := by exact_mod_cast hlt
  have hpos : (0 : Cut) < σ := hσ
  nlinarith [mul_lt_mul_of_pos_left this hpos]

end
end Phys.Algebra
