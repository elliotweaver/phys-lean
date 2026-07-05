import Phys.Algebra.OctonionJordanFamilyMixingComplexification

/-! Probe: the JC-row weight lemmas — famMixJ = ⁅famC,kAB⁆ acts diagonally on slotA 1 and slotB 1
    with fold-root weights +2, −2 (the fundamental-3 weights of the third Cartan generator). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- JC (slotA 1) = famC(kAB(slotA 1)) − kAB(famC(slotA 1))
--   = famC(slotB u1) − kAB(−slotB 1) = slotA u1 − (−slotA u1) = slotA (2•u1)
theorem probe_famMixJ_slotA_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotA 1)
      = slotA ((2 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  -- kAB (slotA 1) = slotB u1 ; famC (slotB u1) = slotA u1
  rw [kAB_slotA_one, famC_slotB u1]
  -- famC (slotA 1) = − slotB 1 ; kAB (− slotB 1) = − slotA u1
  rw [famC_slotA (1:O ℚ), map_neg, kAB_slotB_one]
  -- slotA u1 − (− slotA u1) = slotA (2•u1)
  rw [sub_neg_eq_add, ← slotA_add]
  congr 1
  rw [two_smul]

-- JC (slotB 1) = famC(kAB(slotB 1)) − kAB(famC(slotB 1))
--   = famC(slotA u1) − kAB(slotA 1) = −slotB u1 − slotB u1 = slotB (−2•u1)
theorem probe_famMixJ_slotB_one :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆ (slotB 1)
      = slotB ((-2 : ℚ) • (u1 : O ℚ)) := by
  rw [show (⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotA (u1:O ℚ)) (slotB 1)⁆
        : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = innerMul (slotA (1:O ℚ)) (slotB 1) * innerMul (slotA (u1:O ℚ)) (slotB 1)
          - innerMul (slotA (u1:O ℚ)) (slotB 1) * innerMul (slotA (1:O ℚ)) (slotB 1)
        from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  -- kAB (slotB 1) = slotA u1 ; famC (slotA u1) = − slotB u1
  rw [kAB_slotB_one, famC_slotA u1]
  -- famC (slotB 1) = slotA 1 ; kAB (slotA 1) = slotB u1
  rw [famC_slotB (1:O ℚ), kAB_slotA_one]
  -- − slotB u1 − slotB u1 = slotB (−2•u1)
  rw [← slotB_neg, ← slotB_sub]
  congr 1
  rw [neg_smul, two_smul]; abel

end Phys.Algebra.HJ
