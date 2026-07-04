import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.PieceBscale
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanFamilyRotationSo3Closure —
  N289: THE so(3) CLOSURE OF THE DERIVED FAMILY-ROTATION GENERATORS — the Lie structure of the
        gauge-neutral room of `f₄ = Der(H₃(O))`.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★4 Lie structure; a directed W1 dissolution).
  N288 banked the three derived family-rotation generators of the gauge-neutral room of the
  fold-forced arena `f₄ = derH3`:

      famA = innerMul (slotB 1)(slotC 1),  famB = innerMul (slotC 1)(slotA 1),
      famC = innerMul (slotA 1)(slotB 1)   (= N287's `M0`),

  each ∈ `f₄`, each gauge-central, each rotating the three cap-forced matter slots (N267) into each
  other. N288 SCOPED OUT the FULL `so(3)` closure `⁅famA, famB⁆ = famC` (cyclic) — the End-identity
  making `span{famA, famB, famC}` a genuine 3-dimensional simple Lie algebra (≅ so(3)), the
  CONTINUOUS Lie form of N273's discrete family permutation `framePerm` (S₃). THIS node banks it.

  ------------------------------------------------------------------------------
  THE DISSOLUTION (docs/RUNBOOK.md W1 step 2 — reframe through the theory; THE ONE LAW). The naive
  route — expand `⁅famC, famA⁆` entrywise over the non-associative matrix ring — is an INSTRUMENT
  WALL (a scratch `Matrix.ext` + `simp` attempt ran 5m26s without closing; W9). The theory dissolves
  it: the family-rotation generators are built from the REAL-UNIT matter slots, whose entries are the
  CENTRAL embedded scalars `ocR r` (nuclear in `O ℚ` — `ocR_comm`/`ocR_assocL/M/R`, N5c). So the
  octonion NON-associativity NEVER BITES on these generators:

    (1) COLLAPSE. For a matrix `ocRM P` with central (ground-scalar) entries, the Jordan
        inner-multiplication `innerMul (ocRM P)(ocRM Q)` collapses to the ORDINARY matrix-commutator
        endomorphism `adE (ocRM P * ocRM Q − ocRM Q * ocRM P)` — because every double product
        reassociates freely past the central factors (`ocRM_assoc_L/R`). No coordinate bash.
    (2) LIE-HOM. On the nuclear (central-matrix) generators, `⁅adE (ocRM P), adE (ocRM Q)⁆ =
        adE (ocRM P * ocRM Q − ocRM Q * ocRM P)` — the commutator map `adE` is a Lie homomorphism
        there (again by nuclearity).
    (3) RING-HOM + PURE-ℚ so(3). `ocRM` is a ring homomorphism (`ocRM_mul`/`ocRM_sub`), so the whole
        closure descends to a PURE-ℚ constant-matrix identity `Kc * Ka − Ka * Kc = Kb` (0/±1 entries)
        — the standard `so(3)` structure constants — closed by `decide`. The non-associativity that
        made the coordinate route intractable is precisely what the centrality of the real unit
        removes.

  So the heavy End-identity over the non-associative matrix ring becomes a light chain of nuclear
  reassociations + a constant-matrix commutator. This is the theory (the real unit is central; the
  cap-forced slots carry it) making a classically-brutal proof dissolve.

  ------------------------------------------------------------------------------
  THE ONE CAUSE, MANY TERMINATIONS. The SAME octonion non-associativity that stops the cascade (N2c)
  and caps the Hermitian Jordan tower at order 3 (N5) — furnishing EXACTLY THREE matter-carrier slots
  (N267) — here does NOT obstruct the closure of their rotation generators, precisely because those
  generators are built from the CENTRAL real unit; the family-rotation algebra closes as the simple
  `so(3)`, the continuous Lie realization of the discrete family S₃ (N273).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete family/generation/flavour/rotation: three
  inner-multiplication commutators of central real-unit slot-matrices satisfy `⁅famA, famB⁆ = famC`
  cyclically as endomorphisms of `Matrix (Fin 3) (Fin 3) (O ℚ)`, so their ℚ-span is a 3-dimensional
  Lie subalgebra closing to `so(3)` structure constants. Pure math; physics lives only in identifiers.

  SCOPE (docs/RUNBOOK.md W4.5). BANKS the FULL `so(3)` closure `⁅famA, famB⁆ = famC` (cyclic) as a
  `Module.End` identity, plus the nuclear-collapse machinery that dissolves it. Does NOT bank: the
  bundled `LieSubalgebra`/`= Der(J₃(ℝ))` LieHom (optional hardening); the S₃ ⊂ so(3) embedding vs
  N273 `framePerm`; the ★2 mixing VALUE (route-not-yet-found — a FORCED build target); and
  `= physical 3 generations / flavour SU(3)` (removable prose).

  Foundations-only: no posited axiom, no sorry, no native_decide, no bridge.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

/-! ## The central (ground-scalar) matrices `ocRM P` and their nuclearity. -/

/-- The matrix of embedded central ground scalars: `(ocRM P) i j = ocR (P i j)`. Its entries lie in
    the central copy `ocR '' ℚ ⊆ O ℚ`, so `ocRM P` associates freely with everything. -/
noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j))

@[simp] theorem ocRM_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    ocRM P i j = ocR (P i j) := rfl

/-- `ocR` is additive-inverse compatible: `ocR (-r) = - ocR r`. -/
theorem ocR_neg (r : ℚ) : ocR (-r) = - ocR r := by ext <;> simp [ocR]

/-- `ocR` respects subtraction: `ocR (r - s) = ocR r - ocR s`. -/
theorem ocR_sub (r s : ℚ) : ocR (r - s) = ocR r - ocR s := by
  rw [sub_eq_add_neg r s, ← ocR_add r (-s), ocR_neg, ← sub_eq_add_neg]

/-- NUCLEAR (left): a central matrix `ocRM P` associates from the left past any two arena matrices.
    Entrywise, each product `ocR (P i k) * (Y_kl * Z_lj)` reassociates by the banked `ocR_assocL`. -/
theorem ocRM_assoc_L (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ocRM P * (Y * Z) = (ocRM P * Y) * Z := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocL]
  abel

/-- NUCLEAR (right): a central matrix `ocRM P` associates from the right (banked `ocR_assocR`). -/
theorem ocRM_assoc_R (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (Y * Z) * ocRM P = Y * (Z * ocRM P) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocR]
  abel

/-- `ocRM` is MULTIPLICATIVE: `ocRM P * ocRM Q = ocRM (P * Q)` (the ground embedding `ocR` is a ring
    hom — `ocR_mul`/`ocR_add`). -/
theorem ocRM_mul (P Q : Matrix (Fin 3) (Fin 3) ℚ) : ocRM P * ocRM Q = ocRM (P * Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, ocR_mul, ocR_add]

/-- `ocRM` respects subtraction: `ocRM P - ocRM Q = ocRM (P - Q)`. -/
theorem ocRM_sub (P Q : Matrix (Fin 3) (Fin 3) ℚ) : ocRM P - ocRM Q = ocRM (P - Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.sub_apply, ocRM_apply, ocR_sub]

/-! ## The matrix-commutator endomorphism `adE` and the collapse of `innerMul` on central matrices. -/

/-- THE MATRIX-COMMUTATOR ENDOMORPHISM. `adE K : X ↦ K * X − X * K`, packaged as a ℚ-linear
    endomorphism of the arena. On the central-matrix generators the Jordan inner-multiplication
    collapses to this (`collapse`), so the closure reduces to matrix commutators. -/
noncomputable def adE (K : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := K * X - X * K
  map_add' X Y := by rw [mul_add, add_mul]; abel
  map_smul' r X := by simp only [RingHom.id_apply, mat_mul_smul, mat_smul_mul, smul_sub]

@[simp] theorem adE_apply (K X : Matrix (Fin 3) (Fin 3) (O ℚ)) : adE K X = K * X - X * K := rfl

/-- ★★ THE COLLAPSE. For CENTRAL matrices `ocRM P`, `ocRM Q`, the Jordan inner-multiplication
    commutator collapses to the ordinary matrix-commutator endomorphism:
        `innerMul (ocRM P)(ocRM Q) = adE (ocRM P * ocRM Q − ocRM Q * ocRM P)`.
    The four levels of `jb` (each a `+`-symmetrised product) reassociate freely past the central
    factors (`ocRM_assoc_L/R`), so the mixed terms telescope to the plain commutator `K X − X K`.
    This is where the octonion non-associativity provably does NOT bite — the theory-native
    dissolution of the N288-scoped-out closure. -/
theorem collapse (P Q : Matrix (Fin 3) (Fin 3) ℚ) :
    innerMul (ocRM P) (ocRM Q) = adE (ocRM P * ocRM Q - ocRM Q * ocRM P) := by
  apply LinearMap.ext; intro X
  rw [innerMul_apply, adE_apply]
  simp only [jb, mul_add, add_mul, sub_mul, mul_sub]
  rw [ocRM_assoc_L P (ocRM Q) X, ocRM_assoc_L P X (ocRM Q),
      ocRM_assoc_R P X (ocRM Q), ocRM_assoc_L Q (ocRM P) X,
      ← ocRM_assoc_R P (ocRM Q) X, ocRM_assoc_R Q X (ocRM P)]
  abel

/-- ★★ THE LIE-HOM on the central generators: `⁅adE (ocRM P), adE (ocRM Q)⁆ =
    adE (ocRM P * ocRM Q − ocRM Q * ocRM P)`. The bracket of two matrix-commutator endomorphisms is
    the endomorphism of the commutator of the matrices — valid here because the central factors
    reassociate freely (`ocRM_assoc_L/R`), the Jacobi/telescoping being purely the nuclear identity. -/
theorem adE_bracket (P Q : Matrix (Fin 3) (Fin 3) ℚ) :
    ⁅adE (ocRM P), adE (ocRM Q)⁆ = adE (ocRM P * ocRM Q - ocRM Q * ocRM P) := by
  apply LinearMap.ext; intro X
  rw [show (⁅adE (ocRM P), adE (ocRM Q)⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = adE (ocRM P) * adE (ocRM Q) - adE (ocRM Q) * adE (ocRM P) from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, adE_apply]
  simp only [mul_sub, sub_mul]
  rw [ocRM_assoc_L P (ocRM Q) X, ocRM_assoc_L P X (ocRM Q),
      ocRM_assoc_R P (ocRM Q) X, ocRM_assoc_R P X (ocRM Q),
      ocRM_assoc_L Q (ocRM P) X, ocRM_assoc_R Q X (ocRM P)]
  abel

/-! ## The three family-rotation generators as `adE` of central slot-pattern commutators. -/

/-- The `(0,1)`-slot pattern (`slotA 1 = ocRM pA`). -/
def pA : Matrix (Fin 3) (Fin 3) ℚ := !![0,1,0; 1,0,0; 0,0,0]
/-- The `(0,2)`-slot pattern (`slotB 1 = ocRM pB`). -/
def pB : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,1; 0,0,0; 1,0,0]
/-- The `(1,2)`-slot pattern (`slotC 1 = ocRM pC`). -/
def pC : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,0; 0,0,1; 0,1,0]

/-- `slotA 1 = ocRM pA` (the real-unit first slot is the central matrix of pattern `pA`). -/
theorem slotA_one_ocRM : slotA (1:O ℚ) = ocRM pA := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, ocRM, pA, ocR_one, ocR_zero]

/-- `slotB 1 = ocRM pB`. -/
theorem slotB_one_ocRM : slotB (1:O ℚ) = ocRM pB := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz, ocRM, pB, ocR_one, ocR_zero]

/-- `slotC 1 = ocRM pC`. -/
theorem slotC_one_ocRM : slotC (1:O ℚ) = ocRM pC := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz, ocRM, pC, ocR_one, ocR_zero]

/-- `famC = innerMul (slotA 1)(slotB 1) = adE (ocRM (pA*pB − pB*pA))`. -/
theorem famC_eq_adE : innerMul (slotA (1:O ℚ)) (slotB 1) = adE (ocRM (pA * pB - pB * pA)) := by
  rw [slotA_one_ocRM, slotB_one_ocRM, collapse, ocRM_mul, ocRM_mul, ocRM_sub]

/-- `famA = innerMul (slotB 1)(slotC 1) = adE (ocRM (pB*pC − pC*pB))`. -/
theorem famA_eq_adE : innerMul (slotB (1:O ℚ)) (slotC 1) = adE (ocRM (pB * pC - pC * pB)) := by
  rw [slotB_one_ocRM, slotC_one_ocRM, collapse, ocRM_mul, ocRM_mul, ocRM_sub]

/-- `famB = innerMul (slotC 1)(slotA 1) = adE (ocRM (pC*pA − pA*pC))`. -/
theorem famB_eq_adE : innerMul (slotC (1:O ℚ)) (slotA 1) = adE (ocRM (pC * pA - pA * pC)) := by
  rw [slotC_one_ocRM, slotA_one_ocRM, collapse, ocRM_mul, ocRM_mul, ocRM_sub]

/-! ## The pure-ℚ constant so(3): the slot-pattern commutators close as structure constants. -/

/-- THE PURE-ℚ so(3) STRUCTURE CONSTANT (the (C,A)→B relation). The constant `0/±1` matrix identity
    `(pA*pB − pB*pA)*(pB*pC − pC*pB) − (pB*pC − pC*pB)*(pA*pB − pB*pA) = pC*pA − pA*pC` — closed by
    `decide` over ℚ. This is the classical `so(3)` structure constant, to which the whole
    family-rotation closure descends once the octonion non-associativity is removed by centrality. -/
theorem q_so3_CA :
    (pA*pB - pB*pA) * (pB*pC - pC*pB) - (pB*pC - pC*pB) * (pA*pB - pB*pA)
      = pC*pA - pA*pC := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pA, pB, pC, Matrix.sub_apply]

/-- THE PURE-ℚ so(3) (A,B)→C relation. -/
theorem q_so3_AB :
    (pB*pC - pC*pB) * (pC*pA - pA*pC) - (pC*pA - pA*pC) * (pB*pC - pC*pB)
      = pA*pB - pB*pA := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pA, pB, pC, Matrix.sub_apply]

/-- THE PURE-ℚ so(3) (B,C)→A relation. -/
theorem q_so3_BC :
    (pC*pA - pA*pC) * (pA*pB - pB*pA) - (pA*pB - pB*pA) * (pC*pA - pA*pC)
      = pB*pC - pC*pB := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pA, pB, pC, Matrix.sub_apply]

/-! ## THE so(3) CLOSURE — the derived family-rotation generators close as a simple Lie algebra. -/

/-- ★★★ THE (C,A)→B CLOSURE: `⁅famC, famA⁆ = famB`. Via the collapse to central matrix commutators
    (`famC/famA/famB_eq_adE`), the Lie-hom `adE_bracket`, and the pure-ℚ structure constant
    `q_so3_CA`. NO octonion coordinate expansion — the non-associativity is dissolved by the
    centrality of the real unit the slots carry. -/
theorem famC_famA_closure :
    ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
      = innerMul (slotC (1:O ℚ)) (slotA 1) := by
  rw [famC_eq_adE, famA_eq_adE, famB_eq_adE, adE_bracket, ocRM_mul, ocRM_mul, ocRM_sub, q_so3_CA]

/-- ★★★ THE (A,B)→C CLOSURE: `⁅famA, famB⁆ = famC`. -/
theorem famA_famB_closure :
    ⁅innerMul (slotB (1:O ℚ)) (slotC 1), innerMul (slotC (1:O ℚ)) (slotA 1)⁆
      = innerMul (slotA (1:O ℚ)) (slotB 1) := by
  rw [famA_eq_adE, famB_eq_adE, famC_eq_adE, adE_bracket, ocRM_mul, ocRM_mul, ocRM_sub, q_so3_AB]

/-- ★★★ THE (B,C)→A CLOSURE: `⁅famB, famC⁆ = famA`. -/
theorem famB_famC_closure :
    ⁅innerMul (slotC (1:O ℚ)) (slotA 1), innerMul (slotA (1:O ℚ)) (slotB 1)⁆
      = innerMul (slotB (1:O ℚ)) (slotC 1) := by
  rw [famB_eq_adE, famC_eq_adE, famA_eq_adE, adE_bracket, ocRM_mul, ocRM_mul, ocRM_sub, q_so3_BC]

/-! ## W8 non-vacuity — the closure is genuinely non-abelian. -/

/-- `famB = innerMul (slotC 1)(slotA 1) ≠ 0`: the closure target is a nonzero generator, so the room
    is genuinely NON-abelian — `⁅famC, famA⁆ = famB ≠ 0`. Certified via `famB_eq_adE` at the
    generation-rotation action `famA (slotC c) = slotB c` (`famA_slotC`), or directly: `famB` acts on
    `slotA 1` nontrivially. We use the banked non-vacuity of the rotation. -/
theorem famB_ne_zero : innerMul (slotC (1:O ℚ)) (slotA 1) ≠ 0 := by
  intro h
  -- famB applied to slotA 1: measured famB(slotA a) = slotC a (the (0,1)→(1,2) rotation).
  -- if famB = 0 then famB (slotA 1) = 0, but its (1,2) entry is 1 ≠ 0.
  have hz : innerMul (slotC (1:O ℚ)) (slotA 1) (slotA 1) = 0 := by rw [h]; rfl
  rw [famB_eq_adE] at hz
  -- adE (ocRM Kb) (slotA 1) has (1,2) entry = reQ = 1 by the pure structure; contradiction.
  have := congrArg (fun M => reQ (M 1 2)) hz
  simp only [Matrix.zero_apply] at this
  rw [adE_apply, slotA_one_ocRM] at this
  simp only [ocRM, pA, pC, Matrix.mul_apply, Matrix.sub_apply, Matrix.of_apply,
    Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, ocR_sub, ocR_zero, ocR_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, sub_zero, zero_sub, reQ] at this
  norm_num at this

/-! ## THE CAPSTONE — the family-rotation algebra is a simple `so(3)`. -/

/-- ★★★ CAPSTONE — THE so(3) CLOSURE OF THE DERIVED FAMILY-ROTATION ALGEBRA. The three gauge-central
    family-rotation generators of the gauge-neutral room of the fold-forced arena `f₄ = derH3`
    (N288),
        `famA = innerMul (slotB 1)(slotC 1)`, `famB = innerMul (slotC 1)(slotA 1)`,
        `famC = innerMul (slotA 1)(slotB 1)`,
    CLOSE as a 3-dimensional simple Lie algebra `so(3)`:
        `⁅famA, famB⁆ = famC`,  `⁅famB, famC⁆ = famA`,  `⁅famC, famA⁆ = famB`  (cyclic),
    with the closure genuinely NON-abelian (`famB ≠ 0`). This is the CONTINUOUS Lie realization, as
    inner derivations inside `f₄`, of N273's discrete family permutation `framePerm` (S₃) — the
    family-rotation algebra of the three cap-forced generations (N267).

    Also carries `jdef Xwit Ywit ≠ 0` (`jordan_fails_H4`) in the TYPE — the arena is genuine only at
    the cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem family_rotation_so3 :
    ⁅innerMul (slotB (1:O ℚ)) (slotC 1), innerMul (slotC (1:O ℚ)) (slotA 1)⁆
        = innerMul (slotA (1:O ℚ)) (slotB 1)
    ∧ ⁅innerMul (slotC (1:O ℚ)) (slotA 1), innerMul (slotA (1:O ℚ)) (slotB 1)⁆
        = innerMul (slotB (1:O ℚ)) (slotC 1)
    ∧ ⁅innerMul (slotA (1:O ℚ)) (slotB 1), innerMul (slotB (1:O ℚ)) (slotC 1)⁆
        = innerMul (slotC (1:O ℚ)) (slotA 1)
    ∧ innerMul (slotC (1:O ℚ)) (slotA 1) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨famA_famB_closure, famB_famC_closure, famC_famA_closure, famB_ne_zero, jordan_fails_H4⟩

end Phys.Algebra.HJ
