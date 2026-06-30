/-
  Phys.Algebra.SpacetimeLightCone — N199: THE LIGHT CONE / NULL STRUCTURE and the WITT INDEX
  of the Lorentzian determinant form on the self-adjoint 2×2 matrices over the terminal algebra.
  ===========================================================================
  A GENUINELY DIFFERENT FACE of the (1,9) termination. N43 (`SpacetimeSignature.lean`) exhibited
  ONE split `STV = timeSub ⊕ spaceSub`, with `Qv` positive-definite on the dim-1 `timeSub` and
  negative-definite on the dim-9 `spaceSub`. N198 (`SpacetimeSignatureInertia.lean`) proved the
  INERTIA INDICES — every positive-definite (timelike) subspace has `finrank ≤ 1`, every
  negative-definite (spacelike) one has `finrank ≤ 9`, both achieved. Both N43 and N198 touch ONLY
  DEFINITE subspaces; NEITHER ever exhibited a NULL vector, addressed the form's ISOTROPY, or
  measured the totally-isotropic dimension.

  THIS module opens the third, genuinely-different invariant of the same form: the NULL STRUCTURE
  (the light cone) and the WITT INDEX. These are a DIFFERENT geometric object (the light cone —
  the locus `Qv = 0` — versus the two definite cones), a DIFFERENT property class (ISOTROPY versus
  definiteness), and a DIFFERENT invariant (the Witt index — the maximal dimension of a
  totally-isotropic subspace — versus the inertia indices). Crucially, over the rational ground ℚ
  isotropy is NOT automatic: a definite (anisotropic) form represents zero only trivially. The
  Lorentzian form does represent zero, and we exhibit an explicit RATIONAL null vector to prove it.

  THE TRUNK INPUT (Born = self-overlap = positivity). The Witt bound rests on the SAME N198
  transversality mechanism, now between a totally-null subspace and the banked negative-definite
  `spaceSub`: a common nonzero vector `w` would have `Qv w = 0` (null) and `Qv w < 0` (space block,
  `Qv_neg_on_space`), impossible. So `W ⊓ spaceSub = ⊥`, and the submodule dimension formula with
  `finrank spaceSub = 9` and `finrank (W ⊔ spaceSub) ≤ finrank STV = 10` forces `finrank W ≤ 1`.

  THE DERIVATION (each step a theorem, foundations-only, forward from the banked N43/N198 objects):

    lightVec / lightVecMinus — the two explicit RATIONAL future/past light-cone vectors
                       `(1, ±1, 0)` (time `1`, one spatial unit, octonion block `0`).
    IsTotallyNull W  — `Qv` vanishes identically on `W` (a totally-isotropic / null subspace).
    lightVec_null / lightVecMinus_null — `Qv (1, ±1, 0) = 1 − 1 − 0 = 0`: the cone vectors are null.
    form_isotropic   — ★ THE LIGHT CONE EXISTS: the determinant form represents zero nontrivially
                       (`∃ v ≠ 0, Qv v = 0`). A genuinely new property — the definite blocks of
                       N43/N198 are anisotropic; the full indefinite form is ISOTROPIC.
    lightVec_not_mem_timeSub / lightVec_not_mem_spaceSub — a null vector is neither timelike nor
                       spacelike: the light cone is a region disjoint from BOTH definite cones off
                       the origin.
    nullLine_totallyNull — the line `ℚ·lightVec` is totally null (`Qv (c•lightVec) = c²·0 = 0`).
    finrank_nullLine — `finrank (ℚ·lightVec) = 1` (the null line achieves the Witt bound).
    totallyNull_inf_spaceSub_eq_bot — a totally-null subspace meets the negative-definite space
                       block only at `0` (`Qv w = 0` vs `Qv w < 0`).
    wittIndex_le_one — ★★ THE WITT INDEX IS ≤ 1: every totally-null subspace has `finrank ≤ 1`
                       (the N198 dimension-formula mechanism with the banked `finrank spaceSub = 9`
                       and `finrank STV = 10`).
    witt_index_eq_one — ★ bound + achievement: the Witt index is EXACTLY `1`.
    twoNull_span_not_totallyNull — ★ W8 non-vacuity with teeth: the 2-plane spanned by the two
                       null vectors `(1,1,0)`, `(1,−1,0)` is NOT totally null — it contains their
                       sum `(2,0,0)` with `Qv = 4 ≠ 0`. The `≤ 1` bound is not about an empty set.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The Witt index / light-cone structure of a
  Lorentzian form is standard bilinear-form / causal-structure theory; here it is DERIVED for the
  specific Born determinant form over the terminal algebra — the isotropy is witnessed by an
  explicit RATIONAL null vector and the Witt bound descends from the banked definiteness of the
  N43 space block (itself from Born positivity), with NO posited light cone, NO posited causal
  structure, NO posited Witt decomposition, NO Mathlib ℝ/ℂ as content (the whole statement is over
  the cascade ground ring ℚ). N43/N198 measured the definite cones; this measures the null cone —
  a genuinely different invariant of the same termination, not a re-pin.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "light cone / null / causal / isotropic /
  timelike / spacelike / Witt / Lorentzian": what remains is the theorem that the quadratic form
  `Qv` on the 10-dim ℚ-space `STV = ℚ × ℚ × O ℚ` represents zero nontrivially (`(1,1,0)` is a
  nonzero vector with `Qv = 0`), and every subspace on which `Qv` vanishes identically has
  `finrank ≤ 1`, the bound achieved by `ℚ·(1,1,0)`. No theorem STATEMENT needs a physics word.

  Everything is over the derived field ℚ and the terminal algebra `O ℚ = CD (H ℚ)` (pure algebra —
  NO continuum, NO Mathlib ℝ/ℂ as content). `Submodule`/`Module.finrank`/the submodule dimension
  formula are MACHINERY on the DERIVED objects. NO posited light cone, NO bridge.

  Foundations-only: `[propext, Classical.choice, Quot.sound]`. No sorry, no posited axiom,
  no kernel-trust bypass.
-/
import Phys.Algebra.SpacetimeSignatureInertia
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The light-cone vectors and totally-null subspaces. -/

/-- A future light-cone vector of the determinant form: time `1`, one spatial unit, octonion
    block `0`. `Qv lightVec = 1² − 1² − 0 = 0`. -/
def lightVec : STV := ((1 : ℚ), (1 : ℚ), (0 : O ℚ))

/-- A past light-cone vector: time `1`, the opposite spatial unit. `Qv lightVecMinus = 0`. -/
def lightVecMinus : STV := ((1 : ℚ), (-1 : ℚ), (0 : O ℚ))

/-- A subspace is TOTALLY NULL (totally isotropic): the form `Qv` vanishes on every vector. The
    maximal dimension of such a subspace is the Witt index of the form. -/
def IsTotallyNull (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, Qv w = 0

/-- The future light-cone vector is null: `Qv (1,1,0) = 1 − 1 − 0 = 0`. -/
theorem lightVec_null : Qv lightVec = 0 := by
  show Qform (1 : ℚ) (1 : ℚ) (0 : O ℚ) = 0
  unfold Qform gForm reQ
  simp

/-- The past light-cone vector is null. -/
theorem lightVecMinus_null : Qv lightVecMinus = 0 := by
  show Qform (1 : ℚ) (-1 : ℚ) (0 : O ℚ) = 0
  unfold Qform gForm reQ
  simp

/-- The light-cone vector is nonzero (its time component is `1`). -/
theorem lightVec_ne_zero : lightVec ≠ 0 := by
  intro hc
  have := congrArg (fun p => p.1) hc
  simp [lightVec] at this

/-! ## Isotropy: the light cone is non-empty. -/

/-- ★ THE LIGHT CONE EXISTS — the Born determinant form is ISOTROPIC: it represents zero on a
    nonzero vector. This is a genuinely new property: the definite blocks of N43/N198 are
    anisotropic (a definite form represents zero only at `0`); the full indefinite form does
    represent zero, witnessed by the explicit RATIONAL null vector `(1,1,0)`. -/
theorem form_isotropic : ∃ v : STV, v ≠ 0 ∧ Qv v = 0 :=
  ⟨lightVec, lightVec_ne_zero, lightVec_null⟩

/-- A null vector is NOT timelike: it lies off the positive-definite time line (where `Qv > 0`). -/
theorem lightVec_not_mem_timeSub : lightVec ∉ timeSub := by
  intro h
  have := Qv_pos_on_time h lightVec_ne_zero
  rw [lightVec_null] at this
  exact lt_irrefl 0 this

/-- A null vector is NOT spacelike: it lies off the negative-definite space block (where `Qv < 0`).
    Together with `lightVec_not_mem_timeSub`, the light cone is a region disjoint from both definite
    cones (off the origin). -/
theorem lightVec_not_mem_spaceSub : lightVec ∉ spaceSub := by
  intro h
  have := Qv_neg_on_space h lightVec_ne_zero
  rw [lightVec_null] at this
  exact lt_irrefl 0 this

/-! ## The null line and the Witt index. -/

/-- The null line `ℚ·lightVec` — a totally-isotropic subspace achieving the Witt index. -/
def nullLine : Submodule ℚ STV := Submodule.span ℚ {lightVec}

/-- Scaling a null vector keeps it null: `Qv (c • lightVec) = c²·Qv lightVec = 0`. -/
theorem Qv_smul_lightVec (c : ℚ) : Qv (c • lightVec) = 0 := by
  show Qform (c * 1) (c * 1) (c • (0 : O ℚ)) = 0
  unfold Qform gForm reQ
  simp

/-- The null line is totally null: every scalar multiple of `lightVec` has `Qv = 0`. -/
theorem nullLine_totallyNull : IsTotallyNull nullLine := by
  intro w hw
  rw [nullLine, Submodule.mem_span_singleton] at hw
  obtain ⟨c, rfl⟩ := hw
  exact Qv_smul_lightVec c

/-- The null line has dimension `1` (it achieves the Witt bound). -/
theorem finrank_nullLine : Module.finrank ℚ nullLine = 1 := by
  rw [nullLine, finrank_span_singleton lightVec_ne_zero]

/-- A totally-null subspace meets the banked negative-definite space block only at `0`: a common
    nonzero vector would satisfy both `Qv w = 0` (null) and `Qv w < 0` (space block,
    `Qv_neg_on_space`), impossible. -/
theorem totallyNull_inf_spaceSub_eq_bot {W : Submodule ℚ STV} (hW : IsTotallyNull W) :
    W ⊓ spaceSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwS⟩ := hw
  have h0 : Qv w = 0 := hW w hwW
  have hneg : Qv w < 0 := Qv_neg_on_space hwS hne
  rw [h0] at hneg
  exact lt_irrefl 0 hneg

/-- ★★ THE WITT INDEX IS ≤ 1: every totally-null subspace has `finrank ≤ 1`. By the submodule
    dimension formula `finrank (W ⊔ spaceSub) + finrank (W ⊓ spaceSub) = finrank W + finrank
    spaceSub`, the transversality `W ⊓ spaceSub = ⊥` (`finrank = 0`), the banked `finrank
    spaceSub = 9` (N43) and `finrank (W ⊔ spaceSub) ≤ finrank STV = 10`, one gets `finrank W + 9 ≤
    10`, i.e. `finrank W ≤ 1`. No totally-null plane — the maximal isotropic dimension is `1`. -/
theorem wittIndex_le_one {W : Submodule ℚ STV} (hW : IsTotallyNull W) :
    Module.finrank ℚ W ≤ 1 := by
  have hinf : W ⊓ spaceSub = ⊥ := totallyNull_inf_spaceSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W spaceSub
  rw [hinf, finrank_bot, add_zero, finrank_spaceSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ spaceSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

/-- ★ THE WITT INDEX IS EXACTLY 1: the null line `ℚ·lightVec` achieves the bound
    (`nullLine_totallyNull`, `finrank_nullLine`) and no totally-null subspace exceeds it
    (`wittIndex_le_one`). The Lorentzian determinant form is isotropic with maximal isotropic
    dimension `1` — exactly the Witt index of a `(1, n)` signature. -/
theorem witt_index_eq_one :
    IsTotallyNull nullLine ∧ Module.finrank ℚ nullLine = 1 ∧
      (∀ W : Submodule ℚ STV, IsTotallyNull W → Module.finrank ℚ W ≤ 1) :=
  ⟨nullLine_totallyNull, finrank_nullLine, fun _ h => wittIndex_le_one h⟩

/-- ★ W8 NON-VACUITY WITH TEETH: the 2-dim subspace spanned by the two light-cone vectors
    `(1,1,0)`, `(1,−1,0)` is NOT totally null — it contains their sum `(2,0,0)`, where
    `Qv = 2² − 0 − 0 = 4 ≠ 0`. So the `≤ 1` bound is not a statement about an empty set of
    2-planes: there really is no totally-null 2-plane, and this exhibits a plane (spanned by two
    genuinely null vectors) that fails total-nullness. -/
theorem twoNull_span_not_totallyNull :
    ¬ IsTotallyNull (Submodule.span ℚ {lightVec, lightVecMinus}) := by
  intro h
  have hmem : ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) ∈ Submodule.span ℚ {lightVec, lightVecMinus} := by
    have e1 : lightVec ∈ Submodule.span ℚ {lightVec, lightVecMinus} :=
      Submodule.subset_span (by simp)
    have e2 : lightVecMinus ∈ Submodule.span ℚ {lightVec, lightVecMinus} :=
      Submodule.subset_span (by simp)
    have hsum := Submodule.add_mem _ e1 e2
    have hadd : lightVec + lightVecMinus = ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) := by
      show ((1:ℚ)+1, (1:ℚ)+(-1), (0:O ℚ)+0) = _
      norm_num
    rwa [hadd] at hsum
  have hval := h _ hmem
  have hq : Qv ((2 : ℚ), (0 : ℚ), (0 : O ℚ)) = 4 := by
    show Qform (2 : ℚ) (0 : ℚ) (0 : O ℚ) = 4
    unfold Qform gForm reQ
    simp; norm_num
  rw [hq] at hval
  norm_num at hval

end

end Phys.Algebra
