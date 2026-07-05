import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Phys.Algebra.OctonionJordanTraceForm
import Mathlib.Tactic

/-
  N297 DE-RISK probe. The dilation/traceless-split grading of the spectrum-moving sector L,
  graded by the linear trace jTr (the trace-zero Cartan hyperplane).
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- P1: dilation is f4-central. ⁅T, Lmul 1⁆ = 0 for T ∈ derH3 (ALL B, not just Hermitian).
theorem probe_dilation_central (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) : ⁅T, Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ = 0 := by
  apply LinearMap.ext
  intro B
  rw [show (⁅T, Lmul (1:Matrix (Fin 3) (Fin 3) (O ℚ))⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul 1 - Lmul 1 * T from Ring.lie_def T (Lmul 1)]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Lmul_apply, LinearMap.zero_apply]
  have hjb1 : ∀ X : Matrix (Fin 3) (Fin 3) (O ℚ), jb 1 X = X + X := by
    intro X; unfold jb; rw [one_mul, mul_one]
  rw [hjb1 B, hjb1 (T B), map_add]
  abel

-- P2: Lmul 1 X = X + X (pure scaling by 2)
theorem probe_dilation_scale (X : Matrix (Fin 3) (Fin 3) (O ℚ)) : Lmul 1 X = X + X := by
  rw [Lmul_apply]; unfold jb; rw [one_mul, mul_one]

-- P3: diagonal mover displaces identity: Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2
theorem probe_diag_displace (t0 t1 t2 : ℚ) :
    Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2 := Lmul_one (Dg t0 t1 t2)

-- P4: trace grading: jTr (Lmul (Dg ..) 1) = ocR (2*(t0+t1+t2))
theorem probe_trace_grading (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2 * (t0 + t1 + t2)) := by
  have hadd : jTr (Dg t0 t1 t2 + Dg t0 t1 t2) = jTr (Dg t0 t1 t2) + jTr (Dg t0 t1 t2) := by
    unfold jTr; exact Matrix.trace_add _ _
  have hr : (2 * (t0 + t1 + t2)) = (t0 + t1 + t2) + (t0 + t1 + t2) := by ring
  rw [probe_diag_displace, hadd, jTr_Dg, hr, ocR_add]

-- P5: splitting <=> trace-zero
theorem probe_split_iff (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ t0 + t1 + t2 = 0 := by
  rw [probe_trace_grading]
  constructor
  · intro h
    have hz : (2 * (t0 + t1 + t2)) = 0 := by
      have := congrArg (fun x : O ℚ => x.re.re.re) h
      simpa [ocR_reQ] using this
    linarith
  · intro h; rw [h]; norm_num [ocR_zero]

-- P6: W8 nonvacuity: Lmul (Dg 1 (-1) 0) 1 traceless but ≠ 0
theorem probe_split_traceless : jTr (Lmul (Dg 1 (-1) 0) 1) = 0 := by
  rw [probe_split_iff]; norm_num

theorem probe_split_ne : Lmul (Dg 1 (-1) 0) 1 ≠ 0 := by
  rw [probe_diag_displace]
  intro h
  have hentry : (Dg 1 (-1) 0 + Dg 1 (-1) 0) 0 0 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 0 := by rw [h]
  rw [Matrix.add_apply] at hentry
  unfold Dg at hentry
  rw [Matrix.diagonal_apply_eq] at hentry
  simp only [Matrix.cons_val_zero, Matrix.zero_apply] at hentry
  have : reQ ((ocR (1:ℚ)) + ocR 1) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ, ocR_reQ] at this
  norm_num at this

end Phys.Algebra.HJ
