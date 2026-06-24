/-
  Phys.Algebra.DerivationRep7 — N22: THE FAITHFUL 7-DIMENSIONAL REPRESENTATION of
  the derivation Lie algebra `derivationLieQ` on the imaginary subspace `Im(O ℚ)` —
  the G₂ FUNDAMENTAL REPRESENTATION, derived FORWARD.
  ===========================================================================
  N20 closed the EXACT dimension `finrank_derivationQ_eq_14`; N21 exhibited
  `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` as the explicit
  14-dimensional Lie algebra with its full 91-pair bracket table. The remaining
  N22 claim — "this 14-dim Lie algebra IS g₂" — must be derived FORWARD, never
  asserted at grade and never read off a posited `G₂`.

  ★ THE W1 SURVEY (docs/RUNBOOK.md W1; workbench/N22-g2-isomorphism/PREREG.md).
  Mathlib HAS `LieAlgebra.g₂ R` (the Serre-relation quotient of the free Lie
  algebra on the G₂ Cartan matrix — a genuinely DERIVED type-G₂ object) but NO
  structure theory for it (no `finrank = 14`, no simplicity, no root system). And
  the route-deciding numerics (exact-rational, reusing the BANKED 14 derivations +
  proved bracket table) show the Killing form of `derivationLieQ` is
  NEGATIVE-DEFINITE (all diagonal −16, nondegenerate) — i.e. `Der(O ℚ)` is the
  COMPACT real form of g₂ (the DIVISION/anisotropic octonions), whereas the Serre
  `LieAlgebra.g₂ ℚ` is the SPLIT form. Compact ≇ split over ℚ (a definite vs.
  indefinite Killing form is an isomorphism invariant), so a literal
  `LieEquiv ℚ derivationLieQ (LieAlgebra.g₂ ℚ)` would be FALSE. THE ONE LAW
  (docs/RUNBOOK.md W5): forcing it would fight because the TARGET is wrong, not the
  theory. Per W1 step 3 / W3 the honest move is to bank the sharpest TRACTABLE
  invariant pinning `derivationLieQ` as type-G₂ and child the rest.

  ★ THIS NODE banks the cleanest such invariant — the G₂ FUNDAMENTAL 7-REPRESENTATION:
  the action of every derivation on the 7-dimensional imaginary subspace `Im(O ℚ)`,
  proved to be a FAITHFUL Lie-algebra representation. A 14-dimensional Lie algebra
  acting faithfully on a 7-dimensional space is the defining smallest faithful
  representation of g₂ — the object the literature (Furey, Dixon, Günaydin–Gürsey)
  reads off `Aut(𝕆)` by hand; here it is DERIVED forward from the banked structure.

  WHAT IS BANKED HERE (forward, foundations-only):
    starL            — `star` as a ℚ-linear endomorphism of `O ℚ` (machinery).
    ImO              — ★ the imaginary subspace `Im(O ℚ) := ker(starL + 1)`
                       (the `star`-anti-fixed subspace).
    mem_ImO          — `x ∈ ImO ↔ star x = −x`.
    range_starL_add_one — `range(starL + 1) = ℚ·1` (the trace identity N17 made a
                       range statement: the symmetric part lands on the unit line).
    finrank_ImO      — ★★ `finrank ℚ ImO = 7`, via rank–nullity on `starL + 1`
                       (`range = ℚ·1` is 1-dim, `finrank (O ℚ) = 8` is banked N19).
                       NO 7-coordinate basis matrix — the W9 expansion AVOIDED.
    derivLieQ_mapsTo — every `D ∈ derivationLieQ` maps `ImO` into `ImO` (the banked
                       N18 `deriv_maps_im`: a derivation output is purely imaginary).
    imRep            — ★ the restriction-to-`ImO` Lie homomorphism
                       `derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` (the 7-rep). The
                       bracket is respected because `ImO` is an invariant subspace.
    imRep_injective  — ★★ FAITHFUL: `imRep D = 0 ⟹ D u1 = D u2 = D u4 = 0`
                       (u1,u2,u4 ∈ ImO) `⟹ D = 0` by the banked `determined`
                       (a derivation is fixed by its three generator values). A
                       14-dim Lie algebra acting faithfully on a 7-dim space.
    imRep_witness_ne_zero — ★ ANTI-VACUITY (W8): the banked NONZERO witness
                       derivation has NONZERO image under `imRep` — the rep is
                       non-trivial, not "the zero map is faithful."

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16–N21 held it). NO
  `LieAlgebra.g₂` / `G₂` is imported to ASSERT anything. `ImO`, `imRep`, and the
  faithfulness are all built from the banked `O ℚ`, `derivationLieQ`,
  `deriv_maps_im`, and `determined`; `Submodule` / `LinearMap` / `LieHom` are
  MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / fundamental /
  representation": what remains is the pure statement that the 14-dimensional Lie
  algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a
  double of ℚ acts FAITHFULLY (by restriction) on the 7-dimensional subspace
  `ker(star + id)`. No theorem STATEMENT needs a physics word.

  WHAT REMAINS (childed N23, never asserted here, never a bridge): the full
  identification of `derivationLieQ` with the COMPACT real form of g₂ — the
  Killing-form negative-definiteness / nondegeneracy (the compact signature) and
  the simplicity (no nonzero proper ideal) that, with the faithful 7-rep + the
  banked dim = 14 + the bracket table, complete the type-G₂ pinning. Both are W9
  beasts (14×14 rational definiteness / ideal analysis) correctly scoped to a
  dedicated child, NOT bypassed.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationBracket
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## `star` as a ℚ-linear endomorphism, and the imaginary subspace. -/

/-- `star` (conjugation) as a ℚ-LINEAR endomorphism of `O ℚ`. Machinery on the
    derived object — conjugation is additive and ℚ-linear (it negates the imaginary
    components and fixes the real line). -/
noncomputable def starL : Module.End ℚ (O ℚ) where
  toFun := star
  map_add' := star_add
  map_smul' := by
    intro q x
    show star (q • x) = q • star x
    ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

@[simp] theorem starL_apply (x : O ℚ) : starL x = star x := rfl

/-- ★ THE IMAGINARY SUBSPACE `Im(O ℚ) := ker(star + id)` — the `star`-anti-fixed
    elements `{x | star x = −x}`. The 7-dimensional subspace the derivation algebra
    acts on (the G₂ fundamental representation space). -/
noncomputable def ImO : Submodule ℚ (O ℚ) := LinearMap.ker (starL + 1)

/-- Membership in `ImO`: `x` is imaginary iff `star x = −x`. -/
theorem mem_ImO {x : O ℚ} : x ∈ ImO ↔ star x = -x := by
  simp only [ImO, LinearMap.mem_ker, LinearMap.add_apply, starL_apply,
    Module.End.one_apply]
  exact ⟨fun h => by linear_combination (norm := abel) h, fun h => by rw [h]; abel⟩

/-! ## `finrank ℚ ImO = 7` via rank–nullity. -/

/-- `(star + id) x = (2 reQ x) • 1`: the symmetric (real) part of `x` lands on the
    unit line. The banked trace identity (N17 `trace_id`) read as the action of the
    endomorphism `starL + 1`. -/
theorem starL_add_one_apply (x : O ℚ) : (starL + 1) x = (2 * reQ x) • (1 : O ℚ) := by
  show star x + x = _
  rw [add_comm]; exact trace_id x

/-- `1 ≠ 0` in `O ℚ` (its real coordinate is `1 ≠ 0`). -/
theorem one_ne_zero_O : (1 : O ℚ) ≠ 0 := by
  intro h
  have hh : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [h]
  simp only [reQ] at hh
  norm_num at hh

/-- ★ THE RANGE OF `star + id` IS THE UNIT LINE `ℚ·1`. Forward (`≤`): every value
    is `(2 reQ x) • 1` by `starL_add_one_apply`. Backward (`≥`): `1` itself is hit
    at `½ • 1` (since `reQ 1 = 1`). This is the trace identity (N17) promoted to a
    range statement — the image of the symmetrization is exactly the real line. -/
theorem range_starL_add_one :
    LinearMap.range (starL + 1) = Submodule.span ℚ {(1 : O ℚ)} := by
  apply le_antisymm
  · rintro y ⟨x, rfl⟩
    rw [starL_add_one_apply]
    exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · rw [Submodule.span_le]
    rintro y hy
    simp only [Set.mem_singleton_iff] at hy; subst hy
    refine ⟨(1 / 2 : ℚ) • (1 : O ℚ), ?_⟩
    rw [map_smul, starL_add_one_apply]
    have hr : reQ (1 : O ℚ) = 1 := by simp only [reQ]; rfl
    rw [hr, smul_smul]; norm_num

/-- ★★ `finrank ℚ Im(O ℚ) = 7`. Rank–nullity for `starL + 1`: its range is the
    1-dimensional unit line `ℚ·1` (`range_starL_add_one`), and `finrank (O ℚ) = 8`
    (banked N19 `finrank_O_eq_eight`), so its kernel `ImO` has dimension `8 − 1 = 7`.
    The 7 of the G₂ fundamental representation, derived structurally — NO
    7-coordinate basis matrix (the W9 coordinate expansion AVOIDED, as at N19/N20). -/
theorem finrank_ImO : Module.finrank ℚ ImO = 7 := by
  have hrk := LinearMap.finrank_range_add_finrank_ker (starL + 1)
  rw [range_starL_add_one, finrank_O_eq_eight] at hrk
  have h1 : Module.finrank ℚ (Submodule.span ℚ {(1 : O ℚ)}) = 1 :=
    finrank_span_singleton one_ne_zero_O
  rw [h1] at hrk
  -- hrk : 1 + finrank ℚ (starL+1).ker = 8 ; ImO is defeq to that kernel, so the
  -- `have` re-types the atom as `ImO` and omega closes `finrank ℚ ImO = 7`.
  have h8 : 1 + Module.finrank ℚ ImO = 8 := hrk
  omega

/-! ## The generators `u1, u2, u4` are imaginary (they lie in `ImO`). -/

theorem u1_mem_ImO : u1 ∈ ImO := by
  rw [mem_ImO]; ext <;>
    simp [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

theorem u2_mem_ImO : u2 ∈ ImO := by
  rw [mem_ImO]; ext <;>
    simp [u2, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

theorem u4_mem_ImO : u4 ∈ ImO := by
  rw [mem_ImO]; ext <;>
    simp [u4, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

/-! ## Every derivation maps `ImO` into `ImO`. -/

/-- THE ℚ-LEVEL `maps-Im` BRIDGE: a `IsDerivQ` derivation output is purely
    imaginary (`star (D x) = − D x`). Lifts the banked N18 `deriv_maps_im`
    (ℤ-linear) through `restrictScalars`. -/
theorem derivQ_maps_im (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x : O ℚ) :
    star (D x) = - D x := by
  have hDz : IsDeriv (D.restrictScalars ℤ) := fun a b => hD a b
  have := deriv_maps_im (D.restrictScalars ℤ) hDz x
  simpa [LinearMap.restrictScalars_apply] using this

/-- ★ Every derivation `D ∈ derivationLieQ` maps the imaginary subspace into itself.
    A derivation output is purely imaginary (`derivQ_maps_im`), so `ImO` is an
    INVARIANT subspace — which is what lets the derivation restrict to it. -/
theorem derivLieQ_mapsTo (D : derivationLieQ) :
    ∀ x ∈ ImO, (D : Module.End ℚ (O ℚ)) x ∈ ImO := by
  intro x _
  rw [mem_ImO]
  exact derivQ_maps_im (D : Module.End ℚ (O ℚ)) D.2 x

/-! ## THE FAITHFUL 7-DIMENSIONAL REPRESENTATION. -/

/-- The restriction of a derivation `D` to the invariant subspace `ImO`, as an
    endomorphism of `ImO`. -/
noncomputable def imRepFun (D : derivationLieQ) : Module.End ℚ ImO :=
  (D : Module.End ℚ (O ℚ)).restrict (derivLieQ_mapsTo D)

@[simp] theorem imRepFun_coe (D : derivationLieQ) (x : ImO) :
    ((imRepFun D x : ImO) : O ℚ) = (D : Module.End ℚ (O ℚ)) (x : O ℚ) := rfl

/-- ★ THE G₂ FUNDAMENTAL 7-REPRESENTATION: the restriction-to-`ImO` map, as a
    Lie-algebra homomorphism `derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO`. It is additive
    and ℚ-linear in `D`, and respects the bracket because `ImO` is an invariant
    subspace (the restriction of a commutator is the commutator of the
    restrictions). The 7-dimensional representation physics recognizes as the
    fundamental representation of g₂, here derived FORWARD from the banked structure
    — not a posited Clifford/spinor module. -/
noncomputable def imRep : derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO where
  toFun := imRepFun
  map_add' := by
    intro D E
    refine LinearMap.ext fun x => Subtype.ext ?_
    simp only [imRepFun_coe, LinearMap.add_apply]
    rfl
  map_smul' := by
    intro c D
    refine LinearMap.ext fun x => Subtype.ext ?_
    simp only [imRepFun_coe, LinearMap.smul_apply, RingHom.id_apply]
    rfl
  map_lie' := by
    intro D E
    refine LinearMap.ext fun x => Subtype.ext ?_
    simp only [imRepFun_coe]
    rfl

@[simp] theorem imRep_coe (D : derivationLieQ) (x : ImO) :
    ((imRep D x : ImO) : O ℚ) = (D : Module.End ℚ (O ℚ)) (x : O ℚ) := rfl

/-- ★★ FAITHFULNESS: the 7-representation `imRep` is INJECTIVE. If `imRep D = 0`,
    then `D` kills `u1, u2, u4` (which all lie in `ImO`), and a derivation is
    completely determined by its three generator values (banked N20 `determined`),
    so `D = 0`. A 14-dimensional Lie algebra acting FAITHFULLY on a 7-dimensional
    space — the defining property of the G₂ fundamental representation, here PROVED
    forward. -/
theorem imRep_injective : Function.Injective imRep := by
  rw [injective_iff_map_eq_zero]
  intro D hD
  have key : ∀ (y : O ℚ), y ∈ ImO → (D : Module.End ℚ (O ℚ)) y = 0 := by
    intro y hy
    have h0 : imRep D ⟨y, hy⟩ = (0 : ImO) := by rw [hD]; rfl
    have h1 : ((imRep D ⟨y, hy⟩ : ImO) : O ℚ) = ((0 : ImO) : O ℚ) := by rw [h0]
    rw [imRep_coe] at h1
    simpa using h1
  have hu1 : (D : Module.End ℚ (O ℚ)) u1 = 0 := key u1 u1_mem_ImO
  have hu2 : (D : Module.End ℚ (O ℚ)) u2 = 0 := key u2 u2_mem_ImO
  have hu4 : (D : Module.End ℚ (O ℚ)) u4 = 0 := key u4 u4_mem_ImO
  have hDeq : (D : Module.End ℚ (O ℚ)) = 0 :=
    determined (D : Module.End ℚ (O ℚ)) D.2 hu1 hu2 hu4
  exact Subtype.ext hDeq

/-! ## ANTI-VACUITY on the cascade's terminal algebra (docs/RUNBOOK.md W8).

    The representation is non-trivial: the banked NONZERO witness derivation
    (`witnessDerivQ`, N19) has NONZERO image under `imRep`. This rules out the
    vacuous reading "the zero map acts faithfully." -/

/-- The banked nonzero witness derivation as an element of the Lie algebra. -/
noncomputable def witnessLieQ : derivationLieQ :=
  ⟨witnessDerivQ, witnessDerivQ_isDerivQ⟩

theorem witnessLieQ_ne_zero : witnessLieQ ≠ 0 := by
  intro h
  apply witnessDerivQ_ne_zero
  have h2 : ((witnessLieQ : derivationLieQ) : Module.End ℚ (O ℚ))
      = ((0 : derivationLieQ) : Module.End ℚ (O ℚ)) := by rw [h]
  simpa [witnessLieQ] using h2

/-- ★ ANTI-VACUITY (W8): the banked NONZERO witness derivation has NONZERO image
    under the 7-representation. The faithful action is non-trivial — `imRep` is not
    the zero map on a nonzero element. -/
theorem imRep_witness_ne_zero : imRep witnessLieQ ≠ 0 := by
  intro h
  exact witnessLieQ_ne_zero ((injective_iff_map_eq_zero imRep).mp imRep_injective _ h)

end Phys.Algebra
