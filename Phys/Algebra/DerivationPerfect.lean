/-
  Phys.Algebra.DerivationPerfect — N23: THE PERFECTNESS / NON-SOLVABILITY of the
  derivation Lie algebra `derivationLieQ` — the cleanly-tractable compact-form /
  type-G₂ invariant, derived FORWARD from the banked 91-pair bracket table.
  ===========================================================================
  N20 closed `finrank_derivationQ_eq_14`; N21 exhibited
  `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` with its explicit
  14-element basis `derivBasis` and the FULL 91-pair Lie-bracket structure-constant
  table `br_*`; N22 banked the FAITHFUL 7-dimensional representation `imRep`. The
  remaining N23 target is the COMPACT-FORM / type-G₂ pinning of `derivationLieQ`,
  derived FORWARD, NO posited `G₂`.

  ★ THE W1/W9 ROUTE DECISION (workbench/N23-g2-compact-form/PREREG.md, decided by a
  BOUNDED MEASUREMENT not a guess). The route-deciding numerics (exact-rational,
  reusing the BANKED 14 derivations + proved bracket table — W6, re-verified) settle:
    • IRREDUCIBILITY of the 7-rep HOLDS (the image of `ρ(D_k)` generates the full
      49-dim `End(ImO)` — absolutely irreducible) — but formalizing needs the abstract
      7-space rep machinery; CHILDED.
    • The KILLING FORM is NONDEGENERATE and NEGATIVE-DEFINITE, and the feared 14×14
      determinant FACTORS: `K` block-diagonalizes into 7 disjoint 2×2 blocks
      `[[-16,±8],[±8,-16]]` (det 192 each, det K = 192⁷ = 9618527719784448). Still a
      W9 beast to compute abstractly (`killingForm = trace(ad∘ad)` over the basis);
      CHILDED.
    • ★ PERFECTNESS — THE GIFT. Every basis derivation is a SINGLE banked bracket:
      `D0 = -½⁅D1,D2⁆`, `D1 = ½⁅D0,D2⁆`, `D2 = -½⁅D0,D1⁆`, `D3 = ½⁅D5,D6⁆`,
      `D4 = -⁅D0,D7⁆`, `D5 = ⁅D0,D6⁆`, `D6 = -⁅D0,D5⁆`, `D7 = ⁅D0,D4⁆`,
      `D8 = -⁅D3,D13⁆`, `D9 = -⁅D0,D12⁆`, `D10 = ⁅D0,D11⁆`, `D11 = -⁅D0,D10⁆`,
      `D12 = ⁅D0,D9⁆`, `D13 = ⁅D3,D8⁆` — all entries of the banked `br_*` table. So the
      whole 14-dim algebra lies in its own derived ideal `⁅⊤,⊤⁆`: it is PERFECT, hence
      NOT SOLVABLE. This is the cleanly-tractable forward increment — the structural
      OPPOSITE of a solvable radical, the necessary edge of simplicity/semisimplicity —
      built entirely from the crown-jewel bracket table + Mathlib's derived-series API.

  WHAT IS BANKED HERE (forward, foundations-only):
    bL               — the 14 basis derivations as elements of the Lie algebra
                       `derivationLieQ` (the `Fin 14`-indexed family).
    bL_span_top      — ★ the 14 `bL k` SPAN `⊤` (transported from the banked
                       `derivBasis` along the carrier identity `derivationQ ≃ₗ
                       derivationLieQ`).
    cert_k           — the 14 generator-bracket identities `⁅bL i, bL j⁆ = c • bL k`,
                       lifted from the banked `br_*` table.
    bL_mem_derived   — each `bL k ∈ ⁅⊤,⊤⁆` (a smul of a bracket of two ⊤-elements).
    derivationLieQ_perfect — ★★ `⁅⊤,⊤⁆ = ⊤`: the derivation Lie algebra is PERFECT
                       (equals its own derived ideal).
    derivationLieQ_not_solvable — ★★ `¬ IsSolvable derivationLieQ`: a perfect, nonzero
                       Lie algebra is not solvable (its derived series is constant `⊤`,
                       never reaching `⊥`).
    derivationLieQ_not_lieAbelian — ★ `¬ IsLieAbelian derivationLieQ` (corollary;
                       anti-vacuity — a nonzero bracket exists).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16–N22 held it). NO
  `LieAlgebra.g₂` / `G₂` is imported to ASSERT anything. Perfectness and
  non-solvability are STRUCTURAL FACTS about the banked `derivationLieQ`, proved from
  its own banked bracket table; `LieIdeal` / `derivedSeries` / `IsSolvable` are
  MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact /
  exceptional": what remains is the pure statement that the 14-dimensional Lie algebra
  of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ is
  PERFECT (equals its own derived ideal) and hence NOT solvable. No theorem STATEMENT
  needs a physics word.

  WHAT REMAINS (childed N24, never asserted here, never a bridge): the full
  compact-form pinning — irreducibility of the faithful 7-rep, Killing-form
  nondegeneracy (semisimplicity by Cartan) + negative-definiteness (the compact
  signature), and simplicity (no nonzero proper ideal) — completing the type-G₂
  identification, then the automorphism Lie GROUP (exponentiating over the derived
  continuum). All correctly scoped to dedicated children, NOT bypassed.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationStructureConstants
import Mathlib.Algebra.Lie.Solvable
import Mathlib.Algebra.Lie.IdealOperations
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The 14 basis derivations as elements of the Lie algebra. -/

/-- The 14 explicit basis derivations `D0E..D13E` (N19) as elements of the Lie
    algebra `derivationLieQ` (each is a derivation, so it lies in the carrier). -/
def bL : Fin 14 → derivationLieQ := fun i =>
  ⟨![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i,
   Dvec_mem i⟩

@[simp] theorem bL_coe (i : Fin 14) :
    (bL i : Module.End ℚ (O ℚ))
      = ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i := rfl

/-! ## The 14 generators span the whole Lie algebra.

    `derivBasis` (N21) is a `Module.Basis (Fin 14) ℚ derivationQ`; `derivationQ` and
    `derivationLieQ` have the SAME carrier `{D | IsDerivQ D}`, so the identity on
    endomorphisms is a ℚ-linear equivalence between the two subtypes, transporting the
    basis to a basis of `derivationLieQ` whose vectors are exactly the `bL k`. -/

/-- The carrier identity `derivationQ ≃ₗ[ℚ] derivationLieQ` (both are `{D | IsDerivQ D}`). -/
def toLieEquiv : derivationQ ≃ₗ[ℚ] derivationLieQ where
  toFun := fun x => ⟨x.1, x.2⟩
  map_add' := fun _ _ => rfl
  map_smul' := fun _ _ => rfl
  invFun := fun x => ⟨x.1, x.2⟩
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

/-- The banked `derivBasis` transported to a basis of the Lie algebra `derivationLieQ`. -/
def bLbasis : Module.Basis (Fin 14) ℚ derivationLieQ := derivBasis.map toLieEquiv

/-- The transported basis vectors ARE the `bL` family. -/
theorem bLbasis_eq (i : Fin 14) : bLbasis i = bL i := by
  apply Subtype.ext
  show ((derivBasis i : derivationQ) : Module.End ℚ (O ℚ)) = (bL i).1
  rw [derivBasis_apply]; rfl

/-- ★ THE 14 GENERATORS SPAN `⊤`. They are the values of a basis (`bLbasis`), so their
    span is everything. -/
theorem bL_span_top : Submodule.span ℚ (Set.range bL) = ⊤ := by
  have hr : Set.range bL = Set.range bLbasis := by
    apply Set.ext; intro x; simp only [Set.mem_range]
    exact ⟨fun ⟨i, h⟩ => ⟨i, (bLbasis_eq i).trans h⟩,
           fun ⟨i, h⟩ => ⟨i, (bLbasis_eq i).symm.trans h⟩⟩
  rw [hr]; exact bLbasis.span_eq

/-! ## Every generator lies in the derived ideal `⁅⊤,⊤⁆`.

    Each `bL k` is a scalar multiple of a single bracket `⁅bL i, bL j⁆` of two basis
    derivations (the banked `br_*` table), hence lies in the derived ideal. -/

/-- A generator-bracket identity `⁅bL i, bL j⁆ = c • bL k` (with `c ≠ 0`) places
    `bL k` in the derived ideal `⁅⊤,⊤⁆`: the bracket of two `⊤`-elements is in
    `⁅⊤,⊤⁆`, and the ideal is closed under the scalar `c⁻¹`. -/
theorem mem_derived_of_bracket {i j k : Fin 14} {c : ℚ} (hc : c ≠ 0)
    (h : ⁅bL i, bL j⁆ = c • bL k) :
    bL k ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), ⊤⁆ : LieIdeal ℚ derivationLieQ) := by
  have hb : ⁅bL i, bL j⁆ ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), ⊤⁆) :=
    LieSubmodule.lie_mem_lie (LieSubmodule.mem_top _) (LieSubmodule.mem_top _)
  rw [h] at hb
  have h2 := SMulMemClass.smul_mem c⁻¹ hb
  rwa [smul_smul, inv_mul_cancel₀ hc, one_smul] at h2

-- The 14 generator-bracket certificates, lifted from the banked `br_*` table.
-- (Scalar RHS `c • Dk`, bare RHS `Dk`, and negated RHS `-Dk` are the three shapes.)
theorem cert0 : ⁅bL 1, bL 2⁆ = ((-2 : ℚ)) • bL 0 := by
  apply Subtype.ext; rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe]
  exact br_1_2
theorem cert1 : ⁅bL 0, bL 2⁆ = ((2 : ℚ)) • bL 1 := by
  apply Subtype.ext; rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe]
  exact br_0_2
theorem cert2 : ⁅bL 0, bL 1⁆ = ((-2 : ℚ)) • bL 2 := by
  apply Subtype.ext; rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe]
  exact br_0_1
theorem cert3 : ⁅bL 5, bL 6⁆ = ((2 : ℚ)) • bL 3 := by
  apply Subtype.ext; rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe]
  exact br_5_6
theorem cert4 : ⁅bL 0, bL 7⁆ = ((-1 : ℚ)) • bL 4 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, neg_one_smul]
  exact br_0_7
theorem cert5 : ⁅bL 0, bL 6⁆ = ((1 : ℚ)) • bL 5 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, one_smul]
  exact br_0_6
theorem cert6 : ⁅bL 0, bL 5⁆ = ((-1 : ℚ)) • bL 6 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, neg_one_smul]
  exact br_0_5
theorem cert7 : ⁅bL 0, bL 4⁆ = ((1 : ℚ)) • bL 7 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, one_smul]
  exact br_0_4
theorem cert8 : ⁅bL 3, bL 13⁆ = ((-1 : ℚ)) • bL 8 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, neg_one_smul]
  exact br_3_13
theorem cert9 : ⁅bL 0, bL 12⁆ = ((-1 : ℚ)) • bL 9 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, neg_one_smul]
  exact br_0_12
theorem cert10 : ⁅bL 0, bL 11⁆ = ((1 : ℚ)) • bL 10 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, one_smul]
  exact br_0_11
theorem cert11 : ⁅bL 0, bL 10⁆ = ((-1 : ℚ)) • bL 11 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, neg_one_smul]
  exact br_0_10
theorem cert12 : ⁅bL 0, bL 9⁆ = ((1 : ℚ)) • bL 12 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, one_smul]
  exact br_0_9
theorem cert13 : ⁅bL 3, bL 8⁆ = ((1 : ℚ)) • bL 13 := by
  apply Subtype.ext
  rw [LieSubalgebra.coe_bracket, SetLike.val_smul, bL_coe, bL_coe, bL_coe, one_smul]
  exact br_3_8

/-- ★ EVERY generator `bL k` lies in the derived ideal `⁅⊤,⊤⁆`. Case split on the 14
    indices, each discharged by its banked single-bracket certificate. -/
theorem bL_mem_derived (k : Fin 14) :
    bL k ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), ⊤⁆ : LieIdeal ℚ derivationLieQ) := by
  fin_cases k
  · exact mem_derived_of_bracket (by norm_num) cert0
  · exact mem_derived_of_bracket (by norm_num) cert1
  · exact mem_derived_of_bracket (by norm_num) cert2
  · exact mem_derived_of_bracket (by norm_num) cert3
  · exact mem_derived_of_bracket (by norm_num) cert4
  · exact mem_derived_of_bracket (by norm_num) cert5
  · exact mem_derived_of_bracket (by norm_num) cert6
  · exact mem_derived_of_bracket (by norm_num) cert7
  · exact mem_derived_of_bracket (by norm_num) cert8
  · exact mem_derived_of_bracket (by norm_num) cert9
  · exact mem_derived_of_bracket (by norm_num) cert10
  · exact mem_derived_of_bracket (by norm_num) cert11
  · exact mem_derived_of_bracket (by norm_num) cert12
  · exact mem_derived_of_bracket (by norm_num) cert13

/-! ## PERFECTNESS and NON-SOLVABILITY. -/

/-- ★★ THE DERIVATION LIE ALGEBRA IS PERFECT: `⁅⊤,⊤⁆ = ⊤`. Every generator `bL k`
    lies in the derived ideal (`bL_mem_derived`), and the generators span `⊤`
    (`bL_span_top`), so the derived ideal's underlying submodule is all of `⊤`. The
    14-dim Lie algebra equals its own derived ideal — the structural opposite of a
    solvable radical, derived forward from the banked bracket table. -/
theorem derivationLieQ_perfect :
    (⁅(⊤ : LieIdeal ℚ derivationLieQ), ⊤⁆ : LieIdeal ℚ derivationLieQ) = ⊤ := by
  rw [← LieSubmodule.toSubmodule_eq_top, eq_top_iff, ← bL_span_top, Submodule.span_le]
  rintro x ⟨k, rfl⟩
  exact bL_mem_derived k

/-- The Lie algebra is nontrivial: `⊤ ≠ ⊥`, because the basis vector `bL 0` is nonzero
    (a basis vector is never zero). Anti-vacuity for the non-solvability claim. -/
theorem derivationLieQ_top_ne_bot : (⊤ : LieIdeal ℚ derivationLieQ) ≠ ⊥ := by
  intro h
  have hmem : bL 0 ∈ (⊥ : LieIdeal ℚ derivationLieQ) := h ▸ LieSubmodule.mem_top _
  rw [LieSubmodule.mem_bot] at hmem
  exact bLbasis.ne_zero 0 ((bLbasis_eq 0).trans hmem)

/-- ★★ THE DERIVATION LIE ALGEBRA IS NOT SOLVABLE. Perfectness forces the derived
    series to be CONSTANT `⊤` (`derivedSeries _ _ 1 = ⁅⊤,⊤⁆ = ⊤`, so every later term
    is `⊤` too), but a solvable algebra would have some derived term equal `⊥`; since
    `⊤ ≠ ⊥` (nontrivial), no such term exists. A perfect, nonzero Lie algebra is not
    solvable — the necessary structural edge of semisimplicity/simplicity, here PROVED
    forward from the banked bracket table. -/
theorem derivationLieQ_not_solvable : ¬ LieAlgebra.IsSolvable derivationLieQ := by
  intro hs
  obtain ⟨k, hk⟩ := (LieAlgebra.isSolvable_iff ℚ derivationLieQ).mp hs
  have htop : LieAlgebra.derivedSeries ℚ derivationLieQ k = ⊤ := by
    apply LieIdeal.derivedSeries_eq_top
    rw [LieAlgebra.derivedSeries_def, LieAlgebra.derivedSeriesOfIdeal_succ,
        LieAlgebra.derivedSeriesOfIdeal_zero]
    exact derivationLieQ_perfect
  rw [htop] at hk
  exact derivationLieQ_top_ne_bot hk

/-- ★ COROLLARY (anti-vacuity W8): the derivation Lie algebra is NOT abelian. If it
    were, every bracket would vanish; but `⁅bL 0, bL 1⁆ = -2 • bL 2` (banked `br_0_1`)
    and `bL 2 ≠ 0` (a basis vector), so `-2 • bL 2 ≠ 0` — a nonzero bracket. The 7-rep
    is no scalar action; the bracket table genuinely bites. -/
theorem derivationLieQ_not_lieAbelian : ¬ IsLieAbelian derivationLieQ := by
  intro h
  have hzero : ⁅bL 0, bL 1⁆ = 0 := h.trivial (bL 0) (bL 1)
  rw [cert2] at hzero
  have hb2 : bL 2 ≠ 0 := bLbasis.ne_zero 2 ∘ (bLbasis_eq 2).trans
  exact hb2 (by
    have := smul_eq_zero.mp hzero
    rcases this with h' | h'
    · norm_num at h'
    · exact h')

end

end Phys.Algebra
