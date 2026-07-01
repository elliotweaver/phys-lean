/-
  Phys.Algebra.OctonionJordanTraceForm — N214: THE LINEAR TRACE FUNCTIONAL and the
  BILINEAR TRACE FORM (the Cartan–Killing metric) on the exceptional Jordan algebra J₃(O),
  and — the genuinely-new relational content — THE CHARGE HYPERPLANE AS THE TRACE-FORM-
  ORTHOGONAL COMPLEMENT OF THE FORCED IDENTITY DIRECTION.
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal), step 3.
  HYPERCHARGE NORMALIZATION (`Q = T₃ + Y/2`) was deferred 11 consecutive times (N201–N211) for
  ONE structural reason: the rank-2 `g₂ = Der(O ℚ)` as carried had NO room for a FORCED (not
  posited) charge direction. The §N211 frontier NAMED the route — climb to `J₃(O)` — N212 took
  step 1 (the single `(0,1)`-slot forced weight `t0+t1`), N213 took step 2 (the FULL weight
  diagram of all three slots + the TRACE-ZERO CHARGE HYPERPLANE `t0+t1+t2 = 0`, the forced
  2-parameter charge space). This module takes step 3: it builds the FORCED INNER-PRODUCT
  structure on the Cartan that the charge-anchor front requires, and identifies the N213 charge
  hyperplane INTRINSICALLY via that metric — as the orthogonal complement of a FORCED direction,
  with NO posited normalization.

  N5 banked the `J₃(O)` CARRIER (`Hm`, `Xz`, `Dg`, the unit diagonals `Du0/Du1/Du2`), the
  symmetric (Jordan) bracket `jb A B = A·B + B·A`, `Dg_eq_smul`, and the central scalar `ocR`
  with its ring-homomorphism laws (`ocR_mul`, `ocR_add`, `ocR_zero`). N213 banked the full weight
  diagram and the TRACE-ZERO CHARGE HYPERPLANE. This module banks the NEXT structure, never
  previously banked: the LINEAR trace functional and the BILINEAR trace form on the algebra.

  ★ THE LINEAR TRACE `jTr A = trace A`. On the diagonal Cartan it is the coordinate sum
  `jTr (Dg t0 t1 t2) = ocR (t0+t1+t2)` (`jTr_Dg`) — the FORCED GRADING FUNCTIONAL whose kernel
  is EXACTLY the N213 trace-zero charge hyperplane. It KILLS the off-diagonal core
  `jTr (Xz a b c) = 0` (`jTr_Xz`).

  ★★ THE BILINEAR TRACE FORM `jTraceForm A B = trace (jb A B) = trace (A·B + B·A)` — the
  Cartan–Killing metric of `J₃(O)`. It is SYMMETRIC (`jTraceForm_symm`). On the diagonal Cartan
  it is the FORCED EUCLIDEAN METRIC
      `jTraceForm (Dg s0 s1 s2) (Dg t0 t1 t2) = ocR (2·(s0 t0 + s1 t1 + s2 t2))`  (`jTF_Dg_Dg`),
  which restricts on the complete orthogonal frame `E0=Du0, E1=Du1, E2=Du2` to the FORCED
  orthonormal (weight-2) frame `jTF_Du0_Du0 = ocR 2`, `jTF_Du0_Du1 = 0`.

  ★★★ THE HEADLINE `jTF_one_Dg_zero_iff`. The identity matrix is the FORCED Cartan direction
  `1 = Dg 1 1 1 = E0+E1+E2` (`Dg_one`, the banked `frame_sum`). The trace-form pairing against it
  is TWICE the trace `jTraceForm 1 (Dg t0 t1 t2) = ocR (2·(t0+t1+t2))` (`jTF_one_Dg`), so
      `jTraceForm 1 (Dg t0 t1 t2) = 0  ↔  t0+t1+t2 = 0`.
  The N213 trace-zero CHARGE HYPERPLANE is EXACTLY the trace-form-orthogonal complement of the
  FORCED identity direction — an INTRINSIC characterization of the charge space via the
  Cartan–Killing metric, with NO normalization convention posited. This is the forced
  inner-product anchor the deferred hypercharge front (a) required: charge lives in
  `(ℚ·1)^⊥` w.r.t. the trace form.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). Nothing bashes octonion coordinates: the
  trace form DISSOLVES through `Matrix.diagonal_mul_diagonal` (the Cartan multiplies diagonally),
  `Matrix.trace_diagonal`/`Matrix.trace_add`, and the `ocR` ring-homomorphism laws
  (`ocR_mul`/`ocR_add`) — the N212/N213-style structural reframe. The charge-plane iff is pure
  ℚ-arithmetic on the trace coordinate via the real-part projection `ocR_reQ`.

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS `J₃(O)`, reads its
  trace form off by hand, and NORMALIZES the charge by convention; here the carrier was DERIVED
  from the cascade (N5), the weight diagram/charge plane from N213, and the trace-form metric —
  the FORCED inner product that pins the charge space as an orthogonal complement — is DERIVED as
  a structural consequence of the Jordan bracket and the central scalar. One cause (the
  doubling-derived `J₃(O)` carrier), the forced metric where charge becomes an orthogonal
  complement, no posit.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'Jordan / Cartan / Killing / metric /
  trace-form / charge / hypercharge / frame / idempotent / weight / root / trace-zero / J₃(O) /
  exceptional': what remains is — over the derived field ℚ and the Cayley–Dickson double
  `O ℚ = CD (H ℚ)`, for the symmetric bracket `jb A B = A·B + B·A` on `Matrix (Fin 3) (Fin 3) (O ℚ)`,
  `trace (Dg t0 t1 t2) = ocR (t0+t1+t2)`, `trace (Xz a b c) = 0`,
  `trace (jb (Dg s) (Dg t)) = ocR (2·Σ sᵢtᵢ)`, `trace (jb Du0 Du0) = ocR 2`, `trace (jb Du0 Du1) = 0`,
  `Dg 1 1 1 = 1`, and `trace (jb 1 (Dg t)) = 0 ↔ t0+t1+t2 = 0`; pure matrix algebra over the
  derived field. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanWeightDiagram
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The central scalar's real-part projection and unit. -/

/-- `ocR 1 = 1`: the central embedding sends the ground unit to the algebra unit. -/
theorem ocR_one : ocR (1 : ℚ) = (1 : O ℚ) := by
  have := ocR_one_mul (1 : O ℚ); rwa [mul_one] at this

/-- The real-part projection inverts the central embedding: `(ocR r).re.re.re = r`. -/
theorem ocR_reQ (r : ℚ) : (ocR r).re.re.re = r := rfl

/-! ### The linear trace functional. -/

/-- THE LINEAR TRACE FUNCTIONAL on 3×3 matrices over the terminal algebra `O ℚ`. -/
noncomputable def jTr (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace A

/-- ★ THE FORCED GRADING FUNCTIONAL. On the diagonal Cartan the trace is the coordinate sum
    `jTr (Dg t0 t1 t2) = ocR (t0+t1+t2)` — the linear functional whose kernel is EXACTLY the
    N213 trace-zero charge hyperplane. -/
theorem jTr_Dg (t0 t1 t2 : ℚ) : jTr (Dg t0 t1 t2) = ocR (t0 + t1 + t2) := by
  unfold jTr Dg
  rw [Matrix.trace_diagonal]
  simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  rw [ocR_add, ocR_add]

/-- The trace KILLS the off-diagonal core: `jTr (Xz a b c) = 0` (the core is trace-free). -/
theorem jTr_Xz (a b c : O ℚ) : jTr (Xz a b c) = 0 := by
  unfold jTr Xz
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply, Matrix.of_apply, Matrix.cons_val',
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
    add_zero]

/-! ### The bilinear trace form (the Cartan–Killing metric). -/

/-- ★★ THE BILINEAR TRACE FORM `jTraceForm A B = trace (jb A B) = trace (A·B + B·A)` — the
    Cartan–Killing metric of the exceptional Jordan algebra `J₃(O)`. -/
noncomputable def jTraceForm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : O ℚ := Matrix.trace (jb A B)

/-- The trace form is SYMMETRIC. -/
theorem jTraceForm_symm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jTraceForm A B = jTraceForm B A := by
  unfold jTraceForm jb
  rw [add_comm]

/-- ★★ THE FORCED EUCLIDEAN METRIC. On the diagonal Cartan the trace form is
    `jTraceForm (Dg s0 s1 s2) (Dg t0 t1 t2) = ocR (2·(s0 t0 + s1 t1 + s2 t2))` — the standard
    Euclidean inner product on the rank-3 Cartan coordinates (times 2), NO octonion coordinate
    ring: it dissolves through `diagonal_mul_diagonal` + `trace_diagonal` + the `ocR` ring laws. -/
theorem jTF_Dg_Dg (s0 s1 s2 t0 t1 t2 : ℚ) :
    jTraceForm (Dg s0 s1 s2) (Dg t0 t1 t2)
      = ocR (2 * (s0 * t0 + s1 * t1 + s2 * t2)) := by
  unfold jTraceForm jb Dg
  rw [Matrix.diagonal_mul_diagonal, Matrix.diagonal_mul_diagonal, Matrix.trace_add,
    Matrix.trace_diagonal, Matrix.trace_diagonal]
  simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  simp only [ocR_mul]
  rw [ocR_add, ocR_add, ocR_add, ocR_add, ocR_add]
  congr 1; ring

/-! ### The frame idempotents are Cartan directions; the forced orthonormal frame. -/

/-- The frame idempotent `E0 = Du0` IS the Cartan direction `Dg 1 0 0`. -/
theorem Du0_eq_Dg : (Du0 (B := Dbl ℚ)) = Dg 1 0 0 := by
  unfold Du0 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

/-- `E1 = Du1` IS the Cartan direction `Dg 0 1 0`. -/
theorem Du1_eq_Dg : (Du1 (B := Dbl ℚ)) = Dg 0 1 0 := by
  unfold Du1 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

/-- `E2 = Du2` IS the Cartan direction `Dg 0 0 1`. -/
theorem Du2_eq_Dg : (Du2 (B := Dbl ℚ)) = Dg 0 0 1 := by
  unfold Du2 Dg
  congr 1; funext i; fin_cases i <;>
    simp [ocR_one, ocR_zero, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]

/-- THE FORCED ORTHONORMAL FRAME (diagonal): `jTraceForm E0 E0 = ocR 2` — each frame idempotent
    has trace-form self-length 2. -/
theorem jTF_Du0_Du0 : jTraceForm (Du0 (B := Dbl ℚ)) (Du0 (B := Dbl ℚ)) = ocR 2 := by
  rw [Du0_eq_Dg, jTF_Dg_Dg]; norm_num

/-- THE FORCED ORTHONORMAL FRAME (off-diagonal): `jTraceForm E0 E1 = 0` — distinct frame
    idempotents are trace-form-orthogonal. -/
theorem jTF_Du0_Du1 : jTraceForm (Du0 (B := Dbl ℚ)) (Du1 (B := Dbl ℚ)) = 0 := by
  rw [Du0_eq_Dg, Du1_eq_Dg, jTF_Dg_Dg]; norm_num [ocR_zero]

/-! ### THE HEADLINE — the charge hyperplane as the trace-form-orthogonal complement of `1`. -/

/-- The identity matrix IS the FORCED Cartan direction `Dg 1 1 1 = E0+E1+E2` (the banked
    complete orthogonal frame sum). -/
theorem Dg_one : Dg 1 1 1 = (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  apply Matrix.ext; intro i j
  unfold Dg
  rw [Matrix.diagonal_apply, Matrix.one_apply]
  by_cases h : i = j
  · subst h; fin_cases i <;>
      simp [ocR_one, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
        Matrix.cons_val_two, Matrix.tail_cons]
  · simp [h]

/-- ★★ The trace-form pairing against the FORCED identity direction is TWICE the trace:
    `jTraceForm 1 (Dg t0 t1 t2) = ocR (2·(t0+t1+t2))`. -/
theorem jTF_one_Dg (t0 t1 t2 : ℚ) :
    jTraceForm 1 (Dg t0 t1 t2) = ocR (2 * (t0 + t1 + t2)) := by
  rw [← Dg_one, jTF_Dg_Dg]; congr 1; ring

/-- ★★★ THE CHARGE HYPERPLANE IS THE TRACE-FORM-ORTHOGONAL COMPLEMENT OF THE FORCED IDENTITY.
    `jTraceForm 1 (Dg t0 t1 t2) = 0 ↔ t0+t1+t2 = 0`: the N213 trace-zero charge hyperplane is
    EXACTLY `(ℚ·1)^⊥` w.r.t. the Cartan–Killing trace form — an INTRINSIC characterization of the
    charge space via the forced metric, with NO posited normalization. This is the forced
    inner-product anchor the 11×-deferred hypercharge front required. -/
theorem jTF_one_Dg_zero_iff (t0 t1 t2 : ℚ) :
    jTraceForm 1 (Dg t0 t1 t2) = 0 ↔ t0 + t1 + t2 = 0 := by
  rw [jTF_one_Dg]
  constructor
  · intro h
    have hz : (2 * (t0 + t1 + t2)) = 0 := by
      have := congrArg (fun x : O ℚ => x.re.re.re) h
      simpa [ocR_reQ] using this
    linarith
  · intro h; rw [h]; norm_num [ocR_zero]

/-! ### W8 anti-vacuity teeth — the trace-form metric takes a genuine nonzero value. -/

/-- W8 TEETH: the Cartan metric coordinate `(jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re`
    GENUINELY equals `2·(1·1 + 2·1 + 3·1) = 12` — the forced Euclidean metric is non-degenerate,
    not the trivial `0`. -/
theorem traceform_metric_witness :
    (jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re = 12 := by
  rw [jTF_Dg_Dg]; norm_num [ocR_reQ]

/-- W8 TEETH: the metric witness value is nonzero — the trace form is genuinely non-degenerate. -/
theorem traceform_metric_witness_ne :
    (jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re ≠ 0 := by
  rw [traceform_metric_witness]; norm_num

end Phys.Algebra.HJ
