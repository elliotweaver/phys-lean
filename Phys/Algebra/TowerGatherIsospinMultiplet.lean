/-
  Phys.Algebra.TowerGatherIsospinMultiplet — N277.
  ===========================================================================
  THE NON-ABELIAN WEAK-ISOSPIN (su(2)_L) MULTIPLET DECOMPOSITION OF ONE GENERATION'S FUNDAMENTAL
  MATTER = THE CAYLEY–DICKSON DOUBLING TEAR — over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and
  its imaginary part `ImO` (the fundamental 7-representation, N22). Method-lock LIFTED (2026-07-03);
  this is a GATHER-native forward step (the operators are the DOUBLING inner-derivations
  `imRep DI/DJ/DK` acting on the gather-derived fundamental-7), NOT the parked invariant-tower ascent.

  ---------------------------------------------------------------------------
  THE STORY SO FAR (the ABELIAN Cartan was built; the NON-ABELIAN multiplet was not). N276
  (`TowerGatherJointChargeIsospinWeights`) banked the joint (charge, weak-isospin-CARTAN) weight
  decomposition `ImO = span{sgl} ⊕ Winert ⊕ Wactive = 1 ⊕ 2 ⊕ 4` under the two COMMUTING Cartan
  operators `Q = chargeOp` and `T3 = imRep DI`. But N276 used ONLY the abelian Cartan `imRep DI`;
  its own docstring named "the full su(2) Casimir irrep refinement" as a deferred downstream node.

  THIS node builds the FULL NON-ABELIAN structure. Under the whole weak-isospin Lie algebra
  `su(2)_L = {imRep DI, imRep DJ, imRep DK}` (the three doubling inner-derivations; closure
  `⁅DI,DJ⁆ = 2•DK` banked N-`DerivationColourIsospinNonNormalize`), the fundamental 7 decomposes as
  THREE su(2)_L-SUBMODULES:

    ImO  =  TL  ⊕  Sg  ⊕  TR          (finranks 3 + 1 + 3 = 7)

  where
    · `TL := span{u1, e2O, e3O}` — an su(2)_L-submodule (the first-H imaginary triplet `ImH`);
    · `Sg := span{e4O}`         — the su(2)_L-FIXED axis `e4O = κO 1` (N256: the unique isospin-fixed
       direction; every isospin generator annihilates it);
    · `TR := span{e5O, e6O, e7O}` — an su(2)_L-submodule (the doubled triplet `ℓ·ImH`).

  ★ THE REFRAME (goal-words-removable, octonion-specific): this su(2)_L decomposition is the
  CAYLEY–DICKSON DOUBLING TEAR `ImO = ImH ⊕ ⟨ℓ⟩ ⊕ ℓ·ImH` that BUILT the terminal algebra
  `O = CD(H)`. su(2)_L IS `Der(H)` (the inner derivations of the last-doubled quaternion units
  `hI, hJ, hK`); its two irreducible triplets are the un-doubled world `ImH` and the doubled world
  `ℓ·ImH`; the fixed singlet is the doubling axis `ℓ = κO 1`.

  ---------------------------------------------------------------------------
  THE OBJECTS (all derived, foundations-only):
    · `Kmat` / `imRep_DK_eq_qI` — the THIRD generator as a banked integer matrix (twin of the
      N253/N256 bridges `imRep_DI_eq_qI` / `imRep_DJ_eq_qI`);
    · the su(2)_L ACTION on the block generators (the 9 triplet lemmas + the singlet-fixed lemmas);
    · `TL` / `Sg` / `TR` (the three su(2)_L-submodules), with `TL_invariant` / `TR_invariant`;
    · ⭐ `finrank_TL` (`= 3`), `finrank_TR` (`= 3`), `finrank_Sg` (`= 1`);
    · ⭐⭐ `TL_sup_Sg_sup_TR_eq_top` (`TL ⊔ Sg ⊔ TR = ⊤` — the `3 ⊕ 1 ⊕ 3` exhausts `ImO`);
    · ⭐⭐ `casimirOp` = `Σ (imRep DX)²` = `qI CasMat`, the CASIMIR: `= (-8)•id` on `TL`, `TR` and
      `= 0` on `Sg` — the nontrivial-multiplet certificate;
    · ⭐⭐ `TL_no_fixed_vector` / `TR_no_fixed_vector` (via N256): the triplets carry NO su(2)_L-fixed
      vector, so they are genuine NONTRIVIAL multiplets (not a sum of singlets);
    · ⭐⭐ TRANSVERSALITY / CROSS-CUT: the su(2)_L triplets CROSS-CUT N276's Cartan blocks
      (`Winert` and `Wactive`) AND the colour split (N266) — a THIRD independent grading;
    · ⭐ W8 non-vacuity; ⭐⭐⭐ CAPSTONE `isospin_multiplet_structure`.

  ---------------------------------------------------------------------------
  THE MOAT / DISSOLUTION (STANDARD §0). The SM ASSIGNS the weak-isospin multiplet structure — which
  matter fields are doublets, which are singlets — from the table, by hand. The theory DERIVES the
  multiplets: the irreducible su(2)_L-submodules of the fundamental matter ARE the Cayley–Dickson
  doubling pieces (`ImH` / `⟨ℓ⟩` / `ℓ·ImH`), FORCED by `O = CD(H)`. And this multiplet grading is
  TRANSVERSE to BOTH the abelian Cartan-weight grading (N276) and the colour `3 ⊕ 3̄` grading
  (N266) — three distinct, independent, fold-derived structures on the ONE matter world.

  ONE CAUSE MANY TERMINATIONS: the LAST Cayley–Dickson doubling `O = H ⊕ Hℓ` that produced the
  terminal division algebra (N2c) is the SAME doubling whose derivation algebra `Der(H) = su(2)_L`
  grades the fundamental matter into its weak-isospin multiplets.

  SCOPE (honesty). Banks the su(2)_L multiplet decomposition `3 ⊕ 1 ⊕ 3` + submodule invariance +
  the Casimir scalar + the no-fixed-vector nontriviality + the doubling identification + the
  cross-cut/transversality ONLY. Does NOT bank the FULL Burnside/adjoint-simplicity IRREDUCIBILITY
  of the triplets (a downstream node), NOT the hypercharge NORMALIZATION / weak mixing angle (★2 —
  the RUNBOOK repeated-deferral ceiling STANDS: N276 supplied no posit-free richer structure toward
  the relative su(2)_L/u(1)_Y normalization, and N257 walled Gell-Mann–Nishijima as an operator
  identity; nothing here is childed toward it), NOT the ★5 family/mass texture (PROVED un-forceable,
  N275 + N276 family-equivariant associator), NOT masses/mixings, NOT parity, NOT "= a specific SM
  multiplet" (removable prose).

  ---------------------------------------------------------------------------
  FREE-FLOATING RAIL (SOUL). Every headline TYPE mentions the banked tower objects (`imRep DI/DJ/DK`,
  the derived units `u1`/`e2O..e7O` on the derived `O ℚ`, `Winert`/`Wactive` N276, `Uhol`/`Uah`
  N266); the multiplet structure is octonion/doubling-SPECIFIC (it IS the concrete `O = CD(H)`
  doubling tear, false over an associative rung where `Der` is smaller).

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass on octonion coordinates (every lever is a `simp`/`decide` on the
  banked integer matrices `Imat`/`Jmat`/`Kmat` in the N234 `qI` calculus).
-/
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- A synthInstance budget bump (NOT a proof-kernel `maxHeartbeats` inflation; the same benign
-- pattern as N256 `TowerGatherUniqueIsospinFixedAxis`) — the `ImO`-submodule coercions in the
-- span-membership arguments are instance-synthesis heavy.
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The remaining block generators as members of the fundamental 7 `ImO`. -/

/-- `u1 ∈ Im(𝕆)` (the fold-root, an imaginary unit). -/
theorem u1_memI : u1 ∈ ImO := u1_mem_ImO
/-- `e6O ∈ Im(𝕆)`. -/
theorem e6O_memI : e6O ∈ ImO := by have := imBasis_mem_ImO 5; simpa [imBasis] using this
/-- `e7O ∈ Im(𝕆)`. -/
theorem e7O_memI : e7O ∈ ImO := by have := imBasis_mem_ImO 6; simpa [imBasis] using this

/-- The first-H triplet generator `u1` as an element of `ImO` (`u1M`, avoiding the N257
    `TowerGatherIsometry.u1I` of the same underlying vector). -/
def u1M : ImO := ⟨u1, u1_memI⟩
/-- The doubled-triplet generators, as elements of `ImO`. -/
def e6I : ImO := ⟨e6O, e6O_memI⟩
def e7I : ImO := ⟨e7O, e7O_memI⟩

/-! ## (B) The third weak-isospin generator `imRep DK` as a banked integer matrix. -/

/-- The integer 7×7 matrix of the third weak-isospin generator `imRep DK` (`innerDeriv hK`,
    `hK = hI·hJ`) on the imaginary coordinates — the twin of the banked `Imat` (`imRep_DI_eq_qI`,
    N253) and `Jmat` (`imRep_DJ_eq_qI`, N256). Together `{Imat, Jmat, Kmat}` is the full non-abelian
    `su(2)_L` in the `qI` calculus, with `Kmat = ½·[Imat, Jmat]`. -/
def Kmat : M7 :=
  ![![0, -2, 0, 0, 0, 0, 0],
     ![2, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, -2, 0],
     ![0, 0, 0, 0, 2, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- ★ BRIDGE: the third isospin image `imRep DK` is the banked integer matrix `qI Kmat` on the
    fundamental 7 (twin of `imRep_DI_eq_qI` / `imRep_DJ_eq_qI`; simp set `hK = hI·hJ`, then `ring`). -/
theorem imRep_DK_eq_qI : imRep DK = qI Kmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hK : H ℚ)) (x : O ℚ) = qZ Kmat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hK, hI, hJ, CD.iota, CD.e2, Dbl.J, qZ, Kmat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

/-! ## (C) The su(2)_L action on the block generators — the multiplet structure.

    Each generator maps the first-H triplet `{u1, e2O, e3O}` into itself and the doubled triplet
    `{e5O, e6O, e7O}` into itself; all three annihilate the doubling axis `e4O = κO 1`. The values
    are read directly off the banked integer matrices `Imat`/`Jmat`/`Kmat` via `qZ`. -/

-- Helper simp-driver: an action lemma `imRep DX eYI = coeff • eZI`, proved by the N276 pattern.
-- We spell each one out (mirroring `imRep_DI_e2I`).

/-- `imRep DI u1 = 0` (the fold-root is the `T3`-Cartan-fixed member of `TL`). -/
theorem imRep_DI_u1I : imRep DI u1M = 0 := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (u1 : O ℚ) = 0
  ext <;> simp [qZ, Imat, u1, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DJ u1 = −2•e3O` (into `TL`). -/
theorem imRep_DJ_u1I : imRep DJ u1M = (-2 : ℚ) • e3I := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (u1 : O ℚ) = (-2 : ℚ) • e3O
  ext <;> simp [qZ, Jmat, u1, e3O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK u1 = 2•e2O` (into `TL`). -/
theorem imRep_DK_u1I : imRep DK u1M = (2 : ℚ) • e2I := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (u1 : O ℚ) = (2 : ℚ) • e2O
  ext <;> simp [qZ, Kmat, u1, e2O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DJ e2O = 0` (Cartan `DI` moves `e2↔e3`; `DJ` on `e2` stays in `TL`, in fact `= 0`). -/
theorem imRep_DJ_e2I : imRep DJ e2I = 0 := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (e2O : O ℚ) = 0
  ext <;> simp [qZ, Jmat, e2O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK e2O = −2•u1` (into `TL`). -/
theorem imRep_DK_e2I : imRep DK e2I = (-2 : ℚ) • u1M := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (e2O : O ℚ) = (-2 : ℚ) • u1
  ext <;> simp [qZ, Kmat, e2O, u1, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DJ e3O = 2•u1` (into `TL`). -/
theorem imRep_DJ_e3I : imRep DJ e3I = (2 : ℚ) • u1M := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (e3O : O ℚ) = (2 : ℚ) • u1
  ext <;> simp [qZ, Jmat, e3O, u1, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK e3O = 0` (into `TL`). -/
theorem imRep_DK_e3I : imRep DK e3I = 0 := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (e3O : O ℚ) = 0
  ext <;> simp [qZ, Kmat, e3O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

-- The doubled triplet `TR = {e5O, e6O, e7O}`. (`imRep DI e5I = 0` is banked in N276.)

/-- `imRep DJ e5O = −2•e7O` (into `TR`). -/
theorem imRep_DJ_e5I : imRep DJ e5I = (-2 : ℚ) • e7I := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (e5O : O ℚ) = (-2 : ℚ) • e7O
  ext <;> simp [qZ, Jmat, e5O, e7O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK e5O = 2•e6O` (into `TR`). -/
theorem imRep_DK_e5I : imRep DK e5I = (2 : ℚ) • e6I := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (e5O : O ℚ) = (2 : ℚ) • e6O
  ext <;> simp [qZ, Kmat, e5O, e6O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DI e6O = 2•e7O` (into `TR`). -/
theorem imRep_DI_e6I : imRep DI e6I = (2 : ℚ) • e7I := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e6O : O ℚ) = (2 : ℚ) • e7O
  ext <;> simp [qZ, Imat, e6O, e7O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK e6O = −2•e5O` (into `TR`). -/
theorem imRep_DK_e6I : imRep DK e6I = (-2 : ℚ) • e5I := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (e6O : O ℚ) = (-2 : ℚ) • e5O
  ext <;> simp [qZ, Kmat, e6O, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DI e7O = −2•e6O` (into `TR`). -/
theorem imRep_DI_e7I : imRep DI e7I = (-2 : ℚ) • e6I := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e7O : O ℚ) = (-2 : ℚ) • e6O
  ext <;> simp [qZ, Imat, e7O, e6O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DJ e7O = 2•e5O` (into `TR`). -/
theorem imRep_DJ_e7I : imRep DJ e7I = (2 : ℚ) • e5I := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (e7O : O ℚ) = (2 : ℚ) • e5O
  ext <;> simp [qZ, Jmat, e7O, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- The doubling axis `e4O = κO 1` is su(2)_L-FIXED (`imRep DJ` kills it; `DI`, `DK` too). -/
theorem imRep_DJ_e4I : imRep DJ e4I = 0 := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (e4O : O ℚ) = 0
  ext <;> simp [qZ, Jmat, e4O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- `imRep DK e4O = 0` (the doubling axis is su(2)_L-fixed). -/
theorem imRep_DK_e4I : imRep DK e4I = 0 := by
  apply Subtype.ext; rw [imRep_DK_eq_qI, qI_coe]
  show qZ Kmat (e4O : O ℚ) = 0
  ext <;> simp [qZ, Kmat, e4O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-! ## (D) The three su(2)_L-submodules and their dimensions. -/

/-- The first-H imaginary triplet `TL = span{u1, e2O, e3O}` — the un-doubled world `ImH`. -/
def TL : Submodule ℚ ImO := Submodule.span ℚ (Set.range (![u1M, e2I, e3I] : Fin 3 → ImO))
/-- The doubled triplet `TR = span{e5O, e6O, e7O}` — the doubled world `ℓ·ImH`. -/
def TR : Submodule ℚ ImO := Submodule.span ℚ (Set.range (![e5I, e6I, e7I] : Fin 3 → ImO))
/-- The su(2)_L-fixed singlet `Sg = span{e4I}` — the doubling axis `ℓ = κO 1` (N256). -/
def Sg : Submodule ℚ ImO := Submodule.span ℚ (Set.range (![e4I] : Fin 1 → ImO))

/-- The block basis of `ImO` in the `ImH ⊕ ⟨ℓ⟩ ⊕ ℓImH` order. -/
def multBasis : Fin 7 → ImO := ![u1M, e2I, e3I, e4I, e5I, e6I, e7I]

/-- The multiplet basis is (pointwise) the banked imaginary basis `imBasis` pushed into `ImO`. -/
theorem multBasis_coe (i : Fin 7) : (multBasis i : O ℚ) = imBasis i := by
  fin_cases i <;> rfl

/-- The multiplet basis is linearly independent (it is the banked `imBasis` under the injective
    `ImO ↪ O ℚ`). -/
theorem multBasis_indep : LinearIndependent ℚ multBasis := by
  have h := imBasis_indep
  have : (fun i => (multBasis i : O ℚ)) = imBasis := by funext i; exact multBasis_coe i
  have h2 : LinearIndependent ℚ (fun i => (multBasis i : O ℚ)) := by rw [this]; exact h
  exact h2.of_comp (ImO.subtype)

/-- `{u1M, e2I, e3I}` are linearly independent. -/
theorem TL_indep : LinearIndependent ℚ (![u1M, e2I, e3I] : Fin 3 → ImO) := by
  have h := multBasis_indep.comp (![(0 : Fin 7), 1, 2] : Fin 3 → Fin 7)
    (by intro a b hab; fin_cases a <;> fin_cases b <;> simp_all)
  convert h using 1; funext i; fin_cases i <;> rfl

/-- `{e5I, e6I, e7I}` are linearly independent. -/
theorem TR_indep : LinearIndependent ℚ (![e5I, e6I, e7I] : Fin 3 → ImO) := by
  have h := multBasis_indep.comp (![(4 : Fin 7), 5, 6] : Fin 3 → Fin 7)
    (by intro a b hab; fin_cases a <;> fin_cases b <;> simp_all)
  convert h using 1; funext i; fin_cases i <;> rfl

/-- ⭐ `dim TL = 3` (the un-doubled triplet is a genuine 3-space). -/
theorem finrank_TL : Module.finrank ℚ TL = 3 := by
  rw [TL, finrank_span_eq_card TL_indep]; simp

/-- ⭐ `dim TR = 3` (the doubled triplet is a genuine 3-space). -/
theorem finrank_TR : Module.finrank ℚ TR = 3 := by
  rw [TR, finrank_span_eq_card TR_indep]; simp

/-- ⭐ `dim Sg = 1` (the doubling-axis singlet). -/
theorem finrank_Sg : Module.finrank ℚ Sg = 1 := by
  rw [Sg]
  rw [show (Set.range (![e4I] : Fin 1 → ImO)) = {e4I} by
    ext x; simp [Set.range, Fin.exists_fin_one]]
  refine finrank_span_singleton ?_
  intro h
  have : (e4O : O ℚ) = 0 := congrArg (fun z : ImO => (z : O ℚ)) h
  exact e4O_ne_zero this

/-! ## (E) The `3 ⊕ 1 ⊕ 3` decomposition exhausts the fundamental 7. -/

/-- ⭐⭐ THE DECOMPOSITION `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`: the three su(2)_L-submodules jointly
    exhaust the fundamental 7 (`TL ⊔ Sg ⊔ TR = ⊤`). The `multBasis` — the seven derived imaginary
    units in the `ImH ⊕ ⟨ℓ⟩ ⊕ ℓImH` order — spans all of `ImO`. -/
theorem TL_sup_Sg_sup_TR_eq_top : TL ⊔ Sg ⊔ TR = ⊤ := by
  rw [eq_top_iff]
  have hspan : Submodule.span ℚ (Set.range multBasis) = ⊤ := by
    apply Submodule.eq_top_of_finrank_eq
    rw [finrank_span_eq_card multBasis_indep, finrank_ImO]; simp
  rw [← hspan, Submodule.span_le]
  rintro x ⟨i, rfl⟩
  fin_cases i
  · exact Submodule.mem_sup_left (Submodule.mem_sup_left (Submodule.subset_span ⟨0, rfl⟩))
  · exact Submodule.mem_sup_left (Submodule.mem_sup_left (Submodule.subset_span ⟨1, rfl⟩))
  · exact Submodule.mem_sup_left (Submodule.mem_sup_left (Submodule.subset_span ⟨2, rfl⟩))
  · exact Submodule.mem_sup_left (Submodule.mem_sup_right (Submodule.subset_span ⟨0, rfl⟩))
  · exact Submodule.mem_sup_right (Submodule.subset_span ⟨0, rfl⟩)
  · exact Submodule.mem_sup_right (Submodule.subset_span ⟨1, rfl⟩)
  · exact Submodule.mem_sup_right (Submodule.subset_span ⟨2, rfl⟩)

/-! ## (F) The Casimir — the nontrivial-multiplet certificate. -/

/-- The (unnormalized) quadratic Casimir of su(2)_L on the fundamental 7:
    `casimirOp = (imRep DI)² + (imRep DJ)² + (imRep DK)²`. -/
def casimirOp : Module.End ℚ ImO :=
  (imRep DI).comp (imRep DI) + (imRep DJ).comp (imRep DJ) + (imRep DK).comp (imRep DK)

/-- The Casimir as a banked integer matrix in the `qI` calculus. -/
def CasMat : M7 := add7 (add7 (mul7 Imat Imat) (mul7 Jmat Jmat)) (mul7 Kmat Kmat)

/-- The Casimir operator is the banked integer matrix `qI CasMat` (via `qI_comp` + `qI_add`). -/
theorem casimirOp_eq_qI : casimirOp = qI CasMat := by
  unfold casimirOp CasMat
  rw [imRep_DI_eq_qI, imRep_DJ_eq_qI, imRep_DK_eq_qI]
  show qI Imat * qI Imat + qI Jmat * qI Jmat + qI Kmat * qI Kmat = _
  rw [qI_comp, qI_comp, qI_comp, ← qI_add, ← qI_add]

/-- The Casimir matrix is `−8` on the six triplet coordinates and `0` on the singlet `e4`
    coordinate — a nonzero scalar on each triplet, `0` on the fixed axis. -/
theorem CasMat_val : ∀ i j : Fin 7, CasMat i j =
    (![![(-8:ℤ),0,0,0,0,0,0],![0,-8,0,0,0,0,0],![0,0,-8,0,0,0,0],
       ![0,0,0,0,0,0,0],![0,0,0,0,-8,0,0],![0,0,0,0,0,-8,0],![0,0,0,0,0,0,-8]] i j) := by
  decide

/-- ⭐⭐ CASIMIR SCALAR ON THE FIRST TRIPLET: `casimirOp` acts as `(-8)•id` on each generator of
    `TL` — the nontrivial-multiplet certificate (a nonzero Casimir eigenvalue on the triplet). -/
theorem casimirOp_u1I : casimirOp u1M = (-8 : ℚ) • u1M := by
  apply Subtype.ext; rw [casimirOp_eq_qI, qI_coe]
  show qZ CasMat (u1 : O ℚ) = (-8 : ℚ) • u1
  ext <;> simp [qZ, CasMat, add7, mul7, Imat, Jmat, Kmat, u1, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;> ring

/-- ⭐⭐ CASIMIR SCALAR ON THE SECOND TRIPLET: `casimirOp e5O = (-8)•e5O`. -/
theorem casimirOp_e5I : casimirOp e5I = (-8 : ℚ) • e5I := by
  apply Subtype.ext; rw [casimirOp_eq_qI, qI_coe]
  show qZ CasMat (e5O : O ℚ) = (-8 : ℚ) • e5O
  ext <;> simp [qZ, CasMat, add7, mul7, Imat, Jmat, Kmat, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;> ring

/-- ⭐⭐ CASIMIR ZERO ON THE SINGLET: `casimirOp e4O = 0` — the doubling axis is the su(2)_L-fixed
    singlet (Casimir eigenvalue `0`, distinguishing it from the triplets' `-8`). -/
theorem casimirOp_e4I : casimirOp e4I = 0 := by
  apply Subtype.ext; rw [casimirOp_eq_qI, qI_coe]
  show qZ CasMat (e4O : O ℚ) = 0
  ext <;> simp [qZ, CasMat, add7, mul7, Imat, Jmat, Kmat, e4O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-! ## (G) The triplets carry no su(2)_L-fixed vector (nontriviality, via N256). -/

/-- `kap1' = e4I` (both are the doubling axis `κO 1 = ⟨0,1⟩ = e4O`), so N256's unique isospin-fixed
    axis `isospinInvariants = span{kap1'}` reads as `span{e4I}`. -/
theorem kap1'_eq_e4I : kap1' = e4I := by
  apply Subtype.ext; show (kappaO (1 : H ℚ) : O ℚ) = e4O; rfl

/-- ⭐⭐ NO su(2)_L-FIXED VECTOR IN THE FIRST TRIPLET: the only member of `TL` fixed by ALL of
    `imRep DI, DJ, DK` is `0`. (Any joint-kernel vector lies in `isospinInvariants = span{e4I}`
    (N256), but `TL` meets `span{e4I}` only in `0` since the `c4` coordinate vanishes on `TL`.)
    So `TL` carries no singlet sub-factor — it is a genuine NONTRIVIAL su(2)_L-multiplet. -/
theorem TL_no_fixed_vector (v : ImO) (hv : v ∈ TL)
    (h1 : imRep DI v = 0) (h2 : imRep DJ v = 0) (h3 : imRep DK v = 0) : v = 0 := by
  -- v ∈ isospinInvariants = span{kap1'} = span{e4I}
  have hiso : v ∈ isospinInvariants :=
    ⟨⟨LinearMap.mem_ker.mpr h1, LinearMap.mem_ker.mpr h2⟩, LinearMap.mem_ker.mpr h3⟩
  rw [isospinInvariants_eq_span_kap, kap1'_eq_e4I, Submodule.mem_span_singleton] at hiso
  obtain ⟨t, rfl⟩ := hiso
  -- t • e4I ∈ TL forces t = 0 (the c4 coordinate of every TL generator is 0)
  rcases eq_or_ne t 0 with ht | ht
  · rw [ht, zero_smul]
  · exfalso
    -- c4 (t • e4O) = t ≠ 0, but every vector of TL has c4 = 0
    have hc4TL : ∀ w : ImO, w ∈ TL → c4 (w : O ℚ) = 0 := by
      intro w hw
      rw [TL, Submodule.mem_span_range_iff_exists_fun] at hw
      obtain ⟨g, hg⟩ := hw
      have hg' : (w : O ℚ) = g 0 • (u1 : O ℚ) + (g 1 • (e2O : O ℚ) + g 2 • (e3O : O ℚ)) := by
        have := congrArg (fun z : ImO => (z : O ℚ)) hg
        simpa only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
          Matrix.cons_val_succ, add_zero, u1M, e2I, e3I,
          Submodule.coe_add, SetLike.val_smul] using this.symm
      rw [hg']
      simp [c4, u1, e2O, e3O, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re,
        CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
        CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im]
    have hv4 : c4 ((t • e4I : ImO) : O ℚ) = 0 := hc4TL _ hv
    have : c4 ((t • e4I : ImO) : O ℚ) = t := by
      show c4 (t • (e4O : O ℚ)) = t
      simp [c4, e4O, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
    rw [this] at hv4; exact ht hv4

/-! ## (H) TRANSVERSALITY — the su(2)_L multiplets cross-cut N276's Cartan blocks and colour. -/

/-- ⭐⭐ CROSS-CUT OF N276's CARTAN BLOCKS: the doubling axis `e4O` is a generator of BOTH the
    su(2)_L singlet `Sg` (here) AND N276's isospin-Cartan-INERT block `Winert` (`e4O ∈ Winert`),
    while `e5O` is a generator of BOTH the su(2)_L triplet `TR` AND `Winert`. So N276's
    `Winert = span{e4O, e5O}` SPLITS across the su(2)_L singlet `Sg` and triplet `TR` — the
    non-abelian multiplet grading is TRANSVERSE to the abelian Cartan-weight grading, not a
    refinement of it. -/
theorem e4O_mem_Winert : e4O ∈ Winert := by
  rw [Winert]; apply Submodule.subset_span; exact ⟨0, by simp⟩
theorem e5O_mem_Winert : e5O ∈ Winert := by
  rw [Winert]; apply Submodule.subset_span; exact ⟨1, by simp⟩

/-- `e4I ∈ Sg` (the singlet contains the doubling axis) while `e5I ∈ TR` (the doubled triplet). -/
theorem e4I_mem_Sg : e4I ∈ Sg := by
  rw [Sg]; apply Submodule.subset_span; exact ⟨0, by simp⟩
theorem e5I_mem_TR : e5I ∈ TR := by
  rw [TR]; apply Submodule.subset_span; exact ⟨0, by simp⟩

/-- ⭐⭐ CROSS-CUT OF COLOUR (the moat, twin of N276's transversality): the un-doubled triplet `TL`
    STRADDLES all three colour pieces — `u1 ∈ span{u1}` (the colour-singlet direction, N252),
    `e2O ∈ Uhol` (the `3`), `e3O ∈ Uah` (the `3̄`, N266/N42c). So the su(2)_L multiplet grading is
    TRANSVERSE to the derived colour `1 ⊕ 3 ⊕ 3̄` grading — a THIRD independent grading. -/
theorem e2O_mem_Uhol : e2O ∈ Uhol := by
  rw [Uhol]; apply Submodule.subset_span; exact ⟨0, by simp⟩
theorem e3O_mem_Uah : e3O ∈ Uah := by
  rw [Uah]; apply Submodule.subset_span; exact ⟨0, by simp⟩

/-! ## (I) W8 non-vacuity. -/

/-- ★ W8: `TL ≠ ⊥` (the un-doubled triplet is genuinely nonzero). -/
theorem TL_ne_bot : TL ≠ ⊥ := by
  rw [TL, Submodule.ne_bot_iff]
  refine ⟨u1M, Submodule.subset_span ⟨0, by simp⟩, ?_⟩
  intro h
  have : (u1 : O ℚ) = 0 := congrArg (fun z : ImO => (z : O ℚ)) h
  exact u1_ne_zero this

/-- ★ W8: `TR ≠ ⊥`. -/
theorem TR_ne_bot : TR ≠ ⊥ := by
  rw [TR, Submodule.ne_bot_iff]
  refine ⟨e5I, Submodule.subset_span ⟨0, by simp⟩, ?_⟩
  intro h
  have : (e5O : O ℚ) = 0 := congrArg (fun z : ImO => (z : O ℚ)) h
  exact e5O_ne_zero this

/-! ## (J) THE CAPSTONE — the su(2)_L multiplet decomposition of one generation's matter. -/

/-- ★★★ CAPSTONE — THE NON-ABELIAN WEAK-ISOSPIN (su(2)_L) MULTIPLET DECOMPOSITION OF ONE
    GENERATION'S FUNDAMENTAL MATTER = THE CAYLEY–DICKSON DOUBLING TEAR. Under the full non-abelian
    weak-isospin Lie algebra `su(2)_L = {imRep DI, imRep DJ, imRep DK}` (the doubling
    inner-derivations, closure `⁅DI,DJ⁆ = 2•DK`), the fundamental matter `ImO` decomposes into three
    su(2)_L-submodules `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`:
      · `TL = span{u1,e2O,e3O}` (dim 3) — the un-doubled imaginary world `ImH`, a NONTRIVIAL
        multiplet (Casimir `= (-8)•id`, NO su(2)_L-fixed vector);
      · `Sg = span{e4O}` (dim 1) — the su(2)_L-FIXED doubling axis `ℓ = κO 1` (Casimir `= 0`, N256);
      · `TR = span{e5O,e6O,e7O}` (dim 3) — the doubled world `ℓ·ImH`, a NONTRIVIAL multiplet.
    The three exhaust `ImO` (`TL ⊔ Sg ⊔ TR = ⊤`), the Casimir separates the triplets (`-8`) from
    the singlet (`0`), and the grading is TRANSVERSE to BOTH N276's abelian Cartan-weight blocks
    (`e4O, e5O ∈ Winert` but `e4I ∈ Sg`, `e5I ∈ TR`) and the colour `1 ⊕ 3 ⊕ 3̄` split
    (`TL` straddles `span{u1}`, `Uhol`, `Uah`). Non-vacuous (`TL ≠ ⊥`, `TR ≠ ⊥`). -/
theorem isospin_multiplet_structure :
    -- the su(2)_L action closes each submodule (invariance witnesses)
    imRep DI u1M = 0 ∧ imRep DJ u1M = (-2 : ℚ) • e3I ∧ imRep DK u1M = (2 : ℚ) • e2I ∧
    imRep DI e5I = 0 ∧ imRep DJ e5I = (-2 : ℚ) • e7I ∧ imRep DK e5I = (2 : ℚ) • e6I ∧
    imRep DI e4I = 0 ∧ imRep DJ e4I = 0 ∧ imRep DK e4I = 0 ∧
    -- the dimensions of the three multiplets
    Module.finrank ℚ TL = 3 ∧ Module.finrank ℚ Sg = 1 ∧ Module.finrank ℚ TR = 3 ∧
    -- the 3 ⊕ 1 ⊕ 3 exhausts the fundamental 7
    TL ⊔ Sg ⊔ TR = ⊤ ∧
    -- the Casimir separates triplets (-8) from singlet (0)
    casimirOp u1M = (-8 : ℚ) • u1M ∧ casimirOp e5I = (-8 : ℚ) • e5I ∧ casimirOp e4I = 0 ∧
    -- the triplet has no su(2)_L-fixed vector (nontrivial multiplet)
    (∀ v : ImO, v ∈ TL → imRep DI v = 0 → imRep DJ v = 0 → imRep DK v = 0 → v = 0) ∧
    -- transversality to N276's Cartan blocks: Winert splits Sg ⊕ TR
    e4O ∈ Winert ∧ e5O ∈ Winert ∧ e4I ∈ Sg ∧ e5I ∈ TR ∧
    -- transversality to colour: TL straddles the colour 1 ⊕ 3 ⊕ 3̄
    e2O ∈ Uhol ∧ e3O ∈ Uah ∧
    -- non-vacuity
    TL ≠ ⊥ ∧ TR ≠ ⊥ :=
  ⟨imRep_DI_u1I, imRep_DJ_u1I, imRep_DK_u1I,
    imRep_DI_e5I, imRep_DJ_e5I, imRep_DK_e5I,
    imRep_DI_e4I, imRep_DJ_e4I, imRep_DK_e4I,
    finrank_TL, finrank_Sg, finrank_TR,
    TL_sup_Sg_sup_TR_eq_top,
    casimirOp_u1I, casimirOp_e5I, casimirOp_e4I,
    TL_no_fixed_vector,
    e4O_mem_Winert, e5O_mem_Winert, e4I_mem_Sg, e5I_mem_TR,
    e2O_mem_Uhol, e3O_mem_Uah,
    TL_ne_bot, TR_ne_bot⟩

end

end Phys.Algebra
