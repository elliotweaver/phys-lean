import Phys.Algebra.LorentzContinuumCliffordPinCentralizer
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- Probe: BvC p q in coordinates.
example (p q : STVC) : BvC p q = p.1 * q.1 - p.2.1 * q.2.1 - gFormC p.2.2 q.2.2 := rfl

-- BvC against the three coordinate test vectors.
example (p : STVC) : BvC p ((1, 0, 0) : STVC) = p.1 := by
  show p.1 * 1 - p.2.1 * 0 - gFormC p.2.2 0 = p.1
  rw [gFormC_zero_right']; ring

example (p : STVC) : BvC p ((0, 1, 0) : STVC) = - p.2.1 := by
  show p.1 * 0 - p.2.1 * 1 - gFormC p.2.2 0 = - p.2.1
  rw [gFormC_zero_right']; ring

example (p : STVC) (w : O Cut) : BvC p ((0, 0, w) : STVC) = - gFormC p.2.2 w := by
  show p.1 * 0 - p.2.1 * 0 - gFormC p.2.2 w = - gFormC p.2.2 w
  ring

-- Z1: BvC nondegenerate.
theorem BvC_nondegenerate_probe (p : STVC) (h : ∀ q : STVC, BvC p q = 0) : p = 0 := by
  have h1 : p.1 = 0 := by
    have := h ((1, 0, 0) : STVC)
    rw [show BvC p ((1,0,0):STVC) = p.1 from by
      show p.1 * 1 - p.2.1 * 0 - gFormC p.2.2 0 = p.1
      rw [gFormC_zero_right']; ring] at this
    exact this
  have h2 : p.2.1 = 0 := by
    have := h ((0, 1, 0) : STVC)
    rw [show BvC p ((0,1,0):STVC) = - p.2.1 from by
      show p.1 * 0 - p.2.1 * 1 - gFormC p.2.2 0 = - p.2.1
      rw [gFormC_zero_right']; ring] at this
    linarith [this]
  have h3 : p.2.2 = 0 := by
    apply (gFormC_eq_zero_iff p.2.2).mp
    have := h ((0, 0, p.2.2) : STVC)
    rw [show BvC p ((0,0,p.2.2):STVC) = - gFormC p.2.2 p.2.2 from by
      show p.1 * 0 - p.2.1 * 0 - gFormC p.2.2 p.2.2 = - gFormC p.2.2 p.2.2
      ring] at this
    linarith [this]
  have hp : p = (p.1, p.2.1, p.2.2) := rfl
  rw [hp, h1, h2, h3]; rfl

-- Z2: polar of QvCQuad is nondegenerate (separating).
theorem QvCQuad_polar_nondegenerate_probe (w : STVC)
    (h : ∀ v : STVC, QuadraticMap.polar QvCQuad v w = 0) : w = 0 := by
  apply BvC_nondegenerate_probe w
  intro q
  have hv := h q
  rw [QvCQuad_polar] at hv
  rw [BvC_symm]
  have h2 : (2 : Cut) ≠ 0 := two_ne_zero
  rcases mul_eq_zero.mp hv with h' | h'
  · exact absurd h' h2
  · exact h'

-- Z3: polarBilin of QvCQuad is separating (the exact contractLeft shape).
theorem polarBilin_separating_probe (w : STVC)
    (h : ∀ v : STVC, QuadraticMap.polarBilin QvCQuad v w = 0) : w = 0 := by
  apply QvCQuad_polar_nondegenerate_probe w
  intro v
  rw [← QuadraticMap.polarBilin_apply_apply]
  exact h v

-- W8 teeth: BvC mTimeUnit mTimeUnit = 1
example : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) = 1 := by
  show (1:Cut) * 1 - 0 * 0 - gFormC 0 0 = 1
  rw [gFormC_zero_left]; ring

end

end Phys.Algebra
