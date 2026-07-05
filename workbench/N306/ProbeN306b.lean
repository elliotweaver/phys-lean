/-
  ProbeN306b — MEASURE-FIRST for N306 T3: the ℤ₃-Fourier CYCLE STRUCTURE (exact over ℚ).

  The "DC ⊕ one cycle mode ⊕ nothing else" structural fact, grounded on the banked gcyc / Pdem.
  The cyclic-shift matrix Pcyc (permutation matrix of the banked gcyc) satisfies:
    * Pcyc³ = 1  (order 3, echoing gcyc_cube).
    * Pcyc · Pdem = Pdem  (DC/Unity mode is shift-INVARIANT — the cycle-invariant "1", unity_fixed).
    * 1 + Pcyc + Pcyc² = Jall = 3·Pdem  (the ℤ₃ average IS the DC projector — Fourier DC extraction).
    * (1 + Pcyc + Pcyc²)·Poth = 0  ⟹ on the cycle subspace, 1 + P + P² = 0: the ℤ₃ cyclotomic
      x²+x+1 (irreducible over ℚ, degree 2 = ONE conjugate mode ω,ω² = ONE cosine mode + phase,
      NOTHING else). This IS "DC ⊕ one cycle mode ⊕ nothing else", exact and grounded.
    * Pcyc grounded on banked gcyc: Pcyc i j = if gcyc j = i then 1 else 0.
-/
import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Mathlib.Tactic

namespace ProbeN306b

open Phys.Algebra.HJ Matrix

/-- The cyclic-shift matrix over ℚ: the permutation matrix of the banked generation cycle `gcyc`
    (0→1→2→0). `(Pcyc · v) i = v (gcyc⁻¹ i)`. -/
noncomputable def Pcyc : Matrix (Fin 3) (Fin 3) ℚ := Matrix.of (fun i j => if gcyc j = i then 1 else 0)

/-- GROUNDING: Pcyc is the permutation matrix of the banked cycle `gcyc` (NOT free-floating). -/
theorem Pcyc_ground (i j : Fin 3) : Pcyc i j = (if gcyc j = i then (1:ℚ) else 0) := rfl

/-- Order 3: Pcyc³ = 1 (echoes `gcyc_cube`). -/
theorem Pcyc_cube : Pcyc * Pcyc * Pcyc = 1 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Matrix.mul_apply, Matrix.one_apply, Fin.sum_univ_three] <;> decide

/-- The DC/Unity mode is SHIFT-INVARIANT: Pcyc · Pdem = Pdem (the gathered cycle-invariant "1"). -/
theorem Pcyc_Pdem : Pcyc * Pdem = Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Fin.sum_univ_three] <;> decide

/-- ★ THE ℤ₃-FOURIER DC EXTRACTION: the sum over the cycle of shifts IS the all-ones Jall = 3·Pdem.
    `1 + Pcyc + Pcyc² = Jall`. The democratic average over the ℤ₃ orbit extracts the DC mode. -/
theorem cyc_sum_Jall : 1 + Pcyc + Pcyc * Pcyc = Jall := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Jall, Matrix.mul_apply, Matrix.one_apply, Matrix.add_apply,
      Fin.sum_univ_three] <;> decide

/-- `Jall = 3 • Pdem`. -/
theorem Jall_three_Pdem : Jall = (3:ℚ) • Pdem := by
  apply Matrix.ext; intro i j
  simp [Pdem, Matrix.smul_apply, smul_smul]

/-- ★★ THE CYCLE MODE SATISFIES THE ℤ₃ CYCLOTOMIC: on the "others"/cycle subspace (Poth), the shift
    obeys `(1 + Pcyc + Pcyc²)·Poth = 0`, i.e. `1 + P + P² = 0` restricted to the cycle mode. The
    minimal polynomial x²+x+1 is irreducible over ℚ (degree 2 = ONE conjugate pair ω,ω² = exactly
    ONE cycle mode + phase, NOTHING else) — the ℤ₃-Fourier "DC ⊕ one cosine mode ⊕ nothing". -/
theorem cyc_cyclotomic_on_Poth : (1 + Pcyc + Pcyc * Pcyc) * Poth = 0 := by
  rw [cyc_sum_Jall, Jall_three_Pdem]
  -- 3•Pdem * Poth = 3 • (Pdem*Poth) = 3 • 0 = 0
  rw [Matrix.smul_mul, P_orth, smul_zero]

/-- ★ THE SHIFT PRESERVES THE CYCLE SUBSPACE: Pcyc · Poth = Poth · Pcyc (commutes), so the shift
    maps the cycle mode to itself (the turning is INTERNAL to the one cycle mode). -/
theorem Pcyc_Poth_comm : Pcyc * Poth = Poth * Pcyc := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pcyc, gcyc, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply,
      Matrix.sub_apply, Fin.sum_univ_three] <;> decide

/-- NON-VACUITY: the shift genuinely MOVES the cycle subspace — Pcyc ≠ 1 (it is not the identity,
    the turning is real). -/
theorem Pcyc_ne_one : Pcyc ≠ 1 := by
  intro h
  have h00 : Pcyc 0 0 = (1:Matrix (Fin 3) (Fin 3) ℚ) 0 0 := by rw [h]
  simp [Pcyc, gcyc, Matrix.one_apply] at h00

end ProbeN306b
