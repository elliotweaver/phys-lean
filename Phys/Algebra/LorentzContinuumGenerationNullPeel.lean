/-
  Phys.Algebra.LorentzContinuumGenerationNullPeel — N126: THE NULL-DIFFERENCE TWO-REFLECTION
  PEEL-BACK (the indefinite-Cartan–Dieudonné null case — the genuinely-indefinite content N125's
  anisotropic peel oracle explicitly scoped out).

  ===========================================================================
  CONTEXT. N125 banked the ANISOTROPIC peel oracle `houseHolderM_oracle` over the full 10-dim
  spacetime `STVC = Cut × Cut × O Cut` carrying the indefinite Minkowski form `BvC` (signature
  `(1,9)`): a `BvC`-isometry `T` with a moved `v` whose DIFFERENCE `a := T v − v` is ANISOTROPIC
  (`BvC a a ≠ 0`) admits the single indefinite Householder reflection `houseHolderM a`, growing the
  fixed subspace. N125 explicitly scoped out the genuinely-indefinite NULL case: for an indefinite
  form `a ≠ 0` does NOT force `BvC a a ≠ 0` — the moved difference can be NULL/isotropic
  (`BvC a a = 0`), and then the normalizer `(BvC a a)⁻¹` of `houseHolderM a` is undefined. That is
  the ONLY place positivity was load-bearing in N124's positive-definite peel.

  ── THE MEASURE (the ROADMAP §N126 priority (i) KEY question; W1/W9 measure-first, done by HAND
     against the banked `BvC` bilinearity, NOT guessing) ──
  For a `BvC`-isometry `T` and a moved `v`, set `a := T v − v`, `b := T v + v`. Pure bilinearity +
  the isometry equation `BvC (T v)(T v) = BvC v v` give TWO trunk identities:
      (P)  BvC a b = 0                    — the difference is `BvC`-orthogonal to the sum.
      (N)  BvC a a + BvC b b = 4·BvC v v  — the norm-sum identity.
  So if `v` is ANISOTROPIC (`BvC v v ≠ 0`) at least one of `a`, `b` is anisotropic (THE DICHOTOMY).
  When the difference `a` is NULL (`BvC a a = 0`), (N) forces the sum `b` to be ANISOTROPIC, and the
  TWO-reflection composite `houseHolderM v ∘ houseHolderM b` sends `T v ↦ −v ↦ v`. EVERY step is
  `BvC` bilinearity + the isometry equation + `houseHolderM_neg_self`. POSITIVITY IS NOWHERE USED —
  only the anisotropy of `v` (a genuine SPACELIKE possibility the indefinite signature permits). The
  null obstruction DISSOLVES through the sum auxiliary — the trunk's own bilinearity, not a posited
  indefinite-Cartan–Dieudonné structure theorem.

  ── WHAT THIS NODE BANKS ──
  `houseHolderM_sendback` — the general send-back: anisotropic `c` with `2·BvC c w = BvC c c` ⟹
    `houseHolderM c w = w − c`.
  `BvC_isom_coef_diff` / `BvC_isom_coef_sum` — the difference/sum reflect-back coefficient identities.
  `BvC_isom_diff_perp_sum` — (P): `BvC (T v − v) (T v + v) = 0`.
  `BvC_isom_diff_sum_norm` — (N): `BvC a a + BvC b b = 4·BvC v v`.
  `isom_moved_aniso_dichotomy` — at least one of the difference/sum is anisotropic when `v` is.
  `houseHolderM_diff_sends_back` — `houseHolderM (T v − v) (T v) = v` (single-reflection / aniso route).
  `houseHolderM_sum_sends_neg` — `houseHolderM (T v + v) (T v) = −v` (the null-route auxiliary).
  ★★ `houseHolderM_null_peel_back` — THE NULL-DIFFERENCE PEEL-BACK: for a `BvC`-isometry `T` with an
    anisotropic moved `v`, a product of at most TWO `houseHolderMSet` reflections (each a
    `BvC`-isometry) sends `T v` back to `v`, EVEN when `T v − v` is null.
  W8 teeth (genuinely-indefinite): `nullVec` / `BvC_nullVec_self = 0` (a genuine null vector via the
    banked unit imaginary `CD.e2`), `wVec` an isometric image of the spacelike `mSpaceUnit` whose
    moved difference `wVec − mSpaceUnit = nullVec` is NULL (`wVec_sub_mSpaceUnit_null`),
    `houseHolderM_null_two_reflection_witness` (the two-reflection composite peels `wVec ↦ mSpaceUnit`),
    `houseHolderM_null_peel_self_overlap` (the peeled self-overlap reads `−1`, NOT `126`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the reflection `houseHolderM`, the alphabet `houseHolderMSet`, the
  isometry predicate `IsBvIsomLin`, `houseHolderM_isom`/`_neg_self` (N125); the Minkowski form `BvC`
  and its bilinearity `BvC_add_left`/`BvC_sub_left`/`BvC_add_right`/`BvC_sub_right`/`BvC_symm`
  (N-LieAlgebra/N125); the unit imaginary `CD.e2`, `e2_gFormC_self = 1` (N53/RotationSubgroup). The
  reflect-back identities are the isometry-forced coefficient identities; the dichotomy is the
  norm-sum identity (N). `Submonoid.closure` / `Submonoid.subset_closure` / `Submonoid.mul_mem` /
  `Module.End` standard Mathlib MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  `SO⁺(1,9)`, NOT a posited indefinite-Cartan–Dieudonné structure theorem, NOT a posited reflection
  group, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full Lorentz group and
  reads off indefinite Cartan–Dieudonné, the null case dispatched by an asserted two-reflection
  decomposition. Here the two-reflection peel is CONSTRUCTED forward from the trunk: the auxiliary is
  the moved SUM, its anisotropy FORCED by the norm-sum identity `BvC a a + BvC b b = 4·BvC v v`
  whenever `v` is anisotropic, the send-back the isometry-forced coefficient identities — the null
  obstruction dissolved through the cascade's own bilinear form, positivity nowhere used. The
  genuinely-indefinite W8 witness (a GENUINE null moved difference, built from the banked unit
  imaginary, peeled through the anisotropic sum) shows the construction reaches exactly the case the
  N125 anisotropic oracle could not.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / boost / rotation / reflection / Householder / Minkowski / null / isotropic /
  anisotropic / spacelike / timelike / peel / isometry / oracle / Cartan / Dieudonné / signature":
  what remains is pure linear algebra over the derived complete ordered field `Cut` — for a
  `BvC`-preserving `S` and a vector `v` with `BvC v v ≠ 0`, a product of at most two maps
  `houseHolderM` (each preserving `BvC`) sends `S v` back to `v`, even when `BvC (S v − v)(S v − v) = 0`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The general send-back and the reflect-back coefficient identities. -/

/-- THE GENERAL SEND-BACK: if `c` is anisotropic (`BvC c c ≠ 0`) and `2·BvC c w = BvC c c`, the
    reflection at `c` sends `w` to `w − c`. The single calculation behind both the difference and
    the sum reflect-back. -/
theorem houseHolderM_sendback {c w : STVC} (hc : BvC c c ≠ 0)
    (hcoef : 2 * BvC c w = BvC c c) :
    houseHolderM c w = w - c := by
  rw [houseHolderM_apply]
  have h1 : 2 * (BvC c c)⁻¹ * BvC c w = 1 := by
    field_simp
    linarith [hcoef]
  rw [h1, one_smul]

/-- THE DIFFERENCE COEFFICIENT IDENTITY: `2·BvC (T v − v) (T v) = BvC (T v − v)(T v − v)` for a
    `BvC`-isometry `T` (the N125 oracle's `hkey`, isolated; signature-independent). -/
theorem BvC_isom_coef_diff {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    2 * BvC (T v - v) (T v) = BvC (T v - v) (T v - v) := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have e1 : BvC (T v - v) (T v) = BvC (T v) (T v) - BvC v (T v) := by rw [BvC_sub_left]
  have e2 : BvC (T v - v) (T v - v)
      = BvC (T v) (T v) - BvC (T v) v - BvC v (T v) + BvC v v := by
    rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]; ring
  rw [e1, e2, BvC_symm (T v) v, hTvTv]; ring

/-- THE SUM COEFFICIENT IDENTITY: `2·BvC (T v + v) (T v) = BvC (T v + v)(T v + v)` for a
    `BvC`-isometry `T` (the null-route auxiliary's reflect-back). -/
theorem BvC_isom_coef_sum {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    2 * BvC (T v + v) (T v) = BvC (T v + v) (T v + v) := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have e1 : BvC (T v + v) (T v) = BvC (T v) (T v) + BvC v (T v) := by rw [BvC_add_left]
  have e2 : BvC (T v + v) (T v + v)
      = BvC (T v) (T v) + BvC (T v) v + BvC v (T v) + BvC v v := by
    rw [BvC_add_left, BvC_add_right, BvC_add_right]; ring
  rw [e1, e2, BvC_symm (T v) v, hTvTv]; ring

/-! ## The two trunk identities: the difference ⊥ the sum, and the norm-sum. -/

/-- (P) THE PERP IDENTITY: the moved difference is `BvC`-orthogonal to the moved sum,
    `BvC (T v − v) (T v + v) = 0`. -/
theorem BvC_isom_diff_perp_sum {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    BvC (T v - v) (T v + v) = 0 := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  rw [BvC_sub_left, BvC_add_right, BvC_add_right, BvC_symm v (T v), hTvTv]; ring

/-- (N) THE NORM-SUM IDENTITY: `BvC a a + BvC b b = 4·BvC v v` for `a := T v − v`, `b := T v + v`.
    THE DISSOLUTION ENGINE — when the difference `a` is null, this forces the sum `b` anisotropic. -/
theorem BvC_isom_diff_sum_norm {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    BvC (T v - v) (T v - v) + BvC (T v + v) (T v + v) = 4 * BvC v v := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have ea : BvC (T v - v) (T v - v)
      = BvC (T v) (T v) - BvC (T v) v - BvC v (T v) + BvC v v := by
    rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]; ring
  have eb : BvC (T v + v) (T v + v)
      = BvC (T v) (T v) + BvC (T v) v + BvC v (T v) + BvC v v := by
    rw [BvC_add_left, BvC_add_right, BvC_add_right]; ring
  rw [ea, eb, hTvTv]; ring

/-- THE DICHOTOMY: for an anisotropic moved `v` (`BvC v v ≠ 0`), at least one of the moved
    difference / moved sum is anisotropic — by the norm-sum identity, both null would force
    `4·BvC v v = 0`. -/
theorem isom_moved_aniso_dichotomy {T : Module.End Cut STVC} (hT : IsBvIsomLin T) {v : STVC}
    (hvv : BvC v v ≠ 0) :
    BvC (T v - v) (T v - v) ≠ 0 ∨ BvC (T v + v) (T v + v) ≠ 0 := by
  by_contra h
  push Not at h
  obtain ⟨ha, hb⟩ := h
  have hsum := BvC_isom_diff_sum_norm hT v
  rw [ha, hb] at hsum
  apply hvv
  linarith [hsum]

/-! ## The reflect-back sends and the null-difference two-reflection peel-back. -/

/-- The difference reflection sends `T v` back to `v` (the single-reflection / anisotropic route). -/
theorem houseHolderM_diff_sends_back {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC)
    (ha : BvC (T v - v) (T v - v) ≠ 0) :
    houseHolderM (T v - v) (T v) = v := by
  rw [houseHolderM_sendback ha (BvC_isom_coef_diff hT v)]; abel

/-- The sum reflection sends `T v` to `−v` (the auxiliary step of the null route). -/
theorem houseHolderM_sum_sends_neg {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC)
    (hb : BvC (T v + v) (T v + v) ≠ 0) :
    houseHolderM (T v + v) (T v) = -v := by
  rw [houseHolderM_sendback hb (BvC_isom_coef_sum hT v)]; abel

/-- ★★ THE NULL-DIFFERENCE TWO-REFLECTION PEEL-BACK over the 10-dim `STVC`: for a `BvC`-isometry `T`
    with an anisotropic moved `v` (`BvC v v ≠ 0`), a product of at most TWO indefinite Householder
    reflections (each a `BvC`-isometry, all drawn from `houseHolderMSet`) sends `T v` back to `v` —
    EVEN when the moved difference `T v − v` is NULL (`BvC (T v − v)(T v − v) = 0`), the case the
    N125 anisotropic oracle could not reach. The null obstruction DISSOLVES through the SUM auxiliary
    `b := T v + v`: anisotropy of `v` forces `BvC a a + BvC b b = 4·BvC v v ≠ 0`
    (`isom_moved_aniso_dichotomy`), so when the difference `a` is null the sum `b` is anisotropic, and
    `houseHolderM v ∘ houseHolderM b` sends `T v ↦ −v ↦ v`. Positivity NOWHERE used — only the
    anisotropy of `v` the indefinite signature permits as a genuine spacelike possibility. -/
theorem houseHolderM_null_peel_back {T : Module.End Cut STVC} (hT : IsBvIsomLin T)
    {v : STVC} (hvv : BvC v v ≠ 0) :
    ∃ R : Module.End Cut STVC,
      R ∈ Submonoid.closure houseHolderMSet ∧ IsBvIsomLin R ∧ R (T v) = v := by
  rcases isom_moved_aniso_dichotomy hT hvv with ha | hb
  · -- anisotropic difference: single reflection
    refine ⟨houseHolderM (T v - v), ?_, houseHolderM_isom ha, houseHolderM_diff_sends_back hT v ha⟩
    exact Submonoid.subset_closure ⟨T v - v, ha, rfl⟩
  · -- null difference: two reflections through the anisotropic sum auxiliary
    refine ⟨houseHolderM v * houseHolderM (T v + v), ?_,
      (houseHolderM_isom hvv).comp (houseHolderM_isom hb), ?_⟩
    · exact Submonoid.mul_mem _
        (Submonoid.subset_closure ⟨v, hvv, rfl⟩)
        (Submonoid.subset_closure ⟨T v + v, hb, rfl⟩)
    · rw [Module.End.mul_apply, houseHolderM_sum_sends_neg hT v hb, map_neg,
          houseHolderM_neg_self hvv, neg_neg]

/-! ## W8 teeth — a CONCRETE genuinely-indefinite null moved difference, peeled. -/

/-- A GENUINELY NULL vector of `STVC`: `nullVec := (1,0,e₂)`, `BvC nullVec nullVec = 0` — the null
    cone is genuine over the derived `Cut` (the obstruction N125's anisotropic oracle could not
    reach), built from the banked unit imaginary `CD.e2` (`e2_gFormC_self = 1`). -/
def nullVec : STVC := (1, 0, (CD.e2 : O Cut))

theorem BvC_nullVec_self : BvC (nullVec : STVC) (nullVec : STVC) = 0 := by
  show (1 : Cut) * 1 - 0 * 0 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 0
  rw [e2_gFormC_self]; ring

/-- The concrete isometric image `wVec := (1,1,e₂) = mSpaceUnit + nullVec`. Its moved difference
    `wVec − mSpaceUnit = nullVec` is NULL, yet `BvC wVec wVec = −1 = BvC mSpaceUnit mSpaceUnit`
    (a legitimate isometric image of the spacelike unit axis). -/
def wVec : STVC := (1, 1, (CD.e2 : O Cut))

theorem BvC_wVec_self : BvC (wVec : STVC) (wVec : STVC) = -1 := by
  show (1 : Cut) * 1 - 1 * 1 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -1
  rw [e2_gFormC_self]; ring

/-- THE NULL MOVED DIFFERENCE: `wVec − mSpaceUnit = nullVec`, genuinely null — the N125 anisotropic
    oracle's hypothesis `BvC (wVec − mSpaceUnit)(wVec − mSpaceUnit) ≠ 0` FAILS here. -/
theorem wVec_sub_mSpaceUnit_null :
    BvC (wVec - mSpaceUnit) (wVec - mSpaceUnit) = 0 := by
  have h : (wVec : STVC) - mSpaceUnit = nullVec := by
    show ((1:Cut),(1:Cut),(CD.e2 : O Cut)) - (0,1,0) = ((1:Cut),0,(CD.e2 : O Cut))
    ext <;> simp
  rw [h, BvC_nullVec_self]

/-- The anisotropic sum auxiliary `bVec := wVec + mSpaceUnit = (1,2,e₂)` (`BvC = −4 ≠ 0`) — the null
    difference is peeled THROUGH this anisotropic sum. -/
def bVec : STVC := (1, 2, (CD.e2 : O Cut))

theorem BvC_bVec_self : BvC (bVec : STVC) (bVec : STVC) = -4 := by
  show (1 : Cut) * 1 - 2 * 2 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -4
  rw [e2_gFormC_self]; ring

theorem bVec_eq_sum : (bVec : STVC) = wVec + mSpaceUnit := by
  show ((1:Cut),(2:Cut),(CD.e2 : O Cut)) = (1,1,(CD.e2 : O Cut)) + (0,1,0)
  ext <;> simp <;> norm_num

/-- The sum reflection sends `wVec ↦ −mSpaceUnit` (the auxiliary step): `2·BvC bVec wVec = BvC bVec
    bVec` because `wVec` is an isometric image, so `houseHolderM bVec wVec = wVec − bVec = −mSpaceUnit`. -/
theorem houseHolderM_bVec_wVec : houseHolderM (bVec : STVC) (wVec : STVC) = -mSpaceUnit := by
  have hbw : BvC (bVec : STVC) (wVec : STVC) = -2 := by
    show (1 : Cut) * 1 - 2 * 1 - gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = -2
    rw [e2_gFormC_self]; ring
  rw [houseHolderM_apply, hbw, BvC_bVec_self]
  have hc : 2 * ((-4 : Cut))⁻¹ * (-2) = 1 := by norm_num
  rw [hc, one_smul]
  show (wVec : STVC) - bVec = -mSpaceUnit
  rw [bVec_eq_sum]; abel

/-- ★★ W8 — THE NULL-DIFFERENCE TWO-REFLECTION PEEL on a CONCRETE genuinely-indefinite witness: the
    composite `houseHolderM mSpaceUnit ∘ houseHolderM bVec` sends `wVec` back to `mSpaceUnit`, EVEN
    THOUGH the moved difference `wVec − mSpaceUnit = nullVec` is NULL. The single-reflection N125
    oracle is inapplicable (its anisotropy hypothesis fails, `wVec_sub_mSpaceUnit_null`); the null
    obstruction dissolves through the anisotropic sum auxiliary `bVec`. -/
theorem houseHolderM_null_two_reflection_witness :
    houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC)) = mSpaceUnit := by
  rw [houseHolderM_bVec_wVec, map_neg, houseHolderM_neg_self, neg_neg]
  rw [BvC_mSpaceUnit_self]; norm_num

/-- ★ W8 TEETH — the Minkowski self-overlap of the peeled image reads `−1` (= `BvC mSpaceUnit
    mSpaceUnit`), NOT `126`. The distinguishing read-off the costume bites. -/
theorem houseHolderM_null_peel_self_overlap :
    BvC (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC)))
        (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC))) = -1 := by
  rw [houseHolderM_null_two_reflection_witness, BvC_mSpaceUnit_self]

end

end Phys.Algebra
