/-
  Phys.Algebra.LorentzContinuumGenerationConverseCompactWord — N103: THE CONVERSE GENERATION ON A
  PRODUCT-OF-HALF-TURNS COMPACT ROTATION — a CONCRETE 2-plane-rotation PRODUCT
  `genTwoPlaneLin u w = biMulLin w w * biMulLin u u` (a product of two two-sided half-turns) is
  EvC-ORTHOGONAL (`g*∘g = id`), so its polar/KAK compact part IS THE PRODUCT ITSELF — a NONTRIVIAL
  TWO-GENERATOR `biMulLin` WORD `∈ genIsomMonoidLin`, whose bridge-image lies in the `Function.End`
  generated isometry submonoid `genIsomMonoidC2` — over the DERIVED ℝ `Cut` and the terminal
  algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N102 (docs/ROADMAP.md §N103, priority (i) — MEASURE-FIRST, no
  topology). N101 banked the CONVERSE on the BOOST (non-compact) sector: a boost's compact part
  collapses to `k = id` (the empty generator word). N102 banked the CONVERSE on a CONCRETE
  genuinely-COMPACT SINGLE generator: a two-sided HALF-TURN `biMulLin u u` IS its own compact part
  (`k = g`, a single generator word). Both ENDPOINTS were banked: the trivial (boost → id) and the
  single-generator (half-turn → itself).

  ── WHAT THIS NODE BANKS (the genuine NEW joint — the CONVERSE direction on a MULTI-GENERATOR) ──
  The first NONTRIVIAL TWO-GENERATOR converse-generation result. The concrete `Cut`-linear 2-plane
  rotation `g := genTwoPlaneLin u w = biMulLin w w * biMulLin u u` (N100) — a PRODUCT of two
  two-sided half-turns `A := biMulLin u u`, `B := biMulLin w w` for unit-imaginaries `u, w`
  (`gFormC u u = 1`, `gFormC w w = 1`, `u·u = −1`, `w·w = −1`, `u·(u·z) = −z`, `w·(w·z) = −z`) — is

      • a `QvC`-ISOMETRY   (`g` is the composition `B∘A` of two `QvC`-isometries, `biMulFun_isom`),
      • EvC-ADJOINT to `genTwoPlaneLin w u`   (the EvC-adjoint of `B∘A` is `A∘B` because each
                            half-turn is EvC-SELF-ADJOINT (N102 `biMulLin_imag_isEvCAdjoint_self`)
                            and the adjoint composes contravariantly, `IsEvCAdjoint.comp`), and
      • EvC-ORTHOGONAL     (`g*∘g = (A∘B)∘(B∘A) = A∘(B∘B)∘A = A∘id∘A = A∘A = id`, since each
                            half-turn is an INVOLUTION `A∘A = id`, `B∘B = id`, N102
                            `biMulLin_imag_involutive`).

  Because `g*∘g = id` (EvC-orthogonal), the polar positive part is

      p = g*∘g = id,   so   p^{1/2} = √(id) = id,   (p^{1/2})⁻¹ = id,

  and the compact part EQUALS the rotation itself:

      k := g ∘ (p^{1/2})⁻¹ = g ∘ id = g   ITSELF,

  a NONTRIVIAL 2-plane rotation that IS a TWO-GENERATOR two-sided word
  `biMulLin w w * biMulLin u u`, in `genIsomMonoidLin` (a product of two `subset_closure`
  generators, `genTwoPlaneLin_mem_genLin` N100); bridged, in `genIsomMonoidC2` (the N100 transport
  `endToFunEnd_genIsomMonoidLin_mem_gen2`). THE CONVERSE GENERATION `qvIsomMonoidC ≤ genIsomMonoidC2`
  is hereby DISCHARGED on a CONCRETE genuinely-COMPACT MULTI-GENERATOR (a 2-plane rotation product),
  the genuinely NEW step past N102's single generator — with NO operator topology, NO Lie-group
  integration, NO posited group.

  The deep structural content (genuinely NEW, extending N102's single generator to a product):
  the EvC-orthogonality `g*∘g = id` of a PRODUCT of self-adjoint involutions is forced by the
  involution + self-adjoint structure — a product of pure-rotation generators carries ZERO boost
  content, IS its own compact part (`p = id`), and lands as a finite generator WORD in the
  generated submonoid, exactly the membership the global reverse surjectivity needs for a
  multi-generator compact part.

    genTwoPlaneLin_isQvIsomC           — the rotation product is a `QvC`-isometry (composition).
    genTwoPlaneLin_isEvCAdjoint        — its EvC-adjoint is the swapped product `genTwoPlaneLin w u`.
    genTwoPlaneLin_adjoint_comp_self   — ★ the EvC-orthogonality `g*∘g = id` (involution collapse).
    genTwoPlaneLin_compact_part_eq_self — ★★ THE CONVERSE CORE: the rotation product's polar compact
                                  part `g∘(p^{1/2})⁻¹` EQUALS the rotation product `g` itself.
    genTwoPlaneLin_compact_part_mem_genLin — the compact part (= `g`) `∈ genIsomMonoidLin` (a
                                  two-generator word).
    genTwoPlaneLin_compact_part_mem_gen2 — ★★ THE CONVERSE GENERATION (multi-generator): the bridged
                                  compact part `endToFunEnd k ∈ genIsomMonoidC2`.
    genTwoPlaneLin_e2je2_compact_part_real_coord — ★ W8 NON-VACUITY / TEETH: the concrete `e₂`,`ιe₂`
                                  rotation product's compact part (= itself) FIXES the real axis
                                  `(0,0,1)`, reading deep-scalar coordinate `re.re.re = 1` (a genuine
                                  2-plane rotation, vs a single half-turn negating it to `−1`, N102).

  DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93; `op_sqrt_unique_of_injective` N93;
  `specOpN_op_sqrt` N68; `specOpN_inverse` / `specOpN_resolution_of_injective` N87/N88;
  `cutSqrt_pos` N57; `EvC_nonneg` / `lid_isEvCSymm` N58/N87; `biMulFun_isom` N55;
  `biMulLin_imag_isQvIsomC` / `biMulLin_imag_isEvCAdjoint_self` / `biMulLin_imag_involutive` N102;
  `IsEvCAdjoint.comp` N52; `genTwoPlaneLin` / `genTwoPlaneLin_mem_genLin` /
  `genTwoPlaneLin_e2je2_fixes_one` N100; `endToFunEnd` / `endToFunEnd_apply` N99;
  `endToFunEnd_genIsomMonoidLin_mem_gen2` N100; standard `Submonoid` / `LinearMap` MACHINERY on the
  DERIVED objects, STANDARD §3), NOT a posited operator exponential / continuous functional
  calculus, NOT Mathlib spectral theory, NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ
  as content (the field IS the DERIVED `Cut`), NOT a bridge-in-the-forbidden-sense (the
  compact-part collapse is a fully proved operator equality, not an asserted physics
  identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a product of (pseudo-)orthogonal
  reflections / involutions is orthogonal, hence its own maximal-compact factor in the KAK split,
  is standard Lie theory. Here it DESCENDS from the banked positive-operator-square-root UNIQUENESS
  (N93) applied to the PRODUCT's own EvC-orthogonality, which is itself forced by composing two
  banked self-adjoint involutions (N102) contravariantly — with NO Mathlib functional calculus, NO
  operator `exp`, NO operator topology over the derived `Cut`. The CONVERSE generation extended from
  a single compact generator (N102) to a NONTRIVIAL MULTI-GENERATOR WORD — the membership the global
  reverse surjectivity needs for a generic Spin(9) compact part of word-length two.

  ── THE W1 HEAVY REMAINDER (childed N104, an honest dissolution ticket, NOT closed here) ──
  The FULL converse generation for an ARBITRARY compact isometry (a generic `Spin(9)` element's
  compact part as a finite `biMulLin` WORD of UNBOUNDED length, not a concrete word of length two),
  the literal operator TOPOLOGY over `Cut` (`TopologicalSpace (Module.End Cut STVC)` /
  `ContinuousLinearMap` so the N96 affine path is continuous), and the full `Spin(9)→SO(9)`
  exhaustion remain the genuine group-manifold remainder Mathlib lacks over `Cut`. THIS node closes
  the converse on a concrete two-generator compact word (extending N102's single generator); the
  unbounded-word generation + topology are childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  isometry / compact / orthogonal / polar / KAK / Cartan / positive part / square-root / spectral /
  generation / generator / Spin / SO(9) / SO⁺(1,9) / non-compact / 2-plane / involution / product":
  what remains is pure linear algebra over the derived complete ordered field `Cut` and `O Cut` —
  the `Cut`-linear operator `g := biMulLin w w * biMulLin u u`, a composition of two operators that
  each preserve `gFormC` and square to `LinearMap.id`, is itself form-preserving, has form-adjoint
  `biMulLin u u * biMulLin w w`, and the adjoint-composite `g*∘g` collapses to `LinearMap.id`; the
  inverse-spectral-root of its square is `LinearMap.id` (by root uniqueness on the injective square)
  and its composition with that root equals itself; it lies in the generated submonoid; its image
  under the monoid homomorphism `endToFunEnd` lies in the target generated submonoid. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationConverseCompact

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The 2-plane-rotation product is a `QvC`-isometry, EvC-adjoint to its swap, EvC-orthogonal. -/

/-- The concrete `Cut`-linear 2-plane rotation `genTwoPlaneLin u w = biMulLin w w * biMulLin u u`
    (a PRODUCT of two two-sided half-turns) is a `QvC`-isometry — the composition `B∘A` of two
    `QvC`-isometries each given by `biMulLin_imag_isQvIsomC` (the `v`-block three-factor Born
    composition law preserves `gFormC`). -/
theorem genTwoPlaneLin_isQvIsomC (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    IsQvIsomC (genTwoPlaneLin u w) := by
  intro p
  show QvC (genTwoPlaneLin u w p) = QvC p
  have hgp : genTwoPlaneLin u w p = biMulLin w w (biMulLin u u p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC w hw (biMulLin u u p), biMulLin_imag_isQvIsomC u hu p]

/-- The EvC-adjoint of the rotation product `genTwoPlaneLin u w = B∘A` is the SWAPPED product
    `genTwoPlaneLin w u = A∘B`. Each half-turn is EvC-SELF-ADJOINT
    (`biMulLin_imag_isEvCAdjoint_self` N102), and the EvC-adjoint composes contravariantly
    (`IsEvCAdjoint.comp` — `(B∘A)* = A*∘B* = A∘B`). -/
theorem genTwoPlaneLin_isEvCAdjoint (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    IsEvCAdjoint (genTwoPlaneLin u w) (genTwoPlaneLin w u) :=
  IsEvCAdjoint.comp (biMulLin_imag_isEvCAdjoint_self w hw hwss hwL)
                    (biMulLin_imag_isEvCAdjoint_self u hu huss huL)

/-- ★ THE EvC-ORTHOGONALITY of the rotation product: `g*∘g = id`. With `g = B∘A`,
    `g* = A∘B`, so `g*∘g = (A∘B)∘(B∘A) = A∘(B∘B)∘A = A∘id∘A = A∘A = id` — each half-turn is an
    INVOLUTION (`biMulLin_imag_involutive` N102, `A∘A = id`, `B∘B = id`). The product of two
    self-adjoint involutions is EvC-orthogonal — the structural fact that collapses the polar
    positive part to the identity. -/
theorem genTwoPlaneLin_adjoint_comp_self (u w : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id := by
  show (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u) = LinearMap.id
  have hBB : biMulLin w w * biMulLin w w = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive w hwss hwL
  have hAA : biMulLin u u * biMulLin u u = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive u huss huL
  calc (biMulLin u u * biMulLin w w) * (biMulLin w w * biMulLin u u)
      = biMulLin u u * ((biMulLin w w * biMulLin w w) * biMulLin u u) := by
        rw [mul_assoc, mul_assoc]
    _ = biMulLin u u * ((1 : Module.End Cut STVC) * biMulLin u u) := by rw [hBB]
    _ = biMulLin u u * biMulLin u u := by rw [one_mul]
    _ = 1 := hAA

/-! ## THE CONVERSE CORE — the rotation product's polar compact part is the product itself. -/

/-- ★★ THE CONVERSE CORE — a CONCRETE 2-plane-rotation PRODUCT's polar/KAK compact part IS THE
    PRODUCT ITSELF. For `g := genTwoPlaneLin u w = biMulLin w w * biMulLin u u`, `g` is a
    `QvC`-isometry (`genTwoPlaneLin_isQvIsomC`) with EvC-adjoint `h := genTwoPlaneLin w u`
    (`genTwoPlaneLin_isEvCAdjoint`), and `g` is EvC-ORTHOGONAL: `p := h∘g = id`
    (`genTwoPlaneLin_adjoint_comp_self`). BOTH the spectral root `specOpN (cutSqrt∘c) uu` (N68) AND
    `LinearMap.id` are positive operator square roots of `p = specOpN c uu = id`; `p = id` is
    INJECTIVE, so by the positive-operator-root UNIQUENESS (`op_sqrt_unique_of_injective` N93) the
    spectral root EQUALS `id`. Hence `(p^{1/2})⁻¹ = id` and the compact part
    `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF — a NONTRIVIAL TWO-GENERATOR rotation word. The
    multi-generator extension of N102's single half-turn (which was its own compact part): a PRODUCT
    of half-turns is likewise its own compact part. -/
theorem genTwoPlaneLin_compact_part_eq_self (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = specOpN c uu ∧
      (genTwoPlaneLin u w).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        = genTwoPlaneLin u w := by
  set g := genTwoPlaneLin u w with hg
  set h := genTwoPlaneLin w u with hh
  have hgisom : IsQvIsomC g := genTwoPlaneLin_isQvIsomC u w hu hw
  have hgadj : IsEvCAdjoint g h :=
    genTwoPlaneLin_isEvCAdjoint u w hu hw huss huL hwss hwL
  obtain ⟨n, c, uu, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth, hcpos, heq, ?_⟩
  have hhg_id : h.comp g = LinearMap.id :=
    genTwoPlaneLin_adjoint_comp_self u w huss huL hwss hwL
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, hhg_id]
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

/-! ## The converse generation on a concrete multi-generator (two-half-turn product). -/

/-- The rotation product's polar compact part (`= g` itself) lies in the `Module.End` generated
    two-sided submonoid `genIsomMonoidLin` — a TWO-GENERATOR word `biMulLin w w * biMulLin u u`
    (`genTwoPlaneLin_mem_genLin` N100, `mul_mem` of two `subset_closure` generators). The
    multi-generator extension of N102 (where the compact part was a SINGLE generator). -/
theorem genTwoPlaneLin_compact_part_mem_genLin (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = specOpN c uu ∧
      (genTwoPlaneLin u w).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) ∈ genIsomMonoidLin := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ :=
    genTwoPlaneLin_compact_part_eq_self u w hu hw huss huL hwss hwL
  refine ⟨n, c, uu, heq, ?_⟩
  rw [hkself]
  exact genTwoPlaneLin_mem_genLin u w hu hw

/-- ★★ THE CONVERSE GENERATION (multi-generator sector) — the bridged polar compact part of a
    CONCRETE 2-plane-rotation PRODUCT lies in the `Function.End` generated isometry submonoid
    `genIsomMonoidC2`. Since the compact part IS the rotation product itself
    (`genTwoPlaneLin_compact_part_eq_self`), it lies in `genIsomMonoidLin` as a TWO-GENERATOR word
    (`genTwoPlaneLin_compact_part_mem_genLin`), and the N100 transport
    `endToFunEnd_genIsomMonoidLin_mem_gen2` carries it across the faithful bridge into
    `genIsomMonoidC2`. The CONVERSE direction of `qvIsomMonoidC ≤ genIsomMonoidC2` — that a
    genuinely-COMPACT MULTI-GENERATOR isometry's compact part IS a finite generator product —
    DISCHARGED on a concrete two-generator compact word, with NO operator topology. -/
theorem genTwoPlaneLin_compact_part_mem_gen2 (u w : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = specOpN c uu ∧
      endToFunEnd ((genTwoPlaneLin u w).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, uu, heq, hmem⟩ :=
    genTwoPlaneLin_compact_part_mem_genLin u w hu hw huss huL hwss hwL
  exact ⟨n, c, uu, heq, endToFunEnd_genIsomMonoidLin_mem_gen2 hmem⟩

/-! ## Non-vacuity and W8 teeth (the concrete `e₂`, `ιe₂` rotation product over `Cut`). -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE two-plane rotation product `genTwoPlaneLin e₂ ιe₂`
    (`= biMulLin ιe₂ ιe₂ * biMulLin e₂ e₂`, the product of two distinct anticommuting half-turns)
    realises the converse core: its polar compact part EQUALS the rotation product itself, which
    FIXES the real axis `(0,0,1) ↦ (0,0,1)` (`genTwoPlaneLin_e2je2_fixes_one` N100 — the two
    half-turns each negate the real component, so the product preserves it), reading deep-scalar
    coordinate `re.re.re = 1`. The converse generation on the multi-generator sector is NOT vacuous:
    a genuine NON-identity 2-plane rotation (it rotates `span{e₂, ιe₂}`) IS its own compact part, a
    NONTRIVIAL TWO-GENERATOR word — the DISTINGUISHING fact from a SINGLE half-turn, whose compact
    part (= itself) NEGATES the real axis reading `−1` (N102). -/
theorem genTwoPlaneLin_e2je2_compact_part_real_coord :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      ((((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (1 : Cut) := by
  obtain ⟨n, c, uu, _, _, _, hkself⟩ :=
    genTwoPlaneLin_compact_part_eq_self (CD.e2 : O Cut) (je2 : O Cut)
      e2_gFormC_self je2_gFormC_self biMulFun_e2_sq e2_alt je2_sq je2_alt
  refine ⟨n, c, uu, ?_⟩
  rw [hkself]
  have h : (endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)))
        ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := genTwoPlaneLin_e2je2_fixes_one
  rw [endToFunEnd_apply] at h
  rw [h]
  rfl

end

end Phys.Algebra
