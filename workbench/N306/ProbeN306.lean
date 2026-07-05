/-
  ProbeN306 — MEASURE-FIRST for N306 T3 (the ℤ₃-Fourier cycle FORM), the EXACT-ℚ core.

  Grounds the DC ⊕ cycle decomposition on the banked Pdem/Poth projectors (N305) and derives, over ℚ:
  * Pdem.mulVec a = const mean (the gathered Unity/DC mode, cycle-invariant).
  * Poth.mulVec a = a − const mean (the cycle mode, zero-sum).
  * DCpower = 3·mean², cyclepower = Σ(aₖ − mean)².
  * Parseval: Σ aₖ² = DCpower + cyclepower  (Pdem ⊥ Poth).
  * Koide Q = (DCpower + cyclepower)/(3·DCpower); balance DCpower = cyclepower ⟹ Q = 2/3.
  * THE FORCED √2 (amplitude-SQUARED, exact over ℚ): for a c cos-family with DCpower = c-cyclepower,
    balance ⟺ c² = 2.  (√2 itself is prose; c²=2 is exact.)
-/
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Mathlib.Tactic

namespace ProbeN306

open Phys.Algebra.HJ Matrix

/-- The DC/mean amplitude of a real cycle amplitude vector. -/
def mean (a : Fin 3 → ℚ) : ℚ := (a 0 + a 1 + a 2) / 3

/-- The DC/Unity component: Pdem.mulVec a = constant mean. -/
theorem pdem_mulvec (a : Fin 3 → ℚ) : Pdem.mulVec a = (fun _ => mean a) := by
  funext i
  fin_cases i <;>
    simp [Pdem, Jall, Matrix.mulVec, dotProduct, Fin.sum_univ_three, mean, Matrix.smul_apply] <;>
    ring

/-- The cycle component: Poth.mulVec a = a − constant mean (zero-sum). -/
theorem poth_mulvec (a : Fin 3 → ℚ) : Poth.mulVec a = (fun i => a i - mean a) := by
  have hP : Poth = 1 - Pdem := rfl
  rw [hP, Matrix.sub_mulVec, Matrix.one_mulVec, pdem_mulvec]
  funext i; simp

/-- DC Born power. -/
def DCpower (a : Fin 3 → ℚ) : ℚ := (Pdem.mulVec a 0)^2 + (Pdem.mulVec a 1)^2 + (Pdem.mulVec a 2)^2
/-- Cycle Born power. -/
def cyclepower (a : Fin 3 → ℚ) : ℚ := (Poth.mulVec a 0)^2 + (Poth.mulVec a 1)^2 + (Poth.mulVec a 2)^2

theorem DCpower_eq (a : Fin 3 → ℚ) : DCpower a = 3 * (mean a)^2 := by
  simp [DCpower, pdem_mulvec]; ring

theorem cyclepower_eq (a : Fin 3 → ℚ) :
    cyclepower a = (a 0 - mean a)^2 + (a 1 - mean a)^2 + (a 2 - mean a)^2 := by
  simp [cyclepower, poth_mulvec]

/-- Parseval: total Born power splits into DC + cycle. -/
theorem parseval (a : Fin 3 → ℚ) :
    (a 0)^2 + (a 1)^2 + (a 2)^2 = DCpower a + cyclepower a := by
  rw [DCpower_eq, cyclepower_eq, mean]; ring

/-- The sum of amplitudes is 3·mean (the cycle sums to zero). -/
theorem sum_eq (a : Fin 3 → ℚ) : a 0 + a 1 + a 2 = 3 * mean a := by rw [mean]; ring

/-- Koide quantity Q = Σaₖ² / (Σaₖ)². -/
def Qkoide (a : Fin 3 → ℚ) : ℚ := ((a 0)^2 + (a 1)^2 + (a 2)^2) / (a 0 + a 1 + a 2)^2

/-- THE SELF=OTHER BALANCE ⟹ Koide 2/3.  If DC power = cycle power (the 45° equal split), then
    Q = 2/3 — for ANY amplitude vector, hence any phase δ. -/
theorem balance_forces_koide (a : Fin 3 → ℚ) (hM : mean a ≠ 0)
    (hbal : DCpower a = cyclepower a) : Qkoide a = 2 / 3 := by
  have hsum : (a 0 + a 1 + a 2)^2 = 9 * (mean a)^2 := by rw [sum_eq]; ring
  have hnum : (a 0)^2 + (a 1)^2 + (a 2)^2 = 6 * (mean a)^2 := by
    rw [parseval, ← hbal, DCpower_eq]; ring
  have hden : (a 0 + a 1 + a 2)^2 ≠ 0 := by rw [hsum]; positivity
  rw [Qkoide, hnum, hsum]
  rw [show (6:ℚ) * mean a ^ 2 = (2/3) * (9 * mean a ^ 2) by ring]
  rw [mul_div_assoc, div_self, mul_one]
  positivity

/-- THE FORCED √2 (amplitude-SQUARED, exact over ℚ). For the cosine family with DC amplitude M and
    cycle amplitude A (so DCpower = 3M², cyclepower = (3/2)A² — the cosine Σcos²=3/2 structural
    factor), the self=other balance DCpower = cyclepower holds IFF A² = 2 M². The unique positive
    relative amplitude A/M is thus √2. -/
theorem forced_sqrt2 (M A : ℚ) (hM : M ≠ 0)
    (hbal : 3 * M^2 = (3/2) * A^2) : A^2 = 2 * M^2 := by
  linarith

/-- The converse: A² = 2M² gives balance. Together: balance ⟺ A²=2M². -/
theorem sqrt2_gives_balance (M A : ℚ) (hA : A^2 = 2 * M^2) :
    3 * M^2 = (3/2) * A^2 := by rw [hA]; ring

/-- NON-VACUITY: the balance is genuinely nontrivial — the "wrong" 2:1 operator-weight reading
    (cyclepower = 2·DCpower, giving A²=4M², Q=1) is DISTINCT from the 45° balance. -/
theorem koide_not_one (M A : ℚ) (hM : M ≠ 0) (hA : A^2 = 2 * M^2) :
    A^2 ≠ 4 * M^2 := by
  rw [hA]; intro h
  have hM2 : (0:ℚ) < M^2 := by positivity
  nlinarith [hM2]

end ProbeN306
