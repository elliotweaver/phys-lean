import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanFamilyInvariantCore —
  N290: THE FAMILY-INVARIANT CORE OF THE MATTER ARENA IS THE SCALAR-UNIT LINE.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the ★4→★5 turn; the family analogue of the banked
  gauge-neutral-core arc).

  N288/N289 built and closed the derived FAMILY-ROTATION `so(3)` of the gauge-neutral room of the
  fold-forced arena `f₄ = Der(H₃(O))`:

      famA = innerMul (slotB 1)(slotC 1),  famB = innerMul (slotC 1)(slotA 1),
      famC = innerMul (slotA 1)(slotB 1),      ⁅famA,famB⁆ = famC  (cyclic),

  each a gauge-central inner derivation of the maximal Hermitian octonionic Jordan arena
  `H₃(O ℚ) = J₃(O ℚ)` (N267) that ROTATES the three cap-forced matter-carrier slots into each other.

  After BUILDING a symmetry, the fold's OWN next beat is always: *what is it BLIND to?* — self-
  blindness, the trunk primitive (the look-back has no nonzero fixed point). The gauge arc answered
  this (N252 the unique colour-fixed axis, N266 the colour-neutral core, N271 the joint
  colour∧isospin core = the fold's scalar unit `span{1}`). The family `so(3)` had NOT. THIS node
  answers it: the joint kernel of the family-rotation `so(3)` on the arena is EXACTLY the arena's
  scalar-unit line `span{(1 : Matrix (Fin 3)(Fin 3)(O ℚ))}`, dimension 1.

  So the traceless 26-dimensional arena — where ALL generation content lives — carries NO nonzero
  family-invariant direction. The family symmetry is BLIND to generation content: the fold's self-
  blindness at the family level, the arena-level twin of the gauge-neutral cores.

  ------------------------------------------------------------------------------
  THE DISSOLUTION (docs/RUNBOOK.md W1 step 2 — reframe through the theory; THE ONE LAW). The field
  would decompose the 27-dim `J₃(O)` as an `so(3)`-module (a character computation over a non-
  associative exceptional algebra) and read off the trivial isotypic component. The theory dissolves
  it via N289's `collapse`: each family generator, built from the CENTRAL real-unit slots, equals the
  ordinary matrix-commutator endomorphism `famX = adE (ocRM Kx)` (`famA/B/C_eq_adE`, Kx a constant
  `0/±1` matrix). So `famX M = ocRM Kx * M − M * ocRM Kx`, and since `ocRM` entries are the central
  ground scalar `ocR`, each entry of `[ocRM Kx, M]` is a PURE-ℚ linear combination of `M`'s entries
  (`ocR_one_mul`, `mul_ocR_one`). The joint kernel is then a `0/±1` linear system whose only solution
  (on the Hermitian arena) is `M = ocR r • id`. NO octonion coordinate bash — the non-associativity
  the module decomposition would fight is removed by the centrality of the real unit the slots carry.

  ------------------------------------------------------------------------------
  ONE CAUSE, MANY TERMINATIONS. The SAME octonion non-associativity that stops the cascade (N2c) and
  caps the Hermitian Jordan tower at order 3 (N5) — furnishing EXACTLY THREE matter slots (N267) and
  their `so(3)` rotation (N288/N289) — makes that rotation BLIND to precisely the fold's own scalar
  unit and nothing else: the self-blindness (no nonzero fixed point) reappearing at the family level.
  The continuous twin of N275's discrete "no fixed root" A₂ ceiling: the mass/mixing texture (★5)
  needs a family-symmetry-BREAKING derived object, not a fixed direction this arena supplies.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete family/generation/flavour: the joint kernel
  of the 3-dimensional Lie algebra `span{innerMul (slotB 1)(slotC 1), innerMul (slotC 1)(slotA 1),
  innerMul (slotA 1)(slotB 1)}` acting on the order-3 Hermitian octonionic matrix algebra is exactly
  the scalar-multiples-of-identity line, dimension 1. Pure math; physics lives only in identifiers.

  SCOPE (docs/RUNBOOK.md W4.5). BANKS the family-invariant core = `span{1}` (the joint kernel on the
  Hermitian arena) + its non-vacuity (a traceless slot element is NOT invariant). Does NOT bank: the
  full family-`so(3)` MODULE decomposition (the Casimir `1 ⊕ 21 ⊕ 5` multiplet tower — scope-out);
  the family-symmetry-BREAKING texture (★5, downstream); the ★2 mixing VALUE (route-not-yet-found).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

/-! ## Central-unit multiplication helpers. -/

/-- Right multiplication by the central unit: `z * ocR 1 = z` (via `ocR_comm` + `ocR_one_mul`). -/
theorem mul_ocR_one (z : O ℚ) : z * ocR 1 = z := by rw [← ocR_comm]; exact ocR_one_mul z

/-! ## The two family generators as `adE` of constant `0/±1` matrices. -/

/-- `Ka := pB*pC − pC*pB = !![0,1,0; -1,0,0; 0,0,0]` (the constant matrix for `famA`). -/
theorem Ka_const : (pB * pC - pC * pB : Matrix (Fin 3) (Fin 3) ℚ) = !![0,1,0; -1,0,0; 0,0,0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pB, pC, Matrix.sub_apply]

/-- `Kb := pC*pA − pA*pC = !![0,0,-1; 0,0,0; 1,0,0]` (the constant matrix for `famB`). -/
theorem Kb_const : (pC * pA - pA * pC : Matrix (Fin 3) (Fin 3) ℚ) = !![0,0,-1; 0,0,0; 1,0,0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pC, pA, Matrix.sub_apply]

/-! ## The ⊆ entry-extraction lemmas: `famA M = 0` and `famB M = 0` force the shape of `M`. -/

/-- From `famA M = 0`: the `(1,2)` entry vanishes. `Ka` row 0 = `[0,1,0]`, col 2 = `[0,0,0]`, so
    `(Ka·M − M·Ka)_{0,2} = M 1 2`. -/
theorem famA_forces_12 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotB (1:O ℚ)) (slotC 1) M = 0) : M 1 2 = 0 := by
  rw [famA_eq_adE, Ka_const] at h
  have h02 := congrArg (fun N => N 0 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    add_zero, zero_add, sub_zero, zero_sub] at h02
  simpa using h02

/-- From `famA M = 0`: the `(1,1)` and `(0,0)` diagonal entries are equal. `Ka` row0=`[0,1,0]`,
    col1=`[1,0,0]`, so `(Ka·M − M·Ka)_{0,1} = M 1 1 − M 0 0`. -/
theorem famA_forces_diag_10 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotB (1:O ℚ)) (slotC 1) M = 0) : M 1 1 = M 0 0 := by
  rw [famA_eq_adE, Ka_const] at h
  have h01 := congrArg (fun N => N 0 1) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, zero_mul, mul_zero, ocR_one_mul,
    add_zero, zero_add] at h01
  simp only [one_mul, mul_one] at h01
  exact sub_eq_zero.mp h01

/-- From `famB M = 0`: the `(0,1)` entry vanishes. `Kb` row0=`[0,0,1]`, col1=`[0,0,0]`, so
    `(Kb·M − M·Kb)_{0,1} = M 2 1`... we read the `(2,1)`-free entry. Actually `Kb` col1 = 0 and
    `Kb` row0=`[0,0,1]` gives `(Kb·M)_{0,1} = M 2 1`; `(M·Kb)_{0,1} = 0`. We instead use the
    `(0,1)` entry to get `M 2 1 = 0`, but we want `M 0 1`. Use entry `(2,1)`: `Kb` row2=`[-1,0,0]`,
    col1=`[0,0,0]` ⇒ `(Kb·M − M·Kb)_{2,1} = -(M 0 1)`. -/
theorem famB_forces_01 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotC (1:O ℚ)) (slotA 1) M = 0) : M 0 1 = 0 := by
  rw [famB_eq_adE, Kb_const] at h
  have h21 := congrArg (fun N => N 2 1) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, ocR_neg, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    neg_mul, mul_neg, add_zero, zero_add, sub_zero, zero_sub, neg_neg] at h21
  -- h21 : -(M 0 1) = 0  (or M 0 1-shape); close
  simpa [neg_eq_zero] using h21

/-- From `famB M = 0`: the `(2,2)` and `(0,0)` diagonal entries are equal. `Kb` row0=`[0,0,1]`,
    col2=`[1,0,0]`, so `(Kb·M − M·Kb)_{0,2} = M 2 2 − M 0 0`. -/
theorem famB_forces_diag_20 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotC (1:O ℚ)) (slotA 1) M = 0) : M 2 2 = M 0 0 := by
  rw [famB_eq_adE, Kb_const] at h
  have h02 := congrArg (fun N => N 0 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, ocR_neg, zero_mul, mul_zero, ocR_one_mul,
    neg_mul, mul_neg, add_zero, zero_add] at h02
  simp only [one_mul, mul_one, neg_sub_neg] at h02
  exact (sub_eq_zero.mp h02).symm

/-- From `famB M = 0`: the `(0,2)` entry vanishes. `Kb` row0=`[0,0,1]`, col2=`[1,0,0]`... we read
    entry `(1,2)`: `Kb` row1=`[0,0,0]`, col2=`[1,0,0]` ⇒ `(Kb·M − M·Kb)_{1,2} = − M 1 0`. That gives
    `M 1 0`. For `M 0 2` use entry `(0,0)`: `Kb` row0=`[0,0,1]` ⇒ `(Kb·M)_{0,0} = M 2 0`, col0 =
    `[0,0,-1]` ⇒ `(M·Kb)_{0,0} = − M 0 2`; so `(Kb·M − M·Kb)_{0,0} = M 2 0 + M 0 2`. Hermiticity
    then ties `M 2 0 = star (M 0 2)`. We instead extract `M 0 2` directly from the `(0,1)`-type; the
    cleanest is entry `(2,2)`: `Kb` row2=`[-1,0,0]`, col2=`[1,0,0]` ⇒ `(Kb·M − M·Kb)_{2,2} =
    − M 0 2 − M 2 0`. Combined with Hermiticity handled at assembly. Here we give the raw `(1,2)`
    reading `M 1 0 = 0`. -/
theorem famB_forces_10 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotC (1:O ℚ)) (slotA 1) M = 0) : M 1 0 = 0 := by
  rw [famB_eq_adE, Kb_const] at h
  have h12 := congrArg (fun N => N 1 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, ocR_neg, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    neg_mul, mul_neg, add_zero, zero_add, sub_zero, zero_sub, neg_neg] at h12
  simpa [neg_eq_zero] using h12

/-- From `famA M = 0`: the `(0,2)` entry vanishes. Entry `(0,1)` gave the diagonal; entry `(2,0)`:
    `Ka` row2=`[0,0,0]`, col0=`[0,-1,0]` ⇒ `(Ka·M − M·Ka)_{2,0} = M 2 1`. For `(0,2)` we use entry
    `(0,2)` already (that gave `M 1 2`). Instead `M 0 2` from entry `(1,2)`: `Ka` row1=`[-1,0,0]`,
    col2=`[0,0,0]` ⇒ `(Ka·M − M·Ka)_{1,2} = − M 0 2`. -/
theorem famA_forces_02 {M : Matrix (Fin 3) (Fin 3) (O ℚ)}
    (h : innerMul (slotB (1:O ℚ)) (slotC 1) M = 0) : M 0 2 = 0 := by
  rw [famA_eq_adE, Ka_const] at h
  have h12 := congrArg (fun N => N 1 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, Matrix.of_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, ocR_zero, ocR_one, ocR_neg, zero_mul, mul_zero, ocR_one_mul, mul_ocR_one,
    neg_mul, mul_neg, add_zero, zero_add, sub_zero, zero_sub, neg_neg] at h12
  simpa [neg_eq_zero] using h12

/-! ## ⊇ : the scalar unit is family-invariant (derivations kill the unit). -/

/-- Each family generator, expressed as `adE (ocRM Kx)`, ANNIHILATES the identity matrix:
    `adE (ocRM Kx) 1 = ocRM Kx * 1 − 1 * ocRM Kx = 0`. -/
theorem adE_one (K : Matrix (Fin 3) (Fin 3) (O ℚ)) : adE K 1 = 0 := by
  rw [adE_apply, mul_one, one_mul, sub_self]

/-- `famA 1 = 0`, `famB 1 = 0`, `famC 1 = 0`: the family-rotation `so(3)` fixes the arena's
    identity — the ⊇ half. -/
theorem famA_one : innerMul (slotB (1:O ℚ)) (slotC 1) 1 = 0 := by rw [famA_eq_adE, adE_one]
theorem famB_one : innerMul (slotC (1:O ℚ)) (slotA 1) 1 = 0 := by rw [famB_eq_adE, adE_one]
theorem famC_one : innerMul (slotA (1:O ℚ)) (slotB 1) 1 = 0 := by rw [famC_eq_adE, adE_one]

/-! ## The family-invariant core predicate and the ⊆ crux. -/

/-- The FAMILY-INVARIANT CORE predicate on the arena: a Hermitian matrix annihilated by all three
    family-rotation generators. -/
def FamInvariant (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : Prop :=
  Mᴴ = M ∧ innerMul (slotB (1:O ℚ)) (slotC 1) M = 0
        ∧ innerMul (slotC (1:O ℚ)) (slotA 1) M = 0
        ∧ innerMul (slotA (1:O ℚ)) (slotB 1) M = 0

/-- ★★★ THE ⊆ CRUX. A family-invariant Hermitian matrix is the central real diagonal
    `Dg r r r = diag(ocR r, ocR r, ocR r)` with `r = reQ (M 0 0)` — i.e. a central scalar multiple of
    the identity. The two generators `famA, famB` force every off-diagonal entry to vanish and all
    three diagonal entries to be equal (the entry-extraction lemmas); Hermiticity makes the common
    diagonal entry `M 0 0` self-adjoint, hence the central scalar `ocR (reQ (M 0 0))`
    (`self_adjoint_ocR`, N286). NO octonion coordinate bash. -/
theorem faminvariant_eq_scalar {M : Matrix (Fin 3) (Fin 3) (O ℚ)} (hM : FamInvariant M) :
    M = Dg (reQ (M 0 0)) (reQ (M 0 0)) (reQ (M 0 0)) := by
  obtain ⟨hHerm, hA, hB, _hC⟩ := hM
  -- off-diagonals from famA, famB
  have h12 : M 1 2 = 0 := famA_forces_12 hA
  have h02 : M 0 2 = 0 := famA_forces_02 hA
  have h01 : M 0 1 = 0 := famB_forces_01 hB
  have h10 : M 1 0 = 0 := famB_forces_10 hB
  -- diagonal equalities
  have hd11 : M 1 1 = M 0 0 := famA_forces_diag_10 hA
  have hd22 : M 2 2 = M 0 0 := famB_forces_diag_20 hB
  -- Hermiticity ties the lower off-diagonals to the (starred) upper ones
  have hentry : ∀ i j, star (M j i) = M i j := fun i j => congrFun (congrFun hHerm i) j
  have h21 : M 2 1 = 0 := by
    have hh := hentry 1 2; rw [h12] at hh; exact star_eq_zero.mp hh
  have h20 : M 2 0 = 0 := by
    have hh := hentry 0 2; rw [h02] at hh; exact star_eq_zero.mp hh
  -- the diagonal M 0 0 is self-adjoint ⇒ central ocR
  have hsa : M 0 0 = ocR (reQ (M 0 0)) := self_adjoint_ocR (M 0 0) (hentry 0 0)
  -- assemble entrywise (Dg r r r has all-equal central diagonal; ![r,r,r] i = r by defeq)
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Dg, Matrix.diagonal_apply, Fin.isValue, Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.cons_val_fin_one, if_true, if_false, reduceCtorEq, reduceIte]
  · exact hsa
  · exact h01
  · exact h02
  · exact h10
  · exact hd11.trans hsa
  · exact h12
  · exact h20
  · exact h21
  · exact hd22.trans hsa

/-! ## W8 non-vacuity — the traceless arena carries NO family-invariant direction. -/

/-- `slotA 1` is NOT family-invariant: `famC (slotA 1) = − slotB 1 ≠ 0` (N288 `famC_slotA`), so a
    traceless matter-slot element escapes the core — the invariant subspace really is only the
    scalar line, not the whole arena. -/
theorem slotA_one_not_faminvariant : ¬ FamInvariant (slotA (1:O ℚ)) := by
  intro ⟨_, _, _, hC⟩
  -- hC : famC (slotA 1) = 0, but famC (slotA 1) = - slotB 1 ≠ 0
  rw [famC_slotA] at hC
  have : slotB (1:O ℚ) = 0 := by
    have := congrArg (fun N => - N) hC; simpa using this
  have hb : (slotB (1:O ℚ)) 0 2 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2 := by rw [this]
  rw [slotB_entry] at hb
  simp only [Matrix.zero_apply] at hb
  have : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [hb]
  simp only [reQ] at this; norm_num at this

/-- The central real diagonal `Dg r r r` is the central matrix `ocRM (r • 1)`. -/
theorem Dg_eq_ocRM (r : ℚ) : Dg r r r = ocRM (r • (1 : Matrix (Fin 3) (Fin 3) ℚ)) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, ocRM, Matrix.diagonal_apply, Matrix.one_apply, Matrix.smul_apply, ocR_zero]

/-- Each family generator ANNIHILATES the central real diagonal `Dg r r r`: it is `adE (ocRM Kx)` of
    a central matrix, which commutes because `r • 1` is central in the pure-ℚ matrix ring
    (`ocRM_mul`, `smul` central). -/
theorem adE_ocRM_Dg (K' : Matrix (Fin 3) (Fin 3) ℚ) (r : ℚ) :
    adE (ocRM K') (Dg r r r) = 0 := by
  rw [Dg_eq_ocRM, adE_apply, ocRM_mul, ocRM_mul]
  rw [show K' * (r • (1:Matrix (Fin 3) (Fin 3) ℚ)) = (r • (1:Matrix (Fin 3) (Fin 3) ℚ)) * K' by
    rw [Matrix.mul_smul, Matrix.smul_mul, Matrix.mul_one, Matrix.one_mul]]
  rw [sub_self]

/-- `famA (Dg r r r) = 0`, and cyclically — the central real diagonal is family-invariant. -/
theorem famA_Dg (r : ℚ) : innerMul (slotB (1:O ℚ)) (slotC 1) (Dg r r r) = 0 := by
  rw [famA_eq_adE]; exact adE_ocRM_Dg _ r
theorem famB_Dg (r : ℚ) : innerMul (slotC (1:O ℚ)) (slotA 1) (Dg r r r) = 0 := by
  rw [famB_eq_adE]; exact adE_ocRM_Dg _ r
theorem famC_Dg (r : ℚ) : innerMul (slotA (1:O ℚ)) (slotB 1) (Dg r r r) = 0 := by
  rw [famC_eq_adE]; exact adE_ocRM_Dg _ r

/-- The central real diagonal is Hermitian: `(Dg r r r)ᴴ = Dg r r r` (central entries are
    self-conjugate). -/
theorem Dg_herm (r : ℚ) : (Dg r r r)ᴴ = Dg r r r := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Dg, Matrix.conjTranspose_apply, Matrix.diagonal_apply, ocR_star, ocR_zero]

/-! ## THE CAPSTONE — the family-invariant core is exactly the scalar-unit line. -/

/-- ★★★ CAPSTONE — THE FAMILY-INVARIANT CORE OF THE MATTER ARENA IS THE SCALAR-UNIT LINE. The joint
    kernel of the derived family-rotation `so(3)` {famA, famB, famC} (N288/N289) on the maximal
    Hermitian octonionic Jordan arena `H₃(O ℚ) = J₃(O ℚ)` (N267) is EXACTLY the scalar-unit line:
    a Hermitian matrix is annihilated by all three family generators IFF it is the central real
    diagonal `Dg r r r = r · id`. Equivalently the identity IS invariant, and a traceless
    matter-slot element (`slotA 1`) is NOT — so the traceless 26-dimensional arena, where all
    generation content lives, carries NO nonzero family-invariant direction. This is the fold's
    self-blindness (no nonzero fixed point) at the family level, the arena-level twin of the
    gauge-neutral cores (N252/N266/N271).

    Carries `jdef Xwit Ywit ≠ 0` (`jordan_fails_H4`) in the TYPE — the arena is genuine only at the
    cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem family_invariant_core_eq_span_one :
    (∀ M : Matrix (Fin 3) (Fin 3) (O ℚ),
        FamInvariant M ↔ ∃ r : ℚ, M = Dg r r r)
    ∧ FamInvariant (Dg 1 1 1)
    ∧ ¬ FamInvariant (slotA (1:O ℚ))
    ∧ jdef Xwit Ywit ≠ 0 := by
  refine ⟨fun M => ⟨fun hM => ⟨reQ (M 0 0), faminvariant_eq_scalar hM⟩, ?_⟩,
    ⟨Dg_herm 1, famA_Dg 1, famB_Dg 1, famC_Dg 1⟩, slotA_one_not_faminvariant, jordan_fails_H4⟩
  · rintro ⟨r, rfl⟩
    exact ⟨Dg_herm r, famA_Dg r, famB_Dg r, famC_Dg r⟩

end Phys.Algebra.HJ
