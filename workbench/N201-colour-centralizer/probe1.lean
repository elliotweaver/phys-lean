import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

-- MEASURE: unit/zero facts on O ℚ via simp (works even without bundled MulOneClass).
example (x : O ℚ) : x * 1 = x := by simp
example (x : O ℚ) : (1 : O ℚ) * x = x := by simp
example (x : O ℚ) : (0 : O ℚ) * x = 0 := by simp
example (x : O ℚ) : x * (0 : O ℚ) = 0 := by simp

-- MEASURE 2: THE CORE — D(JO z) = (D u1)·z + JO(D z), pure Leibniz, for any IsDerivQ D.
theorem comm_deriv_JO {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) (z : O ℚ) :
    D (JO z) = D u1 * z + JO (D z) := by
  have hd : D (u1 * z) = D u1 * z + u1 * D z := hD u1 z
  simpa only [JO_apply] using hd

-- MEASURE 3: D commutes with JO ⟺ D u1 = 0.
theorem commutes_JO_iff {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) :
    D.comp JO = JO.comp D ↔ D u1 = 0 := by
  constructor
  · intro h
    have he : (D.comp JO) 1 = (JO.comp D) 1 := by rw [h]
    simp only [LinearMap.comp_apply] at he
    -- he : D (JO 1) = JO (D 1)
    rw [JO_apply] at he
    have hj1 : (u1 * 1 : O ℚ) = u1 := by simp
    rw [hj1] at he                      -- D u1 = JO (D 1)
    rw [derivQ_one D hD] at he          -- D 1 = 0
    rw [map_zero] at he                 -- JO 0 = 0
    exact he
  · intro h
    ext z
    simp only [LinearMap.comp_apply]
    rw [comm_deriv_JO hD z, h, zero_mul, zero_add, JO_apply]

#print axioms comm_deriv_JO
#print axioms commutes_JO_iff

end Phys.Algebra
