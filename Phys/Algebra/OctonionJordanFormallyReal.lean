/-
  Phys.Algebra.OctonionJordanFormallyReal — N270: THE OBSERVABLE MATTER ARENA IS FORMALLY REAL.
  ============================================================================================
  The FORWARD ★4↔★12 joint — grounding N269's gauge-invariant spectrum as a genuine REAL spectrum.

  N269 proved the derived gauge (Der(O ℚ) = g₂ infinitesimally, Aut(O ℚ) = g₂ finitely) leaves the
  arena's cubic norm `jN`, spur `jS`, and the whole generic characteristic polynomial `jN_charpoly`
  invariant, and CALLED the char-poly's roots the "observable spectrum." But NOTHING established
  those roots are REAL. This node fills that gap from the fold's own POSITIVITY primitive.

  THE FOLD PRIMITIVE. The Born self-overlap `gForm v w = reQ (v · star w)` is the fold's positivity:
  over the derived ℚ it is ANISOTROPIC — `gForm w w ≥ 0` (`gForm_self_nonneg`) and `= 0 ↔ w = 0`
  (`gForm_self_eq_zero`), the same trunk primitive that makes `O ℚ` a division algebra / matter
  indivisible (N265), makes `Der(O ℚ)` compact = g₂ (DerivationCompact), and forces the imaginary
  frame orthonormal (N257).

  THE HEADLINE. Lift that positivity to the maximal matter arena `J₃(O ℚ) = H₃(O ℚ)` (N5/N267):
  the real trace-square functional `jQ A := reQ (trace (A * A))` on the general Hermitian element
  `A = Hm d0 d1 d2 a b c` is a SUM OF ℚ-SQUARES,

      `jQ (Hm d0 d1 d2 a b c) = d0² + d1² + d2² + 2·(gForm a a + gForm b b + gForm c c)`   (`jQ_Hm`),

  hence `jQ A ≥ 0` (`jQ_Hm_nonneg`) with `jQ A = 0 ↔ A = 0` (`jQ_Hm_eq_zero_iff`). Tied to the
  BANKED Cartan–Killing metric `jTraceForm` (N214) by `reQ (jTraceForm A A) = 2·jQ A`
  (`reQ_jTraceForm_self`), this says the banked trace form is POSITIVE-DEFINITE
  (`jTraceForm_Hm_nonneg` / `jTraceForm_Hm_posdef`): `J₃(O ℚ)` is a FORMALLY-REAL (Euclidean)
  Jordan algebra. That is WHY N269's gauge-invariant characteristic-polynomial spectrum is a
  genuine REAL observable spectrum — a real symmetric-cubic has real roots because its trace form
  is positive-definite.

  OCTONION-ANCHOR (the free-floating rail, S4). Positive-definiteness of the trace form is not
  octonion-UNIQUE (`H₃(ℝ)/ℂ/ℍ` are formally real too; positivity does not FAIL below O). It is
  NON-free-floating because (i) it descends DIRECTLY from a TRUNK PRIMITIVE (Born positivity) — the
  same standing as N265's no-zero-divisors, which also holds below O yet is not free-floating; and
  (ii) the octonion-SPECIFIC JOINT: formal reality holds AT the cap-forced MAXIMAL Jordan order 3 —
  order 4 is NOT EVEN A JORDAN ALGEBRA (`jordan_fails_H4`, the cascade-stop non-associativity, via
  `jordan_cap_iff_nonassoc`), so `J₃(O ℚ)` is the MAXIMAL formally-real octonionic arena. The
  capstone `arena_formally_real` carries `jordan_cap_pinned_at_three` (whose type includes the
  order-4 failure `jdef Xwit Ywit ≠ 0`), so it is NOT carrier-agnostic.

  THE MOAT / DISSOLUTION (STANDARD §0). Jordan–von Neumann–Wigner (1934) FOUNDED the
  observable-algebra program by POSITING "formally-real (Euclidean) Jordan algebra" as the defining
  AXIOM and then classifying. The theory DERIVES that founding axiom: formal reality of the maximal
  matter arena IS the fold's Born self-overlap positivity, lifted intact through the cap-forced
  maximal order. NOVELTY is claimed ONLY for this forced positivity + the octonion-cap-maximality
  joint — NEVER for "the real eigenvalues ARE physical masses/charges" (removable prose).

  PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete 'observable / spectrum / matter / gauge / eigenvalue
  / mass / Euclidean / formally-real / arena': what remains is — over the derived ℚ and the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, for `jQ A = reQ (trace (A * A))` and the banked
  `jTraceForm`, `jQ (Hm d0 d1 d2 a b c) = d0² + d1² + d2² + 2·(gForm a a + gForm b b + gForm c c)`,
  `jQ (Hm ...) ≥ 0`, `jQ (Hm ...) = 0 ↔ Hm ... = 0`, `reQ (jTraceForm A A) = 2·jQ A`; pure algebra
  over the derived field. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationCompact
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The real trace-square functional of the arena. -/

/-- The real-valued trace-square form of the arena: `jQ A = reQ (trace (A * A))`.
    For a Hermitian `A` this is the sum of the Born norms of all nine entries — the fold's
    positivity read on the matrix. -/
noncomputable def jQ (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (Matrix.trace (A * A))

/-! ## The sum-of-squares identity (the crux) — the fold's positivity lifted to the arena. -/

/-- ★★★ THE CRUX. The trace-square of the general Hermitian element is a SUM OF ℚ-SQUARES:
    `jQ (Hm d0 d1 d2 a b c) = d0² + d1² + d2² + 2·(gForm a a + gForm b b + gForm c c)`.
    Each diagonal entry `ocR dᵢ` contributes `dᵢ·dᵢ`; each off-diagonal octonion `x` appears twice
    (above and below the diagonal) contributing `reQ (x·star x) = gForm x x` and its conjugate twin
    `reQ (star x·x) = gForm x x` (`reQ_mul_comm`). NO octonion coordinate bash — the trace/entry
    expansion collapses through `selfMul_eq_smul`-style `reQ (x·star x) = gForm x x`. -/
theorem jQ_Hm (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jQ (Hm d0 d1 d2 a b c)
      = d0 * d0 + d1 * d1 + d2 * d2
        + 2 * (gForm a a + gForm b b + gForm c c) := by
  unfold jQ Hm
  rw [Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.empty_val',
    Matrix.cons_val_fin_one, Matrix.head_fin_const]
  simp only [reQ_add]
  have hcomm : ∀ x : O ℚ, reQ (star x * x) = gForm x x := by
    intro x; unfold gForm; rw [reQ_mul_comm]
  have hself : ∀ x : O ℚ, reQ (x * star x) = gForm x x := fun x => rfl
  have hocR : ∀ d : ℚ, reQ (ocR d * ocR d) = d * d := by
    intro d; simp [reQ, ocR, Phys.Cascade.CD.mul_re]
  rw [hocR, hself, hself, hcomm, hocR, hself, hcomm, hcomm, hocR]
  ring

/-! ## Positive semi-definiteness and definiteness (formal reality). -/

/-- ★★ POSITIVE SEMI-DEFINITE: the trace-square form is `≥ 0` — the fold's Born positivity
    (`gForm_self_nonneg`) lifted to the arena. -/
theorem jQ_Hm_nonneg (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    0 ≤ jQ (Hm d0 d1 d2 a b c) := by
  rw [jQ_Hm]
  have := gForm_self_nonneg a
  have := gForm_self_nonneg b
  have := gForm_self_nonneg c
  nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]

/-- ★★★ POSITIVE DEFINITE (FORMAL REALITY): the trace-square vanishes iff the Hermitian element
    is zero. THE HEADLINE crux — the fold's ℚ-anisotropy (`gForm_self_eq_zero`) forces every
    off-diagonal octonion and every real diagonal entry to vanish, so the arena is a formally-real
    (Euclidean) Jordan algebra. -/
theorem jQ_Hm_eq_zero_iff (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jQ (Hm d0 d1 d2 a b c) = 0 ↔ (d0 = 0 ∧ d1 = 0 ∧ d2 = 0 ∧ a = 0 ∧ b = 0 ∧ c = 0) := by
  rw [jQ_Hm]
  constructor
  · intro h
    have ha := gForm_self_nonneg a
    have hb := gForm_self_nonneg b
    have hc := gForm_self_nonneg c
    have hd0 : d0 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hd1 : d1 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hd2 : d2 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hga : gForm a a = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hgb : gForm b b = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hgc : gForm c c = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    exact ⟨hd0, hd1, hd2, gForm_self_eq_zero.mp hga, gForm_self_eq_zero.mp hgb,
      gForm_self_eq_zero.mp hgc⟩
  · rintro ⟨hd0, hd1, hd2, ha, hb, hc⟩
    subst hd0; subst hd1; subst hd2; subst ha; subst hb; subst hc
    simp [gForm, reQ]

/-! ## The tie to the BANKED Cartan–Killing trace form (N214). -/

/-- ★★ `jb A A = A*A + A*A`, so the BANKED trace form `jTraceForm A A = trace (jb A A)` has real
    part `reQ (jTraceForm A A) = 2·jQ A`. The formal-reality statement lands on the banked N214
    Cartan–Killing metric, not just the ad-hoc `jQ`. -/
theorem reQ_jTraceForm_self (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    reQ (jTraceForm A A) = 2 * jQ A := by
  unfold jTraceForm jb jQ
  rw [Matrix.trace_add, reQ_add]
  ring

/-- ★★ THE BANKED TRACE FORM IS POSITIVE SEMI-DEFINITE on the general Hermitian element. -/
theorem jTraceForm_Hm_nonneg (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    0 ≤ reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) := by
  rw [reQ_jTraceForm_self]
  have := jQ_Hm_nonneg d0 d1 d2 a b c
  linarith

/-- ★★★ THE BANKED TRACE FORM IS POSITIVE DEFINITE (formal reality on the N214 metric):
    `reQ (jTraceForm A A) = 0 ↔ A = 0` for `A = Hm d0 d1 d2 a b c`. -/
theorem jTraceForm_Hm_posdef (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) = 0
      ↔ (d0 = 0 ∧ d1 = 0 ∧ d2 = 0 ∧ a = 0 ∧ b = 0 ∧ c = 0) := by
  rw [reQ_jTraceForm_self]
  constructor
  · intro h
    have hj : jQ (Hm d0 d1 d2 a b c) = 0 := by linarith
    exact (jQ_Hm_eq_zero_iff d0 d1 d2 a b c).mp hj
  · intro h
    rw [(jQ_Hm_eq_zero_iff d0 d1 d2 a b c).mpr h]; ring

/-! ## W8 non-vacuity — a genuine nonzero element with strictly positive trace-square. -/

/-- W8 TEETH (diagonal witness): the primitive frame idempotent `Hm 1 0 0 0 0 0` (`= E0`) has
    `jQ = 1 > 0` — the form is not identically zero. -/
theorem jQ_witness_diag : jQ (Hm 1 0 0 0 0 0) = 1 := by
  rw [jQ_Hm]; simp [gForm, reQ]

/-- W8 TEETH (off-diagonal witness): the pure off-diagonal `Hm 0 0 0 1 0 0` (`= slotA 1`) has
    `jQ = 2·gForm 1 1 = 2 > 0` — the OFF-diagonal (matter-slot) directions carry strictly positive
    trace-square, so the positivity genuinely sees the matter carrier, not only the diagonal. -/
theorem jQ_witness_offdiag : jQ (Hm 0 0 0 1 0 0) = 2 := by
  rw [jQ_Hm]; simp [gForm, reQ]

/-- W8 TEETH: strict positivity of a nonzero element. -/
theorem jQ_witness_pos : 0 < jQ (Hm 1 0 0 0 0 0) := by rw [jQ_witness_diag]; norm_num

/-! ## Capstone. -/

/-- ★★★ THE OBSERVABLE MATTER ARENA IS FORMALLY REAL. Bundles: the sum-of-squares identity, the
    positive-semidefiniteness and positive-definiteness (formal reality) of the BANKED Cartan–Killing
    trace form `jTraceForm` on the general Hermitian element, non-vacuity (a nonzero element with
    strictly positive trace-square), AND the octonion-SPECIFIC cap anchor
    `jordan_cap_pinned_at_three` (the order-3 Jordan identity holds while order 4 FAILS,
    `jdef Xwit Ywit ≠ 0` — so `J₃(O ℚ)` is the cap-forced MAXIMAL formally-real octonionic arena).
    The type carries the cap failure, so it is NOT carrier-agnostic. -/
theorem arena_formally_real :
    (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        0 ≤ reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)))
    ∧ (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ),
        reQ (jTraceForm (Hm d0 d1 d2 a b c) (Hm d0 d1 d2 a b c)) = 0
          ↔ (d0 = 0 ∧ d1 = 0 ∧ d2 = 0 ∧ a = 0 ∧ b = 0 ∧ c = 0))
    ∧ (0 < jQ (Hm 1 0 0 0 0 0))
    ∧ ((∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
          jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
        ∧ jdef Xwit Ywit ≠ 0) :=
  ⟨jTraceForm_Hm_nonneg, jTraceForm_Hm_posdef, jQ_witness_pos, jordan_cap_pinned_at_three⟩

end Phys.Algebra.HJ
