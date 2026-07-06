import Phys.Algebra.ContinuumExpAntideriv

namespace Phys.Algebra.SlowRollProbe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- u := cutExp(-(c*φ)). Facts:
-- (P1) cutExp((-c)*φ) = u  and cutExp((-(2*c))*φ) = u^2
example (c φ : Cut) : cutExp ((-c) * φ) = cutExp (-(c * φ)) := by rw [show (-c) * φ = -(c*φ) by ring]

example (c φ : Cut) : cutExp ((-(2*c)) * φ) = cutExp (-(c*φ)) ^ 2 := by
  have h : cutExp (-(c*φ)) * cutExp (-(c*φ)) = cutExp (-(c*φ) + -(c*φ)) := cutExp_add _ _
  rw [show (-(2*c)) * φ = -(c*φ) + -(c*φ) by ring, ← h]; ring

-- (P2) u * cutExp(c*φ) = 1
example (c φ : Cut) : cutExp (-(c*φ)) * cutExp (c*φ) = 1 := by
  rw [cutExp_add, show -(c*φ) + c*φ = 0 by ring, cutExp_zero]

-- (P3) for φ>0: u < 1, so 1-u ≠ 0
example (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) : (1 : Cut) - cutExp (-(c*φ)) ≠ 0 := by
  have harg : -(c*φ) < 0 := by nlinarith
  have : cutExp (-(c*φ)) < 1 := by calc cutExp (-(c*φ)) < cutExp 0 := cutExp_strictMono harg
                                        _ = 1 := cutExp_zero
  linarith

-- Now the slow-roll definitions and the ε,η u-forms.
def slowRollEps (c φ : Cut) : Cut :=
  (1/2) * (foldPotentialDeriv c φ / plateauApproachPot c φ) ^ 2

def foldPotentialSecondDerivVal (c φ : Cut) : Cut :=
  - (2 * c ^ 2) * cutExp ((-c) * φ) + 4 * c ^ 2 * cutExp ((-(2 * c)) * φ)

def slowRollEta (c φ : Cut) : Cut :=
  foldPotentialSecondDerivVal c φ / plateauApproachPot c φ

-- V″ grounding: the value IS the derivative of V′ (from N370)
example (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c) (foldPotentialSecondDerivVal c φ) φ :=
  foldPotentialDeriv_hasDerivAt c φ hc

-- ε u-form
example (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    slowRollEps c φ = 2 * c^2 * cutExp (-(c*φ))^2 / (1 - cutExp (-(c*φ)))^2 := by
  unfold slowRollEps foldPotentialDeriv plateauApproachPot
  set u := cutExp (-(c*φ)) with hu
  have hupos : 0 < u := by rw [hu]; exact cutExp_pos _
  have h1u : (1 : Cut) - u ≠ 0 := by
    have harg : -(c*φ) < 0 := by nlinarith
    have : u < 1 := by rw [hu]; calc cutExp (-(c*φ)) < cutExp 0 := cutExp_strictMono harg
                                     _ = 1 := cutExp_zero
    linarith
  field_simp
  ring

-- η u-form
example (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    slowRollEta c φ = (- (2*c^2)*cutExp (-(c*φ)) + 4*c^2*cutExp (-(c*φ))^2) / (1 - cutExp (-(c*φ)))^2 := by
  unfold slowRollEta foldPotentialSecondDerivVal plateauApproachPot
  rw [show (-c) * φ = -(c*φ) by ring]
  have hsq : cutExp ((-(2*c)) * φ) = cutExp (-(c*φ)) ^ 2 := by
    have h : cutExp (-(c*φ)) * cutExp (-(c*φ)) = cutExp (-(c*φ) + -(c*φ)) := cutExp_add _ _
    rw [show (-(2*c)) * φ = -(c*φ) + -(c*φ) by ring, ← h]; ring
  rw [hsq]

end

end Phys.Algebra.SlowRollProbe
