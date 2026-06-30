/-
  Phys.Algebra.SpacetimeSignatureInertia — N198: THE SYLVESTER INERTIA INVARIANCE of
  the Lorentzian determinant form on the self-adjoint 2×2 matrices over the terminal algebra.
  ===========================================================================
  THE GENUINELY-NEW STRENGTHENING of N43 (`SpacetimeSignature.lean`). N43 banked ONE
  decomposition `STV = timeSub ⊕ spaceSub` exhibiting the form as positive-definite on a
  dim-1 block and negative-definite on a dim-9 block (`signature_one_nine`). But exhibiting
  ONE splitting does NOT prove the signature is THE signature: a priori some OTHER subspace
  might be timelike (positive-definite) of dimension 2, which would mean the "single time"
  was an artifact of the chosen split, not forced. THIS module closes that gap — it proves
  SYLVESTER'S LAW OF INERTIA for this form: the positive (timelike) index is EXACTLY 1 and
  the negative (spacelike) index is EXACTLY 9, INVARIANTLY — no subspace on which the form
  is positive-definite has dimension > 1, and none on which it is negative-definite has
  dimension > 9. The single time direction is FORCED, not chosen.

  THE TRUNK INPUT (Born = self-overlap = positivity, one rung up from the form). The whole
  argument rests on N43's two definiteness facts, which descend from Born positivity:
  `Qv_pos_on_time` (the form is positive on the time line) and `Qv_neg_on_space` (the form
  is negative-definite on the space block, the Born self-overlap negated). A timelike
  subspace `W` (positive-definite) and the banked negative-definite `spaceSub` can meet only
  at `0` — a vector in both would have `0 < Qv w` and `Qv w ≤ 0`, impossible. So
  `W ⊓ spaceSub = ⊥`, and the submodule dimension formula
  `finrank (W ⊔ spaceSub) + finrank (W ⊓ spaceSub) = finrank W + finrank spaceSub`
  with `finrank spaceSub = 9` (N43), `finrank (W ⊓ spaceSub) = 0`, and
  `finrank (W ⊔ spaceSub) ≤ finrank STV = 10` (N43) forces `finrank W + 9 ≤ 10`, i.e.
  `finrank W ≤ 1`. The dual argument with `timeSub` (dim 1) bounds every spacelike subspace
  by `10 − 1 = 9`. Both bounds are ACHIEVED by the banked blocks, so the indices are EXACTLY
  `1` and `9`. The maximal timelike dimension is the positive inertia index; the maximal
  spacelike dimension is the negative inertia index; their values `(1, 9)` are the Sylvester
  signature, now proved INVARIANT.

  THE DERIVATION (each step a theorem, foundations-only, forward from the banked N43 objects):

    IsTimelikeSub W  — the form is positive-definite on `W` (a "timelike" subspace).
    IsSpacelikeSub W — the form is negative-definite on `W` (a "spacelike" subspace).
    timeSub_timelike / spaceSub_spacelike — the banked N43 blocks are definite (the
                       achievement half: the bounds below are attained).
    timelike_inf_spaceSub_eq_bot — ★ any timelike subspace meets the banked negative-
                       definite space block only at `0` (positivity vs non-positivity).
    spacelike_inf_timeSub_eq_bot — ★ the dual: any spacelike subspace meets the time line
                       only at `0`.
    timelike_index_le_one  — ★★ EVERY timelike subspace has `finrank ≤ 1` (the submodule
                       dimension formula + `finrank spaceSub = 9` + `finrank STV = 10`).
                       THE UNIQUE TIME — no two independent timelike directions.
    spacelike_index_le_nine — ★★ EVERY spacelike subspace has `finrank ≤ 9` (the dual).
    timelike_index_eq_one  — ★ bound + achievement: the positive index is EXACTLY 1.
    spacelike_index_eq_nine — ★ the negative index is EXACTLY 9.
    signature_inertia_one_nine — ★★★ THE HEADLINE: Sylvester's law of inertia for this
                       form — the positive index is invariantly 1, the negative index
                       invariantly 9. The `(1, 9)` signature is THE signature, derived.
    timePlusSpace_not_timelike — ★ W8 non-vacuity with teeth: the concrete 2-dim subspace
                       `⟨(1,0,0), (0,1,0)⟩` is NOT timelike — it contains the genuinely
                       spacelike vector `(0,1,0)` (`Qv = −1 < 0`). The `≤ 1` bound is not
                       vacuous; there really is no timelike 2-plane.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). Sylvester's law of inertia is a standard
  theorem of bilinear-form theory; here it is DERIVED for the specific Born determinant form
  over the terminal algebra from the banked definiteness of the two N43 blocks (themselves
  descended from Born positivity), with NO posited signature, NO posited bilinear-form
  classification, NO Mathlib ℝ/ℂ as content (the whole statement is over the cascade ground
  ring ℚ; the submodule dimension formula is a ℚ-fact). N43 exhibited a split; this proves it
  is forced — the single time is not a coordinate artifact.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "time / space / Lorentzian / Minkowski
  / signature / timelike / spacelike / inertia": what remains is the theorem that, for the
  quadratic form `Qv` on the 10-dim ℚ-space `STV = ℚ × ℚ × O ℚ`, every subspace on which `Qv`
  is positive-definite has `finrank ≤ 1` and every subspace on which `Qv` is negative-definite
  has `finrank ≤ 9`, both bounds achieved. No theorem STATEMENT needs a physics word.

  Everything is over the derived field ℚ and the terminal algebra `O ℚ = CD (H ℚ)` (pure
  algebra — NO continuum, NO Mathlib ℝ/ℂ as content). `Submodule`/`Module.finrank`/the
  submodule dimension formula are MACHINERY on the DERIVED objects. NO posited signature,
  NO bridge.

  Foundations-only: `[propext, Classical.choice, Quot.sound]`. No sorry, no posited axiom,
  no kernel-trust bypass.
-/
import Phys.Algebra.SpacetimeSignature
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## Timelike and spacelike subspaces of the determinant form. -/

/-- A subspace is TIMELIKE (positive-definite for `Qv`): the form is strictly positive on
    every nonzero vector. The maximal dimension of such a subspace is the positive inertia
    index. -/
def IsTimelikeSub (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, w ≠ 0 → 0 < Qv w

/-- A subspace is SPACELIKE (negative-definite for `Qv`): the form is strictly negative on
    every nonzero vector. The maximal dimension of such a subspace is the negative inertia
    index. -/
def IsSpacelikeSub (W : Submodule ℚ STV) : Prop := ∀ w ∈ W, w ≠ 0 → Qv w < 0

/-- The banked N43 time line is timelike (the achievement half of the positive bound). -/
theorem timeSub_timelike : IsTimelikeSub timeSub := fun _ hw hne => Qv_pos_on_time hw hne

/-- The banked N43 space block is spacelike (the achievement half of the negative bound). -/
theorem spaceSub_spacelike : IsSpacelikeSub spaceSub := fun _ hw hne => Qv_neg_on_space hw hne

/-! ## The transversality of definite subspaces (positivity vs non-positivity). -/

/-- ★ A timelike subspace meets the banked negative-definite space block only at `0`: a
    common nonzero vector would satisfy both `0 < Qv w` (timelike) and `Qv w ≤ 0`
    (space block, `Qv_neg_on_space`), impossible. -/
theorem timelike_inf_spaceSub_eq_bot {W : Submodule ℚ STV} (hW : IsTimelikeSub W) :
    W ⊓ spaceSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwS⟩ := hw
  exact absurd (hW w hwW hne) (not_lt.mpr (le_of_lt (Qv_neg_on_space hwS hne)))

/-- ★ The dual: a spacelike subspace meets the banked positive-definite time line only at
    `0` (`0 < Qv w` on the time line vs `Qv w < 0` spacelike). -/
theorem spacelike_inf_timeSub_eq_bot {W : Submodule ℚ STV} (hW : IsSpacelikeSub W) :
    W ⊓ timeSub = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  by_contra hne
  obtain ⟨hwW, hwT⟩ := hw
  exact absurd (hW w hwW hne) (not_lt.mpr (le_of_lt (Qv_pos_on_time hwT hne)))

/-! ## THE INERTIA BOUNDS — Sylvester's law of inertia for the Born determinant form. -/

/-- ★★ THE UNIQUE TIME: every timelike subspace has `finrank ≤ 1`. By the submodule
    dimension formula `finrank (W ⊔ spaceSub) + finrank (W ⊓ spaceSub) = finrank W +
    finrank spaceSub`, the transversality `W ⊓ spaceSub = ⊥` (`finrank = 0`), the banked
    `finrank spaceSub = 9` and `finrank (W ⊔ spaceSub) ≤ finrank STV = 10`, one gets
    `finrank W + 9 ≤ 10`, i.e. `finrank W ≤ 1`. No two independent timelike directions —
    the single time is forced, not a coordinate artifact of the N43 split. -/
theorem timelike_index_le_one {W : Submodule ℚ STV} (hW : IsTimelikeSub W) :
    Module.finrank ℚ W ≤ 1 := by
  have hinf : W ⊓ spaceSub = ⊥ := timelike_inf_spaceSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W spaceSub
  rw [hinf, finrank_bot, add_zero, finrank_spaceSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ spaceSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

/-- ★★ THE DUAL BOUND: every spacelike subspace has `finrank ≤ 9` (the negative inertia
    index is `≤ 9`), via the dimension formula with the banked `finrank timeSub = 1`. -/
theorem spacelike_index_le_nine {W : Submodule ℚ STV} (hW : IsSpacelikeSub W) :
    Module.finrank ℚ W ≤ 9 := by
  have hinf : W ⊓ timeSub = ⊥ := spacelike_inf_timeSub_eq_bot hW
  have hkey := Submodule.finrank_sup_add_finrank_inf_eq W timeSub
  rw [hinf, finrank_bot, add_zero, finrank_timeSub] at hkey
  have hle : Module.finrank ℚ ↥(W ⊔ timeSub) ≤ 10 := by
    rw [← finrank_STV]; exact Submodule.finrank_le _
  omega

/-- ★ THE POSITIVE INDEX IS EXACTLY 1: the banked time line achieves the bound
    (`timeSub_timelike`, `finrank timeSub = 1`) and no timelike subspace exceeds it
    (`timelike_index_le_one`). -/
theorem timelike_index_eq_one :
    IsTimelikeSub timeSub ∧ Module.finrank ℚ timeSub = 1 ∧
      (∀ W : Submodule ℚ STV, IsTimelikeSub W → Module.finrank ℚ W ≤ 1) :=
  ⟨timeSub_timelike, finrank_timeSub, fun _ h => timelike_index_le_one h⟩

/-- ★ THE NEGATIVE INDEX IS EXACTLY 9: the banked space block achieves the bound
    (`spaceSub_spacelike`, `finrank spaceSub = 9`) and no spacelike subspace exceeds it
    (`spacelike_index_le_nine`). -/
theorem spacelike_index_eq_nine :
    IsSpacelikeSub spaceSub ∧ Module.finrank ℚ spaceSub = 9 ∧
      (∀ W : Submodule ℚ STV, IsSpacelikeSub W → Module.finrank ℚ W ≤ 9) :=
  ⟨spaceSub_spacelike, finrank_spaceSub, fun _ h => spacelike_index_le_nine h⟩

/-- ★★★ THE HEADLINE — SYLVESTER'S LAW OF INERTIA for the Born determinant form. The
    positive (timelike) index is invariantly `1` and the negative (spacelike) index is
    invariantly `9`: every subspace on which `Qv` is positive-definite has `finrank ≤ 1`,
    every subspace on which it is negative-definite has `finrank ≤ 9`, and both bounds are
    achieved by the banked N43 blocks. The `(1, 9)` signature of the self-adjoint `2 × 2`
    matrices over the terminal algebra is THE signature — the single time is forced, not
    chosen, DERIVED from the trunk's Born positivity. -/
theorem signature_inertia_one_nine :
    (IsTimelikeSub timeSub ∧ Module.finrank ℚ timeSub = 1 ∧
      (∀ W : Submodule ℚ STV, IsTimelikeSub W → Module.finrank ℚ W ≤ 1)) ∧
    (IsSpacelikeSub spaceSub ∧ Module.finrank ℚ spaceSub = 9 ∧
      (∀ W : Submodule ℚ STV, IsSpacelikeSub W → Module.finrank ℚ W ≤ 9)) :=
  ⟨timelike_index_eq_one, spacelike_index_eq_nine⟩

/-- ★ W8 NON-VACUITY WITH TEETH: the concrete 2-dim subspace `⟨(1,0,0), (0,1,0)⟩` (the time
    line plus one spatial direction) is NOT timelike. It contains the genuinely spacelike
    vector `(0,1,0)`, where `Qv = Qform 0 1 0 = 0 − 1 − 0 = −1 < 0`. So the `≤ 1` bound is
    not a statement about an empty set of 2-planes — there really is no timelike 2-plane,
    and this exhibits a 2-plane that fails. -/
theorem timePlusSpace_not_timelike :
    ¬ IsTimelikeSub (Submodule.span ℚ
        {((1 : ℚ), (0 : ℚ), (0 : O ℚ)), ((0 : ℚ), (1 : ℚ), (0 : O ℚ))}) := by
  intro h
  have hmem : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ∈ Submodule.span ℚ
      {((1 : ℚ), (0 : ℚ), (0 : O ℚ)), ((0 : ℚ), (1 : ℚ), (0 : O ℚ))} :=
    Submodule.subset_span (by simp)
  have hne : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ≠ 0 := by
    intro hc
    have := congrArg (fun p => p.2.1) hc
    simp at this
  have hmemS : ((0 : ℚ), (1 : ℚ), (0 : O ℚ)) ∈ spaceSub := by
    show ((0 : ℚ), (1 : ℚ), (0 : O ℚ)).1 = 0
    rfl
  have hpos := h _ hmem hne
  have hneg := Qv_neg_on_space hmemS hne
  linarith

end

end Phys.Algebra
