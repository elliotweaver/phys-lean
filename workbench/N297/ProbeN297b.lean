import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Phys.Algebra.OctonionJordanTraceForm
import Mathlib.Tactic

/- N297 DE-RISK probe 2 — the two NEW routes (theory-native dilation-central + trace-form joint). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- NEW P1': dilation is f₄-central VIA the module structure (equivariance + derH3_kills_one),
-- NOT the trivial 2·id route. For T∈derH3 and Hermitian B: ⁅T, Lmul 1⁆ B = 0 because
-- ⁅T, Lmul 1⁆ B = Lmul (T 1) B (equivariance at A=1) and T 1 = 0 (the ceiling).
theorem probe_dilation_fixed (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅T, Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0 := by
  rw [spectrum_sector_equivariance T hT Matrix.conjTranspose_one hB, derH3_kills_one T hT]
  rw [Lmul_apply]; unfold jb; simp

-- NEW: the split-iff-orthogonal joint. The SPLITTING (trace-free displacement) is EXACTLY the
-- trace-form-orthogonal complement of the identity (N214 jTF_one_Dg_zero_iff).
theorem probe_trace_grading (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2 * (t0 + t1 + t2)) := by
  have hadd : jTr (Dg t0 t1 t2 + Dg t0 t1 t2) = jTr (Dg t0 t1 t2) + jTr (Dg t0 t1 t2) := by
    unfold jTr; exact Matrix.trace_add _ _
  have hr : (2 * (t0 + t1 + t2)) = (t0 + t1 + t2) + (t0 + t1 + t2) := by ring
  rw [Lmul_one, hadd, jTr_Dg, hr, ocR_add]

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

theorem probe_split_iff_orthogonal (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ jTraceForm 1 (Dg t0 t1 t2) = 0 := by
  rw [probe_split_iff, jTF_one_Dg_zero_iff]

-- the dilation moves 1 within the TRACE direction (nonzero trace): jTr(Lmul 1 1) = ocR 6 ≠ 0.
theorem probe_dilation_trace : jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) = ocR 6 := by
  have hadd : jTr ((1 : Matrix (Fin 3) (Fin 3) (O ℚ)) + 1)
      = jTr (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) + jTr 1 := by
    unfold jTr; exact Matrix.trace_add _ _
  rw [Lmul_one, hadd]
  have h1 : jTr (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) = ocR 3 := by
    rw [← Dg_one, jTr_Dg]; congr 1; norm_num
  rw [h1, ocR_add]; congr 1; norm_num

end Phys.Algebra.HJ
