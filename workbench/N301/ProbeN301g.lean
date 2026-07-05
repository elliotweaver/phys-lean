import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- H. quadratic spectral invariant preserved: rtr (jb A (fC A)) = 0 for Hermitian A.
-- Route: fC ∈ derH3 gives Leibniz hT.2. jb A A is Hermitian (jb_herm). fC(jb A A) hermitian
-- and its rtr = 0 (derH3_kills_jTr + reality/rtr). Leibniz: fC(jb A A) = jb (fC A) A + jb A (fC A)
-- = 2 • jb A (fC A) (by jb_comm), so rtr(jb A (fC A)) = (1/2) rtr(fC(jb A A)) = 0.
theorem family_kills_quadratic_spectral {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (innerMul (slotA (1:O ℚ)) (slotB 1) A)) = 0 := by
  set T := innerMul (slotA (1:O ℚ)) (slotB 1) with hTdef
  -- Leibniz law of T on (A, A)
  have hleib : T (jb A A) = jb (T A) A + jb A (T A) :=
    (mem_derH3.mp famC_mem_derH3).2 A A hA hA
  -- jb (T A) A = jb A (T A)  (jb symmetric)
  have hsym : jb (T A) A = jb A (T A) := jb_comm (T A) A
  rw [hsym] at hleib
  -- so T (jb A A) = jb A (T A) + jb A (T A)
  -- rtr additive: rtr (T (jb A A)) = 2 * rtr (jb A (T A))
  have hAA : (jb A A)ᴴ = jb A A := jb_herm hA hA
  have hkill : rtr (T (jb A A)) = 0 := by
    have h := derH3_kills_jTr famC_mem_derH3 hAA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleib, rtr_add] at hkill
  -- hkill : rtr (jb A (T A)) + rtr (jb A (T A)) = 0
  linarith [hkill]

#print axioms family_kills_quadratic_spectral

end Phys.Algebra.HJ
