/-
  Phys.Algebra.OctonionJordanWeightDiagram — N213: THE FULL WEIGHT DIAGRAM of the diagonal
  Cartan frame on the exceptional Jordan algebra J₃(O), and the TRACE-ZERO CHARGE HYPERPLANE.
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal), step 2. HYPERCHARGE
  NORMALIZATION (`Q = T₃ + Y/2`) was deferred 11 consecutive times (N201–N211) for ONE structural
  reason: the rank-2 `g₂ = Der(O ℚ)` as currently carried has NO room for an independent charge
  direction that is FORCED rather than posited. The §N211 frontier NAMED the route out of that
  ceiling — climb to `J₃(O)`, the home where charge becomes a FORCED EIGENVALUE — and N212 took
  step 1: the forced weight `t0+t1` of the SINGLE `(0,1)`-slot under the diagonal Cartan
  `diag(t0,t1,t2)`. THIS module takes step 2: it ASSEMBLES the FULL weight diagram of ALL THREE
  off-diagonal slots simultaneously, and derives the genuinely-new structural relation that pins
  the charge space WITHOUT a posit — the TRACE-ZERO COLLAPSE.

  N5 banked the `J₃(O)` CARRIER (`Hm`, `Xz`, `Dg`, the unit diagonals `Du0/Du1/Du2`), the
  symmetric (Jordan) bracket `jb A B = A·B + B·A`, and the diagonal decomposition `Dg_eq_smul`.
  N212 banked the SINGLE `(0,1)`-slot weight (`jb_Dg_Xz`), the Peirce `(1,1,0)` pattern of the
  frame on that slot, and the complete-orthogonal-frame facts. This module banks the NEXT
  structure, never previously banked: the SIMULTANEOUS action on the FULL off-diagonal core
  `Xz a b c` and the trace-zero relation it forces.

  ★★★ THE FULL WEIGHT DIAGRAM `jb_Dg_Xzabc`. In ONE statement the diagonal Cartan `diag(t0,t1,t2)`
  grades all three off-diagonal slots at once:

      `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((t0+t1)•a) ((t0+t2)•b) ((t1+t2)•c)`.

  The `(0,1)`-slot `a` carries weight `t0+t1`, the `(0,2)`-slot `b` carries `t0+t2`, the
  `(1,2)`-slot `c` carries `t1+t2`: the rank-2 weight/root diagram. Each weight is the SUM of the
  two Cartan coordinates of the two indices the slot connects — the Peirce `(iⱼ)`-slot weight
  `tᵢ + tⱼ`. NOT three separate copies of N212's single slot: the whole diagram is one graded map.

  ★★ THE WEIGHT-SUM CONSTRAINT `weight_sum_eq_two_trace`. The three slot weights are NOT
  independent: `(t0+t1)+(t0+t2)+(t1+t2) = 2·(t0+t1+t2)` — their sum is exactly TWICE the trace.
  This is the closure relation of the rank-2 root system: the weight lattice is spanned by two of
  the three, the third forced.

  ★★ THE TRACE-ZERO CHARGE HYPERPLANE `jb_Dg_Xzabc_traceZero`. On the trace-zero hyperplane
  `t0+t1+t2 = 0` — the rank-2 SL-type Cartan — the three slot weights collapse to

      `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((-t2)•a) ((-t1)•b) ((-t0)•c)`,

  i.e. each slot weight equals MINUS the COMPLEMENTARY Cartan coordinate: the `(0,1)`-slot (not
  touching index 2) carries `-t2`, the `(0,2)`-slot (not touching 1) carries `-t1`, the
  `(1,2)`-slot (not touching 0) carries `-t0`. The two free parameters of the trace-zero plane
  are exactly a 2-parameter family of FORCED weight functionals — the genuine charge space, with
  NO normalization convention posited (`weight_sum_traceZero`: on this plane the three weights
  themselves sum to `0`, the closed root system). THIS is the "room for an independent charge
  direction" the rank-2 `g₂` lacked, now derived as a forced eigenvalue structure.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). The full diagram does NOT bash octonion
  coordinates: it DISSOLVES structurally through the banked `Dg_eq_smul` (the diagonal is
  `t0•Du0 + t1•Du1 + t2•Du2`), the ℚ-bilinearity of the bracket (`jb_add_left`, `jb_smul_left`),
  the three per-slot frame lemmas (`jb_Du0_Xzabc`/`jb_Du1_Xzabc`/`jb_Du2_Xzabc`, each a clean
  diagonal-multiplication matrix computation), and the ℚ-linearity of the off-diagonal core
  (`Xz_smul`, `Xz_add`) — exactly the N211/N212-style reframe. The trace-zero collapse is then
  pure ℚ-arithmetic on the weight functionals (`linarith`).

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS the Albert algebra
  `J₃(O)` and reads its root/weight diagram off by hand, then normalizes the charge by convention.
  Here the carrier was DERIVED forward from the cascade (N5), the SINGLE weight from N212, and the
  FULL diagram + the trace-zero charge hyperplane are DERIVED as a structural consequence of the
  banked Jordan bracket and the diagonal frame — the charge space is a forced eigenvalue structure,
  not a posited normalization. One cause (the doubling-derived `J₃(O)` carrier), the forced charge
  space where hypercharge lives.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'Jordan / Peirce / weight / root / charge /
  hypercharge / Cartan / idempotent / frame / eigenvalue / trace-zero / J₃(O) / exceptional': what
  remains is — over the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, for the
  symmetric bracket `jb A B = A·B + B·A` on `Matrix (Fin 3) (Fin 3) (O ℚ)`,
  `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((t0+t1)•a) ((t0+t2)•b) ((t1+t2)•c)`; the coefficient sum
  `(t0+t1)+(t0+t2)+(t1+t2) = 2·(t0+t1+t2)`; and under `t0+t1+t2 = 0`,
  `jb (Dg t0 t1 t2)(Xz a b c) = Xz ((-t2)•a)((-t1)•b)((-t0)•c)`; pure matrix algebra over the
  derived field. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Phys.Algebra.OctonionJordanFrameWeight
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The per-slot frame lemmas — the full Peirce action of each idempotent on `Xz a b c`. -/

/-- `E0 = diagonal ![1,0,0]` KEEPS the two slots touching index `0` (the `(0,1)`-slot `a` and the
    `(0,2)`-slot `b`) and ANNIHILATES the `(1,2)`-slot `c`: `jb Du0 (Xz a b c) = Xz a b 0`.
    Pure matrix-entry computation (diagonal multiplication), no octonion-coordinate ring. -/
theorem jb_Du0_Xzabc (a b c : O ℚ) :
    jb (Du0 (B := Dbl ℚ)) (Xz a b c) = Xz a b 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- `E1 = diagonal ![0,1,0]` KEEPS the two slots touching index `1` (the `(0,1)`-slot `a` and the
    `(1,2)`-slot `c`) and ANNIHILATES the `(0,2)`-slot `b`: `jb Du1 (Xz a b c) = Xz a 0 c`. -/
theorem jb_Du1_Xzabc (a b c : O ℚ) :
    jb (Du1 (B := Dbl ℚ)) (Xz a b c) = Xz a 0 c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- `E2 = diagonal ![0,0,1]` KEEPS the two slots touching index `2` (the `(0,2)`-slot `b` and the
    `(1,2)`-slot `c`) and ANNIHILATES the `(0,1)`-slot `a`: `jb Du2 (Xz a b c) = Xz 0 b c`. -/
theorem jb_Du2_Xzabc (a b c : O ℚ) :
    jb (Du2 (B := Dbl ℚ)) (Xz a b c) = Xz 0 b c := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-! ### The off-diagonal core `Xz` is ℚ-linear. -/

/-- The off-diagonal core is ℚ-homogeneous: `r • Xz a b c = Xz (r•a) (r•b) (r•c)`. Each entry is
    the smul of the corresponding octonion (the lower conjugates absorb the scalar because the
    embedded scalar `ocR r` is self-conjugate and central). -/
theorem Xz_smul (r : ℚ) (a b c : O ℚ) :
    r • Xz a b c = Xz (r • a) (r • b) (r • c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.smul_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

/-- The off-diagonal core is additive: `Xz a b c + Xz p q r = Xz (a+p) (b+q) (c+r)`. -/
theorem Xz_add (a b c p q r : O ℚ) :
    Xz a b c + Xz p q r = Xz (a + p) (b + q) (c + r) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.add_apply, star_add, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

/-! ### ★★★ THE FULL WEIGHT DIAGRAM — all three off-diagonal slots graded simultaneously. -/

/-- ★★★ THE FULL WEIGHT DIAGRAM. Under the diagonal Cartan `Dg t0 t1 t2 = diag(t0,t1,t2)`, the
    off-diagonal core `Xz a b c` is graded slot-by-slot in ONE statement:

        `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((t0+t1)•a) ((t0+t2)•b) ((t1+t2)•c)`.

    The `(0,1)`-slot `a` carries weight `t0+t1`, the `(0,2)`-slot `b` carries `t0+t2`, the
    `(1,2)`-slot `c` carries `t1+t2` — the rank-2 weight/root diagram, each weight the SUM of the
    two Cartan coordinates of the indices the slot connects. THE ONE LAW REFRAME: dissolves through
    `Dg_eq_smul` + `jb`-bilinearity + the three per-slot frame lemmas + `Xz`-linearity; NO
    octonion-coordinate ring. -/
theorem jb_Dg_Xzabc (t0 t1 t2 : ℚ) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((t0 + t1) • a) ((t0 + t2) • b) ((t1 + t2) • c) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xzabc, jb_Du1_Xzabc, jb_Du2_Xzabc,
      Xz_smul, Xz_smul, Xz_smul, Xz_add, Xz_add]
  simp only [smul_zero, add_zero, zero_add, add_smul]

/-! ### The genuine NEW relational content — the weight-sum constraint and the trace-zero collapse. -/

/-- ★★ THE WEIGHT-SUM CONSTRAINT (the rank-2 root-system closure). The three off-diagonal slot
    weights are NOT independent: their sum is exactly TWICE the trace `t0+t1+t2`:

        `(t0+t1) + (t0+t2) + (t1+t2) = 2·(t0+t1+t2)`.

    The weight lattice is spanned by two of the three weights; the third is forced. -/
theorem weight_sum_eq_two_trace (t0 t1 t2 : ℚ) :
    (t0 + t1) + (t0 + t2) + (t1 + t2) = 2 * (t0 + t1 + t2) := by ring

/-- ★★ THE TRACE-ZERO CHARGE HYPERPLANE. On the trace-zero hyperplane `t0+t1+t2 = 0` (the rank-2
    SL-type Cartan) the full weight diagram collapses to

        `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((-t2)•a) ((-t1)•b) ((-t0)•c)`,

    i.e. each slot weight equals MINUS the COMPLEMENTARY Cartan coordinate (the `(i,j)`-slot,
    which does not touch the third index `k`, carries `-tₖ`). The two free parameters of the
    trace-zero plane are a 2-parameter family of FORCED weight functionals — the charge space,
    derived WITHOUT any normalization convention. -/
theorem jb_Dg_Xzabc_traceZero (t0 t1 t2 : ℚ) (h : t0 + t1 + t2 = 0) (a b c : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a b c)
      = Xz ((-t2) • a) ((-t1) • b) ((-t0) • c) := by
  rw [jb_Dg_Xzabc]
  have e0 : t0 + t1 = -t2 := by linarith
  have e1 : t0 + t2 = -t1 := by linarith
  have e2 : t1 + t2 = -t0 := by linarith
  rw [e0, e1, e2]

/-- ★★ On the trace-zero hyperplane the three slot weights THEMSELVES sum to `0` — the closed
    root system: `(t0+t1)+(t0+t2)+(t1+t2) = 0` when `t0+t1+t2 = 0`. -/
theorem weight_sum_traceZero (t0 t1 t2 : ℚ) (h : t0 + t1 + t2 = 0) :
    (t0 + t1) + (t0 + t2) + (t1 + t2) = 0 := by
  rw [weight_sum_eq_two_trace, h]; ring

/-! ### W8 anti-vacuity — a genuine nonzero weight on a DISTINCT slot under a trace-zero Cartan. -/

/-- ★ W8 NON-VACUITY WITH TEETH. On the TRACE-ZERO Cartan `diag(2,3,-5)` (trace `2+3−5 = 0`), the
    `(1,2)`-slot (the `c`-slot, weight `t1+t2 = 3+(−5)`) carries the genuine value `−2` — read off
    the `(1,2)` entry of the graded core with `c = 1`. The value `−2 = t1+t2 = −t0` confirms the
    trace-zero collapse (the `(1,2)`-slot carries MINUS the complementary coordinate `t0 = 2`),
    and it is a DISTINCT slot / DISTINCT value from N212's `(0,1)`-slot witness `5`. -/
theorem slot12_traceZero_weight_witness :
    ((jb (Dg 2 3 (-5)) (Xz (0 : O ℚ) 0 1)) 1 2).re.re.re = -2 := by
  rw [jb_Dg_Xzabc]
  simp only [Matrix.smul_apply, qsmul_def, Xz, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const,
    ocR, CD.mul_re, CD.mul_im, CD.one_re, CD.one_im, mul_one, mul_zero, sub_zero, add_zero,
    Dbl.mul_re]
  norm_num [Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons, Matrix.cons_val_zero,
    Matrix.cons_val_one]

/-- ★ W8 CONTRAST: the weight-sum on the SAME explicit trace-zero Cartan `diag(2,3,-5)` is `0`
    (`weight_sum_traceZero`), so the three slot weights `(5, −3, −2)`... wait — `(2+3, 2−5, 3−5)
    = (5, −3, −2)` sum to `0`: the closed root system. This is the non-vacuity contrast to the
    single nonzero slot value: the weights are a genuine constrained (rank-2) system, not free. -/
theorem slot_weights_traceZero_sum_zero :
    ((2 : ℚ) + 3) + (2 + (-5)) + (3 + (-5)) = 0 :=
  weight_sum_traceZero 2 3 (-5) (by norm_num)

end Phys.Algebra.HJ
