import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Phys.Algebra.OctonionJordanTraceForm
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading —
  N297: THE DILATION / TRACELESS-SPLIT GRADING OF THE SPECTRUM-MOVING SECTOR — the f₄-central
  dilation `Lmul 1 = 2·id` (no spectrum splitting) versus the trace-graded diagonal movers whose
  genuine SPLITTING lives EXACTLY on the trace-zero Cartan hyperplane `(ℚ·1)^⊥`.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the named ascent toward ★5/★2, continuing N295/N296).

  N295 built the object BEYOND `f₄ = Der(H₃(O)) = derH3` (N285/N286) that MOVES the arena's
  spectrum: the Jordan left-multiplication `Lmul A X = jb A X` (N274). Every derivation `T ∈ f₄`
  KILLS the identity (`derH3_kills_one`), so `f₄` FIXES the maximally-degenerate spectral point
  `1 = diag(1,1,1)`, eigenvalues `{1,1,1}` — the CEILING no derivation can lift. The
  left-multiplications MOVE the identity (`Lmul A 1 = A + A`). N296 banked how `f₄` acts on the
  movers: the equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B` (`[f₄, L₀] ⊆ L₀`), exhibiting
  `A ↦ Lmul A` as an `f₄`-module intertwiner.

  The fold's OWN next beat: HOW does a mover actually MOVE the degenerate spectrum — and which
  direction of motion is the trivial one? We compute the SPLITTING structure of the `L₀`-action on
  the degenerate identity, graded by the linear trace `jTr` (N214):

  · ★ THE DILATION IS PURE SCALING. `Lmul 1 X = X + X` (`dilation_scale`): the identity element's
    own left-multiplication is `2·id`, a uniform dilation — it scales the whole spectrum, it does
    NOT split it.

  · ★ THE DILATION IS THE f₄-FIXED (CENTRAL) DIRECTION. `⁅T, Lmul 1⁆ B = 0` for `T ∈ f₄`, Hermitian
    `B` (`dilation_fixed`): by the N296 equivariance `⁅T, Lmul 1⁆ B = Lmul (T 1) B` and the N295
    ceiling `T 1 = 0`. So under the intertwiner `A ↦ Lmul A`, the dilation `Lmul 1` is the image of
    the `f₄`-FIXED point of the arena (the identity `1`, which every derivation kills) — the trivial
    weight-0 direction of the module `L`.

  · ★ THE DIAGONAL MOVERS SPLIT THE DEGENERACY. `Lmul (Dg t0 t1 t2) 1 = Dg t + Dg t`
    (`diag_mover_split`): a diagonal mover displaces the degenerate `diag(1,1,1)` by `2·(t0,t1,t2)`,
    lifting the eigenvalue degeneracy the derivations could not.

  · ★★ THE TRACE GRADING. `jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2·(t0+t1+t2))` (`mover_trace_grading`):
    the trace of the displacement is twice the diagonal sum. The genuine SPLITTING (trace-free
    displacement) is EXACTLY the trace-zero slice:

        `jTr (Lmul (Dg t) 1) = 0 ↔ t0+t1+t2 = 0`   (`split_iff_traceless`).

  · ★★★ THE INTRINSIC JOINT (N214). The splitting slice is EXACTLY the trace-form-orthogonal
    complement of the FORCED identity direction:

        `jTr (Lmul (Dg t) 1) = 0 ↔ jTraceForm 1 (Dg t) = 0`   (`split_iff_orthogonal`),

    via the banked `jTF_one_Dg_zero_iff` (N214, the charge hyperplane `= (ℚ·1)^⊥`). The dichotomy
    is intrinsic and normalization-free: the pure-scaling (dilation) direction is `ℚ·1`, the
    spectrum-splitting directions are its Cartan–Killing-orthogonal complement — the SAME hyperplane
    the derived charge space (N213) lives on.

  · The dilation moves along the trace direction: `jTr (Lmul 1 1) = ocR 6 ≠ 0`
    (`dilation_moves_trace`), the non-vacuity contrast to the traceless splitters.

  ------------------------------------------------------------------------------
  THE DISSOLUTION / MOAT.

  Standard physics POSITS the Yukawa / mass-splitting spurion and CHOOSES which direction breaks the
  degeneracy of the fermion spectrum. The theory DISSOLVES the choice: the spectrum-SPLITTING
  directions ARE the traceless derived Jordan left-multiplications; the non-splitting, pure-scaling
  direction is FORCED to be the `f₄`-central dilation `Lmul 1` (the image of the `f₄`-fixed identity
  under the intertwiner); and the split / no-split dichotomy is the linear-trace grading, tied to the
  SAME trace-zero Cartan hyperplane the derived charge space lives on. No spurion is chosen — the
  grading is a THEOREM.

  ------------------------------------------------------------------------------
  THE ONE CAUSE MANY TERMINATIONS.

  The SAME octonion non-associativity that stops the cascade (N2c) and caps the Hermitian Jordan
  tower at order 3 (N5, `jordan_fails_H4`) furnishing the maximal matter arena `H₃(O)`, makes its
  derivations `f₄` the spectrum-PRESERVERS that FIX the degenerate identity, its left-mults `Lmul`
  the spectrum-MOVERS — and now grades the movers by the linear trace into the ONE f₄-central
  dilation (pure scaling, the fixed identity's image) plus the trace-zero splitters (the charge
  hyperplane). One arena, one multiplication, one trace: the fixed direction scales, the orthogonal
  complement splits.

  ------------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE. Delete spectrum/mass/texture/splitting/dilation/charge/degeneracy: over
  the derived field ℚ and `O ℚ = CD (H ℚ)`, for the ℚ-linear left-multiplication `Lmul` on
  `Matrix (Fin 3)(Fin 3)(O ℚ)`: `Lmul 1 X = X + X`; `⁅T, Lmul 1⁆ B = 0` for `T ∈ derH3`, Hermitian
  `B`; `Lmul (Dg t) 1 = Dg t + Dg t`; `trace (Lmul (Dg t) 1) = ocR (2·Σtᵢ)`, `= 0 ↔ Σtᵢ = 0 ↔
  trace (jb 1 (Dg t)) = 0`; and `trace (Lmul 1 1) = ocR 6 ≠ 0`. Pure matrix algebra over the derived
  field. No theorem statement carries a physics word.

  SCOPE. Banks the dilation/traceless-split grading of the `L₀` action + the intrinsic trace-form
  joint + non-vacuity + the capstone. NOT the abstract "`derH3` kills the linear trace `jTr`"
  (CHILDED — measure-confirmed TRUE but W9-nontrivial: `innerMul A B M ≠ [[A,B],M]` for the
  non-associative octonion matrices, so the trace-annihilation needs the trace-form-skewness of
  Jordan derivations), which would split `L = ℚ·1 ⊕ L₀` as `f₄`-modules; NOT the full
  `e₆ = f₄ ⊕ L₀` dim-78 bundled `LieSubalgebra`; NOT the ★5 mass texture VALUE (route-not-yet-found);
  NOT the ★2 mixing VALUE (route-not-yet-found); NOT "= physical Yukawa / mass splitting" (removable
  prose).
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The dilation — pure scaling and the f₄-fixed (central) direction of the module. -/

/-- ★ THE DILATION IS PURE SCALING. The identity element's own Jordan left-multiplication is `2·id`:
    `Lmul 1 X = X + X` (`jb 1 X = 1*X + X*1 = X + X`). It scales the whole spectrum uniformly — it
    does NOT split it. This is the trivial (weight-0) direction of the spectrum-moving sector. -/
theorem dilation_scale (X : Matrix (Fin 3) (Fin 3) (O ℚ)) : Lmul 1 X = X + X := by
  rw [Lmul_apply]; unfold jb; rw [one_mul, mul_one]

/-- ★ THE DILATION IS THE f₄-FIXED (CENTRAL) DIRECTION. For every Jordan-derivation `T ∈ derH3 = f₄`
    and Hermitian `B`, the commutator of `T` with the dilation `Lmul 1` vanishes: `⁅T, Lmul 1⁆ B = 0`.
    By the N296 equivariance `⁅T, Lmul 1⁆ B = Lmul (T 1) B` and the N295 ceiling `T 1 = 0`
    (`derH3_kills_one`). Under the intertwiner `A ↦ Lmul A`, the dilation is the image of the
    `f₄`-fixed point of the arena (the identity, which every derivation kills) — so it is central in
    the module structure, the trivial-weight direction that carries no spectrum splitting. -/
theorem dilation_fixed (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
    (hT : T ∈ derH3) {B : Matrix (Fin 3) (Fin 3) (O ℚ)} (hB : Bᴴ = B) :
    ⁅T, Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆ B = 0 := by
  rw [spectrum_sector_equivariance T hT Matrix.conjTranspose_one hB, derH3_kills_one T hT]
  rw [Lmul_apply]; unfold jb; simp

/-! ## The diagonal movers — they split the degeneracy, graded by the linear trace. -/

/-- ★ THE DIAGONAL MOVER DISPLACES THE DEGENERATE IDENTITY. A diagonal left-multiplication moves the
    degenerate spectral point `1 = diag(1,1,1)` by twice the diagonal:
    `Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2` (`= Lmul_one`). Unlike a derivation (which
    fixes `1`), it lifts the eigenvalue degeneracy: `{1,1,1}` is displaced along `2·(t0,t1,t2)`. -/
theorem diag_mover_split (t0 t1 t2 : ℚ) :
    Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2 := Lmul_one (Dg t0 t1 t2)

/-- ★★ THE TRACE GRADING. The trace of the diagonal mover's displacement of the identity is twice the
    diagonal sum: `jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2·(t0+t1+t2))`. This is the linear-trace weight
    of the motion — the grading functional (N214 `jTr_Dg`) evaluated on the displacement. -/
theorem mover_trace_grading (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2 * (t0 + t1 + t2)) := by
  have hadd : jTr (Dg t0 t1 t2 + Dg t0 t1 t2) = jTr (Dg t0 t1 t2) + jTr (Dg t0 t1 t2) := by
    unfold jTr; exact Matrix.trace_add _ _
  have hr : (2 * (t0 + t1 + t2)) = (t0 + t1 + t2) + (t0 + t1 + t2) := by ring
  rw [diag_mover_split, hadd, jTr_Dg, hr, ocR_add]

/-- ★★ SPLITTING ⟺ TRACE-ZERO. The genuine SPLITTING of the degenerate spectrum (a trace-free
    displacement — no net scaling) is EXACTLY the trace-zero slice:
    `jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ t0 + t1 + t2 = 0`. A displacement with nonzero trace carries a
    dilation component; a pure split is trace-free. -/
theorem split_iff_traceless (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ t0 + t1 + t2 = 0 := by
  rw [mover_trace_grading]
  constructor
  · intro h
    have hz : (2 * (t0 + t1 + t2)) = 0 := by
      have := congrArg (fun x : O ℚ => x.re.re.re) h
      simpa [ocR_reQ] using this
    linarith
  · intro h; rw [h]; norm_num [ocR_zero]

/-- ★★★ THE INTRINSIC JOINT (N214). The spectrum-splitting slice is EXACTLY the trace-form-orthogonal
    complement of the FORCED identity direction:
    `jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ jTraceForm 1 (Dg t0 t1 t2) = 0`,
    via the banked `jTF_one_Dg_zero_iff` (N214 — the charge hyperplane `= (ℚ·1)^⊥` w.r.t. the
    Cartan–Killing trace form). So the split / no-split dichotomy of the `L₀` action is intrinsic and
    normalization-free: the pure-scaling (dilation) direction is `ℚ·1`, the spectrum-splitting
    directions are its trace-form-orthogonal complement — the SAME hyperplane the derived charge
    space (N213) occupies. -/
theorem split_iff_orthogonal (t0 t1 t2 : ℚ) :
    jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ jTraceForm 1 (Dg t0 t1 t2) = 0 := by
  rw [split_iff_traceless, jTF_one_Dg_zero_iff]

/-- The dilation moves along the TRACE direction (nonzero trace): `jTr (Lmul 1 1) = ocR 6 ≠ 0` — the
    non-vacuity contrast to the traceless splitters. `Lmul 1 1 = 1 + 1`, whose trace is `2·3 = 6`. -/
theorem dilation_moves_trace : jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) = ocR 6 := by
  have hadd : jTr ((1 : Matrix (Fin 3) (Fin 3) (O ℚ)) + 1)
      = jTr (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) + jTr 1 := by
    unfold jTr; exact Matrix.trace_add _ _
  rw [dilation_scale, hadd]
  have h1 : jTr (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) = ocR 3 := by
    rw [← Dg_one, jTr_Dg]; congr 1; norm_num
  rw [h1, ocR_add]; congr 1; norm_num

/-! ## W8 anti-vacuity — a genuine traceless nonzero split. -/

/-- ★★ W8. The concrete split `Lmul (Dg 1 (-1) 0) 1` is TRACELESS: `jTr (Lmul (Dg 1 (-1) 0) 1) = 0`
    (its diagonal sum `1 + (-1) + 0 = 0`). A pure spectrum split, no dilation component. -/
theorem split_traceless : jTr (Lmul (Dg 1 (-1) 0) 1) = 0 := by
  rw [split_iff_traceless]; norm_num

/-- ★★ W8. The concrete traceless split is NONZERO: `Lmul (Dg 1 (-1) 0) 1 ≠ 0` (its `(0,0)` diagonal
    entry is `1 + 1 = 2 ≠ 0`). So the trace-zero splitting slice genuinely lifts the degeneracy — the
    grading is non-vacuous, `L₀` carries real spectrum-splitting motion. -/
theorem split_ne : Lmul (Dg 1 (-1) 0) 1 ≠ 0 := by
  rw [diag_mover_split]
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

/-! ## The capstone — the dilation/traceless-split grading of the spectrum-moving sector. -/

/-- ★★★ THE SPECTRUM-GRADING STRUCTURE. The spectrum-moving sector `L₀` of the reduced structure
    algebra `e₆ = f₄ ⊕ L₀`, acting on the maximally-degenerate identity `1 = diag(1,1,1)`, splits by
    the linear trace into:
    · the DILATION `Lmul 1 = 2·id` — pure scaling (`dilation_scale`), the `f₄`-FIXED/central
      direction (`dilation_fixed`, the image of the derivation-fixed identity under the N296
      intertwiner), moving along the trace (`jTr (Lmul 1 1) = ocR 6 ≠ 0`, `dilation_moves_trace`);
    · the SPLITTERS — diagonal movers displace the degeneracy `Lmul (Dg t) 1 = Dg t + Dg t`
      (`diag_mover_split`), trace-graded `jTr (Lmul (Dg t) 1) = ocR (2·Σtᵢ)` (`mover_trace_grading`),
      with genuine splitting EXACTLY on the trace-zero slice `↔ Σtᵢ = 0` (`split_iff_traceless`)
      `↔ jTraceForm 1 (Dg t) = 0` (`split_iff_orthogonal`, the trace-form-orthogonal complement of the
      identity — the N214 charge hyperplane, intrinsic & normalization-free);
    · non-vacuous: a concrete traceless nonzero split (`split_traceless` ∧ `split_ne`).
    Cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5). DERIVED, not a posited
    Yukawa / mass-splitting spurion. -/
theorem spectrum_grading_structure :
    (∀ X : Matrix (Fin 3) (Fin 3) (O ℚ), Lmul 1 X = X + X)
    ∧ (∀ T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)), T ∈ derH3 →
        ∀ B : Matrix (Fin 3) (Fin 3) (O ℚ), Bᴴ = B → ⁅T, Lmul 1⁆ B = 0)
    ∧ (∀ t0 t1 t2 : ℚ, Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2)
    ∧ (∀ t0 t1 t2 : ℚ, jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2 * (t0 + t1 + t2)))
    ∧ (∀ t0 t1 t2 : ℚ, jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ t0 + t1 + t2 = 0)
    ∧ (∀ t0 t1 t2 : ℚ, jTr (Lmul (Dg t0 t1 t2) 1) = 0 ↔ jTraceForm 1 (Dg t0 t1 t2) = 0)
    ∧ jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1) = ocR 6
    ∧ jTr (Lmul (Dg 1 (-1) 0) 1) = 0
    ∧ Lmul (Dg 1 (-1) 0) 1 ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨dilation_scale,
   fun T hT _B hB => dilation_fixed T hT hB,
   diag_mover_split,
   mover_trace_grading,
   split_iff_traceless,
   split_iff_orthogonal,
   dilation_moves_trace,
   split_traceless,
   split_ne,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
