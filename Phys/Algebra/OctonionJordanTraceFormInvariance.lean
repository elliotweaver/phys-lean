import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.DerivationAutGroup
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanTraceFormInvariance —
  N298: THE INVARIANCE (ASSOCIATIVITY) OF THE DERIVED CARTAN–KILLING TRACE FORM, AND THE
  CONSEQUENT ANNIHILATION OF THE LINEAR TRACE BY THE f₄-GENERATORS.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; directed route-finder for N297's childed obligation).

  N297 childed the abstract "derH3 kills the linear trace `jTr`" after MEASURE-FIRST showed it is
  W9-nontrivial: `innerMul A B M ≠ ⁅⁅A,B⁆,M⁆` for the NON-ASSOCIATIVE octonion matrices, so the
  naive "trace of a commutator = 0" route is FALSE. On honest inspection the FULL-predicate claim
  ("`jTr (T A) = 0` for EVERY `T ∈ derH3`") is not forceable from the banked `IsHermJordanDerivQ`
  predicate alone: from the Leibniz law it is EQUIVALENT to `T` being `jTraceForm`-skew, and neither
  follows from the other without the independent structural theorem `Der(H₃O) = InnDer` (every
  Jordan derivation is inner). That theorem is CHILDED.

  BUT the trunk (RUNBOOK W1 step 2) DISSOLVES the FORCED part with NO innerness. The theory-native
  object is not the abstract predicate — it is the DERIVED TRACE FORM ITSELF. A Cartan–Killing
  form's defining property is INVARIANCE (associativity): `⟨AB, C⟩ = ⟨A, BC⟩`. Over the octonions
  the PRODUCT is non-associative — yet its REAL-PART TRACE is ASSOCIATIVE (`reQ_mul_assoc3`, N209 —
  the trunk fact the calibration 3-form already rests on; the real part is associative PRECISELY
  because the associator is pure-imaginary, the SAME non-associativity that stops the cascade). We
  lift this to the arena and read off the annihilation of the grading functional by the GENERATORS
  of the derived symmetry:

  · ★★ THE TRACE FORM IS INVARIANT/ASSOCIATIVE. `rtr (jb (jb A B) C) = rtr (jb A (jb B C))`
    (`traceform_associative`), where `rtr = reQ ∘ jTr` is the deep-real linear trace. The
    genuinely-new structural lever, never previously banked — the matrix-level lift of octonion
    reQ-trace associativity + cyclicity.

  · ★★★ THE INNER-DERIVATION COMPLEMENT KILLS THE TRACE. `rtr (innerMul A B M) = 0`
    (`innerMul_kills_trace`). `innerMul A B = ⁅Lmul A, Lmul B⁆` (N274) is the inner-derivation
    generator — the `f₄ ⊋ g₂` complement where the electroweak directions live. By trace-form
    associativity + the symmetry `jb A B = jb B A`, its trace VANISHES. This is the clean route the
    false trace-of-commutator route could not reach.

  · ★★ THE ENTRYWISE GAUGE KILLS THE TRACE. `rtr (jActL D M) = 0` for `IsDerivQ D`
    (`jActL_kills_trace`). The entrywise `g₂`-derivations map into the imaginary subspace
    (`derivQ_reQ_zero`), so each diagonal entry's real part vanishes term-by-term.

  · THE REALITY BRIDGE. `jTr H = ocR (rtr H)` for Hermitian `H` (`herm_jTr_eq_ocR_rtr`): a Hermitian
    matrix has self-conjugate diagonal (`selfconj_eq_smul`), so the octonion-valued trace `jTr` is
    the central embedding of its deep-real part. This lifts the killers to the banked octonion trace:
    on the Hermitian arena, `jTr (innerMul A B M) = 0` (`innerMul_kills_jTr`) and
    `jTr (jActL D M) = 0` (`jActL_kills_jTr`) as FULL octonion equalities.

  · The dilation MOVES the trace: `rtr (Lmul 1 1) = 6 ≠ 0` (`dilation_trace_rtr`, from N297
    `dilation_moves_trace`) — the non-vacuity contrast: the killers annihilate a functional that is
    genuinely nonzero on the f₄-fixed dilation direction.

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  The generators of the derived symmetry `f₄` split into the entrywise `g₂` and the inner-derivation
  complement; standard treatments POSIT that a Lie-algebra of "traceless" operators preserves a trace
  functional and CHOOSE the invariant bilinear form. The theory DERIVES it: the trace form's
  INVARIANCE is the octonion real-part trace-associativity (forced by the non-associativity that
  stops the cascade), and from it BOTH generating families annihilate the linear trace — with NO
  posited form, NO chosen normalization, NO innerness assumed. The remaining step to "every element
  of `f₄` kills the trace" is EXACTLY `Der(H₃O) = InnDer` (childed) — the trace-annihilation of the
  generators, banked here, reduces the gap to precisely that innerness theorem.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c), caps the Hermitian Jordan tower
  at order 3 (N5, `jordan_fails_H4`), and makes the calibration 3-form cyclic (N209), makes the
  derived Cartan–Killing trace form INVARIANT (its associator is pure-imaginary, killed by the real
  part) — and that invariance forces the generators of the derived symmetry `f₄` to annihilate the
  linear-trace grading functional. One non-associativity: it stops the tower AND makes the trace form
  a genuine invariant metric whose symmetry the symmetry-generators respect.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete trace/Cartan/Killing/invariant/gauge/generator/spectrum: over the
  derived field ℚ and `O ℚ = CD (H ℚ)`, for the symmetric bracket `jb A B = A*B + B*A` and
  `rtr M = (trace M).re.re.re` on `Matrix (Fin 3)(Fin 3)(O ℚ)`: `rtr (A*B) = rtr (B*A)`;
  `rtr ((A*B)*C) = rtr (A*(B*C))`; `rtr (jb (jb A B) C) = rtr (jb A (jb B C))`;
  `rtr (⁅Lmul A, Lmul B⁆ M) = 0`; `rtr (M.map D) = 0` for `D` a derivation of `O ℚ`; and for
  Hermitian `H`, `trace H = ocR (rtr H)`. Pure matrix algebra over the derived field. No theorem
  statement carries a physics word.

  SCOPE. Banks the trace-form invariance + the generator-level trace annihilation + the reality
  bridge + the octonion-valued Hermitian corollaries + the non-vacuity contrast + the capstone. NOT
  the FULL abstract "`∀ T ∈ derH3, jTr (T A) = 0`" (CHILDED — needs `Der(H₃O) = InnDer`, the
  innerness of Jordan derivations; the generator-annihilation banked here reduces it to exactly that
  theorem); NOT the f₄-module split `L = ℚ·1 ⊕ L₀` (follows once the full invariance is in hand); NOT
  the dim-78 bundled `e₆`; NOT the ★5 mass texture VALUE (route-not-yet-found — this invariance is a
  rung of the named ascent); NOT the ★2 mixing VALUE (route-not-yet-found); NOT "= a physical trace
  anomaly / conserved charge" (removable prose).

  Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no bridge.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The deep-real linear trace `rtr = reQ ∘ jTr`, and its additive laws. -/

/-- THE DEEP-REAL LINEAR TRACE. The `re.re.re` coordinate of the octonion-valued linear trace `jTr`
    (N214): a ℚ-valued linear functional on the arena. On the Hermitian arena it recovers the full
    trace (reality bridge below). -/
noncomputable def rtr (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (jTr M)

/-- `rtr` is the sum of the deep-real parts of the diagonal entries. -/
theorem rtr_expand (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr M = reQ (M 0 0) + reQ (M 1 1) + reQ (M 2 2) := by
  unfold rtr jTr
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply]
  rw [reQ_add, reQ_add]

/-- `rtr` is additive. -/
theorem rtr_add (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (M + N) = rtr M + rtr N := by
  simp only [rtr_expand, Matrix.add_apply, reQ_add]; ring

/-- The deep-real part is subtractive. -/
theorem reQ_sub (a b : O ℚ) : reQ (a - b) = reQ a - reQ b := by
  rw [sub_eq_add_neg, reQ_add, reQ_neg, ← sub_eq_add_neg]

/-- `rtr` is subtractive. -/
theorem rtr_sub (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (M - N) = rtr M - rtr N := by
  simp only [rtr_expand, Matrix.sub_apply, reQ_sub]; ring

/-! ## The trace is CYCLIC and ASSOCIATIVE (the matrix lift of octonion reQ-trace laws, N209). -/

/-- ★ TRACE CYCLICITY. `rtr (A*B) = rtr (B*A)`: the deep-real trace of a matrix product is symmetric,
    the matrix-level lift of the octonion real-part trace-commutativity `reQ_mul_comm` (N209). -/
theorem rtr_mul_comm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (A * B) = rtr (B * A) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, reQ_add]
  rw [reQ_mul_comm (A 0 0) (B 0 0), reQ_mul_comm (A 0 1) (B 1 0), reQ_mul_comm (A 0 2) (B 2 0),
      reQ_mul_comm (A 1 0) (B 0 1), reQ_mul_comm (A 1 1) (B 1 1), reQ_mul_comm (A 1 2) (B 2 1),
      reQ_mul_comm (A 2 0) (B 0 2), reQ_mul_comm (A 2 1) (B 1 2), reQ_mul_comm (A 2 2) (B 2 2)]
  ring

/-- ★ TRACE ASSOCIATIVITY. `rtr ((A*B)*C) = rtr (A*(B*C))`: the deep-real trace of a matrix TRIPLE
    product is associative even though the octonion product is NOT — the matrix-level lift of the
    octonion real-part trace-associativity `reQ_mul_assoc3` (N209). The associator's contribution is
    pure-imaginary, killed by the deep-real projection. -/
theorem rtr_mul_assoc (A B C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr ((A * B) * C) = rtr (A * (B * C)) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, add_mul, mul_add, reQ_add]
  rw [reQ_mul_assoc3 (A 0 0) (B 0 0) (C 0 0), reQ_mul_assoc3 (A 0 0) (B 0 1) (C 1 0),
      reQ_mul_assoc3 (A 0 0) (B 0 2) (C 2 0), reQ_mul_assoc3 (A 0 1) (B 1 0) (C 0 0),
      reQ_mul_assoc3 (A 0 1) (B 1 1) (C 1 0), reQ_mul_assoc3 (A 0 1) (B 1 2) (C 2 0),
      reQ_mul_assoc3 (A 0 2) (B 2 0) (C 0 0), reQ_mul_assoc3 (A 0 2) (B 2 1) (C 1 0),
      reQ_mul_assoc3 (A 0 2) (B 2 2) (C 2 0),
      reQ_mul_assoc3 (A 1 0) (B 0 0) (C 0 1), reQ_mul_assoc3 (A 1 0) (B 0 1) (C 1 1),
      reQ_mul_assoc3 (A 1 0) (B 0 2) (C 2 1), reQ_mul_assoc3 (A 1 1) (B 1 0) (C 0 1),
      reQ_mul_assoc3 (A 1 1) (B 1 1) (C 1 1), reQ_mul_assoc3 (A 1 1) (B 1 2) (C 2 1),
      reQ_mul_assoc3 (A 1 2) (B 2 0) (C 0 1), reQ_mul_assoc3 (A 1 2) (B 2 1) (C 1 1),
      reQ_mul_assoc3 (A 1 2) (B 2 2) (C 2 1),
      reQ_mul_assoc3 (A 2 0) (B 0 0) (C 0 2), reQ_mul_assoc3 (A 2 0) (B 0 1) (C 1 2),
      reQ_mul_assoc3 (A 2 0) (B 0 2) (C 2 2), reQ_mul_assoc3 (A 2 1) (B 1 0) (C 0 2),
      reQ_mul_assoc3 (A 2 1) (B 1 1) (C 1 2), reQ_mul_assoc3 (A 2 1) (B 1 2) (C 2 2),
      reQ_mul_assoc3 (A 2 2) (B 2 0) (C 0 2), reQ_mul_assoc3 (A 2 2) (B 2 1) (C 1 2),
      reQ_mul_assoc3 (A 2 2) (B 2 2) (C 2 2)]
  ring

/-! ## ★★ THE HEADLINE — the derived Cartan–Killing trace form is INVARIANT (associative). -/

/-- ★★ THE TRACE FORM IS INVARIANT/ASSOCIATIVE. `rtr (jb (jb A B) C) = rtr (jb A (jb B C))`: the
    derived Cartan–Killing metric of the arena satisfies the invariance `⟨AB, C⟩ = ⟨A, BC⟩` of a
    genuine invariant form — DESPITE the octonion product being non-associative — because its
    invariance IS the octonion real-part trace-associativity (`rtr_mul_assoc`). Each of the six
    3-fold products reduces, via trace cyclicity + associativity, to one of two canonical forms; the
    two sides match. The genuinely-new structural lever, never previously banked. -/
theorem traceform_associative (A B C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (jb (jb A B) C) = rtr (jb A (jb B C)) := by
  unfold jb
  simp only [add_mul, mul_add, rtr_add]
  have hE1 : rtr (A * B * C) = rtr (A * (B * C)) := rtr_mul_assoc A B C
  have hE2 : rtr (C * (A * B)) = rtr (A * (B * C)) := by
    rw [rtr_mul_comm C (A * B), rtr_mul_assoc A B C]
  have hE3 : rtr (B * C * A) = rtr (A * (B * C)) := by
    rw [rtr_mul_comm (B * C) A]
  have hO1 : rtr (B * A * C) = rtr (A * (C * B)) := by
    rw [rtr_mul_assoc B A C, rtr_mul_comm B (A * C), rtr_mul_assoc A C B]
  have hO2 : rtr (C * (B * A)) = rtr (A * (C * B)) := by
    rw [rtr_mul_comm C (B * A), rtr_mul_assoc B A C, rtr_mul_comm B (A * C), rtr_mul_assoc A C B]
  have hO3 : rtr (C * B * A) = rtr (A * (C * B)) := by
    rw [rtr_mul_comm (C * B) A]
  rw [hE1, hE2, hE3, hO1, hO2, hO3]

/-! ## ★★★ THE GENERATORS OF f₄ KILL THE LINEAR TRACE. -/

/-- ★★★ THE INNER-DERIVATION COMPLEMENT KILLS THE TRACE. `rtr (innerMul A B M) = 0`. The
    inner-derivation generator `innerMul A B = ⁅Lmul A, Lmul B⁆` (N274) — the `f₄ ⊋ g₂` complement —
    annihilates the linear trace: by trace-form associativity `rtr (jb A (jb B M)) = rtr (jb (jb A B) M)`
    and the symmetry `jb A B = jb B A`, the two half-brackets have equal trace and cancel. This is
    the CLEAN route the false trace-of-commutator route (`innerMul ≠ ⁅⁅A,B⁆,M⁆`, N297) could not reach. -/
theorem innerMul_kills_trace (A B M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (innerMul A B M) = 0 := by
  rw [innerMul_apply, rtr_sub, ← traceform_associative A B M, ← traceform_associative B A M,
      jb_comm B A]
  ring

/-- ★★ THE ENTRYWISE GAUGE KILLS THE TRACE. `rtr (jActL D M) = 0` for `D` a derivation of `O ℚ`. The
    entrywise `g₂`-derivation maps each octonion entry into the imaginary subspace
    (`derivQ_reQ_zero`), so every diagonal entry has vanishing deep-real part. -/
theorem jActL_kills_trace (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (jActL D M) = 0 := by
  rw [rtr_expand]
  simp only [jActL_apply, jAct, Matrix.map_apply]
  rw [show reQ (D (M 0 0)) = 0 from derivQ_reQ_zero D hD (M 0 0),
      show reQ (D (M 1 1)) = 0 from derivQ_reQ_zero D hD (M 1 1),
      show reQ (D (M 2 2)) = 0 from derivQ_reQ_zero D hD (M 2 2)]
  ring

/-! ## THE REALITY BRIDGE — on the Hermitian arena `rtr` recovers the banked octonion trace `jTr`. -/

/-- THE REALITY BRIDGE. For a Hermitian matrix `H` (`Hᴴ = H`), the octonion-valued linear trace `jTr`
    is the central embedding of the deep-real trace: `jTr H = ocR (rtr H)`. A Hermitian matrix has
    self-conjugate diagonal entries (`selfconj_eq_smul`), each equal to the scalar embedding of its
    deep-real part. -/
theorem herm_jTr_eq_ocR_rtr {H : Matrix (Fin 3) (Fin 3) (O ℚ)} (hH : Hᴴ = H) :
    jTr H = ocR (rtr H) := by
  have hd : ∀ i, star (H i i) = H i i := by
    intro i
    have := congrFun (congrFun hH i) i
    rwa [conjTranspose_apply] at this
  have hsc : ∀ i, H i i = ocR (reQ (H i i)) := by
    intro i
    have h1 := selfconj_eq_smul (hd i)
    have h2 : ocR (reQ (H i i)) = (reQ (H i i)) • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [h2, ← h1]
  unfold jTr
  rw [Matrix.trace]
  simp only [Fin.sum_univ_three, Matrix.diag_apply]
  rw [hsc 0, hsc 1, hsc 2, rtr_expand, ocR_add, ocR_add]

/-! ## THE ARENA-NATIVE COROLLARIES — the killers on the banked octonion trace `jTr` (Hermitian). -/

/-- ★★★ THE INNER-DERIVATION COMPLEMENT KILLS THE OCTONION TRACE ON THE ARENA. For Hermitian
    `A, B, M`, `jTr (innerMul A B M) = 0` as a FULL octonion equality. `innerMul` preserves the
    Hermitian subspace (`innerMul_herm`), so its trace is real (reality bridge) and equals `ocR 0`. -/
theorem innerMul_kills_jTr {A B M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (hA : Aᴴ = A) (hB : Bᴴ = B) (hM : Mᴴ = M) : jTr (innerMul A B M) = 0 := by
  have hherm : (innerMul A B M)ᴴ = innerMul A B M := innerMul_herm hA hB hM
  rw [herm_jTr_eq_ocR_rtr hherm, innerMul_kills_trace A B M, ocR_zero]

/-- ★★ THE ENTRYWISE GAUGE KILLS THE OCTONION TRACE ON THE ARENA. For Hermitian `M` and `D` a
    derivation of `O ℚ`, `jTr (jActL D M) = 0` as a FULL octonion equality. `jActL D` preserves the
    Hermitian subspace (`jActL_herm`). -/
theorem jActL_kills_jTr (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    {M : Matrix (Fin 3) (Fin 3) (O ℚ)} (hM : Mᴴ = M) : jTr (jActL D M) = 0 := by
  have hherm : (jActL D M)ᴴ = jActL D M := by
    simp only [jActL_apply]; exact jActL_herm hD hM
  rw [herm_jTr_eq_ocR_rtr hherm, jActL_kills_trace D hD M, ocR_zero]

/-! ## W8 — ANTI-VACUITY: the killed functional is genuinely nonzero on the dilation direction. -/

/-- ★★ W8. The linear trace is genuinely NONZERO on the f₄-fixed dilation direction:
    `rtr (Lmul 1 1) = 6` (the dilation moves along the trace, N297 `dilation_moves_trace`). So the
    generators annihilate a functional that is NOT identically zero — the annihilation is non-vacuous. -/
theorem dilation_trace_rtr : rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) = 6 := by
  show reQ (jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1)) = 6
  rw [dilation_moves_trace]; exact ocR_reQ 6

/-- ★★ W8. The nonzero contrast value: `rtr (Lmul 1 1) ≠ 0`. -/
theorem dilation_trace_ne : rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) ≠ 0 := by
  rw [dilation_trace_rtr]; norm_num

/-! ## THE CAPSTONE — the trace-form invariance and the generator-level trace annihilation. -/

/-- ★★★ N298 — THE INVARIANCE OF THE DERIVED CARTAN–KILLING TRACE FORM AND THE TRACE-ANNIHILATION BY
    THE f₄-GENERATORS. Bundles: (i) trace cyclicity + associativity (the octonion reQ-trace laws,
    lifted); (ii) the trace form's INVARIANCE `rtr (jb (jb A B) C) = rtr (jb A (jb B C))`; (iii) the
    inner-derivation complement kills the trace `rtr (innerMul A B M) = 0`; (iv) the entrywise gauge
    kills the trace `rtr (jActL D M) = 0`; (v) the reality bridge + the octonion-valued Hermitian
    corollary `jTr (innerMul A B M) = 0`; (vi) non-vacuity `rtr (Lmul 1 1) = 6 ≠ 0`. Carries
    `jordan_fails_H4` (N5) in the TYPE — the arena is genuine only at the cap-forced terminal order 3.
    The FORCED core of the childed "derH3 kills jTr"; the gap to "every `T ∈ derH3`" is exactly
    `Der(H₃O) = InnDer` (childed). DERIVED, not a posited invariant form. -/
theorem trace_form_invariance_structure :
    (∀ A B : Matrix (Fin 3) (Fin 3) (O ℚ), rtr (A * B) = rtr (B * A))
    ∧ (∀ A B C : Matrix (Fin 3) (Fin 3) (O ℚ), rtr ((A * B) * C) = rtr (A * (B * C)))
    ∧ (∀ A B C : Matrix (Fin 3) (Fin 3) (O ℚ), rtr (jb (jb A B) C) = rtr (jb A (jb B C)))
    ∧ (∀ A B M : Matrix (Fin 3) (Fin 3) (O ℚ), rtr (innerMul A B M) = 0)
    ∧ (∀ (D : Module.End ℚ (O ℚ)), IsDerivQ D →
        ∀ M : Matrix (Fin 3) (Fin 3) (O ℚ), rtr (jActL D M) = 0)
    ∧ (∀ H : Matrix (Fin 3) (Fin 3) (O ℚ), Hᴴ = H → jTr H = ocR (rtr H))
    ∧ (∀ A B M : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → Bᴴ = B → Mᴴ = M →
        jTr (innerMul A B M) = 0)
    ∧ rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) = 6
    ∧ rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨rtr_mul_comm,
   rtr_mul_assoc,
   traceform_associative,
   innerMul_kills_trace,
   jActL_kills_trace,
   fun _H hH => herm_jTr_eq_ocR_rtr hH,
   fun _A _B _M hA hB hM => innerMul_kills_jTr hA hB hM,
   dilation_trace_rtr,
   dilation_trace_ne,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
