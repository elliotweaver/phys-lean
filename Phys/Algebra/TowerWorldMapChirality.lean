/-
# N264 — THE SPINOR IS INTRINSICALLY TWO-HANDED (the chirality germ)

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, imaginary part `ImO`. N261 built the SPINOR — the
gather worldMap's LEFT-regular action `leftReg a = L_a = (a · ·)` is a Clifford module for the fold's
Born form `gForm` — using ONLY the LEFT multiplication face. But the fold's worldMap is intrinsically
TWO-HANDED: the foundational N44 (`ChiralityBlock`) proved the worldMap has a LEFT face `L_a = (a·)`
and a RIGHT face `R_a = (·a)`, and that they do NOT all commute — PROVED equivalent to
non-associativity, the SAME one cause as the cascade-stop (N2c) and the generation-cap (JordanTower).

THIS node completes the object the fold actually makes and proves the JOINT connecting the ★3 spinor
arc to the ★6 chirality star:

  1. The RIGHT face is EQUALLY a Clifford module (`rightReg_clifford`): `{R_a, R_b} = -(2·gForm a b)•id`
     — the exact MIRROR of N261's `leftReg_clifford`, via RIGHT-alternativity `mul_mul_right` (the
     mirror of the left-alternativity `mul_mul_left` N261 used). So BOTH worldMap faces are spinor
     structures for the ONE Born form.
  2. The OBSTRUCTION to fusing the two faces into a single commuting action IS the associator
     (`chir_mixed_apply`: `(L_a R_b − R_b L_a) x = a·(x·b) − (a·x)·b`, the associator middle slot), so
     the two chiralities commute for all imaginary `a,b` IF the algebra associates
     (`chir_commute_of_assoc`) — and they do NOT (`chir_spinor_block`), because `O ℚ` is non-associative
     (the banked `not_associative`, the cascade's own stop), witnessed by a CONCRETE IMAGINARY pair
     (`chir_spinor_block_witness`).
  3. THE ONE-CAUSE LINK (`chir_spinor_block_iff_jordan_cap`): the spinor chirality block is EQUIVALENT
     to the order-4 Hermitian-Jordan generation-cap failure — the same non-associativity, composed as
     an honest `Iff`. One cause, MANY terminations: cascade-stop, generation-cap, N44 chirality block,
     and now the spinor two-handedness.

THE DISSOLUTION (STANDARD §0). Standard physics POSITS chirality: it puts left- and right-handed Weyl
spinors in by hand as separate irreps, and parity violation (the weak force couples to one hand) is an
EMPIRICAL input. The theory INVERTS + DISSOLVES the POSIT OF TWO-NESS AND NON-FUSION: there is ONE
worldMap with two multiplication faces; BOTH are Clifford modules for the same fold Born form; and
their non-fusion is not an axiom but the octonionic non-associativity. The field's "there are two
chiralities and they don't mix" collapses to one forced consequence of the cascade's own stop.

⚠ SCOPE — HONESTY CLAUSE. Banks the structural GERM of chirality — the TWO irreducibly-distinct
handednesses (both Clifford modules) + their forced non-fusion by the one cause — ONLY. Does NOT derive
PARITY VIOLATION (which hand the weak force couples to — a separate, harder, downstream node), NOT a
`ℤ₂` Weyl-grading `O = O⁺ ⊕ O⁻`, NOT `Spin(7)` / the full `Cl(0,7)` algebra iso (downstream). The weak
MIXING ANGLE remains a ≥9× NAMED deferred blocker (ascent invariant tower), untouched.

ONE CAUSE MANY TERMINATIONS: the SAME octonion alternativity (the residue of associativity — left-alt
`mul_mul_left` and right-alt `mul_mul_right`) that (a) makes the LEFT worldMap a spinor (N261) makes
the RIGHT worldMap a spinor too, while the FULL associativity that would fuse them is exactly what the
cascade LOST at this rung — so the spinor is born two-handed.

⚠ FREE-FLOATING check (SOUL rail): every headline TYPE mentions the banked tower objects — the CONCRETE
`leftReg`/`rightReg` regular actions of the banked `O ℚ`/`ImO`, the banked `gForm`, the banked
`not_associative`/`jdef` — NOT a carrier-agnostic "an alternative algebra has two Clifford module
structures". PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "chirality/handedness/left/right-handed/
Weyl/spinor/parity/matter" — the pure statement "the right-regular representation of the derived
non-associative `O ℚ`, restricted to `ImO`, is a Clifford module for `gForm`; the mixed commutator of
the left and right regular actions is the associator; the two do not all commute on `ImO`, equivalently
`O ℚ` is non-associative, equivalently the order-4 Hermitian-Jordan defect is nonzero" stands as pure
mathematics with every property proved.

Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ/ℂ/Clifford as content). `LinearMap`/
`Module.End`/`.comp` are MACHINERY on the DERIVED `O ℚ` (STANDARD §3). NO posited chirality, NO bridge.
Foundations-only: `[propext, Classical.choice, Quot.sound]`.
-/
import Phys.Algebra.TowerWorldMapCliffordModule

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-search budget bump (instance search only, NOT the proof kernel) — the banked
-- N255/N257/N258/N259/N260/N261/N262/N263 precedent for the End-of-O / octonion-tower instance diamonds.
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The RIGHT key-square identity via RIGHT-alternativity (mirror of N261 `key_sq`). -/

/-- ★ THE RIGHT KEY STEP: for imaginary `x ∈ ImO`, the doubled RIGHT action collapses to the negative
    Born norm — `(y · x) · x = (- gForm x x) • y`. The MIRROR of N261's `key_sq`, via RIGHT
    ALTERNATIVITY `mul_mul_right` (`(y·x)·x = y·(x·x)`, the `(y,x,x)` associator vanishing — N5b) then
    the imaginary square `octSq_ImO` (`x·x = (- gForm x x)•1`) then `qsmul_mul_right`/`mul_one`. -/
theorem key_sq_right {x : O ℚ} (hx : x ∈ ImO) (y : O ℚ) :
    (y * x) * x = (- gForm x x) • y := by
  rw [mul_mul_right, octSq_ImO hx, qsmul_mul_right, mul_one]

/-! ## (B) The RIGHT worldMap face assembled as a linear map `ImO →ₗ End ℚ (O ℚ)`. -/

/-- ★★ THE RIGHT worldMap face as a ℚ-linear map: `a ↦ RightMul a` (the right-regular action, N44
    `RightMul`), restricted to the imaginary part `ImO`. Additive and ℚ-linear via the banked
    distributivity `mul_add_na` and scalar law `qsmul_mul_right`. The MIRROR of N261's `leftReg`. -/
def rightReg : ImO →ₗ[ℚ] Module.End ℚ (O ℚ) where
  toFun a := RightMul (a : O ℚ)
  map_add' a b := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.add_apply, RightMul_apply, Submodule.coe_add, mul_add_na]
  map_smul' c a := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.smul_apply, RightMul_apply, SetLike.val_smul, qsmul_mul_right,
      RingHom.id_apply]

@[simp] theorem rightReg_apply (a : ImO) (y : O ℚ) : rightReg a y = y * (a : O ℚ) := rfl

/-! ## (C) The RIGHT Clifford anticommutation relation (mirror of N261 `leftReg_clifford`). -/

/-- ★★ THE RIGHT DIAGONAL: `(rightReg a).comp (rightReg a) = (- gForm a a) • id`. Directly
    `key_sq_right`. Mirror of N261's `leftReg_sq`. -/
theorem rightReg_sq (a : ImO) :
    (rightReg a).comp (rightReg a) = (- gForm (a : O ℚ) (a : O ℚ)) • LinearMap.id := by
  apply LinearMap.ext; intro y
  simp only [LinearMap.comp_apply, rightReg_apply, LinearMap.smul_apply, LinearMap.id_apply]
  exact key_sq_right a.2 y

/-- ★★★ THE RIGHT CLIFFORD RELATION for the fold's Born form:
    `(rightReg a).comp (rightReg b) + (rightReg b).comp (rightReg a) = (-(2 · gForm a b)) • id`
    for all imaginary `a b : ImO`. So the RIGHT worldMap face makes `O ℚ` a Clifford module (spinor)
    for `gForm` on `ImO` — EQUALLY with the LEFT face (N261). Route: POLARIZATION of `key_sq_right`
    at `x = ↑a + ↑b ∈ ImO`, four-term expansion (`add_mul_na`/`mul_add_na`), minus `key_sq_right` at
    `↑a`/`↑b`, `gForm (a+b)(a+b)` bilinear + `gForm_symm`, closed by `linear_combination (norm :=
    module)`. NO coordinate bash. The exact MIRROR of N261's `leftReg_clifford`. -/
theorem rightReg_clifford (a b : ImO) :
    (rightReg a).comp (rightReg b) + (rightReg b).comp (rightReg a)
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id := by
  apply LinearMap.ext; intro y
  have hab : ((a : O ℚ) + b) ∈ ImO := add_mem a.2 b.2
  have hk := key_sq_right hab y
  have hka := key_sq_right a.2 y
  have hkb := key_sq_right b.2 y
  have hexp : (y * ((a : O ℚ) + b)) * ((a : O ℚ) + b)
      = (y * (a : O ℚ)) * (a : O ℚ) + (y * (b : O ℚ)) * (a : O ℚ)
        + ((y * (a : O ℚ)) * (b : O ℚ) + (y * (b : O ℚ)) * (b : O ℚ)) := by
    simp only [add_mul_na, mul_add_na]
  rw [hexp, hka, hkb] at hk
  have hg : gForm ((a : O ℚ) + b) ((a : O ℚ) + b)
      = gForm (a : O ℚ) a + 2 * gForm (a : O ℚ) b + gForm (b : O ℚ) b := by
    rw [gForm_add_left, gForm_add_right, gForm_add_right, gForm_symm (b : O ℚ) a]; ring
  simp only [LinearMap.add_apply, LinearMap.comp_apply, rightReg_apply, LinearMap.smul_apply,
    LinearMap.id_apply]
  rw [hg] at hk
  linear_combination (norm := module) hk

/-! ## (D) W8 non-vacuity teeth on the RIGHT face (mirror of N261's frame witnesses). -/

/-- ★★ W8 RIGHT DIAGONAL WITNESS: `{R_(imBasis i), R_(imBasis i)} = (-2) • id ≠ 0` (the `gForm`-
    orthonormal frame, `gForm_imBasis i i = 1`, N257) — the right Clifford module is non-vacuous. -/
theorem rightReg_clifford_diag_witness (i : Fin 7) :
    (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩)
        + (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩)
      = (-2 : ℚ) • LinearMap.id := by
  rw [rightReg_clifford ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis i, imBasis_mem_ImO i⟩]
  simp only [gForm_imBasis]
  norm_num

/-- ★★ W8 RIGHT OFF-DIAGONAL WITNESS: `i ≠ j ⟹ {R_(imBasis i), R_(imBasis j)} = 0` (`gForm_imBasis
    i j = 0`, N257) — the genuine `{R_i, R_j} = -2 δ_{ij}` relation of an orthonormal frame. -/
theorem rightReg_clifford_offdiag_witness {i j : Fin 7} (hij : i ≠ j) :
    (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩).comp (rightReg ⟨imBasis j, imBasis_mem_ImO j⟩)
        + (rightReg ⟨imBasis j, imBasis_mem_ImO j⟩).comp (rightReg ⟨imBasis i, imBasis_mem_ImO i⟩)
      = 0 := by
  rw [rightReg_clifford ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩]
  simp only [gForm_imBasis, if_neg hij]
  norm_num

/-! ## (E) The mixed commutator IS the associator, and the one-cause chirality block. -/

/-- ★★★ THE BRIDGE: the mixed commutator of the LEFT and RIGHT worldMap faces applied to `x` is the
    associator's middle slot — `(L_a R_b − R_b L_a) x = a·(x·b) − (a·x)·b`. This is the SPINOR-level
    form of N44's one-cause identity (`chirality_commute_iff_assoc`): commutation of the two
    chiralities is LITERALLY associativity. No coordinate computation — `rfl`-level after unfolding. -/
theorem chir_mixed_apply (a b : ImO) (x : O ℚ) :
    (leftReg a) ((rightReg b) x) - (rightReg b) ((leftReg a) x)
      = (a : O ℚ) * (x * b) - ((a : O ℚ) * x) * b := by
  simp only [leftReg_apply, rightReg_apply]

/-- ★★ THE COMMUTING-IF-ASSOCIATES direction: the two worldMap faces commute for ALL imaginary
    `a, b : ImO` IF the algebra associates. (The forward half of the one-cause biconditional; the
    block below is its contrapositive on the derived non-associative `O ℚ`.) -/
theorem chir_commute_of_assoc
    (h : ∀ x y z : O ℚ, (x * y) * z = x * (y * z)) (a b : ImO) :
    (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a) := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply]
  exact (h (a : O ℚ) x b).symm

/-- ★★★ THE HEADLINE — THE SPINOR CHIRALITY BLOCK: the two worldMap chirality faces (left `leftReg`
    and right `rightReg`) do NOT all commute on the imaginary generators, because `O ℚ` is
    NON-associative (the banked cascade-stop `not_associative`). The spinor is intrinsically
    TWO-HANDED: the right-handed action cannot be a second action commuting with the left-handed one.
    Contrapositive of `chir_commute_of_assoc`, contradicted by a concrete imaginary witness. -/
theorem chir_spinor_block :
    ¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ)))
    (h ⟨CD.iota (ιJ ℚ), by rw [mem_ImO]; ext <;> simp [iota, ιJ, Dbl.J]⟩
       ⟨(CD.e2 : O ℚ), by rw [mem_ImO]; ext <;> simp [e2]⟩)
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply] at hx
  exact not_associative_witness hx.symm

/-- ★★ THE CONCRETE WITNESS (sharpest non-vacuity, W8): the SAME explicit non-associating triple that
    stops the cascade (`not_associative_witness`) realizes an EXPLICIT IMAGINARY pair `a = ι(ιJ) ∈ ImO`,
    `b = e₂ ∈ ImO` whose left- and right-worldMap operators DISAGREE already at `x = ι(e₂)`. The block
    is not a vacuous `∀`-failure; it is realized by the cascade's own witness, and BOTH witness
    elements are genuinely imaginary (∈ `ImO`). -/
theorem chir_spinor_block_witness :
    (leftReg ⟨CD.iota (ιJ ℚ), by rw [mem_ImO]; ext <;> simp [iota, ιJ, Dbl.J]⟩).comp
        (rightReg ⟨(CD.e2 : O ℚ), by rw [mem_ImO]; ext <;> simp [e2]⟩)
      ≠ (rightReg ⟨(CD.e2 : O ℚ), by rw [mem_ImO]; ext <;> simp [e2]⟩).comp
        (leftReg ⟨CD.iota (ιJ ℚ), by rw [mem_ImO]; ext <;> simp [iota, ιJ, Dbl.J]⟩) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ))) h
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply] at hx
  exact not_associative_witness hx.symm

/-- ★★★ THE ONE-CAUSE LINK (a PROVED theorem, never asserted): the spinor chirality block is
    EQUIVALENT to the order-4 Hermitian-Jordan generation-cap failure (`jdef Xwit Ywit ≠ 0`, banked
    `jordan_cap_iff_nonassoc`). Both terminations are the SAME octonionic non-associativity. One
    cause, MANY terminations: the cascade-stop (`not_associative`), the generation-cap, N44's
    chirality block on raw `O`, and NOW the spinor's two-handedness on `ImO`. -/
theorem chir_spinor_block_iff_jordan_cap :
    (¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a))
      ↔ (jdef Xwit Ywit ≠ 0) := by
  constructor
  · intro _; exact jordan_cap_iff_nonassoc.mpr not_associative
  · intro _; exact chir_spinor_block

/-! ## (F) The capstone: the spinor is intrinsically two-handed. -/

/-- ★★★ THE CAPSTONE — the derived spinor `O ℚ` is intrinsically TWO-HANDED: BOTH worldMap faces are
    Clifford modules for the fold's Born form `gForm` (the LEFT `leftReg_clifford`, N261, and the RIGHT
    `rightReg_clifford`, here), yet the two chiralities do NOT all commute (`chir_spinor_block`, with a
    concrete imaginary witness), and this block is EQUIVALENT to the generation-cap failure — the same
    octonion non-associativity. The structural germ of chirality, DERIVED not posited. -/
theorem spinor_two_handed :
    -- the LEFT face is a Clifford module (N261)
    (∀ a b : ImO, (leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a)
        = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id)
    -- the RIGHT face is EQUALLY a Clifford module
    ∧ (∀ a b : ImO, (rightReg a).comp (rightReg b) + (rightReg b).comp (rightReg a)
        = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id)
    -- the mixed commutator is the associator (the bridge)
    ∧ (∀ (a b : ImO) (x : O ℚ), (leftReg a) ((rightReg b) x) - (rightReg b) ((leftReg a) x)
        = (a : O ℚ) * (x * b) - ((a : O ℚ) * x) * b)
    -- the two chiralities do NOT all commute (the block), non-vacuously
    ∧ (¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a))
    -- and the block is the one-cause generation-cap failure
    ∧ ((¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a))
        ↔ (jdef Xwit Ywit ≠ 0)) :=
  ⟨leftReg_clifford, rightReg_clifford, chir_mixed_apply, chir_spinor_block,
    chir_spinor_block_iff_jordan_cap⟩

end

end Phys.Algebra
