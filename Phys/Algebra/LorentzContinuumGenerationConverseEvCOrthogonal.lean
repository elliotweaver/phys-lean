/-
  Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal — N104: THE GENERAL EvC-ORTHOGONAL
  LEVER — the ABSTRACT, word-length-INDEPENDENT converse-generation core. N102 (a single two-sided
  half-turn IS its own compact part) and N103 (a product of TWO half-turns IS its own compact part)
  BOTH closed via the SAME structural fact:

      an operator `g` that is a `QvC`-ISOMETRY, EvC-ADJOINT to `h`, AND EvC-ORTHOGONAL (`h∘g = id`)
      has polar positive part `p = h∘g = id`, so `p^{1/2} = √(id) = id`, `(p^{1/2})⁻¹ = id`, and the
      polar/KAK compact part `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF.

  THIS node FACTORS that common body into ONE ABSTRACT lemma `evCOrthogonal_compact_part_eq_self`
  with the EvC-orthogonality `h∘g = id` lifted from a DERIVED fact to a HYPOTHESIS — making it
  word-length-INDEPENDENT. Then the GENERAL REDUCTION `evCOrthogonal_word_compact_part_mem_gen2`
  reduces the FULL converse generation `qvIsomMonoidC ≤ genIsomMonoidC2` to a SINGLE clean residual
  (the surjectivity "is every EvC-orthogonal `QvC`-isometry a `biMulLin` word?", childed N105). The
  lever's reach PAST length two is demonstrated with a concrete THREE-GENERATOR word
  `triHalfTurnLin u w x = biMulLin x x * genTwoPlaneLin u w` (a product of THREE half-turns), built
  ON the banked two-word `genTwoPlaneLin` (N100/N103) — over the DERIVED ℝ `Cut` and the terminal
  algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N103 (docs/ROADMAP.md §N104, priority (i)+(ii) — MEASURE-FIRST, no
  topology). N101 banked the boost sector (compact part `= id`, the empty word); N102 a CONCRETE
  genuinely-COMPACT SINGLE generator (a half-turn IS its own compact part); N103 a CONCRETE
  genuinely-COMPACT TWO-GENERATOR WORD (a product of two half-turns IS its own compact part). The
  converse generation now holds on: the trivial (boost → id), the single generator (half-turn →
  itself), and the two-generator word (rotation product → itself) — each via the SAME proof body.

  ── WHAT THIS NODE BANKS (the genuine NEW joint — the ABSTRACT, length-independent lever) ──

  ★ `evCOrthogonal_compact_part_eq_self` — THE ABSTRACT LEVER. The factored N102/N103 body. For ANY
    `g h : Module.End Cut STVC` with `IsQvIsomC g`, `IsEvCAdjoint g h`, AND `h.comp g = id` (the
    EvC-orthogonality as a HYPOTHESIS, NO assumption on word length), the polar positive part
    `p = h∘g = id`, the spectral root `specOpN (cutSqrt∘c) uu = id` (BOTH it and `LinearMap.id` are
    positive operator square roots of the INJECTIVE `p = id`, so the root UNIQUENESS
    `op_sqrt_unique_of_injective` N93 forces equality), `(p^{1/2})⁻¹ = id`, and the compact part
    `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF. Length-INDEPENDENT — it subsumes N102 (length 1) and
    N103 (length 2) and applies to a word of ANY length.

  ★★ `evCOrthogonal_word_compact_part_mem_gen2` — THE GENERAL REDUCTION. For ANY EvC-orthogonal
    `QvC`-isometry `g` (as above) that is ADDITIONALLY a `biMulLin` word (`g ∈ genIsomMonoidLin`),
    the bridged compact part `endToFunEnd (g∘(p^{1/2})⁻¹) ∈ genIsomMonoidC2` — since the compact
    part IS `g`, already a word, the N100 transport `endToFunEnd_genIsomMonoidLin_mem_gen2` lands it.
    THIS reduces the FULL `qvIsomMonoidC ≤ genIsomMonoidC2` to the SINGLE residual: "every
    EvC-orthogonal `QvC`-isometry IS a `biMulLin` word" — the literal `Spin(9)` generation
    surjectivity, the genuine remaining W1 HEAVY content, childed N105. The compact-part-IS-self
    half of the converse is now CLOSED in full generality; only the word-membership half remains.

  ── THE THREE-GENERATOR WORD (priority (ii), demonstrating the lever past length two) ──

  `triHalfTurnLin u w x := biMulLin x x * genTwoPlaneLin u w` — a product of THREE two-sided
  half-turns `C := biMulLin x x`, and the banked two-word `B∘A = genTwoPlaneLin u w` (N100). Built
  ON the banked two-word, NOT re-expanded to three raw half-turns (which the kernel cannot unify in
  bounded time — a W9 instrument wall DISSOLVED by reframing through the trunk). It is:

      • a `QvC`-ISOMETRY   (`C` composed with the banked two-word isometry `genTwoPlaneLin_isQvIsomC`),
      • EvC-ADJOINT to `genTwoPlaneLin w u * biMulLin x x`  (the EvC-adjoint of `C∘(B∘A)` is
                            `(B∘A)*∘C* = genTwoPlaneLin w u ∘ C`, via `IsEvCAdjoint.comp` of the
                            banked two-word adjoint N103 and the N102 self-adjoint half-turn), and
      • EvC-ORTHOGONAL     (`adjoint∘word = (P∘C)∘(C∘(B∘A)) = P∘(C∘C)∘(B∘A) = P∘(B∘A) = id`, the
                            middle involution `C∘C = id` N102 collapses, then the banked two-word
                            orthogonality `genTwoPlaneLin_adjoint_comp_self` N103 finishes),

  so by THE ABSTRACT LEVER its polar compact part IS the three-word itself — a NONTRIVIAL
  THREE-GENERATOR word `∈ genIsomMonoidLin` (`triHalfTurnLin_mem_genLin`), bridged `∈ genIsomMonoidC2`
  (`triHalfTurnLin_compact_part_mem_gen2`). The converse generation now holds for word-length THREE,
  the genuinely NEW step past N103's length two — with NO operator topology, NO Lie-group
  integration, NO posited group.

    evCOrthogonal_compact_part_eq_self      — ★ THE ABSTRACT LEVER (length-independent).
    evCOrthogonal_word_compact_part_mem_gen2 — ★★ THE GENERAL REDUCTION (to word-membership).
    triHalfTurnLin                          — the concrete three-half-turn word (on the banked two-word).
    triHalfTurnLin_isQvIsomC                — the three-word is a `QvC`-isometry.
    triHalfTurnLin_isEvCAdjoint             — its EvC-adjoint is `genTwoPlaneLin w u * biMulLin x x`.
    triHalfTurnLin_adjoint_comp_self        — ★ THE EvC-ORTHOGONALITY (involution collapse + N103).
    triHalfTurnLin_mem_genLin               — the three-word `∈ genIsomMonoidLin` (three generators).
    triHalfTurnLin_compact_part_eq_self     — ★★ THE COMPACT PART = the three-word itself (via lever).
    triHalfTurnLin_compact_part_mem_gen2    — ★★ THE CONVERSE GENERATION (three-generator): bridged
                                              compact part `∈ genIsomMonoidC2`.
    triHalfTurnLin_e2je2e2_compact_part_real_coord — ★ W8 NON-VACUITY / TEETH: the concrete
                                              `e₂`,`ιe₂`,`e₂` three-word's compact part (= itself)
                                              NEGATES the real axis `(0,0,1)`, reading deep-scalar
                                              coordinate `re.re.re = −1` (the two-word FIXES it `+1`,
                                              N103; one more half-turn negates it).

  DERIVED from the trunk (`isometry_compact_part_isQvIsom` N93; `op_sqrt_unique_of_injective` N93;
  `specOpN_op_sqrt` N68; `specOpN_inverse` / `specOpN_resolution_of_injective` N87/N88;
  `cutSqrt_pos` N57; `EvC_nonneg` / `lid_isEvCSymm` N58/N87; `biMulLin_imag_isQvIsomC` /
  `biMulLin_imag_isEvCAdjoint_self` / `biMulLin_imag_involutive` N102; `IsEvCAdjoint.comp` N52;
  `genTwoPlaneLin` / `genTwoPlaneLin_isQvIsomC` / `genTwoPlaneLin_isEvCAdjoint` /
  `genTwoPlaneLin_adjoint_comp_self` / `genTwoPlaneLin_mem_genLin` / `genTwoPlaneLin_e2je2_fixes_one`
  N100/N103; `endToFunEnd` / `endToFunEnd_apply` / `endToFunEnd_genIsomMonoidLin_mem_gen2` N99/N100;
  standard `Submonoid` / `LinearMap` MACHINERY on the DERIVED objects, STANDARD §3), NOT a posited
  operator exponential / continuous functional calculus, NOT Mathlib spectral theory, NOT a posited
  Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED `Cut`), NOT a
  bridge-in-the-forbidden-sense (the compact-part collapse is a fully proved operator equality, not
  an asserted physics identification).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a (pseudo-)orthogonal element is its own
  maximal-compact factor in the KAK split is standard Lie theory. Here the ABSTRACT version DESCENDS
  from the banked positive-operator-square-root UNIQUENESS (N93) applied to the operator's OWN
  EvC-orthogonality — with NO Mathlib functional calculus, NO operator `exp`, NO operator topology
  over the derived `Cut`. The contribution: the compact-part-IS-self half of the converse generation
  is delivered ONCE, abstractly, for a word of ANY length (the lever), reducing the global reverse
  surjectivity to a SINGLE residual (word-membership), and demonstrated concretely past length two.

  ── THE W1 HEAVY REMAINDER (childed N105, an honest dissolution ticket, NOT closed here) ──
  The single residual the reduction isolates: "every EvC-orthogonal `QvC`-isometry IS a `biMulLin`
  word" (the literal `Spin(9)` generation surjectivity), the operator TOPOLOGY over `Cut`
  (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap` so the N96 affine path is
  continuous), and the full `Spin(9)→SO(9)` exhaustion remain the genuine group-manifold remainder
  Mathlib lacks over `Cut`. THIS node closes the compact-part-IS-self half in FULL generality and
  the converse generation at word-length three; the word-membership surjectivity + topology are
  childed onto the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  isometry / compact / orthogonal / polar / KAK / Cartan / positive part / square-root / spectral /
  generation / generator / Spin / SO(9) / SO⁺(1,9) / non-compact / 2-plane / 3-plane / involution /
  product / word / bridge": what remains is pure linear algebra over the derived complete ordered
  field `Cut` and `O Cut` — a `Cut`-linear operator `g` that preserves `gFormC`, has a form-adjoint
  `h` with `h∘g = LinearMap.id`, equals its own inverse-spectral-root composite; if `g` is a finite
  product of the two-sided generators, its image under the monoid homomorphism `endToFunEnd` lies in
  the target generated submonoid. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge-in-the-
  forbidden-sense, NO Mathlib number-system content import (the continuum is the DERIVED `Cut`),
  NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationConverseCompactWord

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE ABSTRACT LEVER — the factored, word-length-independent converse-generation core. -/

/-- ★ THE ABSTRACT LEVER — an EvC-ORTHOGONAL `QvC`-isometry IS its own polar/KAK compact part. The
    factored N102/N103 proof body, with the EvC-orthogonality `h∘g = id` lifted from a DERIVED fact
    to a HYPOTHESIS — making it word-length-INDEPENDENT. For ANY `g h` with `IsQvIsomC g`,
    `IsEvCAdjoint g h`, and `h.comp g = LinearMap.id`: the polar positive part `p = h∘g = id`, so
    BOTH the spectral root `specOpN (cutSqrt∘c) uu` (N68) AND `LinearMap.id` are positive operator
    square roots of the INJECTIVE `p = specOpN c uu = id`; by the positive-operator-root UNIQUENESS
    (`op_sqrt_unique_of_injective` N93) the spectral root EQUALS `id`, hence `(p^{1/2})⁻¹ = id` and
    the compact part `k := g∘(p^{1/2})⁻¹ = g∘id = g` ITSELF. Subsumes N102 (length 1) and N103
    (length 2) and applies to a word of ANY length. -/
theorem evCOrthogonal_compact_part_eq_self (g h : Module.End Cut STVC)
    (hgisom : IsQvIsomC g) (hgadj : IsEvCAdjoint g h)
    (horth : h.comp g = LinearMap.id) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c uu ∧
      g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = g := by
  obtain ⟨n, c, uu, horth_e, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth_e, hcpos, heq, ?_⟩
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, horth]
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) uu) (specOpN c uu) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth_e
  have h_id : IsEvCOpSqrt (LinearMap.id : Module.End Cut STVC) (specOpN c uu) := by
    refine ⟨lid_isEvCSymm, ?_, ?_⟩
    · intro p; rw [LinearMap.id_apply]; exact EvC_nonneg p
    · rw [hspec_id]; rfl
  have hqinj : Function.Injective (specOpN c uu) := by
    rw [hspec_id]; exact fun x y h => h
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) uu = LinearMap.id :=
    op_sqrt_unique_of_injective hqinj h₁ h_id
  have hres : (∑ i, projC (uu i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth_e hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hinv : (specOpN (fun i => cutSqrt (c i)) uu).comp
      (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = LinearMap.id :=
    specOpN_inverse horth_e hres hsq_ne
  rw [hsqrt_eq, LinearMap.id_comp] at hinv
  rw [hinv, LinearMap.comp_id]

/-- ★★ THE GENERAL REDUCTION — an EvC-ORTHOGONAL `QvC`-isometry that is ALSO a `biMulLin` word has
    its bridged compact part in `genIsomMonoidC2`. For ANY `g h` with `IsQvIsomC g`,
    `IsEvCAdjoint g h`, `h.comp g = id`, AND `g ∈ genIsomMonoidLin`: since the compact part IS `g`
    itself (`evCOrthogonal_compact_part_eq_self`), already a word in `genIsomMonoidLin`, the N100
    transport `endToFunEnd_genIsomMonoidLin_mem_gen2` lands the bridged compact part in
    `genIsomMonoidC2`. THIS reduces the FULL converse `qvIsomMonoidC ≤ genIsomMonoidC2` to the SINGLE
    residual: "every EvC-orthogonal `QvC`-isometry IS a `biMulLin` word" — the literal `Spin(9)`
    generation surjectivity, the genuine remaining W1 content (childed N105). The compact-part-IS-self
    half of the converse is CLOSED in full generality; only the word-membership half remains. -/
theorem evCOrthogonal_word_compact_part_mem_gen2 (g h : Module.End Cut STVC)
    (hgisom : IsQvIsomC g) (hgadj : IsEvCAdjoint g h)
    (horth : h.comp g = LinearMap.id) (hword : g ∈ genIsomMonoidLin) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      h.comp g = specOpN c uu ∧
      endToFunEnd (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)) ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ :=
    evCOrthogonal_compact_part_eq_self g h hgisom hgadj horth
  refine ⟨n, c, uu, heq, ?_⟩
  rw [hkself]
  exact endToFunEnd_genIsomMonoidLin_mem_gen2 hword

/-! ## A concrete THREE-generator word (the lever past word-length two), built on the two-word. -/

/-- A three-half-turn word built ON the banked two-word `genTwoPlaneLin u w` (N100):
    `triHalfTurnLin u w x = biMulLin x x * genTwoPlaneLin u w`
    = `biMulLin x x * (biMulLin w w * biMulLin u u)`. Built on the banked two-word — NOT re-expanded
    to three raw half-turns (the kernel cannot unify the triple nesting in bounded time; reframing
    through the trunk's two-word keeps the elaboration shallow). -/
def triHalfTurnLin (u w x : O Cut) : Module.End Cut STVC :=
  biMulLin x x * genTwoPlaneLin u w

/-- The three-word is a `QvC`-isometry — one half-turn `biMulLin x x` composed with the banked
    two-word isometry `genTwoPlaneLin_isQvIsomC` (N103). -/
theorem triHalfTurnLin_isQvIsomC (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    IsQvIsomC (triHalfTurnLin u w x) := by
  intro p
  show QvC (triHalfTurnLin u w x p) = QvC p
  have hgp : triHalfTurnLin u w x p = biMulLin x x (genTwoPlaneLin u w p) := rfl
  rw [hgp, biMulLin_imag_isQvIsomC x hx (genTwoPlaneLin u w p),
      genTwoPlaneLin_isQvIsomC u w hu hw p]

/-- The EvC-adjoint of the three-word `C∘(B∘A)` is `(B∘A)*∘C* = genTwoPlaneLin w u * biMulLin x x`,
    via `IsEvCAdjoint.comp` of the banked two-word adjoint `genTwoPlaneLin_isEvCAdjoint` (N103) and
    the N102 self-adjoint half-turn `biMulLin_imag_isEvCAdjoint_self`. -/
theorem triHalfTurnLin_isEvCAdjoint (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    IsEvCAdjoint (triHalfTurnLin u w x) (genTwoPlaneLin w u * biMulLin x x) := by
  have hC := biMulLin_imag_isEvCAdjoint_self x hx hxss hxL
  have hgen := genTwoPlaneLin_isEvCAdjoint u w hu hw huss huL hwss hwL
  exact hC.comp hgen

/-- ★ THE EvC-ORTHOGONALITY of the three-word: `adjoint∘word = id`. With `g = C∘(B∘A)` and
    `g* = (B∘A)*∘C = P∘C` (`P := genTwoPlaneLin w u`), `g*∘g = (P∘C)∘(C∘(B∘A)) = P∘(C∘C)∘(B∘A) =
    P∘(B∘A) = id`: the middle half-turn is an INVOLUTION (`C∘C = id`, N102 `biMulLin_imag_involutive`)
    and the banked two-word is EvC-orthogonal (`P∘(B∘A) = genTwoPlaneLin w u ∘ genTwoPlaneLin u w =
    id`, N103 `genTwoPlaneLin_adjoint_comp_self`). The product of three self-adjoint involutions /
    rotation generators is EvC-orthogonal — the structural fact (now at length three) that collapses
    the polar positive part to the identity. -/
theorem triHalfTurnLin_adjoint_comp_self (u w x : O Cut)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x) = LinearMap.id := by
  show (genTwoPlaneLin w u * biMulLin x x) * (biMulLin x x * genTwoPlaneLin u w)
      = LinearMap.id
  have hCC : biMulLin x x * biMulLin x x = (1 : Module.End Cut STVC) :=
    biMulLin_imag_involutive x hxss hxL
  have hgen : (genTwoPlaneLin w u).comp (genTwoPlaneLin u w) = LinearMap.id :=
    genTwoPlaneLin_adjoint_comp_self u w huss huL hwss hwL
  set P := genTwoPlaneLin w u
  set Q := genTwoPlaneLin u w
  set C := biMulLin x x
  calc (P * C) * (C * Q)
      = P * ((C * C) * Q) := by rw [mul_assoc, ← mul_assoc C C Q]
    _ = P * ((1 : Module.End Cut STVC) * Q) := by rw [hCC]
    _ = P * Q := by rw [one_mul]
    _ = LinearMap.id := hgen

/-- The three-word lies in the `Module.End` generated submonoid `genIsomMonoidLin` — the banked
    two-word `genTwoPlaneLin_mem_genLin` (N100) times one more `subset_closure` generator
    `biMulLin x x`. A NONTRIVIAL THREE-GENERATOR word. -/
theorem triHalfTurnLin_mem_genLin (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1) :
    triHalfTurnLin u w x ∈ genIsomMonoidLin := by
  have gC : biMulLin x x ∈ genIsomMonoidLin :=
    Submonoid.subset_closure ⟨x, x, hx, hx, rfl⟩
  have gQ : genTwoPlaneLin u w ∈ genIsomMonoidLin := genTwoPlaneLin_mem_genLin u w hu hw
  exact mul_mem gC gQ

/-- ★★ THE THREE-WORD'S COMPACT PART IS THE THREE-WORD ITSELF — via THE ABSTRACT LEVER. The three-word
    is a `QvC`-isometry (`triHalfTurnLin_isQvIsomC`), EvC-adjoint to `genTwoPlaneLin w u * biMulLin x x`
    (`triHalfTurnLin_isEvCAdjoint`), and EvC-orthogonal (`triHalfTurnLin_adjoint_comp_self`), so
    `evCOrthogonal_compact_part_eq_self` gives compact part `= g` itself. The converse generation
    extended to word-length THREE — past N103's length two. -/
theorem triHalfTurnLin_compact_part_eq_self (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x) = specOpN c uu ∧
      (triHalfTurnLin u w x).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu)
        = triHalfTurnLin u w x := by
  obtain ⟨n, c, uu, _, _, heq, hkself⟩ :=
    evCOrthogonal_compact_part_eq_self (triHalfTurnLin u w x)
      (genTwoPlaneLin w u * biMulLin x x)
      (triHalfTurnLin_isQvIsomC u w x hu hw hx)
      (triHalfTurnLin_isEvCAdjoint u w x hu hw hx huss huL hwss hwL hxss hxL)
      (triHalfTurnLin_adjoint_comp_self u w x huss huL hwss hwL hxss hxL)
  exact ⟨n, c, uu, heq, hkself⟩

/-- ★★ THE CONVERSE GENERATION (three-generator sector) — the bridged polar compact part of the
    concrete THREE-half-turn word lies in `genIsomMonoidC2`. The compact part IS the three-word
    (`triHalfTurnLin_compact_part_eq_self`), a THREE-GENERATOR word `∈ genIsomMonoidLin`
    (`triHalfTurnLin_mem_genLin`); the N100 transport carries it across the bridge. The converse
    direction discharged at word-length THREE. -/
theorem triHalfTurnLin_compact_part_mem_gen2 (u w x : O Cut)
    (hu : gFormC u u = 1) (hw : gFormC w w = 1) (hx : gFormC x x = 1)
    (huss : u * u = -1) (huL : ∀ z : O Cut, u * (u * z) = -z)
    (hwss : w * w = -1) (hwL : ∀ z : O Cut, w * (w * z) = -z)
    (hxss : x * x = -1) (hxL : ∀ z : O Cut, x * (x * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (genTwoPlaneLin w u * biMulLin x x).comp (triHalfTurnLin u w x) = specOpN c uu ∧
      endToFunEnd ((triHalfTurnLin u w x).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ∈ genIsomMonoidC2 := by
  obtain ⟨n, c, uu, heq, hkself⟩ :=
    triHalfTurnLin_compact_part_eq_self u w x hu hw hx huss huL hwss hwL hxss hxL
  refine ⟨n, c, uu, heq, ?_⟩
  rw [hkself]
  exact endToFunEnd_genIsomMonoidLin_mem_gen2 (triHalfTurnLin_mem_genLin u w x hu hw hx)

/-! ## Non-vacuity and W8 teeth (the concrete `e₂`, `ιe₂`, `e₂` three-word over `Cut`). -/

/-- ★ W8 NON-VACUITY / TEETH — the CONCRETE three-plane word `triHalfTurnLin e₂ ιe₂ e₂`
    (`= biMulLin e₂ e₂ * genTwoPlaneLin e₂ ιe₂`) realises the converse core: its polar compact part
    EQUALS the three-word itself, which NEGATES the real axis `(0,0,1) ↦ (0,0,−1)`. The banked
    two-word `genTwoPlaneLin e₂ ιe₂` FIXES `(0,0,1)` (`genTwoPlaneLin_e2je2_fixes_one` N100), then the
    outer half-turn `biMulLin e₂ e₂` negates the real component (`e₂·(1·e₂) = e₂·e₂ = −1`), reading
    deep-scalar coordinate `re.re.re = −1`. NOT vacuous: a genuine word that rotates `span{e₂, ιe₂}`
    and then negates `span{1, e₂}` IS its own compact part, a NONTRIVIAL THREE-GENERATOR word — the
    two-word FIXES the real axis `+1` (N103); one more half-turn negates it. -/
theorem triHalfTurnLin_e2je2e2_compact_part_real_coord :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      ((((triHalfTurnLin (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) uu))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (-1 : Cut) := by
  obtain ⟨n, c, uu, _, hkself⟩ :=
    triHalfTurnLin_compact_part_eq_self (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut)
      e2_gFormC_self je2_gFormC_self e2_gFormC_self
      biMulFun_e2_sq e2_alt je2_sq je2_alt biMulFun_e2_sq e2_alt
  refine ⟨n, c, uu, ?_⟩
  rw [hkself]
  have hfix : (endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)))
        ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := genTwoPlaneLin_e2je2_fixes_one
  rw [endToFunEnd_apply] at hfix
  show ((biMulLin (CD.e2 : O Cut) (CD.e2 : O Cut)
      (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)
        ((0 : Cut), (0 : Cut), (1 : O Cut)))).2.2).re.re.re = (-1 : Cut)
  rw [hfix]
  show ((CD.e2 : O Cut) * ((1 : O Cut) * (CD.e2 : O Cut))).re.re.re = (-1 : Cut)
  rw [one_mul, biMulFun_e2_sq]
  rfl

end

end Phys.Algebra
