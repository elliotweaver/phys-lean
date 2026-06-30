/-
  Phys.Algebra.OctonionJordanFrameWeight — N212: THE FORCED WEIGHT GRADING OF THE
  DIAGONAL CARTAN FRAME ON THE EXCEPTIONAL JORDAN ALGEBRA J₃(O).
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal). HYPERCHARGE
  NORMALIZATION (`Q = T₃ + Y/2`) was deferred 11 consecutive times (N201–N211) for ONE
  structural reason: the rank-2 `g₂ = Der(O ℚ)` as currently carried has NO room for an
  independent charge direction that is FORCED rather than posited. The §N211 frontier NAMED
  the route out of that structural ceiling: climb to the exceptional Jordan algebra `J₃(O)` —
  the 3×3 Hermitian octonionic matrices — the home where charge becomes a FORCED EIGENVALUE.

  N5 already banked the `J₃(O)` CARRIER (`Hm`, `Xz`, `Dg`, the unit diagonals `Du0/Du1/Du2`),
  the symmetric (Jordan) bracket `jb A B = A·B + B·A` and its defect `jdef`, the order-3
  Jordan identity (`jdef_H3`/`jordan_cap_pinned_at_three`), and the n≥4 cap (`jordan_fails_H4`).
  This module banks the GENUINELY-NEW NEXT structure on `J₃(O)`, never previously banked:
  the PEIRCE / WEIGHT GRADING of the diagonal idempotent frame.

  THE FRAME. The three diagonal unit idempotents `E0=Du0, E1=Du1, E2=Du2 = diagonal ![1,0,0]`
  etc. form a COMPLETE ORTHOGONAL frame: they resolve the identity (`frame_sum : E0+E1+E2 = 1`),
  each is idempotent (`Du0_idem`), and distinct ones are Jordan-orthogonal (`jb_Du0_Du1 = 0`).

  THE GRADING. The off-diagonal `(0,1)`-slot `Xz a 0 0` (octonion `a` at `(0,1)`, `star a` at
  `(1,0)`, else 0) is a SIMULTANEOUS EIGENVECTOR of the frame's Jordan-multiplication operators
  `A ↦ jb E_k A`:
      jb E0 (Xz a 0 0) = Xz a 0 0     (unscaled eigenvalue 1 — slot in E0's support)
      jb E1 (Xz a 0 0) = Xz a 0 0     (unscaled eigenvalue 1 — slot in E1's support)
      jb E2 (Xz a 0 0) = 0            (eigenvalue 0 — slot ANNIHILATED, not in E2's support)
  The eigenvalue pattern `(1,1,0)` is the Peirce decomposition: the `(i,j)`-slot lies in the
  joint Peirce space `V₁(Eᵢ) ∩ V₁(Eⱼ) ∩ V₀(E_other)`.

  ★ THE HEADLINE — THE FORCED WEIGHT `jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) • (Xz a 0 0)`.
  Under the diagonal Cartan `diag(t0,t1,t2)`, the `(0,1)`-slot carries weight `t0 + t1` — a
  FORCED eigenvalue (a linear functional of the Cartan parameters), NOT a posited convention.
  The three off-diagonal slots carry weights `(t0+t1), (t1+t2), (t0+t2)`: the root/weight pattern
  in which a charge becomes a forced eigenvalue. THIS is the "room for an independent direction"
  the rank-2 `g₂` lacked — the rank-2 diagonal Cartan of `J₃(O)` supplies a 2-parameter family
  of forced weights, and the trace-zero hyperplane of `(t0,t1,t2)` is the genuine charge space.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). The headline does NOT bash octonion
  coordinates: it DISSOLVES structurally through the banked `Dg_eq_smul` (the real diagonal is the
  ℚ-linear combination `t0•Du0 + t1•Du1 + t2•Du2`), the banked ℚ-bilinearity of the bracket
  (`jb_add_left`, `jb_smul_left`), and the three unit eigenvalue lemmas — exactly the N211-style
  reframe that turned a degree-4 coordinate-ring wall into a structural identity.

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS the Albert algebra
  `J₃(O)` and reads its Peirce/weight structure off by hand. Here the carrier was DERIVED forward
  from the cascade (N5), and its weight grading — the forced eigenvalues where charge lives — is
  DERIVED as a structural consequence of the banked Jordan bracket and the diagonal frame, with NO
  posited Jordan algebra / Peirce decomposition / Cartan / weight system as content.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'Jordan / Peirce / weight / charge /
  hypercharge / Cartan / idempotent / frame / eigenvalue / root / J₃(O) / exceptional': what
  remains is — over the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, for the
  symmetric bracket `jb A B = A·B + B·A` on `Matrix (Fin 3) (Fin 3) (O ℚ)`, the diagonal units
  `diagonal ![1,0,0]` etc. satisfy `jb (diagonal ![1,0,0]) (Xz a 0 0) = Xz a 0 0`,
  `jb (diagonal ![0,0,1]) (Xz a 0 0) = 0`, and `jb (Dg t0 t1 t2)(Xz a 0 0) = (t0+t1)•(Xz a 0 0)`;
  pure matrix algebra over the derived field. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The frame eigenvalue lemmas — the Peirce pattern `(1,1,0)` on the `(0,1)`-slot. -/

/-- The first diagonal unit idempotent `E0 = diagonal ![1,0,0]` acts on the off-diagonal
    `(0,1)`-slot `Xz a 0 0` with unscaled Jordan eigenvalue `1`:
    `jb (Du0) (Xz a 0 0) = Xz a 0 0`. The slot lies in `E0`'s support (its `(0,·)` row).
    Pure matrix-entry computation, no octonion-coordinate ring. -/
theorem jb_Du0_Xz (a : O ℚ) : jb (Du0 (B := Dbl ℚ)) (Xz a 0 0) = Xz a 0 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- The second diagonal unit idempotent `E1 = diagonal ![0,1,0]` acts on the `(0,1)`-slot with
    unscaled Jordan eigenvalue `1`: `jb (Du1) (Xz a 0 0) = Xz a 0 0`. The slot lies in `E1`'s
    support (its `(1,·)` row). -/
theorem jb_Du1_Xz (a : O ℚ) : jb (Du1 (B := Dbl ℚ)) (Xz a 0 0) = Xz a 0 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-- ★ The third diagonal unit idempotent `E2 = diagonal ![0,0,1]` ANNIHILATES the `(0,1)`-slot
    (Jordan eigenvalue `0`): `jb (Du2) (Xz a 0 0) = 0`. The slot is NOT in `E2`'s support — this
    annihilation (vs the eigenvalue `1` of `E0`/`E1`) is the genuine Peirce content, the
    `(1,1,0)` pattern that places the slot in the joint Peirce space of the frame. -/
theorem jb_Du2_Xz (a : O ℚ) : jb (Du2 (B := Dbl ℚ)) (Xz a 0 0) = 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du2, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const]

/-! ### The headline — the forced weight of the `(0,1)`-slot under the diagonal Cartan. -/

/-- ★★★ THE FORCED WEIGHT GRADING. Under the diagonal Cartan `Dg t0 t1 t2 = diag(t0,t1,t2)`, the
    off-diagonal `(0,1)`-slot carries Jordan eigenvalue (weight) exactly `t0 + t1`:

        `jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) • (Xz a 0 0)`.

    The weight `t0 + t1` is a FORCED eigenvalue — a linear functional of the Cartan parameters —
    NOT a posited convention. (By symmetry the three off-diagonal slots carry weights
    `(t0+t1), (t1+t2), (t0+t2)`, the root/weight pattern.) THE ONE LAW REFRAME: this dissolves
    structurally through the banked `Dg_eq_smul` (the diagonal is `t0•Du0 + t1•Du1 + t2•Du2`),
    the bracket's ℚ-bilinearity (`jb_add_left`/`jb_smul_left`), and the three unit eigenvalue
    lemmas — NO octonion-coordinate ring. -/
theorem jb_Dg_Xz (t0 t1 t2 : ℚ) (a : O ℚ) :
    jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) • (Xz a 0 0) := by
  rw [Dg_eq_smul, jb_add_left, jb_add_left, jb_smul_left, jb_smul_left, jb_smul_left,
      jb_Du0_Xz, jb_Du1_Xz, jb_Du2_Xz, smul_zero, add_zero, add_smul]

/-! ### The frame is genuine — completeness, idempotence, orthogonality. -/

/-- THE FRAME RESOLVES THE IDENTITY: `E0 + E1 + E2 = 1`. The three diagonal units sum to the
    identity matrix — a complete orthogonal frame, the resolution of identity that makes the
    weight grading a genuine decomposition. -/
theorem frame_sum :
    Du0 (B := Dbl ℚ) + Du1 (B := Dbl ℚ) + Du2 (B := Dbl ℚ)
      = (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Du0, Du1, Du2, Matrix.add_apply, Matrix.one_apply]

/-- Each frame element is idempotent: `E0 * E0 = E0` (a genuine idempotent of the matrix ring). -/
theorem Du0_idem : Du0 (B := Dbl ℚ) * Du0 (B := Dbl ℚ) = Du0 (B := Dbl ℚ) := by
  apply Matrix.ext; intro i j
  simp only [Du0, Matrix.diagonal_mul]
  fin_cases i <;> fin_cases j <;> simp

/-- Distinct frame idempotents are Jordan-orthogonal: `jb E0 E1 = 0`. The frame is orthogonal,
    so the Peirce/weight spaces it grades are genuinely independent. -/
theorem jb_Du0_Du1 : jb (Du0 (B := Dbl ℚ)) (Du1 (B := Dbl ℚ)) = 0 := by
  apply Matrix.ext; intro i j
  simp only [jb, Matrix.add_apply, Du0, Du1, Matrix.diagonal_mul, Matrix.mul_diagonal]
  fin_cases i <;> fin_cases j <;> simp

/-! ### W8 anti-vacuity — the weight is a genuine nonzero functional with teeth. -/

/-- ★ W8 NON-VACUITY WITH TEETH. The `(0,1)`-slot weight under the explicit Cartan `diag(2,3,0)`
    is GENUINELY `2 + 3 = 5` — read off the `(0,1)` entry of the graded slot. The value `5`
    distinguishes the SUM functional `t0+t1` from a product `6`, from `t0=2`, from `t1=3`, and
    from `max=3`: the forced weight is the SUM, not a vacuous or alternative reading. -/
theorem slot01_weight_witness :
    ((jb (Dg 2 3 0) (Xz (1 : O ℚ) 0 0)) 0 1).re.re.re = 5 := by
  rw [jb_Dg_Xz]
  simp only [Matrix.smul_apply, qsmul_def, Xz, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.empty_val',
    ocR, CD.mul_re, CD.mul_im, CD.one_re, CD.one_im, mul_one, mul_zero, sub_zero, add_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.one_re, Dbl.one_im]
  norm_num

/-- ★ W8 CONTRAST: the third frame idempotent genuinely annihilates the slot, so the weight
    pattern is `(1,1,0)` and not the degenerate all-ones — the `(0,1)`-slot is NOT in `E2`'s
    support. (Re-export of `jb_Du2_Xz` as the non-vacuity contrast to the eigenvalue-1 lemmas.) -/
theorem slot01_E2_annihilates (a : O ℚ) : jb (Du2 (B := Dbl ℚ)) (Xz a 0 0) = 0 := jb_Du2_Xz a

end Phys.Algebra.HJ
