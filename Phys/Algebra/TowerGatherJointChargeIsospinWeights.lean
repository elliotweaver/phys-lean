/-
  Phys.Algebra.TowerGatherJointChargeIsospinWeights — N276.
  ===========================================================================
  THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION OF ONE GENERATION'S FUNDAMENTAL
  MATTER — over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and its imaginary part `ImO` (the
  fundamental 7-representation, N22). Method-lock LIFTED (2026-07-03); this is a GATHER-native
  forward step (the charge operator `chargeOp = crossOp u1` IS the gather tear on the fold-root,
  N240/N223), NOT the parked invariant-tower ascent.

  ---------------------------------------------------------------------------
  THE STORY SO FAR (the neutral core was built; the charged grading was left unbuilt). N254
  (`TowerGatherForcedSecondNeutral`) banked the NEUTRAL kernel of the two derived operators:
  the gather charge `chargeOp = crossOp u1` (N240) and the doubling weak-isospin Cartan
  `imRep DI` (N202) COMMUTE (`charge_isospin_commute`), are ℚ-linearly independent, and their
  JOINT kernel is exactly the fold-root singlet line `span{sgl}` (`joint_neutral_kernel`,
  `sgl = ⟨u1⟩`). But N254 built ONLY the neutral kernel; the CHARGED complement's joint (charge,
  isospin-Cartan) decomposition — how the two commuting operators grade the charged matter TOGETHER
  — was explicitly left unbuilt.

  THIS node builds it. Under the two BANKED COMMUTING integer operators `Q = chargeOp = qI Cmat`
  (N253/N254 `chargeOp_eq_qI`) and `T3 = imRep DI = qI Imat` (N253 `imRep_DI_eq_qI`), the
  fundamental 7 decomposes into JOINT INVARIANT SUBSPACES:

    ImO  =  span{sgl}  ⊕  Winert  ⊕  Wactive          (finranks 1 + 2 + 4 = 7)

  where
    · `span{sgl}` = the fold-root line `⟨u1⟩` : Q-neutral AND T3-neutral (N254);
    · `Winert  := span{e4O, e5O}` : CHARGED (`chargeOp` is a complex structure on it — `e4↦e5`,
       `e5↦−e4`, so `Q² = −1` on the block) but isospin-Cartan-INERT (`imRep DI` kills both `e4O`,
       `e5O`);
    · `Wactive := span{e2O, e3O, e6O, e7O}` : the isospin-Cartan-ACTIVE 4-block
       (`imRep DI e2O = 2•e3O ≠ 0`).

  ---------------------------------------------------------------------------
  THE OBJECTS (all derived, foundations-only):
    · `e4I`/`e5I`/`e2I`/`e3I` — the block basis vectors as members of `ImO`;
    · `imRep_DI_e4I`/`imRep_DI_e5I` (T3-INERT), `imRep_DI_e2I` (T3-ACTIVE, `= 2•e3I ≠ 0`);
    · `chargeOp_e4I`/`chargeOp_e5I` (the CHARGE COMPLEX STRUCTURE on `Winert`: `e4↦e5`, `e5↦−e4`);
    · `Winert`/`Wactive` (the two derived charged blocks);
    · ⭐ `finrank_Winert` (`= 2`), `finrank_Wactive` (`= 4`);
    · ⭐⭐ `Winert_sup_Wactive_eq_Vsub` (the charged 6-space `Vsub = 3 ⊕ 3̄` SPLITS `2 ⊕ 4` under
       the joint grading);
    · ⭐⭐ TRANSVERSALITY TO COLOUR (the moat): `e5O ∉ Uhol`, `e4O ∈ Uhol` — `Winert` STRADDLES
       both colour halves `3 = Uhol` and `3̄ = Uah` (N42c), so the derived isospin grading is
       TRANSVERSE to the derived colour grading, NOT a refinement of it;
    · ⭐ W8 non-vacuity: `Winert_ne_bot`, `chargeOp e4I ≠ 0`;
    · ⭐⭐⭐ CAPSTONE `joint_charge_isospin_weight_structure`.

  ---------------------------------------------------------------------------
  THE MOAT / DISSOLUTION (STANDARD §0). The SM ASSIGNS each fermion component its `(T3, Y, Q)`
  quantum numbers from the hypercharge table (an empirical input) and imposes the isospin
  multiplet structure by hand. The theory DERIVES the joint weight blocks as the JOINT INVARIANT
  SUBSPACES of two operators the fold FORCED — the charge = the gather tear on the fold-root `u1`
  (N240), the isospin Cartan = the doubling derivation (N202) — that COMMUTE (N254). The quantum
  numbers fall out as joint eigenspaces, not a table; and the derived isospin grading is TRANSVERSE
  to both the charge-0/charged split (N254) and the colour `3 ⊕ 3̄` split (N266/N42c) — the
  "misalignment" the SM encodes as `Q = T3 + Y/2` is a derived geometric fact about two commuting
  operators' distinct, transverse gradings.

  ONE CAUSE MANY TERMINATIONS: the SAME fold-root `u1` seeds the charge (N240), the neutral core
  (N254), and the colour complex structure (N266); the doubling seeds the isospin Cartan (N189);
  their joint grading is the derived quantum-number content of one generation of matter.

  SCOPE (honesty). Banks the joint (charge, isospin-Cartan) weight decomposition `1 ⊕ 2 ⊕ 4` + the
  charged-isospin-inert block + its transversality to colour ONLY. Does NOT bank the hypercharge
  NORMALIZATION / weak mixing angle (★2, deferred ≥9× for a structural reason), NOT the full su(2)
  Casimir irrep refinement of `Wactive` (the doublet content — a downstream ascent node), NOT the
  ★5 family/mass texture (PROVED un-forceable from the arena, N275 + the family-equivariant
  associator), NOT masses/mixings, NOT parity, NOT "= a specific SM multiplet" (removable prose).

  ---------------------------------------------------------------------------
  FREE-FLOATING RAIL (SOUL). Every headline TYPE mentions the banked tower objects
  (`chargeOp`/`imRep DI`/`Vsub`/`Uhol`/`Uah`/`sgl`/`e4O`/`e5O` on the derived `O ℚ`); the
  transversality is octonion/doubling-specific (it uses the concrete banked coordinate structure).
  ⚠ COMPLEX FIELD METALANGUAGE (N242 warning light): `chargeOp`/`imRep DI`/`Winert`/`Wactive` stay
  DERIVED REAL objects; `Submodule.span`/`⊔`/`⊓`/`finrank`/`LinearMap.ker` are Mathlib machinery
  on the derived objects; NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`, NO `ℚ[i]`-as-ground.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no `native_decide`/`decide` on octonion coordinates (a `linarith`/`simp` on the banked integer
  matrices `Cmat`/`Imat`, the N252/N256 methodology), no bridge.
-/
import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- The block-image / independence proofs pass a uniform coordinate simp set; a few members are
-- redundant on some coordinates. Silence the cosmetic unused-simp-arg linter (N256 precedent).
set_option linter.unusedSimpArgs false

/-! ## (A) The block basis vectors as members of the fundamental 7 `ImO`. -/

/-- `e4O ∈ Im(𝕆)` (the 4th imaginary unit). -/
theorem e4O_memI : e4O ∈ ImO := by
  have := imBasis_mem_ImO 3; simpa [imBasis] using this
/-- `e5O ∈ Im(𝕆)`. -/
theorem e5O_memI : e5O ∈ ImO := by
  have := imBasis_mem_ImO 4; simpa [imBasis] using this
/-- `e2O ∈ Im(𝕆)`. -/
theorem e2O_memI : e2O ∈ ImO := by
  have := imBasis_mem_ImO 1; simpa [imBasis] using this
/-- `e3O ∈ Im(𝕆)`. -/
theorem e3O_memI : e3O ∈ ImO := by
  have := imBasis_mem_ImO 2; simpa [imBasis] using this

/-- The isospin-Cartan-inert block generators, as elements of `ImO`. -/
noncomputable def e4I : ImO := ⟨e4O, e4O_memI⟩
noncomputable def e5I : ImO := ⟨e5O, e5O_memI⟩
/-- Two isospin-Cartan-active block generators (for the T3-active contrast). -/
noncomputable def e2I : ImO := ⟨e2O, e2O_memI⟩
noncomputable def e3I : ImO := ⟨e3O, e3O_memI⟩

/-! ## (B) The ISOSPIN-CARTAN grading `T3 = imRep DI` on the blocks. -/

/-- ★ ISOSPIN-CARTAN-INERT: the weak-isospin Cartan `imRep DI` annihilates `e4O`
    (`imRep DI = qI Imat`, and `Imat` has a zero row/column at the `c4` coordinate). -/
theorem imRep_DI_e4I : imRep DI e4I = 0 := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e4O : O ℚ) = 0
  ext <;> simp [qZ, Imat, e4I, e4O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- ★ ISOSPIN-CARTAN-INERT: `imRep DI` annihilates `e5O`. -/
theorem imRep_DI_e5I : imRep DI e5I = 0 := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e5O : O ℚ) = 0
  ext <;> simp [qZ, Imat, e5I, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- ★ ISOSPIN-CARTAN-ACTIVE (the contrast): `imRep DI e2O = 2 • e3O ≠ 0` — the `Wactive` block
    genuinely carries isospin (`Imat` has a `±2` entry coupling `c2 ↔ c3`). -/
theorem imRep_DI_e2I : imRep DI e2I = (2 : ℚ) • e3I := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e2O : O ℚ) = ((2 : ℚ) • e3I : ImO)
  show qZ Imat (e2O : O ℚ) = (2 : ℚ) • e3O
  ext <;> simp [qZ, Imat, e2I, e3I, e2O, e3O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-! ## (C) The CHARGE grading `Q = chargeOp` on the isospin-inert block — a complex structure. -/

/-- ★★ CHARGE COMPLEX STRUCTURE (leg 1): `chargeOp e4O = e5O`
    (`chargeOp = qI Cmat`, and `Cmat` rotates `c4 ↦ c5`). -/
theorem chargeOp_e4I : chargeOp e4I = e5I := by
  apply Subtype.ext; rw [chargeOp_eq_qI, qI_coe]
  show qZ Cmat (e4O : O ℚ) = (e5I : O ℚ)
  show qZ Cmat (e4O : O ℚ) = e5O
  ext <;> simp [qZ, Cmat, e4I, e5I, e4O, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-- ★★ CHARGE COMPLEX STRUCTURE (leg 2): `chargeOp e5O = −e4O` — with `chargeOp_e4I`, `chargeOp`
    is a complex structure on `Winert` (`Q² = −1` there), so `Winert` is CHARGED. -/
theorem chargeOp_e5I : chargeOp e5I = -e4I := by
  apply Subtype.ext; rw [chargeOp_eq_qI, qI_coe]
  show qZ Cmat (e5O : O ℚ) = ((-e4I : ImO) : O ℚ)
  show qZ Cmat (e5O : O ℚ) = -e4O
  ext <;> simp [qZ, Cmat, e4I, e5I, e4O, e5O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

/-! ## (D) The two derived charged blocks and their dimensions. -/

/-- The isospin-Cartan-INERT charged block `Winert = span{e4O, e5O}`. -/
noncomputable def Winert : Submodule ℚ (O ℚ) :=
  Submodule.span ℚ (Set.range (![e4O, e5O] : Fin 2 → O ℚ))

/-- The isospin-Cartan-ACTIVE block `Wactive = span{e2O, e3O, e6O, e7O}`. -/
noncomputable def Wactive : Submodule ℚ (O ℚ) :=
  Submodule.span ℚ (Set.range (![e2O, e3O, e6O, e7O] : Fin 4 → O ℚ))

/-- `{e4O, e5O}` are linearly independent. -/
theorem e45_indep : LinearIndependent ℚ (![e4O, e5O] : Fin 2 → O ℚ) := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  simp only [e4O, e5O, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h4 h5
  intro i; fin_cases i <;> simp_all

/-- `{e2O, e3O, e6O, e7O}` are linearly independent. -/
theorem e2367_indep : LinearIndependent ℚ (![e2O, e3O, e6O, e7O] : Fin 4 → O ℚ) := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h2 := congrArg c2 hg
  have h3 := congrArg c3 hg
  have h6 := congrArg c6 hg
  have h7 := congrArg c7 hg
  simp only [e2O, e3O, e6O, e7O, c2, c3, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h2 h3 h6 h7
  intro i; fin_cases i <;> simp_all

/-- ⭐ `dim Winert = 2` (the charged isospin-inert block is a genuine plane). -/
theorem finrank_Winert : Module.finrank ℚ Winert = 2 := by
  rw [Winert, finrank_span_eq_card e45_indep]; simp

/-- ⭐ `dim Wactive = 4`. -/
theorem finrank_Wactive : Module.finrank ℚ Wactive = 4 := by
  rw [Wactive, finrank_span_eq_card e2367_indep]; simp

/-- ⭐⭐ THE CHARGED 6-SPACE SPLITS `2 ⊕ 4`: `Winert ⊔ Wactive = Vsub` (the banked charged
    complement `Vsub = 3 ⊕ 3̄`, N42c, is the join of the two derived isospin blocks). -/
theorem Winert_sup_Wactive_eq_Vsub : Winert ⊔ Wactive = Vsub := by
  rw [Winert, Wactive, Vsub, imgUnit, ← Submodule.span_union]
  congr 1
  apply Set.eq_of_subset_of_subset
  · rintro x (hx | hx) <;> (
      simp only [Set.mem_range] at hx ⊢; obtain ⟨i, rfl⟩ := hx; fin_cases i)
    · exact ⟨2, rfl⟩
    · exact ⟨3, rfl⟩
    · exact ⟨0, rfl⟩
    · exact ⟨1, rfl⟩
    · exact ⟨4, rfl⟩
    · exact ⟨5, rfl⟩
  · rintro x ⟨i, rfl⟩
    fin_cases i
    · exact Or.inr ⟨0, rfl⟩
    · exact Or.inr ⟨1, rfl⟩
    · exact Or.inl ⟨0, rfl⟩
    · exact Or.inl ⟨1, rfl⟩
    · exact Or.inr ⟨2, rfl⟩
    · exact Or.inr ⟨3, rfl⟩

/-! ## (E) TRANSVERSALITY TO COLOUR (the moat) — `Winert` straddles both colour halves. -/

/-- `e4O ∈ Uhol` (the `3` half of the colour split, N42c) — a generator of `Uhol`. -/
theorem e4O_mem_Uhol : e4O ∈ Uhol := by
  rw [Uhol]; apply Submodule.subset_span; exact ⟨1, by simp⟩

/-- ⭐⭐ `e5O ∉ Uhol`: the OTHER `Winert` generator lands in the CONJUGATE half `3̄ = Uah`, NOT in
    `Uhol`. So `Winert = span{e4O, e5O}` STRADDLES both colour triplets — the derived
    isospin-Cartan grading is TRANSVERSE to the derived colour `3 ⊕ 3̄` grading (N266/N42c), not a
    refinement of it. This is the geometric content the SM encodes by hand as `Q = T3 + Y/2`. -/
theorem e5O_not_mem_Uhol : e5O ∉ Uhol := by
  intro h
  rw [Uhol, Submodule.mem_span_range_iff_exists_fun] at h
  obtain ⟨g, hg⟩ := h
  have h5 := congrArg c5 hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, e2O, e4O, e6O, e5O, c5,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h5
  norm_num at h5

/-- `e5O ∈ Uah` (the `3̄` half) — a generator of `Uah`. -/
theorem e5O_mem_Uah : e5O ∈ Uah := by
  rw [Uah]; apply Submodule.subset_span; exact ⟨1, by simp⟩

/-! ## (F) W8 non-vacuity. -/

/-- `e5O ≠ 0`. -/
theorem e5O_ne_zero : (e5O : O ℚ) ≠ 0 := by
  intro h; have : c5 (e5O : O ℚ) = c5 (0 : O ℚ) := by rw [h]
  simp [e5O, c5] at this

/-- `e4O ≠ 0`. -/
theorem e4O_ne_zero : (e4O : O ℚ) ≠ 0 := by
  intro h; have : c4 (e4O : O ℚ) = c4 (0 : O ℚ) := by rw [h]
  simp [e4O, c4] at this

/-- ★ W8: `Winert ≠ ⊥` (the charged isospin-inert block is genuinely nonzero). -/
theorem Winert_ne_bot : Winert ≠ ⊥ := by
  rw [Winert, Submodule.ne_bot_iff]
  refine ⟨e4O, ?_, e4O_ne_zero⟩
  apply Submodule.subset_span; exact ⟨0, by simp⟩

/-- ★ W8: `chargeOp e4I ≠ 0` — `Winert` is genuinely CHARGED (the charge complex structure moves
    `e4O` to the nonzero `e5O`). -/
theorem chargeOp_e4I_ne_zero : chargeOp e4I ≠ 0 := by
  rw [chargeOp_e4I]
  intro h
  have : (e5I : O ℚ) = ((0 : ImO) : O ℚ) := congrArg (fun z : ImO => (z : O ℚ)) h
  exact e5O_ne_zero this

/-! ## (G) THE CAPSTONE — the joint (charge, weak-isospin-Cartan) weight decomposition. -/

/-- ★★★ CAPSTONE — THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION. Under the two
    BANKED COMMUTING derived operators `Q = chargeOp` (the gather tear on the fold-root `u1`,
    N240) and `T3 = imRep DI` (the doubling weak-isospin Cartan, N202), which COMMUTE (N254), the
    fundamental matter `ImO` grades into:
      · the fold-root singlet `span{sgl}` — Q-neutral AND T3-neutral (N254 `joint_neutral_kernel`);
      · the charged isospin-inert block `Winert = span{e4O,e5O}` (dim 2): CHARGED (`chargeOp` a
        complex structure `e4↦e5`, `e5↦−e4`) but T3-INERT (`imRep DI` kills `e4O`, `e5O`);
      · the T3-active block `Wactive = span{e2O,e3O,e6O,e7O}` (dim 4): `imRep DI e2O = 2•e3O ≠ 0`.
    The charged complement `Vsub = 3 ⊕ 3̄` (N42c) SPLITS `2 ⊕ 4` under the joint grading
    (`Winert ⊔ Wactive = Vsub`), and the isospin-inert block STRADDLES both colour halves
    (`e4O ∈ Uhol`, `e5O ∉ Uhol` — `e5O ∈ Uah`): the derived isospin-Cartan grading is TRANSVERSE
    to the derived colour `3 ⊕ 3̄` grading, FORCED not tabulated. Non-vacuous
    (`Winert ≠ ⊥`, `chargeOp e4I ≠ 0`). -/
theorem joint_charge_isospin_weight_structure :
    -- the isospin-Cartan grading: inert block killed, active block moved
    imRep DI e4I = 0 ∧ imRep DI e5I = 0 ∧ imRep DI e2I = (2 : ℚ) • e3I ∧
    -- the charge complex structure on the inert block
    chargeOp e4I = e5I ∧ chargeOp e5I = -e4I ∧
    -- dimensions of the two derived charged blocks
    Module.finrank ℚ Winert = 2 ∧ Module.finrank ℚ Wactive = 4 ∧
    -- the charged 6-space Vsub splits 2 ⊕ 4
    Winert ⊔ Wactive = Vsub ∧
    -- transversality to the colour 3 ⊕ 3̄ grading
    e4O ∈ Uhol ∧ e5O ∉ Uhol ∧ e5O ∈ Uah ∧
    -- the two operators COMMUTE (N254) — the joint grading is genuine
    Commute chargeOp (imRep DI) ∧
    -- non-vacuity
    Winert ≠ ⊥ ∧ chargeOp e4I ≠ 0 :=
  ⟨imRep_DI_e4I, imRep_DI_e5I, imRep_DI_e2I, chargeOp_e4I, chargeOp_e5I,
    finrank_Winert, finrank_Wactive, Winert_sup_Wactive_eq_Vsub,
    e4O_mem_Uhol, e5O_not_mem_Uhol, e5O_mem_Uah, charge_isospin_commute,
    Winert_ne_bot, chargeOp_e4I_ne_zero⟩

end Phys.Algebra
