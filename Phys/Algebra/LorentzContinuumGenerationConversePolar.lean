/-
  Phys.Algebra.LorentzContinuumGenerationConversePolar — N130: THE CONVERSE POLAR DECOMPOSITION
  OF AN ARBITRARY `BvC`-ISOMETRY — the joint connecting the indefinite-Householder/`BvC` world
  (N125–N129) to the polar/KAK strand (N89–N105), over the derived ℝ `Cut`.
  ===========================================================================
  CONTEXT. Two strands of the `SO⁺(1,9)` development were banked but DISCONNECTED:

    • THE POLAR/KAK STRAND (N89–N105) — the full polar path decomposition of an isometry:
      `isometry_polar_path_decomp` (N97) shows every operator `g` with `IsQvIsomC g` AND an
      `EvC`-adjoint `IsEvCAdjoint g h` factors as `g = k · γ(1)`, where `k := g∘(p^{1/2})⁻¹` is
      itself a `QvC`-isometry (the compact/orthogonal factor) and `γ` is the AFFINE CONE-PATH of
      `EvC`-positive self-adjoint operators from `γ(0) = id` to the positive part `γ(1) = p^{1/2}`.
      BUT it takes `IsEvCAdjoint g h` as a HYPOTHESIS — it never SUPPLIES the adjoint.
    • THE INDEFINITE-HOUSEHOLDER/`BvC` WORLD (N125–N129) — `IsBvIsomLin S` (`∀ p q, BvC (S p)(S q)
      = BvC p q`), the closed exhaustion `lorentz_exhaustion_M`, the block decomposition `blockDiagC`.

  Nothing yet connected them: an arbitrary `IsBvIsomLin S` had no `EvC`-adjoint on record, so the
  polar machinery could not be applied to a GENERAL `BvC`-isometry — only to the specific operators
  (boosts, half-turns) whose self-adjointness was hand-proved.

  ── THE RE-SPEC (THE ONE LAW — measure first, do NOT grind a mis-framed target) ──
  The ROADMAP §N130 priority (i) literally names "an arbitrary `BvC`-isometry `S` FACTORS as
  `S = blockDiagC a b R`". That literal target is FALSE as a universal claim: `blockDiagC a b R` is
  only the FIXED-DIRECTION `SO(8) × SO(1,1)` block-diagonal subgroup; a generic boost points along
  an arbitrary spatial direction, so a generic `S ∈ SO⁺(1,9)` does NOT lie in that block subgroup.
  The theory-native content the chain actually wants — and the genuine MISSING JOINT — is the
  EvC-adjoint of an arbitrary `BvC`-isometry, which immediately yields the polar (boost × rotation
  in the operator sense `compact × positive`) decomposition of ANY `BvC`-isometry via the banked N97.

  ── THE DERIVATION (theory-native, every step a banked one-rewrite reduction) ──
  1. `bvIsomLin_injective` — a `BvC`-isometry is INJECTIVE. If `S (p−q) = 0` then for ALL `r`,
     `BvC (p−q) r = BvC (S (p−q))(S r) = BvC 0 (S r) = 0` (the LEFT slot is killed directly — no
     surjectivity needed), so `p−q = 0` by the `BvC` right-nondegeneracy (`bvC_right_nondeg`, N128).
  2. `bvIsomLin_isQvIsomC` — a `BvC`-isometry preserves the Born quadratic: `QvC (S p) = BvC (S p)
     (S p) = BvC p p = QvC p` (`BvC_self`, N51). The reverse of the N51 forward bridge.
  3. `bvIsomLin_inverse` — injective ⟹ bijective on the FINITE-dim `STVC` (`Module.Finite Cut STVC`,
     N76, via `LinearMap.injective_iff_surjective`) ⟹ a UNIT of the `Module.End` ring
     (`Module.End.isUnit_iff`), giving a two-sided `Module.End`-inverse `Sinv`.
  4. ★★ `bvIsomLin_has_evCAdjoint` — THE JOINT: every `BvC`-isometry HAS an `EvC`-adjoint, namely
     `h := J ∘ Sinv ∘ J` with `J = sigOpC` the signature involution (N90). The pairing, all banked:
       `EvC (S p) q = BvC (S p)(J q)`            [`evC_eq_bvC_sigOpC`]
                   `= BvC (S p)(S (Sinv (J q)))`  [`J q = S (Sinv (J q))` by `S∘Sinv = id`]
                   `= BvC p (Sinv (J q))`         [`IsBvIsomLin S`]
                   `= EvC p (J (Sinv (J q)))`     [`BvC_eq_EvC_sigOpC`]
                   `= EvC p (h q)`.
  5. ★★★ `bvIsomLin_polar_path_decomp` — FEED N97: an ARBITRARY `IsBvIsomLin S` factors as the full
     packaged polar path decomposition `S = k · γ(1)`. The converse polar decomposition of an
     arbitrary `BvC`-isometry — DERIVED forward from the banked N89–N105 + the new adjoint joint,
     no operator topology, no posited polar/KAK theorem, no posited Lorentz group.

  ── WHAT THIS NODE BANKS ──
    bvIsomLin_injective                 — a `BvC`-isometry is injective (`bvC_right_nondeg`).
    bvIsomLin_isQvIsomC                 — a `BvC`-isometry preserves `QvC` (`BvC_self`).
    evC_eq_bvC_sigOpC                   — helper `EvC p q = BvC p (sigOpC q)`.
    bvIsomLin_inverse                   — the two-sided `Module.End`-inverse (finite-dim bijectivity).
    ★★ bvIsomLin_has_evCAdjoint         — THE JOINT: every `BvC`-isometry has an `EvC`-adjoint.
    ★★★ bvIsomLin_polar_path_decomp     — THE CONVERSE POLAR DECOMPOSITION of an arbitrary
                                          `BvC`-isometry (the full N97 conclusion applied generally).
    W8 (genuinely-indefinite):
    bvIsomLin_boost_recon_coord         — the converse decomposition of the concrete boost `(5/3,4/3)`
                                          reconstructs it: space coordinate `4/3` recovered at `(1,0,0)`.
    bvIsomLin_boost_witness_self_overlap — the reconstructed operator preserves the indefinite
                                          self-overlap of the moved timelike axis, reading `1`.

  THE MOAT: the literature POSITS the polar/KAK decomposition of `SO⁺(1,9)` and reads the adjoint off
  a fixed pseudo-metric matrix. Here the `EvC`-adjoint of an arbitrary `BvC`-isometry DESCENDS from
  finite-dimensional bijectivity (the cascade-derived `Module.Finite Cut STVC`) + the banked `BvC`
  right-nondegeneracy + the signature involution `J = sigOpC` — and feeding it into the banked affine
  cone-path decomposition gives the converse for EVERY `BvC`-isometry, with NO operator topology, NO
  operator `exp`, NO Mathlib spectral theory, the structure DERIVED not asserted.

  DERIVED from the banked N49–N129 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / isometry /
  compact / orthogonal / polar / KAK / Cartan / positive part / square-root / spectral / adjoint /
  signature / timelike / Minkowski / metric / Spin / SO(9) / SO⁺(1,9) / non-degenerate / path / cone":
  what remains is pure linear algebra over the derived complete ordered field `Cut`, `O Cut`, the
  positive-definite form `EvC` and the indefinite form `BvC` — a `Cut`-linear `S` with `∀ p q, BvC
  (S p)(S q) = BvC p q` is injective (by `BvC` right-nondegeneracy), bijective (finite dim), a ring
  unit; with the involution `J` its inverse gives `h := J∘S⁻¹∘J` satisfying `∀ p q, EvC (S p) q =
  EvC p (h q)`, and `BvC p p = QvC p`, so the banked packaged decomposition applies. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumReverseSurj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## A `BvC`-isometry is injective and preserves the Born quadratic. -/

/-- A `BvC`-isometry is INJECTIVE. If `S (p − q) = 0` then for ALL `r`,
    `BvC (p − q) r = BvC (S (p − q))(S r) = BvC 0 (S r) = 0` — the LEFT slot is killed directly,
    no surjectivity needed — so `p − q = 0` by the `BvC` right-nondegeneracy (`bvC_right_nondeg`). -/
theorem bvIsomLin_injective {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    Function.Injective S := by
  intro p q hpq
  have hd : S (p - q) = 0 := by rw [map_sub, hpq, sub_self]
  have hpq0 : p - q = 0 := by
    apply bvC_right_nondeg
    intro r
    have := hS (p - q) r
    rw [hd, BvC_zero_left] at this
    exact this.symm
  exact sub_eq_zero.mp hpq0

/-- A `BvC`-isometry preserves the Born quadratic `QvC`: `QvC (S p) = BvC (S p)(S p) = BvC p p =
    QvC p` (`BvC_self`). The reverse of the N51 forward `IsQvIsomC → IsBvIsomLin` bridge. -/
theorem bvIsomLin_isQvIsomC {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    IsQvIsomC S := by
  intro p
  show QvC (S p) = QvC p
  rw [← BvC_self, ← BvC_self, hS p p]

/-- Helper: the positive-definite reference form `EvC` and the indefinite Minkowski form `BvC` are
    related by the signature involution `J = sigOpC` the OTHER way: `EvC p q = BvC p (J q)` (since
    `BvC p (J q) = EvC p (J (J q)) = EvC p q`, `sigOpC_comp_self`). -/
theorem evC_eq_bvC_sigOpC (p q : STVC) : EvC p q = BvC p (sigOpC q) := by
  rw [BvC_eq_EvC_sigOpC, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

/-! ## The two-sided `Module.End`-inverse of a `BvC`-isometry (finite-dim bijectivity). -/

/-- A `BvC`-isometry has a two-sided `Module.End`-inverse: injective (`bvIsomLin_injective`) ⟹
    bijective on the FINITE-dim `STVC` (`Module.Finite Cut STVC` N76, `injective_iff_surjective`) ⟹
    a UNIT of the `Module.End` ring (`Module.End.isUnit_iff`), giving `Sinv` with `S∘Sinv = id` and
    `Sinv∘S = id`. -/
theorem bvIsomLin_inverse {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ Sinv : Module.End Cut STVC, S.comp Sinv = LinearMap.id ∧ Sinv.comp S = LinearMap.id := by
  have hinj : Function.Injective S := bvIsomLin_injective hS
  have hbij : Function.Bijective S := ⟨hinj, LinearMap.injective_iff_surjective.mp hinj⟩
  have hunit : IsUnit S := (Module.End.isUnit_iff S).mpr hbij
  obtain ⟨u, hu⟩ := hunit
  exact ⟨u.inv, by rw [← hu]; exact u.val_inv, by rw [← hu]; exact u.inv_val⟩

/-! ## THE JOINT — every `BvC`-isometry has an `EvC`-adjoint. -/

/-- ★★ THE JOINT — every `BvC`-isometry HAS an `EvC`-adjoint, namely `h := J ∘ Sinv ∘ J` with
    `J = sigOpC` the signature involution and `Sinv` the inverse of `S` (`bvIsomLin_inverse`). The
    pairing chains banked rewrites:
      `EvC (S p) q = BvC (S p)(J q)`            (`evC_eq_bvC_sigOpC`)
                  `= BvC (S p)(S (Sinv (J q)))`  (`J q = S (Sinv (J q))`, `S∘Sinv = id`)
                  `= BvC p (Sinv (J q))`         (`IsBvIsomLin S`)
                  `= EvC p (J (Sinv (J q)))`     (`BvC_eq_EvC_sigOpC`)
                  `= EvC p (h q)`.
    This is the missing connector: it supplies the `IsEvCAdjoint` hypothesis the entire polar/KAK
    strand (N89–N105) consumes, for an ARBITRARY `BvC`-isometry. -/
theorem bvIsomLin_has_evCAdjoint {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ h : Module.End Cut STVC, IsEvCAdjoint S h := by
  obtain ⟨Sinv, hSi, _⟩ := bvIsomLin_inverse hS
  refine ⟨sigOpC.comp (Sinv.comp sigOpC), ?_⟩
  intro p q
  have hSr : S (Sinv (sigOpC q)) = sigOpC q := by
    have := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC q)) hSi
    simpa only [LinearMap.comp_apply, LinearMap.id_apply] using this
  calc EvC (S p) q
      = BvC (S p) (sigOpC q) := evC_eq_bvC_sigOpC (S p) q
    _ = BvC (S p) (S (Sinv (sigOpC q))) := by rw [hSr]
    _ = BvC p (Sinv (sigOpC q)) := hS p (Sinv (sigOpC q))
    _ = EvC p (sigOpC (Sinv (sigOpC q))) := BvC_eq_EvC_sigOpC p (Sinv (sigOpC q))
    _ = EvC p ((sigOpC.comp (Sinv.comp sigOpC)) q) := by simp only [LinearMap.comp_apply]

/-! ## THE CONVERSE POLAR DECOMPOSITION of an arbitrary `BvC`-isometry. -/

/-- ★★★ THE CONVERSE POLAR DECOMPOSITION — an ARBITRARY `BvC`-isometry `S` factors as the full
    packaged polar path decomposition `S = k · γ(1)`: `k := S∘(p^{1/2})⁻¹` is a `QvC`-isometry (the
    compact/orthogonal factor) and `γ` is the affine cone-path of `EvC`-positive self-adjoint
    operators from `γ(0) = id` to the positive part `γ(1) = p^{1/2}` of `p = S*S = specOpN c u`.
    Obtained by SUPPLYING the `EvC`-adjoint of `S` (`bvIsomLin_has_evCAdjoint`) and the `QvC`-isometry
    property (`bvIsomLin_isQvIsomC`) to the banked packaged witness `isometry_polar_path_decomp`
    (N97). The converse content — every `BvC`-isometry polar-decomposes — DERIVED forward from the
    banked N89–N129, with NO operator topology / `exp` / posited polar theorem. -/
theorem bvIsomLin_polar_path_decomp {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC)
      (γ : Cut → Module.End Cut STVC),
      h.comp S = specOpN c u ∧
      γ = specPathOp c u ∧
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) ∧
      (∀ t, IsEvCSymm (γ t)) ∧
      (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) ∧
      IsQvIsomC (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∧
      (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) = S := by
  obtain ⟨h, Hadj⟩ := bvIsomLin_has_evCAdjoint hS
  obtain ⟨n, c, u, γ, h1, h2, h3, h4, h5, h6, h7, h8⟩ :=
    isometry_polar_path_decomp (bvIsomLin_isQvIsomC hS) Hadj
  exact ⟨h, n, c, u, γ, h1, h2, h3, h4, h5, h6, h7, h8⟩

/-! ## W8 teeth — the converse decomposition of a concrete boost genuinely returns it. -/

/-- ★ W8 NON-VACUITY / TEETH — the converse polar decomposition of the CONCRETE boost `(5/3, 4/3)`
    (a genuine non-identity `BvC`-isometry, off-diagonal `4/3 ≠ 0`, derived ONLY from its
    `IsBvIsomLin` property — no hand-proved adjoint) RECONSTRUCTS the boost: the reconstructed
    operator `k∘γ(1)`, read at the pure-time vector `(1,0,0)`, has space coordinate `4/3` — the
    boost's own `b`-parameter. The converse is not vacuous: it returns the genuine boost. -/
theorem bvIsomLin_boost_recon_coord :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC)
      (γ : Cut → Module.End Cut STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      (((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1)
          ((1:Cut), (0:Cut), (0:O Cut))).2.1 = 4/3 := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨h, n, c, u, γ, h1, _, _, _, _, _, _, h8⟩ :=
    bvIsomLin_polar_path_decomp (boostEndC_isBvIsomLin hab)
  refine ⟨h, n, c, u, γ, h1, ?_⟩
  rw [h8, boostEndC_apply]
  norm_num

/-- ★ W8 TEETH — the reconstructed operator of the boost `(5/3, 4/3)` PRESERVES the indefinite
    Minkowski self-overlap of the (moved) timelike axis `mTimeUnit`, reading `1` (`= BvC mTimeUnit
    mTimeUnit`). The converse decomposition reconstructs the boost (`bvIsomLin_polar_path_decomp`),
    which preserves the indefinite form (`boostEndC_isBvIsomLin`) — the distinguishing read-off the
    costume C162 bites. -/
theorem bvIsomLin_boost_witness_self_overlap :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC)
      (γ : Cut → Module.End Cut STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      BvC (((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) (mTimeUnit : STVC))
          (((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) (mTimeUnit : STVC)) = 1 := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨h, n, c, u, γ, h1, _, _, _, _, _, _, h8⟩ :=
    bvIsomLin_polar_path_decomp (boostEndC_isBvIsomLin hab)
  refine ⟨h, n, c, u, γ, h1, ?_⟩
  rw [h8, (boostEndC_isBvIsomLin hab) mTimeUnit mTimeUnit, BvC_mTimeUnit_self]

end

end Phys.Algebra
