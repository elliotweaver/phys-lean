import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.OctonionJordanFormallyReal
import Phys.Algebra.OctonionJordanThreeMatterSlots

/-!
N295 de-risk probe: the spectrum-MOVING sector beyond f₄.

Claims to confirm compile with banked levers (bounded, `$LAKE build` this file):
 P1. `Lmul A 1 = 2 • A`  — left-multiplication moves the identity (jb A 1 = A*1 + 1*A = 2A).
 P2. `Lmul (slotA 1) 1 = 2 • slotA 1 ≠ 0` — a concrete nonzero motion of the identity.
 P3. every `T ∈ derH3` fixes the identity's Jordan action structure: for Hermitian A,
     `T (jb A 1) = jb (T A) 1 + jb A (T 1)`. Combined with `jb A 1 = 2•A` this says
     `2 • T A = 2 • T A + jb A (T 1)`, forcing `jb A (T 1) = 0` for all Hermitian A;
     the cleanest bankable fact: `T` is a Leibniz derivation so it does NOT satisfy the
     unit-motion law `T 1 = 2 • (something)`. Here we just confirm the Leibniz law instance.
-/
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- P1: Lmul A 1 = jb A 1 = A * 1 + 1 * A = 2 • A
example (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : Lmul A 1 = A + A := by
  rw [Lmul_apply]
  unfold jb
  rw [mul_one, one_mul]

-- P2: the identity motion is genuinely nonzero for A = slotA 1
-- (slotA 1 ≠ 0 is banked as slotA_ne_zero / from the arena). Confirm the SHAPE compiles.
example : Lmul (slotA (1 : O ℚ)) 1 = slotA 1 + slotA 1 := by
  rw [Lmul_apply]; unfold jb; rw [mul_one, one_mul]

-- P3: confirm the derH3 Leibniz law is accessible on Hermitian args
example (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) (hT : T ∈ derH3)
    (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) (hB : Bᴴ = B) :
    T (jb A B) = jb (T A) B + jb A (T B) := hT.2 A B hA hB

-- P4: innerMul (=[Lmul,Lmul]) ∈ derH3 is banked — the closure [L_A,L_B] ∈ f₄
example (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) (hB : Bᴴ = B) :
    innerMul A B ∈ derH3 := innerMul_mem_derH3 hA hB

-- P5: the positive-definite trace form (N270) is the witness that L_A moves the trace:
-- jTraceForm A A = trace (jb A A), and reQ of it = 2 * jQ A ≥ 0, = 0 iff A = 0.
example (a b c : O ℚ) (d0 d1 d2 : ℚ) :
    0 ≤ jQ (Hm d0 d1 d2 a b c) := jQ_Hm_nonneg d0 d1 d2 a b c

#print axioms jb_herm
end

end Phys.Algebra.HJ
