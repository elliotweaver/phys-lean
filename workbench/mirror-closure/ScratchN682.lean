import Phys.Algebra.FineStructureRunningCoupling
import Mathlib.Tactic

/-!
  # N682 — RUNNING LAW CHARACTERIZED: the affine-log running law FORCED, not defined
  ================================================================================
  PREREG: workbench/PREREG-LANES-682-684.md (LANE A, frozen at 44b2902e).

  THE CORE THEOREM (Cauchy functional-equation characterization over the derived line):
  any `f : Cut → Cut` that is additive-on-multiplicative on the positives
  (`f (x·y) = f x + f y`) and monotone on the positives IS a constant multiple of the
  banked derived logarithm: `f x = f (cutExp 1) · cutLog x` for all `0 < x`.

  Route: `g := f ∘ cutExp` is additive on all of `Cut` (banked `cutExp_add`,
  `cutExp_pos`); additivity gives ℚ-linearity by the standard ℕ/ℤ/ℚ ladder; monotone +
  ℚ-density (`exists_rat_btwn` over the Archimedean derived line) sandwiches
  `g x = x · g 1`; pulling back through the banked inverse pair `cutExp_cutLog` /
  `cutLog_cutExp` lands the law.

  THE WELD: the banked running coupling `invAlphaRun`'s log part (in the ratio
  argument `r = M/μ`) satisfies the two hypotheses, carries unit rate
  `κ · chargeTraceDepth`, and ANY flow with the same two structural properties and the
  same unit rate IS it (`invAlphaRun_characterized`).
-/

namespace Phys.Algebra
namespace RunningLawCharacterized

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) The additive ladder: an additive map on the derived line is ℚ-linear. -/

/-- An additive map sends `0` to `0`. -/
theorem additive_zero (g : Cut → Cut) (hadd : ∀ a b, g (a + b) = g a + g b) :
    g 0 = 0 := by
  have h := hadd 0 0
  rw [add_zero] at h
  linarith

/-- An additive map is odd: `g (−a) = −g a`. -/
theorem additive_neg (g : Cut → Cut) (hadd : ∀ a b, g (a + b) = g a + g b) (a : Cut) :
    g (-a) = - g a := by
  have h := hadd a (-a)
  rw [add_neg_cancel, additive_zero g hadd] at h
  linarith

/-- ℕ-homogeneity of an additive map: `g (n·x) = n·(g x)`. Induction on the banked
    successor structure of the derived naturals inside `Cut`. -/
theorem additive_nsmul (g : Cut → Cut) (hadd : ∀ a b, g (a + b) = g a + g b)
    (n : ℕ) (x : Cut) : g ((n : Cut) * x) = (n : Cut) * g x := by
  induction n with
  | zero => simp [additive_zero g hadd]
  | succ n ih =>
      have hsplit : ((n + 1 : ℕ) : Cut) * x = (n : Cut) * x + x := by
        push_cast; ring
      rw [hsplit, hadd, ih]
      push_cast; ring

/-- ℤ-linearity at `1`: `g m = m · g 1` for every derived integer `m`. -/
theorem additive_int (g : Cut → Cut) (hadd : ∀ a b, g (a + b) = g a + g b)
    (m : ℤ) : g ((m : Cut)) = (m : Cut) * g 1 := by
  obtain ⟨n, rfl | rfl⟩ := m.eq_nat_or_neg
  · have h := additive_nsmul g hadd n 1
    rw [mul_one] at h
    push_cast
    rw [h]
  · have h := additive_nsmul g hadd n 1
    rw [mul_one] at h
    push_cast
    rw [additive_neg g hadd, h]
    ring

/-- ℚ-linearity at `1`: `g q = q · g 1` for every derived rational `q`. Clears the
    denominator through ℕ-homogeneity and cancels it (the derived line has
    characteristic zero, so the cast denominator is nonzero). -/
theorem additive_rat (g : Cut → Cut) (hadd : ∀ a b, g (a + b) = g a + g b)
    (q : ℚ) : g ((q : Cut)) = (q : Cut) * g 1 := by
  have key : ((q.den : ℚ)) * q = (q.num : ℚ) := by
    rw [mul_comm, Rat.mul_den_eq_num]
  have keyC : (q.den : Cut) * (q : Cut) = (q.num : Cut) := by
    exact_mod_cast key
  have h1 : (q.den : Cut) * g ((q : Cut)) = (q.num : Cut) * g 1 := by
    rw [← additive_nsmul g hadd q.den (q : Cut), keyC, additive_int g hadd q.num]
  have hdenC : (q.den : Cut) ≠ 0 := Nat.cast_ne_zero.mpr q.den_nz
  have h2 : (q.den : Cut) * g ((q : Cut)) = (q.den : Cut) * ((q : Cut) * g 1) := by
    rw [h1, ← keyC]; ring
  exact mul_left_cancel₀ hdenC h2

/-! ## (2) The sandwich: additive + monotone forces linearity on the whole line.
    ℚ-density of the derived line (`exists_rat_btwn`, available because the banked
    `Cut` is an Archimedean linear ordered field) squeezes `g x` between rational
    multiples of `g 1` from both sides. -/

/-- ★★ ADDITIVE + MONOTONE ⟹ LINEAR over the derived line: `g x = x · g 1`. -/
theorem additive_monotone_linear (g : Cut → Cut)
    (hadd : ∀ a b, g (a + b) = g a + g b) (hmono : Monotone g) :
    ∀ x : Cut, g x = x * g 1 := by
  intro x
  have hg1 : 0 ≤ g 1 := by
    have h := hmono (zero_le_one (α := Cut))
    rwa [additive_zero g hadd] at h
  rcases eq_or_lt_of_le hg1 with hz | hpos
  · -- degenerate rate: g 1 = 0, so g vanishes identically by the sandwich at rate 0
    obtain ⟨qu, hqu⟩ := exists_rat_gt x
    obtain ⟨ql, hql⟩ := exists_rat_lt x
    have hup : g x ≤ 0 := by
      have h := hmono (le_of_lt hqu)
      rwa [additive_rat g hadd qu, ← hz, mul_zero] at h
    have hdown : 0 ≤ g x := by
      have h := hmono (le_of_lt hql)
      rwa [additive_rat g hadd ql, ← hz, mul_zero] at h
    rw [← hz, mul_zero]
    linarith
  · -- positive rate: squeeze via ℚ-density
    by_contra hne
    rcases lt_or_gt_of_ne hne with hlt | hgt
    · -- g x < x · g 1 : pick a rational strictly between g x / g 1 and x
      have hdiv : g x / g 1 < x := (div_lt_iff₀ hpos).mpr hlt
      obtain ⟨q, hq1, hq2⟩ := exists_rat_btwn hdiv
      have hle : (q : Cut) * g 1 ≤ g x := by
        have h := hmono (le_of_lt hq2)
        rwa [additive_rat g hadd q] at h
      have hgtq : g x < (q : Cut) * g 1 := (div_lt_iff₀ hpos).mp hq1
      linarith
    · -- x · g 1 < g x : symmetric squeeze
      have hdiv : x < g x / g 1 := (lt_div_iff₀ hpos).mpr hgt
      obtain ⟨q, hq1, hq2⟩ := exists_rat_btwn hdiv
      have hle : g x ≤ (q : Cut) * g 1 := by
        have h := hmono (le_of_lt hq1)
        rwa [additive_rat g hadd q] at h
      have hltq : (q : Cut) * g 1 < g x := (lt_div_iff₀ hpos).mp hq2
      linarith

/-! ## (3) THE CORE THEOREM: the Cauchy characterization of the running law. -/

/-- ★★★ RUNNING LAW CHARACTERIZED: any `f : Cut → Cut` additive-on-multiplicative on
    the positives (H1) and monotone on the positives (H2) IS `c · cutLog` with the rate
    `c = f (cutExp 1)` read off the flow at the unit tick: `f x = f (cutExp 1) · cutLog x`
    for all `0 < x`. The affine-log form is FORCED by the two structural properties —
    no differentiability, no posited β-function. -/
theorem running_law_characterized (f : Cut → Cut)
    (H1 : ∀ x y : Cut, 0 < x → 0 < y → f (x * y) = f x + f y)
    (H2 : ∀ x y : Cut, 0 < x → x ≤ y → f x ≤ f y) :
    ∀ x : Cut, 0 < x → f x = f (cutExp 1) * cutLog x := by
  -- the pulled-back flow g := f ∘ cutExp is additive and monotone on ALL of Cut
  have hadd : ∀ a b : Cut, f (cutExp (a + b)) = f (cutExp a) + f (cutExp b) := by
    intro a b
    rw [← cutExp_add]
    exact H1 _ _ (cutExp_pos a) (cutExp_pos b)
  have hmono : Monotone (fun t => f (cutExp t)) := by
    intro a b hab
    exact H2 _ _ (cutExp_pos a) (cutExp_strictMono.monotone hab)
  have hlin := additive_monotone_linear (fun t => f (cutExp t)) hadd hmono
  intro x hx
  have hpull : f x = f (cutExp (cutLog x)) := by rw [cutExp_cutLog hx]
  rw [hpull]
  have h := hlin (cutLog x)
  simp only at h
  rw [h]
  ring

/-! ## (4) THE WELD: the banked running coupling IS an instance, and the unique one
    at its rate. The log part of `invAlphaRun` in the ratio argument `r = M/μ` is
    `r ↦ invAlphaRun κ M (M/r) − invAlphaHigh = κ · chargeTraceDepth · cutLog r`. -/

/-- The log part of the banked flow in the ratio argument, in closed form. -/
theorem invAlphaRun_logPart_eq (κ M r : Cut) (hM : 0 < M) (hr : 0 < r) :
    invAlphaRun κ M (M / r) - invAlphaHigh = κ * chargeTraceDepth * cutLog r := by
  have hcancel : M / (M / r) = r := by
    field_simp
  unfold invAlphaRun
  rw [hcancel]
  ring

/-- H1 FOR THE BANKED FLOW: the log part is additive-on-multiplicative in the ratio
    argument — the banked cocycle property, via the banked `cutLog_mul`. -/
theorem invAlphaRun_logPart_additive (κ M : Cut) (hM : 0 < M) :
    ∀ x y : Cut, 0 < x → 0 < y →
      invAlphaRun κ M (M / (x * y)) - invAlphaHigh
        = (invAlphaRun κ M (M / x) - invAlphaHigh)
          + (invAlphaRun κ M (M / y) - invAlphaHigh) := by
  intro x y hx hy
  rw [invAlphaRun_logPart_eq κ M _ hM (mul_pos hx hy),
      invAlphaRun_logPart_eq κ M _ hM hx,
      invAlphaRun_logPart_eq κ M _ hM hy,
      cutLog_mul hx hy]
  ring

/-- H2 FOR THE BANKED FLOW: with screening sign `0 ≤ κ`, the log part is monotone in
    the ratio argument on the positives — from `cutLog` strict monotonicity (banked
    `cutLog_lt`) and Born positivity of the charge trace depth. -/
theorem invAlphaRun_logPart_monotone (κ M : Cut) (hM : 0 < M) (hκ : 0 ≤ κ) :
    ∀ x y : Cut, 0 < x → x ≤ y →
      invAlphaRun κ M (M / x) - invAlphaHigh
        ≤ invAlphaRun κ M (M / y) - invAlphaHigh := by
  intro x y hx hxy
  have hy : 0 < y := lt_of_lt_of_le hx hxy
  rw [invAlphaRun_logPart_eq κ M _ hM hx, invAlphaRun_logPart_eq κ M _ hM hy]
  have hlog : cutLog x ≤ cutLog y := by
    rcases eq_or_lt_of_le hxy with rfl | hlt
    · exact le_refl _
    · exact le_of_lt (cutLog_lt hx hlt)
  have hcoeff : 0 ≤ κ * chargeTraceDepth :=
    mul_nonneg hκ (le_of_lt chargeTraceDepth_pos)
  exact mul_le_mul_of_nonneg_left hlog hcoeff

/-- THE UNIT RATE of the banked flow: the log part at the ratio `cutExp 1` reads off
    exactly `κ · chargeTraceDepth` — the slope datum of the characterization. -/
theorem invAlphaRun_logPart_unit_rate (κ M : Cut) (hM : 0 < M) :
    invAlphaRun κ M (M / cutExp 1) - invAlphaHigh = κ * chargeTraceDepth := by
  rw [invAlphaRun_logPart_eq κ M _ hM (cutExp_pos 1), cutLog_cutExp, mul_one]

/-- ★★★ THE CHARACTERIZATION WELD: ANY flow `f` with the banked cocycle (H1), the
    screening monotonicity (H2), and the banked unit rate `f (cutExp 1) = κ ·
    chargeTraceDepth` IS the banked running coupling's log part: `invAlphaHigh + f r =
    invAlphaRun κ M (M/r)` for every positive ratio. The banked running law is not one
    choice among many — it is the ONLY monotone multiplicative-to-additive flow with
    its rate. -/
theorem invAlphaRun_characterized (κ M : Cut) (hM : 0 < M) (f : Cut → Cut)
    (H1 : ∀ x y : Cut, 0 < x → 0 < y → f (x * y) = f x + f y)
    (H2 : ∀ x y : Cut, 0 < x → x ≤ y → f x ≤ f y)
    (Hrate : f (cutExp 1) = κ * chargeTraceDepth) :
    ∀ r : Cut, 0 < r → invAlphaHigh + f r = invAlphaRun κ M (M / r) := by
  intro r hr
  have hlaw := running_law_characterized f H1 H2 r hr
  have heq := invAlphaRun_logPart_eq κ M r hM hr
  rw [hlaw, Hrate]
  linarith

end

end RunningLawCharacterized
end Phys.Algebra
