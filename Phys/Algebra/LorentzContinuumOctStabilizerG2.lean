/-
  Phys.Algebra.LorentzContinuumOctStabilizerG2 — N138: THE EXPLICIT G₂ = Aut(O) = Der(O)
  GAUGE LINK — an octonion ALGEBRA-AUTOMORPHISM of the terminal algebra `O Cut` lands in the
  observer-plane gauge stabilizer `octStab` (N137), pinning the gauge group's G₂ identity inside
  the SO(8)/Spin(7) octonion-block `gFormC`-isometry group, over the derived ℝ `Cut`, the terminal
  algebra `O Cut := CD (H Cut)`, the spacetime `STVC = Cut × Cut × O Cut`, the indefinite Minkowski
  form `BvC` (signature (1,9)).

  ===========================================================================
  CONTEXT. N137 OPENED the gauge sector: the stabilizer `octStab` of the observer `(t,x)` plane
  inside the continuum Lorentz group `SO⁺(1,9)` (`bvIsomLinMonoid`, N132) restricts to the
  octonion-block `gFormC`-isometry group (SO(8) ⊃ Spin(7) ⊃ G₂), with the SECTION
  `octBlockEndC_mem_octStab : IsGFormCIsom R → IsOctStab (octBlockEndC R)` embedding any
  `gFormC`-isometry of the octonion block into the stabilizer. W4.5 SUFFICIENCY: this node does
  NOT add another lateral stabilizer/octonion-block identity — it ADVANCES to the FORWARD joint the
  gauge content opens: PINNING THE G₂ IDENTITY of the gauge group.

  ── THE MEASURED STRUCTURE (W1/W9 measure-first) ──
  The internal-symmetry block is the octonion-block `gFormC`-isometry group SO(8). Its DISTINGUISHED
  subgroup is G₂ = Aut(O) = Der(O) (the banked octonion automorphism group N31 `AutO` / N41f
  `IsAlgAutCut`, whose Lie algebra is the simple type-G₂ derivation algebra `Der(O) = g₂`, N20
  `finrank_derivationQ_eq_14`, dim 14): the part of SO(8) that ALSO preserves the octonion
  MULTIPLICATION and fixes the unit `1`. THE FORWARD THEOREM: an octonion algebra-automorphism is a
  `gFormC`-isometry, so its octonion-block embedding lands in the gauge stabilizer `octStab` — the
  explicit G₂ ⊂ SO(8) gauge inclusion.

  ── THE GAUGE INCLUSION (the forced theorem) ──
  `IsAlgAutCut φ` (a `Cut`-linear self-equiv of `O Cut` that is multiplicative and unital, N41f) is a
  `gFormC`-isometry: from the banked Born form `gFormC v w = reQC (v · star w)`, an automorphism
  PRESERVES the real part `reQC` (the one nontrivial step — the field structure of the derived `Cut`
  does the case split via the monic quadratic every element satisfies), hence COMMUTES with
  conjugation `star`, hence PRESERVES `gFormC` (`autC_gFormC` — the GROUP-level analogue of the
  infinitesimal skew-adjointness that made every derivation skew, N26: the SAME Born positivity,
  integrated). Then `octBlockEndC φ ∈ octStab` by the banked N137 section.

  ── THE TRUNK REFRAME (W1, THE ONE LAW) ──
  This is the Cut-side mirror of the banked ℚ-side `aut_gForm` (N31 `DerivationAutGroup`): the SAME
  Born self-overlap / positivity that the derivation algebra is skew for, the automorphism group
  preserves. No new analytic input — every step is a one-rewrite reduction through banked identities
  (`octRefl_trace_id` / `octRefl_selfconj_eq_smul` / `smulCompat_oCut` centrality / `reQC` linearity /
  `gFormC_one`), over the DERIVED ℝ `Cut`. The G₂ gauge subgroup is the DERIVED structure-preserving
  subgroup of the derived octonion block's `gFormC`-isometry group — not a posited gauge group, not a
  posited G₂.

  ── WHAT THIS NODE BANKS ──
  `selfMulC_eq_smul` — the Born self-overlap is a real scalar `x · star x = (gFormC x x) • 1`.
  `octo_quadraticC` — the monic quadratic `x · x = (2 reQC x) • x − (gFormC x x) • 1` every element
    of the terminal algebra satisfies (the polynomial a unital automorphism preserves).
  `autC_quad_diff` — the quadratic-difference identity at `x` and `φ x`.
  ★ `autC_reQC` — an automorphism PRESERVES THE REAL PART `reQC (φ x) = reQC x` (the nontrivial step).
  `autC_star` — an automorphism COMMUTES with conjugation `φ (star x) = star (φ x)`.
  ★★ `autC_gFormC` — THE GAUGE CONTENT: an automorphism PRESERVES the Born form
    `gFormC (φ x) (φ y) = gFormC x y` (the group-level analogue of skew-adjointness).
  `autC_isGFormCIsom` — an automorphism (as a linear map) is a `gFormC`-isometry (lands in SO(8)).
  ★ `octBlockEndC_autC_mem_octStab` — THE GAUGE INCLUSION: the octonion-block embedding of an
    octonion algebra-automorphism lands in the gauge stabilizer `octStab` (G₂ = Aut(O) ⊂ SO(8) ⊂
    the observer-plane stabilizer of `SO⁺(1,9)`).
  W8 (genuine non-vacuity): `octBlockEndC_id_mem_octStab` (the concrete identity automorphism
    `expOEquiv 0`, N41f, embeds into the stabilizer — the inclusion is inhabited), `autC_gFormC_one`
    (an automorphism preserves the unit's self-overlap `gFormC (φ 1) (φ 1) = 1`, the costume anchor).

  THE MOAT (docs/STANDARD.md §0). The literature POSITS the Lorentz group, an internal gauge group
  SO(8), AND its G₂ structure subgroup as independent inputs. Here the gauge group is the DERIVED
  observer-plane stabilizer (N137), its octonion-block restriction is the DERIVED `gFormC`-isometry
  group (N124), and its G₂ subgroup is the DERIVED octonion automorphism group (N31/N41f) whose Lie
  algebra is the DERIVED simple type-G₂ `Der(O) = g₂` (N20) — every layer CONSTRUCTED forward from
  the cascade's own terminal algebra, no posited gauge group, no posited G₂, no Mathlib ℝ/ℂ as
  content, no bridge.

  Physics-words-removable: delete "gauge / G₂ / SO(8) / Spin(7) / automorphism / derivation / Aut /
  Lorentz / stabilizer / octonion / observer / internal-symmetry / isometry" → over the derived
  complete ordered field `Cut`, the terminal algebra `O Cut`, and `STVC = Cut × Cut × O Cut`: a
  multiplicative-and-unital `Cut`-linear self-equiv of `O Cut` preserves the form
  `gFormC v w = reQC (v · star w)`, and its block embedding `(t,x,v) ↦ (t,x,φ v)` lies in the
  submonoid of `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`. No theorem statement needs a physics
  word.
-/
import Phys.Algebra.LorentzContinuumOctStabilizerGauge
import Phys.Algebra.DerivationOAutomorphism

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

open scoped BigOperators

noncomputable section

/-! ## The carrier-algebra facts (the quadratic the automorphism preserves) -/

/-- Cut-side: the Born self-overlap is a real scalar `x · star x = (gFormC x x) • 1`. The banked
    `octRefl_selfconj_eq_smul` identifies the self-conjugate `x · star x` with `(reQC (x·star x)) • 1`,
    and `gFormC x x = reQC (x · star x)` by definition. -/
theorem selfMulC_eq_smul (x : O Cut) : x * star x = (gFormC x x) • (1 : O Cut) := by
  have hsc : star (x * star x) = x * star x := by rw [star_mul, star_star]
  have h := octRefl_selfconj_eq_smul hsc
  rw [h]; rfl

/-- ★ Cut-side: the monic quadratic every element of the terminal algebra satisfies,
    `x · x = (2 reQC x) • x − (gFormC x x) • 1`. The coefficients are the trace `2 reQC x` (banked
    `octRefl_trace_id`) and the Born self-overlap `gFormC x x` (`selfMulC_eq_smul`) — the polynomial a
    unital algebra automorphism must preserve. -/
theorem octo_quadraticC (x : O Cut) :
    x * x = (2 * reQC x) • x - (gFormC x x) • (1 : O Cut) := by
  have hst : star x = (2 * reQC x) • (1 : O Cut) - x := by
    have ht := octRefl_trace_id x; linear_combination (norm := abel) ht
  have hsm : x * star x = (gFormC x x) • (1 : O Cut) := selfMulC_eq_smul x
  rw [hst, mul_sub, smulCompat_oCut.hr, mul_one] at hsm
  linear_combination (norm := abel) -hsm

/-! ## The automorphism preserves the real part, conjugation, and the Born form -/

/-- The quadratic-difference identity for an automorphism, after applying `φ`:
    `(2 (reQC x − reQC φx)) • φx = (gFormC x x − gFormC φx φx) • 1`. The structural identity from
    which real-part preservation is extracted. -/
theorem autC_quad_diff {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    (2 * (reQC x - reQC (φ x))) • (φ x)
      = (gFormC x x - gFormC (φ x) (φ x)) • (1 : O Cut) := by
  obtain ⟨hmul, hone⟩ := h
  have hL : φ (x * x) = φ x * φ x := hmul x x
  have hQ := octo_quadraticC x
  have hφQ : φ (x * x) = (2 * reQC x) • (φ x) - (gFormC x x) • (1 : O Cut) := by
    rw [hQ]; simp [map_sub, map_smul, hone]
  have hQ' := octo_quadraticC (φ x)
  rw [hL, hQ'] at hφQ
  linear_combination (norm := module) -hφQ

/-- ★ AN AUTOMORPHISM PRESERVES THE REAL PART `reQC (φ x) = reQC x`. THE NONTRIVIAL STEP: from
    `autC_quad_diff`, either the leading coefficient `2 (reQC x − reQC φx)` vanishes (done), or `φ x`
    is a real scalar `(reQC φx) • 1` — and then so is `x` (apply `φ.symm`, fixing scalars), giving
    `reQC x = reQC φx`. The field structure of the derived `Cut` does the case split — no coordinates,
    no linear-independence bash. -/
theorem autC_reQC {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    reQC (φ x) = reQC x := by
  set a : Cut := 2 * (reQC x - reQC (φ x)) with ha
  have hkey := autC_quad_diff h x
  have hreQ : a * reQC (φ x) = (gFormC x x - gFormC (φ x) (φ x)) := by
    have := congrArg reQC hkey
    rw [reQC_smul, reQC_smul, reQC_one, mul_one] at this
    exact this
  rw [← hreQ] at hkey
  have hzero : a • ((φ x) - reQC (φ x) • (1 : O Cut)) = 0 := by
    rw [smul_sub, hkey, smul_smul, sub_self]
  rcases smul_eq_zero.mp hzero with ha0 | hw0
  · have h2 : (2 : Cut) * (reQC x - reQC (φ x)) = 0 := ha0
    have : reQC x - reQC (φ x) = 0 := by
      rcases mul_eq_zero.mp h2 with h2a | h2b
      · exact absurd h2a (by norm_num)
      · exact h2b
    linarith [this]
  · have hφscalar : φ x = reQC (φ x) • (1 : O Cut) := by rw [sub_eq_zero] at hw0; exact hw0
    have hxscalar : x = reQC (φ x) • (1 : O Cut) := by
      have hsymm : φ.symm (reQC (φ x) • (1 : O Cut)) = reQC (φ x) • (1 : O Cut) := by
        apply φ.injective
        rw [φ.apply_symm_apply, map_smul, h.2]
      have h1 : φ.symm (φ x) = φ.symm (reQC (φ x) • (1 : O Cut)) := congrArg φ.symm hφscalar
      rw [φ.symm_apply_apply, hsymm] at h1
      exact h1
    have hr := congrArg reQC hxscalar
    rw [reQC_smul, reQC_one, mul_one] at hr
    exact hr.symm

/-- An automorphism COMMUTES with conjugation `φ (star x) = star (φ x)`. From the banked trace
    identity `star x = (2 reQC x) • 1 − x` (`octRefl_trace_id`) and real-part preservation. -/
theorem autC_star {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    φ (star x) = star (φ x) := by
  have hsx : star x = (2 * reQC x) • (1 : O Cut) - x := by
    have ht := octRefl_trace_id x; linear_combination (norm := abel) ht
  have hsφx : star (φ x) = (2 * reQC (φ x)) • (1 : O Cut) - φ x := by
    have ht := octRefl_trace_id (φ x); linear_combination (norm := abel) ht
  rw [hsx, map_sub, map_smul, h.2, hsφx, autC_reQC h x]

/-- ★★ AN AUTOMORPHISM PRESERVES THE BORN SELF-OVERLAP FORM `gFormC (φ x) (φ y) = gFormC x y`
    (norm-preserving). THE GAUGE CONTENT — the group-level analogue of the infinitesimal
    skew-adjointness (`derivationLieQ_le_skewAdjoint`, N26): the SAME Born positivity, integrated.
    From `gFormC v w = reQC (v · star w)`, conjugation-commuting (`autC_star`), multiplicativity, and
    real-part preservation (`autC_reQC`). -/
theorem autC_gFormC {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x y : O Cut) :
    gFormC (φ x) (φ y) = gFormC x y := by
  show reQC (φ x * star (φ y)) = reQC (x * star y)
  rw [← autC_star h y, ← h.1 x (star y), autC_reQC h (x * star y)]

/-- An octonion algebra-automorphism (as a `Cut`-linear map) is a `gFormC`-isometry — it lands in
    the octonion-block isometry group SO(8). -/
theorem autC_isGFormCIsom {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    IsGFormCIsom (φ : O Cut →ₗ[Cut] O Cut) :=
  fun u v => autC_gFormC h u v

/-! ## The gauge inclusion: an automorphism lands in the observer-plane stabilizer -/

/-- ★ THE GAUGE INCLUSION (G₂ = Aut(O) = Der(O) ⊂ SO(8) ⊂ the observer-plane stabilizer of
    `SO⁺(1,9)`): the octonion-block embedding `octBlockEndC φ` of an octonion algebra-automorphism
    `φ` lands in the gauge stabilizer `octStab` (N137). The distinguished G₂ subgroup of the SO(8)
    octonion-block gauge group is the structure-preserving (multiplication-and-unit-fixing) part. -/
theorem octBlockEndC_autC_mem_octStab {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    IsOctStab (octBlockEndC (φ : O Cut →ₗ[Cut] O Cut)) :=
  octBlockEndC_mem_octStab (autC_isGFormCIsom h)

/-! ## NON-VACUITY (W8): the gauge inclusion is genuine -/

/-- W8: the concrete identity automorphism `expOEquiv 0` (the exponential of the zero derivation,
    N41f `expOEquiv_zero_isAlgAut`) embeds into the gauge stabilizer — the G₂ inclusion is inhabited
    by a real member, not the empty/degenerate case. -/
theorem octBlockEndC_id_mem_octStab :
    IsOctStab (octBlockEndC ((expOEquiv (0 : Module.End Cut (O Cut))) : O Cut →ₗ[Cut] O Cut)) :=
  octBlockEndC_autC_mem_octStab expOEquiv_zero_isAlgAut

/-- W8 anchor: an octonion algebra-automorphism preserves the unit's Born self-overlap,
    `gFormC (φ 1) (φ 1) = gFormC 1 1 = 1`. The costume `C170` reads off this `1`. -/
theorem autC_gFormC_one {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    gFormC (φ 1) (φ 1) = 1 := by
  rw [autC_gFormC h, gFormC_one]

end

end Phys.Algebra
