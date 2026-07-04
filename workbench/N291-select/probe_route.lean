import Phys.Algebra.OctonionJordanFamilyInvariantCore
import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

/-!  N291 SCRATCH PROBE — confirm the Lean route for the gauge-covariant coupling member.
     Mc := innerMul (slotA u1) (slotB 1).  Targets:
       (1) covariance:  ⁅jActL D, Mc⁆ = innerMul (slotA (D u1)) (slotB 1)
       (2) membership:  Mc ∈ derH3  (slotA u1 Hermitian via Xz_herm)
       (3) gauge non-neutrality (tooth): ⁅jActL DJ, Mc⁆ ≠ 0  (since DJ u1 ≠ 0)
-/

open Phys.Algebra Phys.Algebra.HJ

namespace N291Probe

-- (1) THE COVARIANCE FORMULA
theorem coupling_covariance (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotA u1) (slotB (1:O ℚ))⁆
      = innerMul (slotA (D u1)) (slotB 1) := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotA D hD, jAct_slotB_one D hD,
    innerMul_zero_right, add_zero]

-- (2) MEMBERSHIP:  slotA u1 Hermitian, slotB 1 Hermitian ⟹ innerMul ∈ derH3
theorem coupling_mem_derH3 :
    innerMul (slotA u1) (slotB (1:O ℚ)) ∈ derH3 :=
  innerMul_mem_derH3 (Xz_herm u1 0 0) slotB_one_herm

end N291Probe
