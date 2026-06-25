/-
# N31 — THE AUTOMORPHISM GROUP of the terminal algebra, increment 1: DEFINE + SEED

The Lie GROUP whose Lie algebra is the banked simple type-G₂ `derivationLieQ` (N30b): the
group of algebra automorphisms `Aut(O ℚ)` of the terminal Cayley–Dickson algebra
`O ℚ = CD (CD (Dbl ℚ))`, realized — for this increment — as a `Subgroup` of the ℚ-linear
automorphism group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital predicate
`IsAlgAut`. Derived FORWARD from the banked algebra-level structure, NO posited `G₂`/`Aut`
import (the SAME posit-vs-derive moat N3–N6/N16–N30b held).

THE TRUNK CONNECTION (THE ONE LAW). The compact automorphism group is the integral of the
derivation algebra; the SAME Born self-overlap/positivity (`gForm`, `selfMul_selfconj`) that
made every derivation SKEW-ADJOINT (`derivationLieQ_le_skewAdjoint`, N26) is what an
automorphism PRESERVES (`gForm`-orthogonality, `aut_gForm`) — ONE cause, the group analogue of
the infinitesimal skew-adjointness. The definiteness of that form is exactly what makes the
group compact (re-verified numerically: Killing det 9618527719784448, NEG-definite); the
analytic exp-over-`ContinuumQ.Cut` + compactness are CHILDED onto the chain tail.

THE FORWARD SEED FACTS (all proved here, increment-1 scope):
  • `aut_reQ`        — ★ an automorphism PRESERVES the real part: `reQ (φ x) = reQ x`
                        (the one nontrivial step; the rest follow from it).
  • `aut_star`       — an automorphism COMMUTES with conjugation: `φ (star x) = star (φ x)`.
  • `aut_gForm`      — ★★ an automorphism PRESERVES the Born self-overlap form
                        `gForm (φ x) (φ y) = gForm x y` (norm-preserving — the group-level
                        analogue of skew-adjointness, the trunk's positivity).
  • `aut_mapsTo_ImO` — ★ an automorphism PRESERVES the imaginary subspace `ImO`.
  • `aut_map_one`    — an automorphism FIXES the unit (definitional).
  • `AutO`           — ★ the automorphism group as a `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` (one_mem /
                        mul_mem / inv_mem all proved), with the seed facts as member-level
                        corollaries; non-vacuous (the identity is a member).

Physics-words-removable: delete "automorphism group / gauge / compact / G₂ / colour" → the
file is a complete proof about the structure-preserving ℚ-linear bijections of the Cayley–
Dickson double-of-a-double-of-a-double of `ℚ` (they fix the real part, commute with the
conjugation, preserve the self-overlap form and the trace-zero subspace, and form a group).
NO physics name is load-bearing.
-/
import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The carrier algebra facts (the quadratic the automorphism preserves) -/

/-- A self-conjugate element is a real scalar: `star y = y → y = (reQ y) • 1`. From the
    banked trace identity `y + star y = (2 reQ y) • 1`. -/
theorem selfconj_eq_smul {y : O ℚ} (h : star y = y) : y = (reQ y) • (1 : O ℚ) := by
  have ht := trace_id y
  rw [h] at ht
  have h2 : (2 : ℚ) • y = (2 * reQ y) • (1 : O ℚ) := by rw [two_smul]; exact ht
  have hc := congrArg (fun z => (2⁻¹ : ℚ) • z) h2
  simp only [smul_smul] at hc
  rw [show (2⁻¹ : ℚ) * 2 = 1 by norm_num, one_smul,
      show (2⁻¹ : ℚ) * (2 * reQ y) = reQ y by ring] at hc
  exact hc

/-- The Born self-overlap is a real scalar: `x · star x = (gForm x x) • 1` (banked
    `selfMul_selfconj` says it is self-conjugate; `selfconj_eq_smul` identifies the scalar). -/
theorem selfMul_eq_smul (x : O ℚ) : x * star x = (gForm x x) • (1 : O ℚ) := by
  have := selfconj_eq_smul (selfMul_selfconj x); rw [this]; rfl

/-- ★ THE QUADRATIC the terminal algebra forces on every element:
    `x · x = (2 reQ x) • x − (gForm x x) • 1`. Every `x` satisfies a monic quadratic over `ℚ·1`
    whose coefficients are the (banked) trace `2 reQ x` and the Born self-overlap `gForm x x` —
    the polynomial a unital algebra automorphism must preserve. -/
theorem octo_quadratic (x : O ℚ) :
    x * x = (2 * reQ x) • x - (gForm x x) • (1 : O ℚ) := by
  have hst : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have ht := trace_id x; linear_combination (norm := abel) ht
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hst, mul_sub, qsmul_mul_right, mul_one] at hsm
  linear_combination (norm := abel) -hsm

@[simp] theorem reQ_one : reQ (1 : O ℚ) = 1 := by simp [reQ]

/-! ## The automorphism predicate and the forward seed facts -/

/-- THE ALGEBRA-AUTOMORPHISM PREDICATE on a ℚ-linear self-equiv of the terminal algebra:
    multiplicative and unital. (`O ℚ` is non-associative, so there is no `Algebra ℚ (O ℚ)`
    instance and no Mathlib `AlgEquiv` to import and assert against — the predicate is built
    FORWARD on the ℚ-linear automorphism group `(O ℚ ≃ₗ[ℚ] O ℚ)`, MACHINERY on the DERIVED
    object, STANDARD §3.) -/
def IsAlgAut (φ : O ℚ ≃ₗ[ℚ] O ℚ) : Prop :=
  (∀ x y, φ (x * y) = φ x * φ y) ∧ φ 1 = 1

/-- An automorphism FIXES the unit (definitional; the `φ 1 = 1` clause). -/
theorem aut_map_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) : φ 1 = 1 := h.2

/-- An automorphism FIXES real scalars: `φ (c • 1) = c • 1`. -/
theorem aut_smul_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (c : ℚ) :
    φ (c • (1 : O ℚ)) = c • (1 : O ℚ) := by
  rw [map_smul, h.2]

/-- The difference of the quadratic at `x` and at `φ x`, after applying the automorphism:
    `(2 (reQ x − reQ φx)) • φx = (gForm x x − gForm φx φx) • 1`. The structural identity from
    which real-part preservation is extracted. -/
theorem aut_quad_diff {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    (2 * (reQ x - reQ (φ x))) • (φ x)
      = (gForm x x - gForm (φ x) (φ x)) • (1 : O ℚ) := by
  obtain ⟨hmul, hone⟩ := h
  have hL : φ (x * x) = φ x * φ x := hmul x x
  have hQ := octo_quadratic x
  have hφQ : φ (x * x) = (2 * reQ x) • (φ x) - (gForm x x) • (1 : O ℚ) := by
    rw [hQ]; simp [map_sub, map_smul, hone]
  have hQ' := octo_quadratic (φ x)
  rw [hL, hQ'] at hφQ
  linear_combination (norm := module) -hφQ

/-- ★ AN AUTOMORPHISM PRESERVES THE REAL PART: `reQ (φ x) = reQ x`. THE NONTRIVIAL SEED FACT.
    From `aut_quad_diff`: either the leading coefficient `2(reQ x − reQ φx)` vanishes (done),
    or `φ x` is itself a real scalar `(reQ φx) • 1` — and then so is `x` (apply `φ.symm`, which
    fixes scalars), giving `reQ x = reQ φx` directly. No coordinates, no linear-independence
    bash — the field structure of the derived ℚ does the case split. -/
theorem aut_reQ {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    reQ (φ x) = reQ x := by
  set a : ℚ := 2 * (reQ x - reQ (φ x)) with ha
  have hkey := aut_quad_diff h x
  have hreQ : a * reQ (φ x) = (gForm x x - gForm (φ x) (φ x)) := by
    have := congrArg reQ hkey
    rw [reQ_smul, reQ_smul, reQ_one, mul_one] at this
    exact this
  rw [← hreQ] at hkey
  have hzero : a • ((φ x) - reQ (φ x) • (1 : O ℚ)) = 0 := by
    rw [smul_sub, hkey, smul_smul, sub_self]
  rcases smul_eq_zero.mp hzero with ha0 | hw0
  · have h2 : (2 : ℚ) * (reQ x - reQ (φ x)) = 0 := ha0
    linarith [h2]
  · have hφscalar : φ x = reQ (φ x) • (1 : O ℚ) := by rw [sub_eq_zero] at hw0; exact hw0
    have hxscalar : x = reQ (φ x) • (1 : O ℚ) := by
      have hsymm : φ.symm (reQ (φ x) • (1 : O ℚ)) = reQ (φ x) • (1 : O ℚ) := by
        apply φ.injective
        rw [φ.apply_symm_apply, aut_smul_one h]
      have h1 : φ.symm (φ x) = φ.symm (reQ (φ x) • (1 : O ℚ)) := congrArg φ.symm hφscalar
      rw [φ.symm_apply_apply, hsymm] at h1
      exact h1
    have hr := congrArg reQ hxscalar
    rw [reQ_smul, reQ_one, mul_one] at hr
    exact hr.symm

/-- An automorphism COMMUTES with conjugation: `φ (star x) = star (φ x)`. From the banked
    trace identity `star x = (2 reQ x) • 1 − x` and real-part preservation (`aut_reQ`). -/
theorem aut_star {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    φ (star x) = star (φ x) := by
  have hsx : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have ht := trace_id x; linear_combination (norm := abel) ht
  have hsφx : star (φ x) = (2 * reQ (φ x)) • (1 : O ℚ) - φ x := by
    have ht := trace_id (φ x); linear_combination (norm := abel) ht
  rw [hsx, map_sub, map_smul, h.2, hsφx, aut_reQ h x]

/-- ★★ AN AUTOMORPHISM PRESERVES THE BORN SELF-OVERLAP FORM:
    `gForm (φ x) (φ y) = gForm x y` (norm-preserving). THE GROUP-LEVEL ANALOGUE of the
    infinitesimal skew-adjointness (`derivationLieQ_le_skewAdjoint`, N26): the SAME Born
    positivity, integrated. From `gForm v w = reQ (v · star w)`, conjugation-commuting
    (`aut_star`), multiplicativity, and real-part preservation (`aut_reQ`). -/
theorem aut_gForm {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x y : O ℚ) :
    gForm (φ x) (φ y) = gForm x y := by
  show reQ (φ x * star (φ y)) = reQ (x * star y)
  rw [← aut_star h y, ← h.1 x (star y), aut_reQ h (x * star y)]

/-- ★ AN AUTOMORPHISM PRESERVES THE IMAGINARY SUBSPACE `ImO` (the trace-zero subspace): if
    `star x = −x` then `star (φ x) = −φ x`. From conjugation-commuting (`aut_star`). -/
theorem aut_mapsTo_ImO {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) {x : O ℚ}
    (hx : x ∈ ImO) : φ x ∈ ImO := by
  rw [mem_ImO] at hx ⊢
  rw [← aut_star h x, hx, map_neg]

/-! ## The automorphism group as a `Subgroup` -/

/-- `IsAlgAut` holds of the identity. -/
theorem isAlgAut_one : IsAlgAut (1 : O ℚ ≃ₗ[ℚ] O ℚ) :=
  ⟨fun _ _ => rfl, rfl⟩

/-- `IsAlgAut` is closed under composition (the group product `φ * ψ = φ ∘ ψ`). -/
theorem isAlgAut_mul {φ ψ : O ℚ ≃ₗ[ℚ] O ℚ} (hφ : IsAlgAut φ) (hψ : IsAlgAut ψ) :
    IsAlgAut (φ * ψ) := by
  refine ⟨fun x y => ?_, ?_⟩
  · show φ (ψ (x * y)) = φ (ψ x) * φ (ψ y)
    rw [hψ.1, hφ.1]
  · show φ (ψ 1) = 1
    rw [hψ.2, hφ.2]

/-- `IsAlgAut` is closed under inverse (`φ⁻¹ = φ.symm`). Multiplicativity transports through
    the equiv: `φ.symm x · φ.symm y = φ.symm (x · y)` because `φ` is multiplicative. -/
theorem isAlgAut_inv {φ : O ℚ ≃ₗ[ℚ] O ℚ} (hφ : IsAlgAut φ) : IsAlgAut φ⁻¹ := by
  refine ⟨fun x y => ?_, ?_⟩
  · show φ.symm (x * y) = φ.symm x * φ.symm y
    apply φ.injective
    rw [φ.apply_symm_apply, hφ.1, φ.apply_symm_apply, φ.apply_symm_apply]
  · show φ.symm 1 = 1
    apply φ.injective
    rw [φ.apply_symm_apply, hφ.2]

/-- ★ THE AUTOMORPHISM GROUP of the terminal algebra, as a `Subgroup` of the ℚ-linear
    automorphism group `(O ℚ ≃ₗ[ℚ] O ℚ)`. Its Lie algebra is the banked simple type-G₂
    `derivationLieQ` (N30b); the analytic exp realizing that correspondence + the compactness
    (from the definite Born form) are childed onto the chain tail. NO posited `G₂`/`Aut`. -/
def AutO : Subgroup (O ℚ ≃ₗ[ℚ] O ℚ) where
  carrier := {φ | IsAlgAut φ}
  one_mem' := isAlgAut_one
  mul_mem' := isAlgAut_mul
  inv_mem' := isAlgAut_inv

@[simp] theorem mem_AutO {φ : O ℚ ≃ₗ[ℚ] O ℚ} : φ ∈ AutO ↔ IsAlgAut φ := Iff.rfl

/-- NON-VACUITY (W8): the automorphism group is inhabited — the identity is a member, so the
    group is a genuine object (not the empty/degenerate case). The full nontriviality (that
    `Der(O ℚ)` exponentiates to a 14-parameter family of nonidentity automorphisms) is the
    childed analytic-exp node. -/
theorem one_mem_AutO : (1 : O ℚ ≃ₗ[ℚ] O ℚ) ∈ AutO := isAlgAut_one

/-! ## Member-level corollaries (the seed facts on group elements) -/

theorem AutO_reQ (φ : AutO) (x : O ℚ) : reQ ((φ : O ℚ ≃ₗ[ℚ] O ℚ) x) = reQ x :=
  aut_reQ φ.2 x

theorem AutO_star (φ : AutO) (x : O ℚ) :
    (φ : O ℚ ≃ₗ[ℚ] O ℚ) (star x) = star ((φ : O ℚ ≃ₗ[ℚ] O ℚ) x) :=
  aut_star φ.2 x

theorem AutO_gForm (φ : AutO) (x y : O ℚ) :
    gForm ((φ : O ℚ ≃ₗ[ℚ] O ℚ) x) ((φ : O ℚ ≃ₗ[ℚ] O ℚ) y) = gForm x y :=
  aut_gForm φ.2 x y

theorem AutO_mapsTo_ImO (φ : AutO) {x : O ℚ} (hx : x ∈ ImO) :
    (φ : O ℚ ≃ₗ[ℚ] O ℚ) x ∈ ImO :=
  aut_mapsTo_ImO φ.2 hx

end

end Phys.Algebra
