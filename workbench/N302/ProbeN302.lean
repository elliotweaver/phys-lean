import Phys.Algebra.OctonionJordanFamilyMassMixingOrbit

/-!
N302 de-risk probe — the CUBIC/DETERMINANT isospectrality for ALL of f₄=derH3.
Target: rtr (jb (jb A A) (T A)) = 0 for T∈derH3, Hermitian A.
Route: banked levers only (Leibniz mem_derH3.2, traceform_associative N298, jb_comm, derH3_kills_jTr N300).
NO cubic power-associativity (probe4 measured the naive T(A³)=3A²∘TA FAILS resid 60.7).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The derived trace 3-form `t(X,Y,Z) = rtr (jb (jb X Y) Z)` is cyclic (via
    traceform_associative N298 + jb_comm). -/
theorem rtr_jb_cyc (X Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (jb (jb X Y) Z) = rtr (jb (jb Y Z) X) := by
  rw [traceform_associative X Y Z, jb_comm X (jb Y Z)]

/-- GENERALIZE N301's famC-only quadratic to ALL of f₄: rtr (jb A (T A)) = 0. -/
theorem derH3_kills_quadratic_spectral {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (T A)) = 0 := by
  have hleib : T (jb A A) = jb (T A) A + jb A (T A) := (mem_derH3.mp hT).2 A A hA hA
  rw [jb_comm (T A) A] at hleib
  have hAA : (jb A A)ᴴ = jb A A := jb_herm hA hA
  have hkill : rtr (T (jb A A)) = 0 := by
    have h := derH3_kills_jTr hT hAA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleib, rtr_add] at hkill
  linarith [hkill]

/-- ★★★ THE CUBIC/DETERMINANT FIRST-VARIATION VANISHES for ALL of f₄:
    rtr (jb (jb A A) (T A)) = 0. The σ₃/determinant char-poly coefficient is preserved. -/
theorem derH3_kills_cubic_spectral {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb (jb A A) (T A)) = 0 := by
  set B := jb A A with hBdef
  have hB : Bᴴ = B := jb_herm hA hA
  -- T(jb B A) is the trace-killed piece
  have hleibBA : T (jb B A) = jb (T B) A + jb B (T A) := (mem_derH3.mp hT).2 B A hB hA
  -- T B = 2 • jb A (T A)
  have hTB : T B = jb (T A) A + jb A (T A) := (mem_derH3.mp hT).2 A A hA hA
  rw [jb_comm (T A) A] at hTB
  -- jb B A Hermitian ⟹ rtr(T(jb B A)) = 0
  have hBA : (jb B A)ᴴ = jb B A := jb_herm hB hA
  have hkill : rtr (T (jb B A)) = 0 := by
    have h := derH3_kills_jTr hT hBA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleibBA, rtr_add] at hkill
  -- hkill : rtr (jb (T B) A) + rtr (jb B (T A)) = 0
  -- rewrite T B = 2•(jb A (T A))
  rw [hTB] at hkill
  -- jb (jb A (TA) + jb A (TA)) A = jb (jb A (TA)) A + jb (jb A (TA)) A
  rw [jb_add_left (jb A (T A)) (jb A (T A)) A, rtr_add] at hkill
  -- now: rtr(jb (jb A (TA)) A) + rtr(jb (jb A (TA)) A) + rtr(jb B (TA)) = 0
  -- want target: rtr(jb B (TA)) = rtr(jb (jb A A)(TA)). B = jb A A. good.
  -- Show rtr(jb (jb A (TA)) A) = rtr(jb (jb A A)(TA)) via cyclic symmetry.
  --   t(A, TA, A) = rtr(jb (jb A (TA)) A)
  --   t(A, A, TA) = rtr(jb (jb A A)(TA)) = rtr(jb B (TA))
  -- cyc: t(A,TA,A) = t(TA,A,A) = t(A,A,TA)
  have hcyc1 : rtr (jb (jb A (T A)) A) = rtr (jb (jb (T A) A) A) := by
    rw [rtr_jb_cyc A (T A) A]
  have hcyc2 : rtr (jb (jb (T A) A) A) = rtr (jb (jb A A) (T A)) := by
    rw [rtr_jb_cyc (T A) A A]
  rw [hcyc1, hcyc2] at hkill
  -- hkill : rtr(jb (jb A A)(TA)) + rtr(jb (jb A A)(TA)) + rtr(jb B (TA)) = 0, B = jb A A
  rw [hBdef] at hkill
  linarith [hkill]

end Phys.Algebra.HJ
