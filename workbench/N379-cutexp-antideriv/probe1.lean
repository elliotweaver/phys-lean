import Phys.Algebra.FoldPotentialCriticality

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (1) The termwise antiderivative of the exponential series. -/

def expAntiderivTerm (x : Cut) (n : ℕ) : Cut :=
  x ^ (n + 1) / (((n + 1).factorial : ℕ) : Cut)

theorem expAntiderivTerm_eq_expTermC_succ (x : Cut) (n : ℕ) :
    expAntiderivTerm x n = expTermC x (n + 1) := rfl

theorem expAntiderivTerm_summable (x : Cut) : Summable (expAntiderivTerm x) := by
  have h : Summable (fun n => expTermC x (n + 1)) :=
    (summable_nat_add_iff 1).mpr (expTermC_summable x)
  exact h.congr (fun n => (expAntiderivTerm_eq_expTermC_succ x n).symm)

/-! ## (2) The definite integral / accumulated flux and the FTC difference form. -/

def expAntideriv (x : Cut) : Cut := ∑' n, expAntiderivTerm x n

theorem expAntideriv_eq (x : Cut) : expAntideriv x = cutExp x - 1 := by
  unfold expAntideriv
  have hstep : (∑' n, expAntiderivTerm x n) = ∑' n, expTermC x (n + 1) := by
    apply tsum_congr; intro n; exact expAntiderivTerm_eq_expTermC_succ x n
  rw [hstep]
  have hz := (expTermC_summable x).tsum_eq_zero_add
  have h0 : expTermC x 0 = 1 := by unfold expTermC; simp
  rw [h0] at hz
  have hcut : cutExp x = ∑' n, expTermC x n := rfl
  rw [← hcut] at hz
  linarith [hz]

theorem expAntideriv_zero : expAntideriv 0 = 0 := by
  rw [expAntideriv_eq, cutExp_zero]; ring

theorem expAntideriv_hasDerivAt (x : Cut) :
    CutHasDerivAt expAntideriv (cutExp x) x := by
  have hfun : expAntideriv = fun y => cutExp y + (-1 : Cut) := by
    funext y; rw [expAntideriv_eq]; ring
  rw [hfun]
  have h := (cutExp_hasDerivAt x).add (cutHasDerivAt_const (-1) x)
  simpa using h

/-! ## (3) The identity derivative helper. -/

theorem cutHasDerivAt_id (x : Cut) : CutHasDerivAt (fun y => y) 1 x := by
  unfold CutHasDerivAt
  have h1 : Tendsto (fun _ : Cut => (1 : Cut)) (𝓝[≠] (0 : Cut)) (𝓝 1) := tendsto_const_nhds
  refine h1.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  simp only [mem_compl_iff, mem_singleton_iff] at hh
  have : x + h - x = h := by ring
  rw [this]
  field_simp

/-! ## (4) The scaled e-fold integral. -/

def expScaleAntideriv (a x : Cut) : Cut := (cutExp (a * x) - 1) / a

theorem expScaleAntideriv_eq_base (a x : Cut) (ha : a ≠ 0) :
    expScaleAntideriv a x = expAntideriv (a * x) / a := by
  unfold expScaleAntideriv
  rw [expAntideriv_eq]

theorem expScaleAntideriv_hasDerivAt (a x : Cut) (ha : a ≠ 0) :
    CutHasDerivAt (fun y => expScaleAntideriv a y) (cutExp (a * x)) x := by
  have hscale := cutExp_scale_hasDerivAt a x ha
  have hsum := hscale.add (cutHasDerivAt_const (-1) x)
  have hcm := hsum.const_mul a⁻¹
  have hfun : (fun y => a⁻¹ * (cutExp (a * y) + (-1 : Cut))) = fun y => expScaleAntideriv a y := by
    funext y; unfold expScaleAntideriv; field_simp
  have hval : a⁻¹ * (a * cutExp (a * x) + 0) = cutExp (a * x) := by
    field_simp
  rw [hfun, hval] at hcm
  exact hcm

/-! ## (5) Capstone bundle. -/

theorem expAntideriv_ftc (x : Cut) :
    expAntideriv x = cutExp x - 1
      ∧ expAntideriv 0 = 0
      ∧ CutHasDerivAt expAntideriv (cutExp x) x :=
  ⟨expAntideriv_eq x, expAntideriv_zero, expAntideriv_hasDerivAt x⟩

/-! ## (6) Non-vacuity teeth (W8). -/

theorem expAntideriv_pos (x : Cut) (hx : 0 < x) : 0 < expAntideriv x := by
  rw [expAntideriv_eq]
  have h := one_add_le_cutExp x (le_of_lt hx)
  linarith

theorem expAntideriv_zero_ne_cutExp_zero : expAntideriv 0 ≠ cutExp 0 := by
  rw [expAntideriv_zero, cutExp_zero]; norm_num

end

end Phys.Foundation.ContinuumQ
