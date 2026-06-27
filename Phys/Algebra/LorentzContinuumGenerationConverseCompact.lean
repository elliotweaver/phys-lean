/-
  Phys.Algebra.LorentzContinuumGenerationConverseCompact — N102: THE CONVERSE GENERATION ON THE
  COMPACT (ROTATION) SECTOR — a two-sided HALF-TURN's polar/KAK compact part IS THE HALF-TURN
  ITSELF (a NONTRIVIAL single two-sided generator), hence lies in the `Module.End` generated
  submonoid `genIsomMonoidLin`, and its bridge-image lies in the `Function.End` generated
  isometry submonoid `genIsomMonoidC2` — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N101 (docs/ROADMAP.md §N102, priority (i) — MEASURE-FIRST, no
  topology). N101 banked the CONVERSE on the BOOST (non-compact) sector: a proper boost `g` is
  EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE, so it IS its own polar POSITIVE part `p^{1/2}`,
  and its compact part collapses to `k = g∘(p^{1/2})⁻¹ = id` — the empty generator word. That
  closed `qvIsomMonoidC ≤ genIsomMonoidC2` on the entire boost sector with NO operator topology.

  ── WHAT THIS NODE BANKS (the genuine NEW joint — the CONVERSE direction, COMPACT sector) ──
  The DUAL collapse. A two-sided HALF-TURN `g := biMulLin u u` for a unit-imaginary `u`
  (`gFormC u u = 1`, `u·u = −1`, `u·(u·z) = −z`) is

      • a `QvC`-ISOMETRY   (`biMulFun_isom` — the `v`-block preserves `gFormC` via the three-factor
                            Born composition law `biMul_gFormC`),
      • EvC-SELF-ADJOINT   (`IsEvCAdjoint g g` — POLARIZING the `v`-block Born isometry
                            `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w` and using the involution
                            `u·((u·(w·u))·u) = w` to move the operator across the form), and
      • an INVOLUTION      (`g∘g = id`, the two-sided square law `u·((u·(v·u))·u) = v` lifted across
                            the FAITHFUL bridge `endToFunEnd`),

  but — unlike the boost — it is NOT positive-semidefinite (it negates the 2-plane `span{1,u}`).
  Because `g* = g` (self-adjoint) AND `g∘g = id` (involution), the polar positive part is

      p = g*∘g = g∘g = id,   so   p^{1/2} = √(id) = id,   (p^{1/2})⁻¹ = id,

  and the compact part collapses the OTHER way from the boost:

      k := g ∘ (p^{1/2})⁻¹ = g ∘ id = g   ITSELF,

  a NONTRIVIAL rotation that IS a single two-sided generator `biMulLin u u`, trivially in
  `genIsomMonoidLin` (one generator, `Submonoid.subset_closure`); bridged, in `genIsomMonoidC2`
  (the N100 transport `endToFunEnd_genIsomMonoidLin_mem_gen2`). THE CONVERSE GENERATION
  `qvIsomMonoidC ≤ genIsomMonoidC2` is hereby DISCHARGED on a CONCRETE genuinely-COMPACT
  (rotation) generator — the first compact-sector converse-direction result, with NO operator
  topology, NO Lie-group integration, NO posited group.

  The deep structural content (genuinely NEW, the DUAL of N101's boost collapse): a pure rotation
  (half-turn) carries ZERO boost content — it IS its own compact part (`k = g`), NONTRIVIAL,
  exactly the opposite of the boost which contributes `k = id`. KAK `g = k·p` with `p = id` for
  the pure-orthogonal (rotation) factor is exactly the statement that a genuinely-compact element
  IS its own maximal-compact factor — and lands as a generator product, the membership the global
  reverse surjectivity needs, delivered structurally for a concrete compact generator.

    biMulLin_imag_isQvIsomC      — the half-turn `biMulLin u u` is a `QvC`-isometry (`biMulFun_isom`).
    biMulLin_imag_involutive     — the half-turn is an INVOLUTION `g∘g = id` (across the faithful bridge).
    biMulLin_imag_polarized_isom — the polarized `v`-block Born isometry `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w`.
    biMulLin_imag_isEvCAdjoint_self — ★ the half-turn is EvC-SELF-ADJOINT (`IsEvCAdjoint g g`).
    biMulLin_imag_compact_part_eq_self — ★★ THE CONVERSE CORE: the half-turn's polar compact part
                                  `g∘(p^{1/2})⁻¹` EQUALS the half-turn `g` itself (`p = g∘g = id`).
    biMulLin_imag_compact_part_mem_genLin — the compact part (= `g`) `∈ genIsomMonoidLin` (one generator).
    biMulLin_imag_compact_part_mem_gen2  — ★★ THE CONVERSE GENERATION (compact sector): the bridged
                                  compact part `endToFunEnd k ∈ genIsomMonoidC2`.
    biMulLin_e2_compact_part_neg_coord — ★ W8 NON-VACUITY / TEETH: the concrete `e₂` half-turn's
                                  compact part (= itself) NEGATES the real axis `(0,0,1)`, reading
                                  deep-scalar coordinate `−1` (vs the boost compact part = id reads `1`).

  DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93; `op_sqrt_unique_of_injective` N93;
  `specOpN_op_sqrt` N68; `specOpN_inverse` / `specOpN_resolution_of_injective` N87/N88;
  `cutSqrt_pos` N57; `EvC_nonneg` / `lid_isEvCSymm` N58/N87; `biMulFun_isom` / `biMul_gFormC` N55;
  `biMulFun_imag_sq` / `biMulFun_imag_involutive_comp` N94; `e2_alt` / `e2_gFormC_self` N53;
  `biMulLin` / `endToFunEnd` / `endToFunEnd_biMulLin` / `endToFunEnd_injective` N99;
  `genIsomMonoidLin` / `endToFunEnd_genIsomMonoidLin_mem_gen2` N100; the polarized Born
  composition law `gFormC_comp` N50; standard `Submonoid.closure` / `LinearMap` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited operator exponential / continuous functional
  calculus, NOT Mathlib spectral theory, NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ
  as content (the field IS the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the
  compact-part collapse is a fully proved operator equality, not an asserted physics
  identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a genuinely-compact (orthogonal) element
  is its own maximal-compact factor in the KAK split is standard Lie theory (the positive factor
  of an orthogonal transformation is the identity). Here it DESCENDS from the banked
  positive-operator-square-root UNIQUENESS (N93) applied to the half-turn's own self-adjointness
  (the POLARIZED octonionic Born isometry) and involution (the two-sided square law) — with NO
  Mathlib functional calculus, NO operator `exp`, NO operator topology over the derived `Cut`. The
  CONVERSE generation on the COMPACT sector — the membership the global reverse surjectivity needs
  — is delivered structurally for a concrete genuinely-compact generator, the DUAL of the boost
  result: the boost contributes `k = id`, the half-turn contributes `k = g` itself.

  ── THE W1 HEAVY REMAINDER (childed N103, an honest dissolution ticket, NOT closed here) ──
  The FULL converse generation for an ARBITRARY compact isometry (a generic product of half-turns
  / a generic `Spin(9)` element's compact part as a finite `biMulLin` WORD, not just a single
  generator), the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` /
  `ContinuousLinearMap` so the N96 affine path is continuous), and the full `Spin(9)→SO(9)`
  exhaustion remain the genuine group-manifold remainder Mathlib lacks over `Cut`. THIS node
  closes the converse on a concrete compact generator (the dual of N101's boost sector); the
  arbitrary-word generation + topology are childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  isometry / compact / orthogonal / polar / KAK / Cartan / positive part / square-root / spectral
  / generation / generator / Spin / SO(9) / SO⁺(1,9) / non-compact / 2-plane / involution": what
  remains is pure linear algebra over the derived complete ordered field `Cut` and `O Cut` — the
  `Cut`-linear operator `v ↦ u·(v·u)` (`gFormC u u = 1`, `u·u = −1`, `u·(u·z) = −z`) is
  EvC-self-adjoint and squares to `LinearMap.id`, so the inverse-spectral-root of its square is
  `LinearMap.id` (by root uniqueness on the injective square) and its composition with that root
  equals itself; it lies in the generated submonoid; its image under the monoid homomorphism
  `endToFunEnd` lies in the target generated submonoid. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationConverse
import Phys.Algebra.LorentzContinuumSpin9Reach

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The half-turn `biMulLin u u` is a `QvC`-isometry and an involution. -/

/-- The two-sided half-turn `biMulLin u u` (a unit-imaginary `u`, `gFormC u u = 1`) is a
    `QvC`-isometry: the `v`-block `v ↦ u·(v·u)` preserves `gFormC` by the three-factor Born
    composition law (`biMulFun_isom`, via the defeq `biMulLin u u = biMulFun u u` on coordinates). -/
theorem biMulLin_imag_isQvIsomC (u : O Cut) (hu : gFormC u u = 1) :
    IsQvIsomC (biMulLin u u) :=
  fun p => biMulFun_isom hu hu p

/-- The two-sided half-turn `biMulLin u u` is an INVOLUTION at the `Module.End` level:
    `g∘g = LinearMap.id`. Reframed through the FAITHFUL monoid bridge `endToFunEnd` (no coordinate
    unfolding): `endToFunEnd (g∘g) = biMulFun u u ∘ biMulFun u u = id` (the two-sided square law
    `biMulFun_imag_involutive_comp` N94), then `endToFunEnd_injective`. -/
theorem biMulLin_imag_involutive (u : O Cut) (husq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) :
    (biMulLin u u).comp (biMulLin u u) = LinearMap.id := by
  apply endToFunEnd_injective
  have h2 : endToFunEnd ((biMulLin u u).comp (biMulLin u u))
      = biMulFun u u ∘ biMulFun u u := by
    rw [show (biMulLin u u).comp (biMulLin u u) = biMulLin u u * biMulLin u u from rfl,
        map_mul, endToFunEnd_biMulLin]
    rfl
  rw [h2, biMulFun_imag_involutive_comp u husq hL]
  rfl

/-! ## EvC-self-adjointness of the half-turn (the polarized Born isometry of the `v`-block). -/

/-- The application of the linear two-sided operator on coordinates (definitional). -/
theorem biMulLin_apply_coord (u u' : O Cut) (p : STVC) :
    biMulLin u u' p = (p.1, p.2.1, u * (p.2.2 * u')) := rfl

/-- ★ THE POLARIZED `v`-BLOCK BORN ISOMETRY: `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w` for a
    Born-unit `u`. The two-sided multiplication `v ↦ u·(v·u)` preserves the `gFormC` bilinear form.
    POLARIZING the diagonal three-factor Born composition law `biMul_gFormC` (`gFormC (u·(z·u))
    (u·(z·u)) = gFormC u u · (gFormC z z · gFormC u u) = gFormC z z`) in the slot `z ↦ v+w`. The
    bilinear engine of the half-turn's EvC-self-adjointness — theory-native from the Born = self-
    overlap composition law, no coordinate brute. -/
theorem biMulLin_imag_polarized_isom (u : O Cut) (hu : gFormC u u = 1) (v w : O Cut) :
    gFormC (u * (v * u)) (u * (w * u)) = gFormC v w := by
  have hdiag : ∀ z : O Cut, gFormC (u * (z * u)) (u * (z * u)) = gFormC z z := by
    intro z
    rw [biMul_gFormC, hu, mul_one, one_mul]
  have hBadd : u * ((v + w) * u) = u * (v * u) + u * (w * u) := by
    rw [add_mul, mul_add_na]
  have h := hdiag (v + w)
  rw [hBadd] at h
  simp only [gFormC_add_left, gFormC_add_right] at h
  rw [gFormC_symm (u * (w * u)) (u * (v * u)), gFormC_symm w v] at h
  have hv := hdiag v
  have hw := hdiag w
  linarith [h, hv, hw]

/-- ★ THE HALF-TURN IS EvC-SELF-ADJOINT: `IsEvCAdjoint (biMulLin u u) (biMulLin u u)`. The `(t,x)`
    block is fixed; on the `v`-block, `gFormC (u·(v·u)) w = gFormC v (u·(w·u))` follows by writing
    `w = u·((u·(w·u))·u)` (the involution `biMulFun_imag_sq` N94) and applying the polarized Born
    isometry. The orthogonal/compact factor of the polar split is its own adjoint — the dual of the
    boost's self-adjointness, here for a genuinely-compact (rotation) generator. -/
theorem biMulLin_imag_isEvCAdjoint_self (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    IsEvCAdjoint (biMulLin u u) (biMulLin u u) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', w⟩ := q
  rw [biMulLin_apply_coord, biMulLin_apply_coord]
  show t * t' + x * x' + gFormC (u * (v * u)) w
      = t * t' + x * x' + gFormC v (u * (w * u))
  have hBinv : u * ((u * (w * u)) * u) = w := biMulFun_imag_sq u husq hL w
  have key : gFormC (u * (v * u)) w = gFormC v (u * (w * u)) := by
    conv_lhs => rw [← hBinv]
    rw [biMulLin_imag_polarized_isom u hu v (u * (w * u))]
  rw [key]

/-! ## THE CONVERSE CORE — the half-turn's polar compact part is the half-turn itself. -/

/-- ★★ THE CONVERSE CORE — a two-sided HALF-TURN's polar/KAK compact part IS THE HALF-TURN ITSELF.
    For `g := biMulLin u u` (a unit-imaginary `u`), `g` is EvC-self-adjoint
    (`biMulLin_imag_isEvCAdjoint_self`) AND an involution `g∘g = id` (`biMulLin_imag_involutive`),
    so the positive part of the polar split is `p = g*∘g = g∘g = specOpN c uu = id`. BOTH the
    spectral root `specOpN (cutSqrt∘c) uu` (N68) AND `LinearMap.id` are positive operator square
    roots of `p = id` (`id∘id = id`); `p = id` is INJECTIVE, so by the positive-operator-root
    UNIQUENESS (`op_sqrt_unique_of_injective` N93) the spectral root EQUALS `id`. Hence
    `(p^{1/2})⁻¹ = id` and the compact part `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF — a NONTRIVIAL
    single two-sided generator. The DUAL of the boost: the boost is its own POSITIVE part (compact
    part `= id`); the half-turn is its own ORTHOGONAL part (positive part `= id`). -/
theorem biMulLin_imag_compact_part_eq_self (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (biMulLin u u).comp (biMulLin u u) = specOpN c uu ∧
      (biMulLin u u).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = biMulLin u u := by
  set g := biMulLin u u with hg
  have hgisom : IsQvIsomC g := biMulLin_imag_isQvIsomC u hu
  have hgadj : IsEvCAdjoint g g := biMulLin_imag_isEvCAdjoint_self u hu husq hL
  obtain ⟨n, c, uu, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth, hcpos, heq, ?_⟩
  have hgg_id : g.comp g = LinearMap.id := biMulLin_imag_involutive u husq hL
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, hgg_id]
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) uu) (specOpN c uu) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth
  have h_id : IsEvCOpSqrt (LinearMap.id : Module.End Cut STVC) (specOpN c uu) := by
    refine ⟨lid_isEvCSymm, ?_, ?_⟩
    · intro p; rw [LinearMap.id_apply]; exact EvC_nonneg p
    · rw [hspec_id]; rfl
  have hqinj : Function.Injective (specOpN c uu) := by
    rw [hspec_id]; exact fun x y h => h
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) uu = LinearMap.id :=
    op_sqrt_unique_of_injective hqinj h₁ h_id
  have hres : (∑ i, projC (uu i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hinv : (specOpN (fun i => cutSqrt (c i)) uu).comp
      (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = LinearMap.id :=
    specOpN_inverse horth hres hsq_ne
  rw [hsqrt_eq, LinearMap.id_comp] at hinv
  rw [hinv, LinearMap.comp_id]

/-! ## The converse generation on a concrete compact generator. -/

/-- The half-turn's polar compact part (`= g` itself) lies in the `Module.End` generated two-sided
    submonoid `genIsomMonoidLin` — a SINGLE two-sided generator `biMulLin u u`
    (`Submonoid.subset_closure`). The DUAL of the boost (whose compact part was the EMPTY word
    `id`): a genuinely-compact generator contributes a NONTRIVIAL single-generator word. -/
theorem biMulLin_imag_compact_part_mem_genLin (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (biMulLin u u).comp (biMulLin u u) = specOpN c uu ∧
      (biMulLin u u).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) ∈ genIsomMonoidLin := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ := biMulLin_imag_compact_part_eq_self u hu husq hL
  refine ⟨n, c, uu, heq, ?_⟩
  rw [hkself]
  exact Submonoid.subset_closure ⟨u, u, hu, hu, rfl⟩

/-- ★★ THE CONVERSE GENERATION (compact sector) — the bridged polar compact part of a two-sided
    half-turn lies in the `Function.End` generated isometry submonoid `genIsomMonoidC2`. Since the
    compact part IS the half-turn itself (`biMulLin_imag_compact_part_eq_self`), it lies in the
    `Module.End` generated submonoid `genIsomMonoidLin` as a single generator
    (`biMulLin_imag_compact_part_mem_genLin`), and the N100 transport
    `endToFunEnd_genIsomMonoidLin_mem_gen2` carries it across the faithful bridge into
    `genIsomMonoidC2`. The CONVERSE direction of `qvIsomMonoidC ≤ genIsomMonoidC2` — that a
    genuinely-COMPACT isometry's compact part IS a finite generator product — DISCHARGED on a
    concrete compact generator, with NO operator topology. -/
theorem biMulLin_imag_compact_part_mem_gen2 (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (biMulLin u u).comp (biMulLin u u) = specOpN c uu ∧
      endToFunEnd ((biMulLin u u).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, uu, heq, hmem⟩ := biMulLin_imag_compact_part_mem_genLin u hu husq hL
  exact ⟨n, c, uu, heq, endToFunEnd_genIsomMonoidLin_mem_gen2 hmem⟩

/-! ## Non-vacuity and W8 teeth (the concrete `e₂` half-turn over `Cut`). -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE two-sided half-turn `biMulLin e₂ e₂` (the cascade's
    terminal imaginary generator `e₂`, `e₂·e₂ = −1`) realises the converse core: its polar compact
    part EQUALS the half-turn itself, which NEGATES the real axis `(0,0,1) ↦ (0,0,−1)` (since
    `e₂·(1·e₂) = e₂·e₂ = −1`), reading deep-scalar coordinate `re.re.re = −1`. The converse
    generation on the compact sector is NOT vacuous: a genuine NON-identity rotation (the half-turn
    negates `span{1,e₂}`) IS its own compact part, a NONTRIVIAL single generator — the
    DISTINGUISHING fact from the boost, whose compact part is the trivial `id` (reading `1` at the
    real axis, N101). -/
theorem biMulLin_e2_compact_part_neg_coord :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (((biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (-1 : Cut) := by
  obtain ⟨n, c, uu, _, _, _, hkself⟩ :=
    biMulLin_imag_compact_part_eq_self (CD.e2 : O Cut)
      e2_gFormC_self biMulFun_e2_sq e2_alt
  refine ⟨n, c, uu, ?_⟩
  rw [hkself]
  show ((CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut))).re.re.re = (-1 : Cut)
  rw [one_mul, biMulFun_e2_sq]
  rfl

end

end Phys.Algebra
