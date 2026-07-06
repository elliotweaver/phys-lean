import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.UniversalityCriticalExponent
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Phys.Algebra.PathIntegralProbe

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt
open Phys.Algebra.Universality
open Phys.Algebra
open Matrix
open scoped BigOperators

noncomputable section

/-! ## MEASURE HALF -/

/-- raw Boltzmann/path-integral weight e^{−βS}. -/
def bWeight (β s : Cut) : Cut := cutExp (-(β * s))

theorem bWeight_pos (β s : Cut) : 0 < bWeight β s := cutExp_pos _

/-- ADDITIVE ACTION ⟹ MULTIPLICATIVE (FACTORIZING) WEIGHT — the fold's homomorphic exp. -/
theorem bWeight_add (β s t : Cut) : bWeight β (s + t) = bWeight β s * bWeight β t := by
  unfold bWeight
  rw [cutExp_add]
  congr 1
  ring

/-- THE GIBBS / PATH-INTEGRAL MEASURE over a general finite index, `qᵢ = e^{−βSᵢ}/Z`. -/
def gibbsMeasure {ι : Type*} [Fintype ι] (S : ι → Cut) (β : Cut) : ι → Cut :=
  fun i => cutExp (-β * S i) / (∑ j, cutExp (-β * S j))

/-- On `Fin n` the general Gibbs measure IS the banked Boltzmann state (N375). Grounds the general
    object on the banked one. -/
theorem gibbsMeasure_eq_boltzmann {n : ℕ} (E : Fin n → Cut) (β : Cut) :
    gibbsMeasure E β = boltzmann E β := rfl

/-- composite action on two independent subsystems: S(i,j) = S₁(i) + S₂(j). -/
def compAction {ι κ : Type*} (E : ι → Cut) (F : κ → Cut) : ι × κ → Cut :=
  fun p => E p.1 + F p.2

/-- numerator factorizes. -/
theorem expNum_comp {ι κ : Type*} (E : ι → Cut) (F : κ → Cut) (β : Cut) (p : ι × κ) :
    cutExp (-β * compAction E F p) = cutExp (-β * E p.1) * cutExp (-β * F p.2) := by
  unfold compAction
  rw [cutExp_add]
  congr 1
  ring

/-- partition function factorizes: Z_comp = Z_E · Z_F. -/
theorem partitionZ_factorizes {ι κ : Type*} [Fintype ι] [Fintype κ]
    (E : ι → Cut) (F : κ → Cut) (β : Cut) :
    (∑ p : ι × κ, cutExp (-β * compAction E F p))
      = (∑ i, cutExp (-β * E i)) * (∑ j, cutExp (-β * F j)) := by
  rw [Finset.sum_mul_sum, Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  exact expNum_comp E F β (i, j)

/-- ★ THE PRODUCT MEASURE: the joint path measure over two independent subsystems factorizes into the
    product of the marginal measures. Additive action ⟹ product measure — the locality of e^{−S}. -/
theorem gibbsMeasure_factorizes {ι κ : Type*} [Fintype ι] [Fintype κ]
    (E : ι → Cut) (F : κ → Cut) (β : Cut) (p : ι × κ) :
    gibbsMeasure (compAction E F) β p = gibbsMeasure E β p.1 * gibbsMeasure F β p.2 := by
  unfold gibbsMeasure
  rw [expNum_comp, partitionZ_factorizes, mul_div_mul_comm]

/-- The measure form is FORCED: the exponential Boltzmann measure uniquely maximizes entropy at its
    own budget (banked maxent_at_fixed_budget + boltzmann_isGibbs). -/
theorem pathMeasure_unique_maxent {n : ℕ} [NeZero n] (E : Fin n → Cut) (β : Cut)
    (p : Fin n → Cut) (hp : ∀ i, 0 < p i) (hsp : ∑ i, p i = 1)
    (hbud : ∑ i, p i * E i = ∑ i, boltzmann E β i * E i) :
    negEntropy (boltzmann E β) ≤ negEntropy p
      ∧ (negEntropy (boltzmann E β) = negEntropy p ↔ p = boltzmann E β) :=
  maxent_at_fixed_budget p (boltzmann E β) E β (- cutLog (∑ j, cutExp (-β * E j)))
    (boltzmann_isGibbs E β) hp (boltzmann_pos E β) hsp (boltzmann_sum_one E β) hbud

/-! ## RENORM HALF -/

/-- the relevant direction (all-ones = the totalization vector) is FIXED by chanProj (eigenvalue 1). -/
theorem chanProj_relevant_direction (N : ℕ) (hN : 1 ≤ N) :
    (chanProj N).mulVec (fun _ => (1 : ℚ)) = (fun _ => (1 : ℚ)) := by
  have hNpos : (N : ℚ) ≠ 0 := by
    have h : 0 < N := by omega
    exact_mod_cast h.ne'
  unfold chanProj
  rw [Matrix.smul_mulVec, chanTot_mulVec]
  funext i
  simp only [Pi.smul_apply, smul_eq_mul, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    nsmul_eq_mul, mul_one]
  field_simp

/-- the sum-zero subspace (codimension-1) is KILLED by chanProj (eigenvalue 0) — the irrelevant
    directions. So the relevant subspace is exactly 1-dimensional: finitely many relevant directions. -/
theorem chanProj_irrelevant_kernel (N : ℕ) (v : Fin N → ℚ) (hv : ∑ i, v i = 0) :
    (chanProj N).mulVec v = 0 := by
  unfold chanProj
  rw [Matrix.smul_mulVec, chanTot_mulVec]
  funext i
  simp only [Pi.smul_apply, smul_eq_mul, hv, mul_zero, Pi.zero_apply]

/-! ## THE SCALING LADDER λ_n = −n/(84π), tied to the SAME 84π grammar (N329). -/

/-- the scaling dimension of the n-th direction: λ_n = −n / criticalPhaseNumerator = −n/(84π). -/
def scalingDim (n : ℕ) : Cut := -(n : Cut) / criticalPhaseNumerator

theorem scalingDim_eq (n : ℕ) : scalingDim n = -(n : Cut) / (84 * cutPi) := by
  unfold scalingDim; rw [criticalPhaseNumerator_eq]

theorem scalingDim_zero : scalingDim 0 = 0 := by
  unfold scalingDim; simp

theorem scalingDim_nonpos (n : ℕ) : scalingDim n ≤ 0 := by
  unfold scalingDim
  apply div_nonpos_of_nonpos_of_nonneg
  · have : (0 : Cut) ≤ (n : Cut) := by positivity
    linarith
  · exact le_of_lt criticalPhaseNumerator_pos

theorem scalingDim_strictAnti (n : ℕ) : scalingDim (n + 1) < scalingDim n := by
  unfold scalingDim
  have hD : (0 : Cut) < criticalPhaseNumerator := criticalPhaseNumerator_pos
  rw [div_lt_div_iff_of_pos_right hD]
  push_cast
  linarith

theorem scalingDim_eq_zero_iff (n : ℕ) : scalingDim n = 0 ↔ n = 0 := by
  constructor
  · intro h
    unfold scalingDim at h
    have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
    rw [div_eq_zero_iff] at h
    rcases h with h | h
    · have : (n : Cut) = 0 := by linarith [neg_eq_zero.mp h]
      exact_mod_cast this
    · exact absurd h hD
  · intro h; rw [h]; exact scalingDim_zero

theorem scalingDim_lock (n : ℕ) : scalingDim n * criticalPhaseNumerator = -(n : Cut) := by
  unfold scalingDim
  rw [div_mul_cancel₀]
  exact ne_of_gt criticalPhaseNumerator_pos

end

end Phys.Algebra.PathIntegralProbe
