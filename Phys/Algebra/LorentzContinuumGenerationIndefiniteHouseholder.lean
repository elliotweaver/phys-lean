/-
  Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder — N125: THE INDEFINITE-SIGNATURE
  HOUSEHOLDER REFLECTION + THE ANISOTROPIC PEEL ORACLE (lifting N124's positive-definite Householder
  peel from the 8-dim terminal algebra `O Cut` to the FULL 10-dim spacetime `STVC = Cut × Cut × O Cut`
  carrying the INDEFINITE Minkowski form `BvC`, signature `(1,9)`).

  ===========================================================================
  CONTEXT. N124 banked the Householder peel oracle of the POSITIVE-DEFINITE Born form `gFormC` on
  `O Cut` (8-dim, signature `(8)`) — `houseHolder` / `houseHolder_isom` / `houseHolder_involutive` /
  `houseHolder_oracle` / `gFormC_isom_mem_closure`, the full `O(8)` octonion-block exhaustion. The
  full spacetime symmetry is the 10-dim `SO⁺(1,9)` over `STVC`, of which the octonion block is the
  maximal-compact `SO(8)` corner. N125 (ROADMAP §N125 priority (i)) LIFTS the Householder peel to the
  full `STVC` carrying the INDEFINITE polarized Minkowski form
  `BvC p q = t·t' − x·x' − gFormC v v'` (N-LieAlgebra; `BvC_self : BvC p p = QvC p`).

  ── THE MEASURE (the ticket's KEY question; W1/W9 measure-first) ──
  The ticket flags: does the reflect-back scalar identity `BvC a a = 2·BvC a (T v)` (a := T v − v)
  SURVIVE the indefinite signature, where `BvC a a` can be ≤ 0 for a moved `a`? READING N124's
  `houseHolder_oracle` proof against the banked `BvC` bilinearity (`BvC_add_left`/`BvC_sub_left`/
  `BvC_sub_right`/`BvC_symm` N-LieAlgebra) settles it:
      BvC a a      = BvC(Tv)(Tv) − 2·BvC(Tv)v + BvC v v        [pure bilinearity]
      BvC a (Tv)   = BvC(Tv)(Tv) − BvC v (Tv)                  [pure bilinearity]
  and the isometry equation `BvC (T v)(T v) = BvC v v` (T preserves `BvC`) collapses BOTH to
      BvC a a = 2·(BvC v v − BvC(Tv)v) = 2·BvC a (T v).
  EVERY step is bilinearity + the isometry equation — POSITIVITY IS NOWHERE USED. The identity
  survives the `(1,9)` signature UNCHANGED. N124 used positivity ONLY to know that a moved difference
  `a := T v − v ≠ 0` is automatically ANISOTROPIC (`gFormC a a ≠ 0`).

  ── THE GENUINE NEW CONTENT OF THE INDEFINITE SIGNATURE (W1 honest decomposition) ──
  For an INDEFINITE form `a ≠ 0` does NOT force `BvC a a ≠ 0` — the moved difference can be
  NULL/isotropic (`BvC a a = 0`), and then the normalizing scalar `(BvC a a)⁻¹` is undefined. This is
  the ONLY place positivity was load-bearing. So N125 banks the indefinite Householder reflection and
  the peel oracle UNDER THE EXPLICIT ANISOTROPY HYPOTHESIS the signature forces; the isotropic/null
  case (where every moved difference is null — the standard indefinite-Cartan–Dieudonné complication)
  + the full `SO⁺(1,9)` assembly stitching the boost (spectral) strand to this rotation exhaustion
  are the childed remainder N126.

  ── WHAT THIS NODE BANKS ──
  `BvC_add_right` / `BvC_smul_right` — the banked-missing right-slot bilinearity of `BvC`.
  `BvCRight a` — the bundled Minkowski functional `p ↦ BvC a p` as a `Cut`-linear map.
  `fixSubmoduleM S := ker (S − id)` / `mem_fixSubmoduleM` — the fixed subspace of an `STVC`-operator.
  `IsBvIsomLin S := ∀ p q, BvC (S p)(S q) = BvC p q` (+ `.comp`, `isBvIsomLin_ne_id_has_moved`).
  `houseHolderM a := id − (2·(BvC a a)⁻¹)•smulRight (BvCRight a) a` — the indefinite Householder
    reflection across the `BvC`-hyperplane orthogonal to an ANISOTROPIC `a`.
  `houseHolderM_apply` / `houseHolderM_fixes_ortho` / `houseHolderM_neg_self`.
  `BvC_houseterm` — the two-term bilinear expansion (`BvC` already bilinear, NO polarization).
  ★ `houseHolderM_isom` — the reflection PRESERVES `BvC` (cross-terms cancel via
    `2·(BvC a a)⁻¹·BvC a a = 2`).
  ★ `houseHolderM_involutive` — `R · R = 1`.
  `houseHolderMSet` — the reflection alphabet.
  ★★ `houseHolderM_oracle` — THE ANISOTROPIC PEEL ORACLE over the 10-dim `STVC`: for a `BvC`-isometry
    `T` with a moved `v` whose difference `a := T v − v` is anisotropic, `R := houseHolderM a` is an
    involution, `R · T` a `BvC`-isometry, and `finrank (fixSubmoduleM T) < finrank (fixSubmoduleM (R·T))`.
    THE KEY identity `BvC a a = 2·BvC a (T v)` survives the indefinite signature (above).
  W8 teeth: `houseHolderM_witness_neg_T` (TIMELIKE unit axis `(1,0,0)`, `BvC = 1`, negated) +
    `houseHolderM_witness_neg_X` (SPACELIKE NEGATIVE-norm unit axis `(0,1,0)`, `BvC = −1`, negated —
    the genuinely-indefinite demonstration that positivity is NOT required, only anisotropy) +
    `houseHolderM_witness_self_overlap_T` (Minkowski self-overlap of the reflected timelike image
    reads `1`, NOT `125`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the indefinite Minkowski form `BvC` is the polarization of the cascade's
  own Born quadratic form `QvC` (N-LieAlgebra, `BvC_self`); its bilinearity `BvC_add_left`/
  `BvC_sub_left`/`BvC_sub_right`/`BvC_symm` (N-LieAlgebra); the finite-dimension `finrank_STVC = 10`
  (N122); the reflect-back identity is the isometry-forced `BvC a a = 2·BvC a (T v)`; the strict
  finrank growth via `Submodule.finrank_lt_finrank_of_lt` on the finite-dimensional `STVC`. The
  positive-definite `O Cut` Householder peel (N124) is the template; the indefinite version replaces
  positivity by the explicit anisotropy hypothesis. `LinearMap.smulRight` / `Submodule.finrank_lt_finrank_of_lt`
  / `Module.End` standard Mathlib MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  `SO⁺(1,9)`, NOT a posited reflection/Clifford group, NOT a posited orthogonal-group structure
  theorem, NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full Lorentz group
  `SO⁺(1,9)` and reads off indefinite Cartan–Dieudonné, the reflections taken as the abstract
  Householder maps of an ASSUMED real Minkowski form. Here the reflection is CONSTRUCTED forward from
  the trunk: the form is the cascade's own Born quadratic `QvC` polarized to `BvC`, the reflect-back
  is the isometry-forced `BvC a a = 2·BvC a (T v)` (signature-independent), the strict finrank growth
  bounded by the cascade-COUNTED dimension `10` (N122). The genuinely-indefinite W8 spacelike witness
  (a negative-norm axis carrying a clean reflection) shows positivity is NOT a premise — only the
  anisotropy the signature itself forces.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / boost / rotation / reflection / Householder / Minkowski / metric / signature /
  timelike / spacelike / null / isotropic / anisotropic / isometry / peel / oracle / fixed /
  orthogonal / SO⁺(1,9) / Spin": what remains is pure linear algebra over the derived complete
  ordered field `Cut` — for a vector `a` with the bilinear `BvC a a ≠ 0`, the `Cut`-linear map
  `houseHolderM a := p ↦ p − (2·(BvC a a)⁻¹·BvC a p) • a` preserves the bilinear form `BvC`, is
  involutive, fixes `ker (BvC a ·)`, and for a `BvC`-preserving `S ≠ id` the choice `a := S v − v` at
  a moved `v` with `BvC a a ≠ 0` makes `ker (houseHolderM a · S − id) ⊋ ker (S − id)`. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle
import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The right-slot bilinearity of the indefinite Minkowski form `BvC`. -/

/-- `BvC` is additive in the right slot (by symmetry from `BvC_add_left`). -/
theorem BvC_add_right (p q q' : STVC) : BvC p (q + q') = BvC p q + BvC p q' := by
  rw [BvC_symm p (q + q'), BvC_add_left, BvC_symm q p, BvC_symm q' p]

/-- `BvC` is `Cut`-homogeneous in the right slot. -/
theorem BvC_smul_right (c : Cut) (p q : STVC) : BvC p (c • q) = c * BvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * (c • t') - x * (c • x') - gFormC v (c • v') = c * (t * t' - x * x' - gFormC v v')
  rw [gFormC_smul_right]; show t * (c * t') - x * (c * x') - c * gFormC v v' = _; ring

/-- THE BUNDLED MINKOWSKI FUNCTIONAL `BvCRight a : p ↦ BvC a p` as a `Cut`-linear map. The indefinite
    analogue of N119's `gFormCRight`; its kernel is the `BvC`-orthogonal hyperplane. -/
def BvCRight (a : STVC) : STVC →ₗ[Cut] Cut where
  toFun := fun p => BvC a p
  map_add' := BvC_add_right a
  map_smul' := fun c p => by simpa using BvC_smul_right c a p

/-! ## The fixed subspace and the linear isometry predicate on `STVC`. -/

/-- THE FIXED SUBSPACE of an `STVC`-operator: `ker (S − id)`, the vectors `S` leaves untouched. -/
def fixSubmoduleM (S : Module.End Cut STVC) : Submodule Cut STVC :=
  LinearMap.ker (S - LinearMap.id)

/-- Membership in the fixed subspace: `p ∈ fixSubmoduleM S ↔ S p = p`. -/
theorem mem_fixSubmoduleM (S : Module.End Cut STVC) (p : STVC) :
    p ∈ fixSubmoduleM S ↔ S p = p := by
  unfold fixSubmoduleM
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

/-- THE LINEAR `BvC`-ISOMETRY PREDICATE on `STVC`-operators: `∀ p q, BvC (S p)(S q) = BvC p q`. -/
def IsBvIsomLin (S : Module.End Cut STVC) : Prop := ∀ p q : STVC, BvC (S p) (S q) = BvC p q

/-- A composite of two linear `BvC`-isometries is a linear `BvC`-isometry. -/
theorem IsBvIsomLin.comp {R T : Module.End Cut STVC}
    (hR : IsBvIsomLin R) (hT : IsBvIsomLin T) : IsBvIsomLin (R * T) := by
  intro p q
  rw [Module.End.mul_apply, Module.End.mul_apply, hR, hT]

/-- A linear `BvC`-isometry `T ≠ id` has a moved vector. -/
theorem isBvIsomLin_ne_id_has_moved {T : Module.End Cut STVC} (hid : T ≠ LinearMap.id) :
    ∃ p : STVC, T p ≠ p := by
  by_contra h
  push Not at h
  exact hid (LinearMap.ext h)

/-! ## The indefinite Householder reflection. -/

/-- THE INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION across the `BvC`-hyperplane orthogonal to an
    ANISOTROPIC `a` (`BvC a a ≠ 0`): `houseHolderM a := id − (2·(BvC a a)⁻¹)•smulRight (BvCRight a) a`,
    i.e. `p ↦ p − (2·(BvC a a)⁻¹·BvC a p) • a`. The lift of N124's positive-definite `houseHolder`
    from `O Cut` to the full indefinite `STVC`. PURE bilinear-form linear algebra — positivity
    replaced by the explicit anisotropy hypothesis the `(1,9)` signature forces. -/
def houseHolderM (a : STVC) : Module.End Cut STVC :=
  LinearMap.id - (2 * (BvC a a)⁻¹) • (LinearMap.smulRight (BvCRight a) a)

/-- The explicit action: `houseHolderM a p = p − (2·(BvC a a)⁻¹·BvC a p) • a`. -/
theorem houseHolderM_apply (a p : STVC) :
    houseHolderM a p = p - (2 * (BvC a a)⁻¹ * BvC a p) • a := by
  unfold houseHolderM
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show p - (2 * (BvC a a)⁻¹) • (BvCRight a p • a) = _
  rw [smul_smul]; rfl

/-- The reflection FIXES the hyperplane it reflects across: any `u` `BvC`-orthogonal to `a` is
    fixed. -/
theorem houseHolderM_fixes_ortho {a u : STVC} (h : BvC a u = 0) :
    houseHolderM a u = u := by
  rw [houseHolderM_apply, h, mul_zero, zero_smul, sub_zero]

/-- The reflection NEGATES the `a`-line: `houseHolderM a a = −a` for `BvC a a ≠ 0`. -/
theorem houseHolderM_neg_self {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a a = -a := by
  rw [houseHolderM_apply]
  have : (2 * (BvC a a)⁻¹ * BvC a a) = 2 := by field_simp
  rw [this]; module

/-! ## The reflection preserves `BvC` and is an involution. -/

/-- The bilinear expansion `BvC (x − s•a) (y − t•a)`. `BvC` is already bilinear, so NO polarization
    is needed. -/
theorem BvC_houseterm (x y a : STVC) (s t : Cut) :
    BvC (x - s • a) (y - t • a)
      = BvC x y - t * BvC x a - s * BvC a y + s * t * BvC a a := by
  rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]
  have hsa_y : BvC (s • a) y = s * BvC a y := by rw [BvC_symm, BvC_smul_right, BvC_symm]
  have hx_ta : BvC x (t • a) = t * BvC x a := by rw [BvC_smul_right]
  have hsa_ta : BvC (s • a) (t • a) = s * t * BvC a a := by
    rw [BvC_smul_right, BvC_symm (s • a) a, BvC_smul_right]; ring
  rw [hsa_y, hx_ta, hsa_ta]; ring

/-- ★ THE REFLECTION PRESERVES THE MINKOWSKI FORM: `IsBvIsomLin (houseHolderM a)` for `BvC a a ≠ 0`.
    The bilinear expansion `BvC_houseterm` with the two cross-terms cancelling the square term via
    the field identity `2·(BvC a a)⁻¹·BvC a a = 2`. -/
theorem houseHolderM_isom {a : STVC} (ha : BvC a a ≠ 0) :
    IsBvIsomLin (houseHolderM a) := by
  intro u v
  rw [houseHolderM_apply, houseHolderM_apply, BvC_houseterm, BvC_symm u a]
  field_simp; ring

/-- ★ THE REFLECTION IS AN INVOLUTION: `houseHolderM a · houseHolderM a = 1` for `BvC a a ≠ 0`.
    The `R · R = 1` the peel oracle requires. -/
theorem houseHolderM_involutive {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a * houseHolderM a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolderM_apply, houseHolderM_apply]
  have hinner : BvC a (v - (2 * (BvC a a)⁻¹ * BvC a v) • a)
      = BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a := by
    rw [BvC_sub_right, BvC_smul_right]
  rw [hinner]
  have hcoef : (2 * (BvC a a)⁻¹ * BvC a v)
      + (2 * (BvC a a)⁻¹ * (BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]; rfl

/-! ## The reflection alphabet and the ANISOTROPIC peel oracle. -/

/-- THE INDEFINITE REFLECTION ALPHABET: the Householder reflections of vectors of nonzero Minkowski
    norm (anisotropic vectors). -/
def houseHolderMSet : Set (Module.End Cut STVC) :=
  { R | ∃ a : STVC, BvC a a ≠ 0 ∧ R = houseHolderM a }

/-- ★★ THE ANISOTROPIC PEEL ORACLE over the 10-dim `STVC`: for a linear `BvC`-isometry `T` with a
    moved vector `v` whose difference `a := T v − v` is ANISOTROPIC (`BvC a a ≠ 0`), the indefinite
    Householder reflection `R := houseHolderM a` is an involution (`R · R = 1`), `R · T` is a
    `BvC`-isometry, and its fixed subspace STRICTLY contains `fixSubmoduleM T`, so
    `finrank (fixSubmoduleM T) < finrank (fixSubmoduleM (R · T))`. THE KEY scalar identity
    `BvC a a = 2·BvC a (T v)` (a := T v − v) survives the indefinite signature UNCHANGED — pure
    bilinearity + the isometry equation `BvC (T v)(T v) = BvC v v` — so `R (T v) = v` (the moved image
    reflected exactly back) while every `T`-fixed `u` is `BvC`-orthogonal to `a` hence stays fixed.
    The local peel of N124, lifted from the positive-definite `O Cut` to the full indefinite `STVC`;
    positivity replaced by the explicit anisotropy hypothesis the signature forces. -/
theorem houseHolderM_oracle (T : Module.End Cut STVC) (hT : IsBvIsomLin T)
    {v : STVC} (hv : T v ≠ v) (haniso : BvC (T v - v) (T v - v) ≠ 0) :
    ∃ R ∈ houseHolderMSet, R * R = 1 ∧ IsBvIsomLin (R * T) ∧
      Module.finrank Cut (fixSubmoduleM T)
        < Module.finrank Cut (fixSubmoduleM (R * T)) := by
  set a : STVC := T v - v with ha_def
  have haa : BvC a a ≠ 0 := haniso
  set R : Module.End Cut STVC := houseHolderM a with hR_def
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  -- THE KEY scalar identity (survives the indefinite signature): BvC a a = 2 · BvC a (T v).
  have hkey : BvC a a = 2 * BvC a (T v) := by
    have e1 : BvC a (T v) = BvC (T v) (T v) - BvC v (T v) := by
      rw [ha_def, BvC_sub_left]
    have e2 : BvC a a = BvC (T v) (T v) - BvC v (T v) - BvC v (T v) + BvC v v := by
      rw [ha_def,
          show (T v - v) = (T v - (1 : Cut) • v) by rw [one_smul],
          BvC_houseterm (T v) (T v) v 1 1, BvC_symm v (T v)]
      ring
    rw [e1, e2, hTvTv]; ring
  have hbne : BvC a (T v) ≠ 0 := by
    intro h; rw [h, mul_zero] at hkey; exact haa hkey
  -- O4: the reflection sends `T v` back to `v`.
  have hO4 : R (T v) = v := by
    rw [hR_def, houseHolderM_apply]
    have hc : 2 * (BvC a a)⁻¹ * BvC a (T v) = 1 := by rw [hkey]; field_simp
    rw [hc, one_smul, ha_def]; abel
  -- O5: every `T`-fixed `u` stays `(R·T)`-fixed.
  have hO5 : ∀ u : STVC, T u = u → (R * T) u = u := by
    intro u hu
    have hortho : BvC a u = 0 := by
      rw [ha_def, BvC_sub_left]
      have hTu : BvC (T v) u = BvC v u := by
        have := hT v u; rw [hu] at this; exact this
      rw [hTu]; ring
    rw [Module.End.mul_apply, hu, hR_def, houseHolderM_fixes_ortho hortho]
  refine ⟨R, ⟨a, haa, rfl⟩, ?_, ?_, ?_⟩
  · rw [hR_def]; exact houseHolderM_involutive haa
  · exact (houseHolderM_isom haa).comp hT
  · have hsub : fixSubmoduleM T ≤ fixSubmoduleM (R * T) := by
      intro u hu
      rw [mem_fixSubmoduleM] at hu ⊢
      exact hO5 u hu
    have hvmem : v ∈ fixSubmoduleM (R * T) := by
      rw [mem_fixSubmoduleM, Module.End.mul_apply, hO4]
    have hvnotmem : v ∉ fixSubmoduleM T := by
      rw [mem_fixSubmoduleM]; exact hv
    have hlt : fixSubmoduleM T < fixSubmoduleM (R * T) :=
      lt_of_le_of_ne hsub (fun heq => hvnotmem (heq ▸ hvmem))
    exact Submodule.finrank_lt_finrank_of_lt hlt

/-! ## W8 teeth — concrete timelike + spacelike reflections (the genuinely-indefinite demo). -/

/-- The timelike unit axis `(1,0,0)` of `STVC` (Minkowski self-overlap `+1`). -/
def mTimeUnit : STVC := (1, 0, 0)

/-- The spacelike unit axis `(0,1,0)` of `STVC` (Minkowski self-overlap `−1`). -/
def mSpaceUnit : STVC := (0, 1, 0)

/-- The timelike unit axis has positive Minkowski self-overlap `BvC = 1`. -/
theorem BvC_mTimeUnit_self : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) = 1 := by
  show (1 : Cut) * 1 - 0 * 0 - gFormC 0 0 = 1
  rw [gFormC_zero_left]; ring

/-- The spacelike unit axis has NEGATIVE Minkowski self-overlap `BvC = −1` — the genuinely-indefinite
    direction the positive-definite `O Cut` form never produced. -/
theorem BvC_mSpaceUnit_self : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) = -1 := by
  show (0 : Cut) * 0 - 1 * 1 - gFormC 0 0 = -1
  rw [gFormC_zero_left]; ring

/-- ★ W8 — the indefinite Householder reflection at the TIMELIKE unit axis negates it. -/
theorem houseHolderM_witness_neg_T :
    houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC) = -(mTimeUnit : STVC) :=
  houseHolderM_neg_self (by rw [BvC_mTimeUnit_self]; exact one_ne_zero)

/-- ★ W8 — the indefinite Householder reflection at the SPACELIKE (NEGATIVE-norm) unit axis negates
    it. THE GENUINELY-INDEFINITE DEMONSTRATION: a negative-`BvC`-norm vector still carries a clean
    reflection — positivity is NOT required of the indefinite Householder peel, only the anisotropy
    `BvC a a ≠ 0` (here `−1 ≠ 0`). N124's positive-definite peel never had such a witness. -/
theorem houseHolderM_witness_neg_X :
    houseHolderM (mSpaceUnit : STVC) (mSpaceUnit : STVC) = -(mSpaceUnit : STVC) :=
  houseHolderM_neg_self (by rw [BvC_mSpaceUnit_self]; exact neg_ne_zero.mpr one_ne_zero)

/-- ★ W8 TEETH — the Minkowski self-overlap of the reflected timelike axis reads `1`. The
    distinguishing read-off: `houseHolderM mTimeUnit mTimeUnit = −mTimeUnit`, so
    `BvC (−mTimeUnit) (−mTimeUnit) = BvC mTimeUnit mTimeUnit = 1` (`BvC_mTimeUnit_self`) — NOT `125`. -/
theorem houseHolderM_witness_self_overlap_T :
    BvC (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC))
        (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)) = 1 := by
  rw [houseHolderM_witness_neg_T, BvC_neg_left, BvC_symm, BvC_neg_left, BvC_symm, neg_neg]
  exact BvC_mTimeUnit_self

end

end Phys.Algebra
