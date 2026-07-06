import Phys.Algebra.ContinuumExpAntideriv

namespace Phys.Algebra.SlowRollProbe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

def slowRollEps (c φ : Cut) : Cut :=
  (1/2) * (foldPotentialDeriv c φ / plateauApproachPot c φ) ^ 2

def foldPotentialSecondDerivVal (c φ : Cut) : Cut :=
  - (2 * c ^ 2) * cutExp ((-c) * φ) + 4 * c ^ 2 * cutExp ((-(2 * c)) * φ)

def slowRollEta (c φ : Cut) : Cut :=
  foldPotentialSecondDerivVal c φ / plateauApproachPot c φ

-- helper: for φ>0, 1-u ≠ 0
theorem one_sub_u_ne (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) : (1:Cut) - cutExp (-(c*φ)) ≠ 0 := by
  have harg : -(c*φ) < 0 := by nlinarith
  have : cutExp (-(c*φ)) < 1 := by
    calc cutExp (-(c*φ)) < cutExp 0 := cutExp_strictMono harg
      _ = 1 := cutExp_zero
  linarith

-- ε u-form
theorem slowRollEps_eq (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    slowRollEps c φ = 2 * c^2 * cutExp (-(c*φ))^2 / (1 - cutExp (-(c*φ)))^2 := by
  unfold slowRollEps foldPotentialDeriv plateauApproachPot
  set u := cutExp (-(c*φ)) with hu
  have h1u : (1 : Cut) - u ≠ 0 := one_sub_u_ne c φ hc hφ
  field_simp

-- η u-form
theorem slowRollEta_eq (c φ : Cut) :
    slowRollEta c φ = (- (2*c^2)*cutExp (-(c*φ)) + 4*c^2*cutExp (-(c*φ))^2) / (1 - cutExp (-(c*φ)))^2 := by
  unfold slowRollEta foldPotentialSecondDerivVal plateauApproachPot
  rw [show (-c) * φ = -(c*φ) by ring]
  have hsq : cutExp ((-(2*c)) * φ) = cutExp (-(c*φ)) ^ 2 := by
    have h : cutExp (-(c*φ)) * cutExp (-(c*φ)) = cutExp (-(c*φ) + -(c*φ)) := cutExp_add _ _
    rw [show (-(2*c)) * φ = -(c*φ) + -(c*φ) by ring, ← h]; ring
  rw [hsq]

/-! ### e-fold count via the N379 antiderivative (FTC) -/

-- e-fold count N(φ) = ∫₀^φ (V/V') = (cutExp(cφ)−1)/(2c²) − φ/(2c).
-- Its derivative is V/V' = (cutExp(cφ)−1)/(2c).  Ground this via N379 pieces.
def efoldCount (c φ : Cut) : Cut := expScaleAntideriv c φ / (2*c) - φ / (2*c)

theorem efoldCount_hasDerivAt (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (efoldCount c) ((cutExp (c*φ) - 1) / (2*c)) φ := by
  have hbig : CutHasDerivAt (fun y => expScaleAntideriv c y) (cutExp (c*φ)) φ :=
    expScaleAntideriv_hasDerivAt c φ hc
  have h1 : CutHasDerivAt (fun y => expScaleAntideriv c y / (2*c)) (cutExp (c*φ) / (2*c)) φ := by
    have := hbig.const_mul (2*c)⁻¹
    have hfe : (fun y => (2*c)⁻¹ * expScaleAntideriv c y) = (fun y => expScaleAntideriv c y / (2*c)) := by
      funext y; rw [div_eq_inv_mul]
    rw [hfe] at this
    have hval : (2*c)⁻¹ * cutExp (c*φ) = cutExp (c*φ) / (2*c) := by rw [div_eq_inv_mul]
    rw [hval] at this; exact this
  have h2 : CutHasDerivAt (fun y => y / (2*c)) (1 / (2*c)) φ := by
    have := (cutHasDerivAt_id φ).const_mul (2*c)⁻¹
    have hfe : (fun y => (2*c)⁻¹ * y) = (fun y => y / (2*c)) := by funext y; rw [div_eq_inv_mul]
    rw [hfe] at this
    have hval : (2*c)⁻¹ * 1 = 1 / (2*c) := by rw [div_eq_inv_mul, mul_one]
    rw [hval] at this; exact this
  have hsub := h1.sub h2
  have hfe : (fun y => expScaleAntideriv c y / (2*c) - y / (2*c)) = efoldCount c := by
    funext y; rfl
  rw [hfe] at hsub
  have hval : cutExp (c*φ) / (2*c) - 1 / (2*c) = (cutExp (c*φ) - 1) / (2*c) := by
    rw [div_sub_div_same]
  rw [hval] at hsub; exact hsub

/-! ### leading e-fold count and the suppression identity -/

def efoldLead (c φ : Cut) : Cut := cutExp (c*φ) / (2*c^2)

-- 2c²·u·N_lead = 1  where u = cutExp(-(c*φ))
theorem efoldLead_suppression (c φ : Cut) (hc : c ≠ 0) :
    2*c^2 * cutExp (-(c*φ)) * efoldLead c φ = 1 := by
  unfold efoldLead
  have hc2 : (2:Cut)*c^2 ≠ 0 := by positivity
  have hu : cutExp (-(c*φ)) * cutExp (c*φ) = 1 := by
    rw [cutExp_add, show -(c*φ) + c*φ = 0 by ring, cutExp_zero]
  field_simp
  -- goal: 2*c^2 * cutExp(-(c*φ)) * cutExp(c*φ) = 2*c^2   (after clearing /(2c²))
  nlinarith [hu, sq_nonneg c]

end

end Phys.Algebra.SlowRollProbe
