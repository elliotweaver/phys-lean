/-
  Phys.Algebra.JordanArenaDimension — N470.

  ============================================================================
  THE TERMINAL JORDAN ARENA DIMENSION: `finrank ℚ hermSub = 27`, and its
  trace-zero subspace has `finrank = 26`.
  ============================================================================

  The fold's cascade TERMINATES at the octonions (`O ℚ`, N2c/ForcedStop), and the
  terminal object it can still build is the maximal Hermitian Jordan order — the
  derived matter arena `hermSub = { M : Matrix (Fin 3) (Fin 3) (O ℚ) | Mᴴ = M }`
  (N267/N299). Its DIMENSION — how much room the fold's own last construction has —
  is a first-class structural fact: it is what makes the arena's derivation algebra
  `f₄` (N284/N285), grounds the observable-algebra reality (N270), and gates the
  channel count of the vacuum-energy mechanism (N337/N338). Until now it lived ONLY
  as a COMMENT ("3 + 3·8 = 27", N267 `Hm_slot_decomp`): N299/N300 explicitly AVOIDED
  computing `dim hermSub` because a 27-element coordinate basis TIMES OUT (a W9
  instrument-cost wall). This node banks it as a kernel-checked theorem.

  ## THE W9-DISSOLUTION ROUTE (the theory-native lever)

  The field would count `dim = 27` by exhibiting a 27-element coordinate basis and
  taking its rank (the route that timed out). The theory does not need coordinates:
  its OWN slot decomposition `Hm = Dg + slotA + slotB + slotC` (N267) SAYS the arena
  is `(real diagonal triple) ⊕ (three copies of the matter carrier O ℚ)`, i.e. a
  LINEAR EQUIVALENCE
        `hermEquiv : hermSub ≃ₗ[ℚ] (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)`,
  so `finrank` is ADDITIVE over the `⊕`:  `3·1 + 3·8 = 27`, using the banked terminal
  dimension `finrank_O_eq_eight` (= 8). NO coordinate basis, NO `decide`. This is the
  EXACT route that banked `finrank_O_eq_eight` itself (the Cayley–Dickson product
  equivalence `CD A ≃ₗ A × A`, chain `2 → 4 → 8`, `DerivationFinrank.lean`): the fold's
  own doubling structure carries the dimension, so the standard wall becomes a
  two-line corollary.

  The surjectivity of the read-off (`build_readOff`) needs exactly one octonion fact:
  a SELF-CONJUGATE octonion is REAL (`selfconj_eq_ocR`: `star x = x → x = ocR (reQ x)`),
  which is why a Hermitian matrix's diagonal is central — the very shape `Hm` encodes.

  ## THE TRACE-ZERO SUBSPACE (= 26)

  The real-trace functional `hermTrace : hermSub →ₗ[ℚ] ℚ` (sum of the three real
  diagonal parts) is SURJECTIVE (`hermTrace_surj`, it hits `1`), so by rank–nullity its
  kernel `tracelessArena` has `finrank = 27 − 1 = 26`.

  ## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

  Delete "Jordan / matter / arena / octonion / generation / cosmology / channel". What
  survives: the ℚ-submodule of self-adjoint 3×3 matrices over the banked 8-dimensional
  ℚ-algebra `O ℚ` is linearly equivalent to `(Fin 3 → ℚ) × (O ℚ)³`, hence has `finrank
  27`; the kernel of its (surjective) real-trace functional has `finrank 26`. Pure
  linear algebra; no physics name does any logical work.

  ## FOUNDATIONS

  `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. NO `foldRetention`, NO
  proof holes, NO bespoke axiom, NO kernel-eval bypass, NO coordinate basis, NO
  `Real`/`Cut` (this
  is a pure ℚ / `O ℚ` fact; `finrank`/`Matrix`/`LinearEquiv`/`LinearMap.ker` are
  standard Mathlib MACHINERY on the DERIVED carrier). Import guard: the banked
  Hermitian-Jordan chain, NEVER `MassGapOne`.
-/
import Phys.Algebra.HermitianJordan.Setup
import Phys.Algebra.DerivationSkew
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix Module

attribute [local instance] CD.narCD CD.srCD

/-! ## The one octonion fact: a self-conjugate octonion is real. -/

/-- ★ A SELF-CONJUGATE OCTONION IS REAL. For `x : O ℚ`, `star x = x` forces every
    imaginary layer to be its own negative, hence zero, so `x = ocR (reQ x)` — the
    embedded ground-ring scalar of its real part. This is why a Hermitian matrix over
    `O ℚ` has a central (real) diagonal — the shape `Hm` is exactly the general
    self-adjoint element. -/
theorem selfconj_eq_ocR (x : O ℚ) (h : star x = x) : x = ocR (reQ x) := by
  obtain ⟨⟨⟨xrrr, xrri⟩, ⟨xrir, xrii⟩⟩, ⟨⟨xirr, xiri⟩, ⟨xiir, xiii⟩⟩⟩ := x
  simp only [CD.ext_iff, Dbl.ext_iff] at h
  simp only [CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] at h
  simp only [ocR, reQ]
  obtain ⟨⟨⟨_, h2⟩, h3, h4⟩, ⟨h5, h6⟩, h7, h8⟩ := h
  refine CD.ext (CD.ext (Dbl.ext rfl ?_) (Dbl.ext ?_ ?_)) (CD.ext (Dbl.ext ?_ ?_) (Dbl.ext ?_ ?_)) <;>
    simp only [] <;> linarith

/-! ## `reQ` is a ℚ-linear functional on the matter carrier. -/

/-- `reQ` is additive. -/
theorem reQ_add (x y : O ℚ) : reQ (x + y) = reQ x + reQ y := by
  simp only [reQ, CD.add_re, Dbl.add_re]

/-- `reQ` commutes with ℚ-scaling. -/
theorem reQ_smul (q : ℚ) (x : O ℚ) : reQ (q • x) = q * reQ x := by
  simp only [reQ]; simp [cd_qsmul_re]

/-! ## The slot decomposition AS a linear equivalence.

    `hermSub ≃ₗ[ℚ] (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)`: the three real diagonal parts
    (a `Fin 3 → ℚ`) and the three off-diagonal octonions `(0,1),(0,2),(1,2)`. -/

/-- The parametrization: reals-triple + octonion-triple → Hermitian matrix (the
    banked general self-adjoint shape `Hm`). -/
noncomputable def build (p : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)) : hermSub :=
  ⟨Hm (p.1 0) (p.1 1) (p.1 2) p.2.1 p.2.2.1 p.2.2.2, by
    rw [mem_hermSub]
    apply Matrix.ext; intro i j
    simp only [Matrix.conjTranspose_apply, Hm]
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.of_apply, Matrix.cons_val, ocR_star, star_star]⟩

/-- The read-off: Hermitian matrix → its three real diagonal parts + three
    off-diagonal octonions. -/
noncomputable def readOff (M : hermSub) : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ) :=
  (fun i => reQ ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) i i),
    ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1,
     (M : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2,
     (M : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2))

/-- `readOff ∘ build = id` — reading back the parameters of a built matrix. -/
theorem readOff_build (p : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)) : readOff (build p) = p := by
  obtain ⟨d, a, b, c⟩ := p
  simp only [readOff, build, Hm]
  refine Prod.ext ?_ ?_
  · funext i; fin_cases i <;> simp [Matrix.of_apply, Matrix.cons_val, reQ, ocR]
  · simp [Matrix.of_apply, Matrix.cons_val]

/-- `build ∘ readOff = id` — reconstructing a Hermitian matrix from its parameters.
    The diagonal reconstruction is exactly `selfconj_eq_ocR`; the below-diagonal
    entries are the conjugates of the above-diagonal ones (self-adjointness). -/
theorem build_readOff (M : hermSub) : build (readOff M) = M := by
  apply Subtype.ext
  obtain ⟨M, hM⟩ := M
  rw [mem_hermSub] at hM
  have hstar : ∀ i j, star (M j i) = M i j := by
    intro i j; have := congrFun (congrFun hM i) j
    rwa [Matrix.conjTranspose_apply] at this
  simp only [build, readOff, Hm]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.of_apply, Matrix.cons_val, Matrix.cons_val_zero, Matrix.cons_val_one,
      Fin.isValue] <;>
    first
      | rfl
      | exact (selfconj_eq_ocR _ (hstar _ _)).symm
      | exact hstar _ _

/-- ★★★ THE STRUCTURAL EQUIVALENCE. The maximal Hermitian octonionic Jordan arena is,
    as a ℚ-vector space, `(Fin 3 → ℚ) × (O ℚ)³` — the fold's own slot decomposition
    (N267) read as a linear equivalence: real diagonal ⊕ three copies of the matter
    carrier. This is the route the dimension descends WITHOUT a coordinate basis (W9). -/
noncomputable def hermEquiv : hermSub ≃ₗ[ℚ] (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ) where
  toFun := readOff
  invFun := build
  left_inv := build_readOff
  right_inv := readOff_build
  map_add' := by
    intro M N
    simp only [readOff, Submodule.coe_add, Matrix.add_apply]
    refine Prod.ext ?_ ?_
    · funext i; simp [reQ_add]
    · simp [Prod.ext_iff]
  map_smul' := by
    intro q M
    simp only [readOff, SetLike.val_smul, Matrix.smul_apply, RingHom.id_apply, Prod.smul_def]
    refine Prod.ext ?_ ?_
    · funext i; simp [reQ_smul]
    · simp [Prod.ext_iff, Prod.smul_def]

/-! ## The dimension: 27, via finrank-additivity over the equivalence. -/

/-- ★★★ THE TERMINAL JORDAN ARENA DIMENSION: `finrank ℚ hermSub = 27`. Derived
    STRUCTURALLY through the fold's own slot decomposition (`hermEquiv`) and the banked
    terminal dimension `finrank_O_eq_eight` (= 8): `3·1 + 3·8 = 27`. NO coordinate
    basis, NO `decide` — the W9 instrument-cost wall (N299/N300) dissolved by the
    theory's own structure. -/
theorem finrank_hermSub_eq_27 : Module.finrank ℚ hermSub = 27 := by
  rw [hermEquiv.finrank_eq, Module.finrank_prod]
  rw [Module.finrank_pi (R := ℚ) (ι := Fin 3)]
  simp only [Module.finrank_self, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul, mul_one]
  rw [Module.finrank_prod, Module.finrank_prod, finrank_O_eq_eight]

/-! ## The trace-zero subspace: 26, via rank–nullity. -/

/-- The real-trace functional on the Hermitian arena: the sum of the three real
    diagonal parts. -/
noncomputable def hermTrace : hermSub →ₗ[ℚ] ℚ where
  toFun M := reQ ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 0)
             + reQ ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 1)
             + reQ ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) 2 2)
  map_add' M N := by
    simp only [Submodule.coe_add, Matrix.add_apply, reQ_add]; ring
  map_smul' q M := by
    simp only [SetLike.val_smul, Matrix.smul_apply, reQ_smul, RingHom.id_apply, smul_eq_mul]; ring

/-- ★★ The real-trace functional is SURJECTIVE (it hits every scalar; e.g. `r` via the
    diagonal matrix `Hm r 0 0 0 0 0`) — hence NONZERO, so the trace-zero subspace is a
    genuine codimension-1 hyperplane, not the whole arena. -/
theorem hermTrace_surj : Function.Surjective hermTrace := by
  intro r
  refine ⟨⟨Hm r 0 0 0 0 0, ?_⟩, ?_⟩
  · rw [mem_hermSub]; apply Matrix.ext; intro i j
    simp only [Matrix.conjTranspose_apply, Hm]
    fin_cases i <;> fin_cases j <;> simp [Matrix.of_apply, ocR_star, star_zero]
  · simp only [hermTrace, LinearMap.coe_mk, AddHom.coe_mk, Hm]
    simp [Matrix.of_apply, reQ, ocR]

/-- The trace-zero (traceless) subspace of the Hermitian arena. -/
noncomputable def tracelessArena : Submodule ℚ hermSub := LinearMap.ker hermTrace

/-- ★★★ THE TRACE-ZERO SUBSPACE DIMENSION: `finrank ℚ tracelessArena = 26`. By
    rank–nullity: the surjective real-trace functional has 1-dimensional range, so its
    kernel has `finrank = 27 − 1 = 26`. -/
theorem finrank_tracelessArena_eq_26 : Module.finrank ℚ tracelessArena = 26 := by
  have hr : Module.finrank ℚ (LinearMap.range hermTrace) = 1 := by
    rw [LinearMap.range_eq_top.mpr hermTrace_surj, finrank_top, Module.finrank_self]
  have hrn := hermTrace.finrank_range_add_finrank_ker
  rw [hr, finrank_hermSub_eq_27] at hrn
  show Module.finrank ℚ (LinearMap.ker hermTrace) = 26
  omega

/-! ## W8 non-vacuity teeth: the count is genuine, not the degenerate zero. -/

/-- W8: the Hermitian arena is NONTRIVIAL (`27 ≠ 0`) — the finrank is a genuine
    positive count, not the vacuous dimension of the zero module. -/
theorem finrank_hermSub_pos' : 0 < Module.finrank ℚ hermSub := by
  rw [finrank_hermSub_eq_27]; norm_num

/-- W8: the trace-zero subspace is a PROPER, nonzero, codimension-1 subspace
    (`0 < 26 < 27`) — the trace functional genuinely bites. -/
theorem tracelessArena_codim_one :
    0 < Module.finrank ℚ tracelessArena ∧
      Module.finrank ℚ tracelessArena < Module.finrank ℚ hermSub := by
  rw [finrank_tracelessArena_eq_26, finrank_hermSub_eq_27]
  exact ⟨by norm_num, by norm_num⟩

/-- W8: a nonzero element genuinely lives in the arena (`build` of a nonzero real
    diagonal is nonzero) — the equivalence is not between trivial spaces. -/
theorem build_ne_zero_of_nonzero :
    (build (![1, 0, 0], 0, 0, 0) : Matrix (Fin 3) (Fin 3) (O ℚ)) ≠ 0 := by
  intro h
  have h00 := congrFun (congrFun h 0) 0
  simp only [build, Hm, Matrix.of_apply, Matrix.cons_val_zero, Matrix.zero_apply, ocR] at h00
  exact one_ne_zero (congrArg (fun z => z.re.re.re) h00)

/-! ## Capstone. -/

/-- ★★★ THE TERMINAL JORDAN ARENA DIMENSION (capstone). The maximal Hermitian
    octonionic Jordan arena `hermSub` — the terminal object the fold's cascade builds —
    is a 27-dimensional ℚ-vector space (linearly equivalent to its own slot
    decomposition `(Fin 3 → ℚ) × (O ℚ)³`), its real-trace functional is surjective, and
    its trace-zero subspace is 26-dimensional. All derived structurally from the fold's
    own doubling (the banked `finrank_O_eq_eight`), with NO coordinate basis — the W9
    wall dissolved. Statable from no single conjunct alone (non-hollow). -/
theorem terminal_jordan_arena_dimension :
    Module.finrank ℚ hermSub = 27
    ∧ Module.finrank ℚ tracelessArena = 26
    ∧ Function.Surjective hermTrace
    ∧ (0 < Module.finrank ℚ tracelessArena ∧
        Module.finrank ℚ tracelessArena < Module.finrank ℚ hermSub) :=
  ⟨finrank_hermSub_eq_27, finrank_tracelessArena_eq_26, hermTrace_surj, tracelessArena_codim_one⟩

end Phys.Algebra.HJ
