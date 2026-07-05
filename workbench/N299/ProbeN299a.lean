import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Mathlib.Tactic

/-! ProbeN299a — measure the innerness-free operator-trace DISSOLUTION lever.
    Route: N296 equivariance ⁅T,Lmul A⁆ B = Lmul(TA) B on Hermitian args, restricted to the
    Hermitian submodule H, gives ⁅T|_H, (Lmul A)|_H⁆ = (Lmul(TA))|_H, whose trace is 0 by
    LinearMap.trace_lie — NO innerness, NO Chevalley-Schafer. Then rtr(TA) = 0 once we know
    trace_H(Lmul C) = k·rtr(C), k≠0.  This probe measures the W9-LIGHT core (H, finiteness,
    the restricted equivariance, trace_lie). -/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

abbrev Arena := Matrix (Fin 3) (Fin 3) (O ℚ)

/-- The Hermitian submodule of the arena. -/
def hermSub : Submodule ℚ Arena where
  carrier := { M | Mᴴ = M }
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_setOf_eq, conjTranspose_add] at *
    rw [ha, hb]
  zero_mem' := by simp only [Set.mem_setOf_eq, conjTranspose_zero]
  smul_mem' := by
    intro c a ha
    simp only [Set.mem_setOf_eq] at *
    rw [conjTranspose_smul, ha]
    -- star of a ℚ-scalar smul: need (c • a)ᴴ = c • a. conjTranspose_smul gives star c • aᴴ.
    sorry

-- (1) Does Module.Finite / Free fire for hermSub?
example : Module.Finite ℚ hermSub := by infer_instance
example : Module.Free ℚ hermSub := by infer_instance

-- (2) The trace_lie lever exists with the right shape.
example (f g : Module.End ℚ hermSub) : LinearMap.trace ℚ hermSub ⁅f, g⁆ = 0 :=
  LinearMap.trace_lie f g

end Phys.Algebra.HJ
