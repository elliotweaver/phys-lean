/-
  Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle — N124: THE PEEL ORACLE CONSTRUCTION —
  THE FIXED-SUBSPACE-GROWING HOUSEHOLDER REFLECTION (the local step that drives N123's
  finrank-strong-recursion skeleton `reflection_exhaustion`, DISCHARGING its oracle hypothesis and
  closing the full octonion-block exhaustion / `O(8)` surjectivity).

  ===========================================================================
  CONTEXT. N123 banked the abstract finrank-strong-recursion SKELETON `reflection_exhaustion`: given
  a peel ORACLE — for any non-identity `gFormC`-isometry `T`, a reflection `R` from an alphabet
  `refl` with `R · R = 1`, `R · T` again an isometry, and `finrank (fixSubmodule T) <
  finrank (fixSubmodule (R · T))` (the fixed subspace STRICTLY grows) — EVERY `gFormC`-isometry `S`
  lies in `Submonoid.closure refl`, the abstract Cartan–Dieudonné descent on the codimension
  `m = 8 − finrank (fixSubmodule S)`. The ENTIRE global surjectivity was REDUCED to constructing
  that single local peel. THIS node CONSTRUCTS the oracle, discharging the hypothesis.

  ── THE W1 REFRAME (THE ONE LAW) — the ROADMAP's flagged obstruction DISSOLVES ──
  The ROADMAP §N124 frontier guessed the route: the bisector reflection `octReflBlock` (N121) at the
  bisector of a moved `v` and `T v`, with the REAL/IMAGINARY SPLIT handled — because
  `octReflBlock` / `octRefl_reflect_imag` are stated only for IMAGINARY `v` (`star v = −v`) — plus a
  literal operator TOPOLOGY over `Cut` for the `Spin(9)` cover. RETURN TO THE TRUNK: Born =
  self-overlap = POSITIVITY. The Born form `gFormC` on `O Cut` is POSITIVE-DEFINITE
  (`gFormC_pos_of_ne` N115/Polar — `gFormC v v > 0` for every `v ≠ 0`). A positive-definite form
  has HOUSEHOLDER REFLECTIONS, which are PURE bilinear-form linear algebra: the map
  `houseHolder a := v ↦ v − (2·(gFormC a a)⁻¹ · gFormC a v) • a` across the hyperplane
  Born-orthogonal to `a` needs NO octonion multiplication, NO imaginarity condition `star v = −v`,
  NO operator topology. `octReflBlock` was merely the IMAGINARY shadow of this general reflection
  (for imaginary `v`, the two-sided half-turn `n·(v·n)` AGREES with `houseHolder (e − w) v`). So the
  ENTIRE flagged obstruction dissolves at once, and the FULL oracle closes — not a decomposition
  piece. The descent dichotomy of N123 needs nothing more.

  ── WHAT THIS NODE BANKS (the Householder peel + the discharged exhaustion) ──
  `houseHolder a := id − (2·(gFormC a a)⁻¹) • smulRight (gFormCRight a) a` — the Householder
    reflection of the Born form across the hyperplane Born-orthogonal to `a`, built from the bundled
    Born functional `gFormCRight a` (N119) via `LinearMap.smulRight`.
  `houseHolder_apply` — the explicit action `houseHolder a v = v − (2·(gFormC a a)⁻¹·gFormC a v) • a`.
  `houseHolder_fixes_ortho` — `gFormC a u = 0 ⟹ houseHolder a u = u` (fixes the reflecting
    hyperplane, the codim-1 Born-orthogonal complement of `a`).
  `houseHolder_neg_self` — `houseHolder a a = −a` for `gFormC a a ≠ 0` (negates the `a`-line).
  ★ `houseHolder_isom` — `IsGFormCIsom (houseHolder a)` for `gFormC a a ≠ 0`: the reflection
    PRESERVES the Born form. Direct bilinear expansion `gFormC_houseterm` + the field cancellation
    `2·(gFormC a a)⁻¹·gFormC a a = 2` (NO polarization needed — `gFormC` is already bilinear).
  ★ `houseHolder_involutive` — `houseHolder a · houseHolder a = 1` (`gFormC a (houseHolder a v) =
    −gFormC a v`, so two reflections restore `v`). The `R · R = 1` the oracle requires.
  `houseHolderSet := { R | ∃ a, gFormC a a ≠ 0 ∧ R = houseHolder a }` — the reflection alphabet.
  ★★ `houseHolder_oracle` — THE PEEL ORACLE: for a non-identity `gFormC`-isometry `T`, the
    Householder reflection `R := houseHolder (T v − v)` at a moved vector `v` (`T v ≠ v`,
    `isom_ne_id_has_moved`) is an involution, `R · T` is a `gFormC`-isometry, and
    `finrank (fixSubmodule T) < finrank (fixSubmodule (R · T))`. THE KEY scalar identity:
    `gFormC a a = 2·gFormC a (T v)` (with `a := T v − v`), because isometry gives
    `gFormC (T v) (T v) = gFormC v v` — so `R (T v) = v` (the moved image reflected back, O4) while
    every `T`-fixed `u` stays fixed (`gFormC a u = gFormC (T v) u − gFormC v u =
    gFormC (T v) (T u) − gFormC v u = gFormC v u − gFormC v u = 0`, O5), giving
    `fixSubmodule T < fixSubmodule (R · T)` (strict: `v` newly fixed, was moved) and the finrank
    strictly grows (`Submodule.finrank_lt_finrank_of_lt`, `instFiniteOCut` N76).
  ★★ `gFormC_isom_mem_closure` — THE FULL OCTONION-BLOCK EXHAUSTION (oracle DISCHARGED): every
    `gFormC`-isometry of the terminal algebra `O Cut` is a finite product of Householder reflections
    (`Submonoid.closure houseHolderSet`). `houseHolder_oracle` fed into N123's `reflection_exhaustion`
    — the abstract Cartan–Dieudonné structure theorem now a closed theorem over the derived field,
    the oracle no longer a hypothesis.
  W8 teeth: `houseHolder_witness_neg` — the concrete `houseHolder` at the unit-imaginary axis
    `ke2je2` negates it (`houseHolder ke2je2 ke2je2 = −ke2je2`), the Born self-overlap of the image
    reading `gFormC (−ke2je2) (−ke2je2) = 1`, NOT `123`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the Born POSITIVITY `gFormC_pos_of_ne` (N115 — Born = self-overlap =
  positivity, the trunk primitive); the bundled Born functional `gFormCRight` (N119); the recursion
  SKELETON `reflection_exhaustion` + `fixSubmodule` + `IsGFormCIsom` (N123); the finite-dimension
  instance `instFiniteOCut` (N76); the Born bilinearity `gFormC_add/neg/smul/symm` (N-LieAlgebra).
  `LinearMap.smulRight` / `Submodule.finrank_lt_finrank_of_lt` / `Submonoid.closure` / `Module.End`
  standard Mathlib MACHINERY on the DERIVED objects (STANDARD §3), over the derived ℝ
  `ContinuumQ.Cut` and the terminal algebra `O Cut := CD (H Cut)`. NOT a posited Lorentz group /
  SO⁺(1,9), NOT a posited reflection/Clifford group, NOT a posited orthogonal-group structure
  theorem, NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off Cartan–Dieudonné (every orthogonal map a finite product of reflections) as
  the standard structure theorem, the reflections taken as the abstract Householder maps of an
  ASSUMED positive-definite real form. Here the reflection is CONSTRUCTED forward from the trunk:
  the form is the cascade's own Born self-overlap `gFormC`, its positive-definiteness is the DERIVED
  `gFormC_pos_of_ne` (so the normalizing scalar `(gFormC a a)⁻¹` is well-defined because `a := T v − v`
  is genuinely nonzero at a moved vector), the reflect-back is the isometry-forced scalar identity
  `gFormC a a = 2·gFormC a (T v)`, and the strict finrank growth is bounded by the cascade-COUNTED
  dimension `8` (N122). The oracle the global recursion needs is a forced, witnessed construction,
  not a posited group-theoretic input. The ROADMAP guessed a heavier, imaginary-only bisector
  route; the trunk's positivity dissolved it to a single clean Householder reflection.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / Householder / isometry / oracle / Cartan / Dieudonné /
  peel / orthogonal / SO(8) / Spin / hyperplane / fixed / exhaustion / surjectivity / generation":
  what remains is pure linear algebra over the derived complete ordered field `Cut` — for a vector
  `a` with `gFormC a a ≠ 0`, the `Cut`-linear map `houseHolder a := v ↦ v − (2·(gFormC a a)⁻¹·
  gFormC a v) • a` preserves the bilinear form `gFormC`, is involutive, fixes `ker (gFormC a ·)`,
  and for a `gFormC`-preserving `S ≠ id` the choice `a := S v − v` at a moved `v` makes
  `ker (houseHolder a · S − id) ⊋ ker (S − id)`, so every `gFormC`-preserving map lies in the
  submonoid generated by these reflections. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The Householder reflection of the positive-definite Born form. -/

/-- THE HOUSEHOLDER REFLECTION across the hyperplane Born-orthogonal to `a`:
    `houseHolder a := id − (2·(gFormC a a)⁻¹) • smulRight (gFormCRight a) a`, i.e.
    `v ↦ v − (2·(gFormC a a)⁻¹ · gFormC a v) • a`. Built from the bundled Born functional
    `gFormCRight a` (N119) via `LinearMap.smulRight`. PURE bilinear-form linear algebra — NO
    octonion multiplication, NO imaginarity condition. The general reflection of which N121's
    imaginary-only `octReflBlock` is the special shadow. -/
def houseHolder (a : O Cut) : O Cut →ₗ[Cut] O Cut :=
  LinearMap.id - (2 * (gFormC a a)⁻¹) • (LinearMap.smulRight (gFormCRight a) a)

/-- The explicit action: `houseHolder a v = v − (2·(gFormC a a)⁻¹ · gFormC a v) • a`. -/
theorem houseHolder_apply (a v : O Cut) :
    houseHolder a v = v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a := by
  unfold houseHolder
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show v - (2 * (gFormC a a)⁻¹) • (gFormCRight a v • a) = _
  rw [smul_smul]; rfl

/-- The reflection FIXES the hyperplane it reflects across: any `u` Born-orthogonal to `a`
    (`gFormC a u = 0`) is fixed. -/
theorem houseHolder_fixes_ortho {a u : O Cut} (h : gFormC a u = 0) :
    houseHolder a u = u := by
  rw [houseHolder_apply, h, mul_zero, zero_smul, sub_zero]

/-- The reflection NEGATES the `a`-line: `houseHolder a a = −a` for `gFormC a a ≠ 0`. -/
theorem houseHolder_neg_self {a : O Cut} (ha : gFormC a a ≠ 0) :
    houseHolder a a = -a := by
  rw [houseHolder_apply]
  have : (2 * (gFormC a a)⁻¹ * gFormC a a) = 2 := by field_simp
  rw [this]; module

/-! ## The reflection preserves the Born form and is an involution. -/

/-- The bilinear expansion of the two-term form `gFormC (x − s•a) (y − t•a)`. `gFormC` is already
    bilinear (N-LieAlgebra), so NO polarization is needed. -/
theorem gFormC_houseterm (x y a : O Cut) (s t : Cut) :
    gFormC (x - s • a) (y - t • a)
      = gFormC x y - t * gFormC x a - s * gFormC a y + s * t * gFormC a a := by
  simp only [sub_eq_add_neg, gFormC_add_left, gFormC_add_right, gFormC_neg_left,
    octRefl_gFormC_neg_right, gFormC_smul_left, gFormC_smul_right]
  ring

/-- ★ THE REFLECTION PRESERVES THE BORN FORM: `IsGFormCIsom (houseHolder a)` for `gFormC a a ≠ 0`.
    The bilinear expansion `gFormC_houseterm` with the two cross-terms cancelling the square term
    via the field identity `2·(gFormC a a)⁻¹·gFormC a a = 2`. -/
theorem houseHolder_isom {a : O Cut} (ha : gFormC a a ≠ 0) :
    IsGFormCIsom (houseHolder a) := by
  intro u v
  rw [houseHolder_apply, houseHolder_apply, gFormC_houseterm, gFormC_symm u a]
  field_simp; ring

/-- ★ THE REFLECTION IS AN INVOLUTION: `houseHolder a · houseHolder a = 1` for `gFormC a a ≠ 0`.
    `gFormC a (houseHolder a v) = −gFormC a v`, so the two reflections' `a`-coefficients sum to
    zero and `v` is restored. The `R · R = 1` the peel oracle requires. -/
theorem houseHolder_involutive {a : O Cut} (ha : gFormC a a ≠ 0) :
    houseHolder a * houseHolder a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolder_apply, houseHolder_apply]
  have hinner : gFormC a (v - (2 * (gFormC a a)⁻¹ * gFormC a v) • a)
      = gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a := by
    rw [sub_eq_add_neg, gFormC_add_right, octRefl_gFormC_neg_right, gFormC_smul_right]; ring
  rw [hinner]
  have hcoef : (2 * (gFormC a a)⁻¹ * gFormC a v)
      + (2 * (gFormC a a)⁻¹ * (gFormC a v - (2 * (gFormC a a)⁻¹ * gFormC a v) * gFormC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]; rfl

/-! ## The reflection alphabet and the supporting isometry facts. -/

/-- THE REFLECTION ALPHABET: the Householder reflections of vectors of nonzero Born norm. -/
def houseHolderSet : Set (Module.End Cut (O Cut)) :=
  { R | ∃ a : O Cut, gFormC a a ≠ 0 ∧ R = houseHolder a }

/-- Bilinear sub-expansion in the left slot: `gFormC (x − y) w = gFormC x w − gFormC y w`. -/
theorem gFormC_sub_left (x y w : O Cut) : gFormC (x - y) w = gFormC x w - gFormC y w := by
  rw [sub_eq_add_neg, gFormC_add_left, gFormC_neg_left, ← sub_eq_add_neg]

/-- A composite of two Born-isometries is a Born-isometry. -/
theorem IsGFormCIsom.comp {R T : O Cut →ₗ[Cut] O Cut}
    (hR : IsGFormCIsom R) (hT : IsGFormCIsom T) : IsGFormCIsom (R * T) := by
  intro u v
  rw [Module.End.mul_apply, Module.End.mul_apply, hR, hT]

/-- A Born-isometry `T ≠ id` has a moved vector. -/
theorem isom_ne_id_has_moved {T : O Cut →ₗ[Cut] O Cut} (hid : T ≠ LinearMap.id) :
    ∃ v : O Cut, T v ≠ v := by
  by_contra h
  push Not at h
  exact hid (LinearMap.ext h)

/-! ## THE PEEL ORACLE — the fixed-subspace-growing reflection. -/

/-- ★★ THE PEEL ORACLE: for a non-identity `gFormC`-isometry `T`, the Householder reflection
    `R := houseHolder (T v − v)` at a moved vector `v` (`T v ≠ v`) is an involution (`R · R = 1`),
    `R · T` is a `gFormC`-isometry, and its fixed subspace STRICTLY contains `fixSubmodule T`, so
    `finrank (fixSubmodule T) < finrank (fixSubmodule (R · T))`. THE KEY scalar identity
    `gFormC a a = 2·gFormC a (T v)` (with `a := T v − v`) comes from isometry
    `gFormC (T v) (T v) = gFormC v v`; it makes `R (T v) = v` (the moved image reflected exactly
    back), while every `T`-fixed `u` is Born-orthogonal to `a` (`gFormC a u = gFormC (T v) (T u) −
    gFormC v u = 0`) hence stays fixed. The descent oracle N123's recursion skeleton requires,
    CONSTRUCTED — the global octonion-block exhaustion's single missing local step. -/
theorem houseHolder_oracle (T : O Cut →ₗ[Cut] O Cut) (hT : IsGFormCIsom T)
    (hid : T ≠ LinearMap.id) :
    ∃ R ∈ houseHolderSet, R * R = 1 ∧ IsGFormCIsom (R * T) ∧
      Module.finrank Cut (fixSubmodule T)
        < Module.finrank Cut (fixSubmodule (R * T)) := by
  obtain ⟨v, hv⟩ := isom_ne_id_has_moved hid
  set a : O Cut := T v - v with ha_def
  have hane : a ≠ 0 := sub_ne_zero.mpr hv
  have haa : gFormC a a ≠ 0 := ne_of_gt (gFormC_pos_of_ne hane)
  set R : O Cut →ₗ[Cut] O Cut := houseHolder a with hR_def
  have hTvTv : gFormC (T v) (T v) = gFormC v v := hT v v
  -- THE KEY scalar identity: gFormC a a = 2 · gFormC a (T v).
  have hkey : gFormC a a = 2 * gFormC a (T v) := by
    have e1 : gFormC a (T v) = gFormC (T v) (T v) - gFormC v (T v) := by
      rw [ha_def, gFormC_sub_left]
    have e2 : gFormC a a = gFormC (T v) (T v) - gFormC v (T v) - gFormC v (T v) + gFormC v v := by
      rw [ha_def,
          show (T v - v) = (T v - (1 : Cut) • v) by rw [one_smul],
          gFormC_houseterm (T v) (T v) v 1 1, gFormC_symm v (T v)]
      ring
    rw [e1, e2, hTvTv]; ring
  have hbne : gFormC a (T v) ≠ 0 := by
    intro h; rw [h, mul_zero] at hkey; exact haa hkey
  -- O4: the reflection sends `T v` back to `v`.
  have hO4 : R (T v) = v := by
    rw [hR_def, houseHolder_apply]
    have hc : 2 * (gFormC a a)⁻¹ * gFormC a (T v) = 1 := by rw [hkey]; field_simp
    rw [hc, one_smul, ha_def]; abel
  -- O5: every `T`-fixed `u` stays `(R·T)`-fixed.
  have hO5 : ∀ u : O Cut, T u = u → (R * T) u = u := by
    intro u hu
    have hortho : gFormC a u = 0 := by
      rw [ha_def, gFormC_sub_left]
      have hTu : gFormC (T v) u = gFormC v u := by
        have := hT v u; rw [hu] at this; exact this
      rw [hTu]; ring
    rw [Module.End.mul_apply, hu, hR_def, houseHolder_fixes_ortho hortho]
  refine ⟨R, ⟨a, haa, rfl⟩, ?_, ?_, ?_⟩
  · rw [hR_def]; exact houseHolder_involutive haa
  · exact (houseHolder_isom haa).comp hT
  · have hsub : fixSubmodule T ≤ fixSubmodule (R * T) := by
      intro u hu
      rw [mem_fixSubmodule] at hu ⊢
      exact hO5 u hu
    have hvmem : v ∈ fixSubmodule (R * T) := by
      rw [mem_fixSubmodule, Module.End.mul_apply, hO4]
    have hvnotmem : v ∉ fixSubmodule T := by
      rw [mem_fixSubmodule]; exact hv
    have hlt : fixSubmodule T < fixSubmodule (R * T) :=
      lt_of_le_of_ne hsub (fun heq => hvnotmem (heq ▸ hvmem))
    exact Submodule.finrank_lt_finrank_of_lt hlt

/-! ## THE FULL OCTONION-BLOCK EXHAUSTION — the oracle discharged. -/

/-- ★★ THE FULL OCTONION-BLOCK EXHAUSTION (oracle DISCHARGED): every `gFormC`-isometry of the
    terminal algebra `O Cut` is a finite product of Householder reflections
    (`Submonoid.closure houseHolderSet`). N124's `houseHolder_oracle` fed into N123's
    recursion skeleton `reflection_exhaustion` — the abstract Cartan–Dieudonné structure theorem,
    now a CLOSED theorem over the derived field `Cut`, the oracle no longer a hypothesis. The global
    `SO(8)`/`O(8)` surjectivity (every Born-isometry a finite reflection product) DERIVED from the
    banked N49–N123 + the derived ℝ `Cut` + the terminal algebra `O Cut`. -/
theorem gFormC_isom_mem_closure (S : O Cut →ₗ[Cut] O Cut) (hS : IsGFormCIsom S) :
    S ∈ Submonoid.closure houseHolderSet :=
  reflection_exhaustion houseHolderSet houseHolder_oracle S hS

/-! ## W8 teeth — a concrete Householder reflection negating a banked unit axis. -/

/-- ★ W8 — THE HOUSEHOLDER REFLECTION IS CONCRETELY NON-VACUOUS. The Householder reflection at the
    banked unit-imaginary axis `ke2je2` (Born self-overlap `1`, so `gFormC ke2je2 ke2je2 ≠ 0`)
    NEGATES it: `houseHolder ke2je2 ke2je2 = −ke2je2` (`houseHolder_neg_self`). -/
theorem houseHolder_witness_neg :
    houseHolder (ke2je2 : O Cut) (ke2je2 : O Cut) = -(ke2je2 : O Cut) :=
  houseHolder_neg_self (by rw [ke2je2_gFormC_self]; exact one_ne_zero)

/-- ★ W8 TEETH — the Born self-overlap of the negated image reads `1`. The distinguishing read-off:
    `houseHolder ke2je2 ke2je2 = −ke2je2`, so `gFormC (−ke2je2) (−ke2je2) = gFormC ke2je2 ke2je2 = 1`
    (`ke2je2_gFormC_self`) — NOT `123`. -/
theorem houseHolder_witness_self_overlap :
    gFormC (houseHolder (ke2je2 : O Cut) (ke2je2 : O Cut))
           (houseHolder (ke2je2 : O Cut) (ke2je2 : O Cut)) = 1 := by
  rw [houseHolder_witness_neg, gFormC_neg_left, octRefl_gFormC_neg_right, neg_neg]
  exact ke2je2_gFormC_self

end

end Phys.Algebra
