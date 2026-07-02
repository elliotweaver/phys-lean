/-
  Phys.Algebra.TowerGatherReductiveGaugeLie — N247.
  ===========================================================================
  THE REDUCTIVE GAUGE LIE ALGEBRA `u(1) ⊕ su(3)` AS ONE LIE SUBALGEBRA OF `so(7)`, DERIVED from the
  gather-obstruction charge operator. Owner-authorized gather-side hypercharge front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the
  parked invariant-tower ascent.

  THE JOINT (the deliverable — PROMOTING N246 from a submodule direct sum to a LIE-ALGEBRA object).
  N246 banked `chargeLine` (the u(1) charge line, dim `1`) and `colourImg` (colour su(3), dim `8`)
  as COMPLEMENTARY SUBMODULE summands of the concrete `so(7) = 14 ⊕ 7`: they meet only in `⊥` and
  their sup is a genuine dim-`9` direct sum, with the two factors element-wise `Commute` (N245).
  But N246 lived entirely at the SUBMODULE / element-`Commute` level — it never bracketed, never
  closed the join under `⁅·,·⁆`, never exhibited the join as a Lie algebra. THIS node builds the
  LIE-ALGEBRA STRUCTURE the N246 data forces:

    ★★★ the join `chargeLine ⊔ colourImg` is a genuine LIE SUBALGEBRA `chargeColourLie` of the
        ambient `Module.End ℚ ImO` (bracket-closed), and it sits inside the gather arena so(7)
        (`chargeColourLie ≤ skewAdjointLieSubalgebra bornBil`);
    ★★★ the u(1) charge line is CENTRAL in the join: `⁅x, y⁆ = 0` for every `x ∈ chargeLine` and
        `y ∈ chargeColourLie` (`chargeLine_central`) — a genuine central abelian ideal;
    ★★★ the DERIVED SUBALGEBRA of the join lands entirely in colour su(3)
        (`joint_derived_le_colourImg`): the abelian u(1) direction is LOST under bracketing, so the
        semisimple part of the reductive algebra is exactly colour su(3). This is the reductive
        splitting `[g, g] = su(3)`, `Z(g) ⊇ u(1)` of `g = u(1) ⊕ su(3)`, DERIVED not posited.

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The same N245 commuting
  (`colour_commute_chargeOp`, itself the operator recast of the N240 bracket-vanishing whose only
  solutions are colour, forced by the simplicity of Der(O ℚ)) that makes charge and colour commute
  ELEMENT-WISE now makes the u(1) charge line a CENTRAL IDEAL of the joint Lie algebra: the four-term
  bracket of the join collapses (u(1)-self is `0`, both u(1)–colour cross terms are `0` by the
  commuting, only the colour–colour term survives and lands back in colour by the bracket-closure of
  `colourCentralizer`). The commuting SU(3)×U(1) the field POSITS as a product group is here realized
  as the reductive Lie algebra `u(1) ⊕ su(3)` — a single derived Lie subalgebra of the one so(7) the
  gather tear produces, with the abelian factor central and the semisimple factor colour su(3).

  W8 TEETH — the reductive structure is PROPER, not vacuous. `chargeColourLie_finrank = 9`: the
  reductive gauge Lie algebra is genuinely `9`-dimensional (`1 + 8`), NOT collapsed to `8` (charge
  absorbed into colour, i.e. `chargeOp ∈ range imRepL`, false by N246 `chargeOp_not_mem_range_imRep`)
  and NOT to `1` (colour trivial). And `chargeOp_not_central_in_so7`: the u(1) charge is central in
  the JOINT but NOT in ALL of so(7) — `⁅imRep DJ, chargeOp⁆ ≠ 0` (banked `chargeOp_stabilizer_proper`,
  N240, the off-Cartan isospin generator `DJ ∉ colourCentralizer` does NOT commute). The centrality is
  a PROPER property of the reductive subalgebra, not a trivial "everything commutes."

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp`, `chargeLine`, `colourImg`, `imRep`, `imRepL`, `colourCentralizer`, `bornBil`-so(7) stay
  DERIVED REAL objects; `LieSubalgebra`, `⁅·,·⁆` on `Module.End ℚ ImO`, `LieHom.map_lie`,
  `Submodule.mem_sup`/`span` are Mathlib machinery on them. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`,
  NO `ℚ[i]`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / colour / su(3) / u(1) /
  gauge / central / reductive": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for the fundamental 7
  `ImO`, the endomorphism `crossOp u1`, the line `span{crossOp u1}`, the pushed centralizer
  `(colourCentralizer).map imRepL`, and the Born form `bornBil`: the sup
  `span{crossOp u1} ⊔ (colourCentralizer).map imRepL` is a Lie subalgebra of the skew-adjoint
  endomorphisms of `bornBil`; `span{crossOp u1}` brackets to `0` against the whole sup; the derived
  subalgebra `⁅sup, sup⁆` lies in `(colourCentralizer).map imRepL`; and the sup has `finrank 9`. No
  theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N246 (`chargeOp`/`chargeLine`/`colourImg`/`finrank_chargeLine_sup_colourImg`/
  `chargeOp_not_mem_range_imRep` and, via its chain, N245 `colour_commute_chargeOp`, N240
  `chargeOp_mem_so7`/`chargeOp_stabilizer_proper`, N225 `imRepL`/`imRep_mem_so7`, N201
  `colourCentralizer`, N202 `DJ`), and standard Mathlib Lie machinery (`LieSubalgebra`, `Ring.lie_def`
  via the `Module.End` Lie ring, `LieHom.map_lie`, `Submodule.mem_sup`/`mem_span_singleton`/
  `mem_sup_right`, `lie_self`). Ground = derived ℚ; nothing posited; no Mathlib number/algebra as
  content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE u(1) CHARGE LINE COMMUTES WITH COLOUR su(3) AT THE LIE-BRACKET LEVEL. -/

/-- The charge operator brackets to `0` against every element of colour su(3):
    `⁅chargeOp, y⁆ = 0` for `y ∈ colourImg`. This lifts the N245 element-`Commute`
    (`colour_commute_chargeOp`) to the endomorphism Lie bracket `⁅a, b⁆ = a*b − b*a`, across the
    whole colour submodule `colourImg = (colourCentralizer).map imRepL` (span-free: any
    `y ∈ colourImg` is `imRepL d` for `d ∈ colourCentralizer`). -/
theorem chargeOp_lie_colourImg (y : Module.End ℚ ImO) (hy : y ∈ colourImg) :
    ⁅chargeOp, y⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hd
  show chargeOp * (imRepL d) - (imRepL d) * chargeOp = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, ← hc.eq, sub_self]

/-- The other bracket order: `⁅y, chargeOp⁆ = 0` for `y ∈ colourImg`. -/
theorem colourImg_lie_chargeOp (y : Module.End ℚ ImO) (hy : y ∈ colourImg) :
    ⁅y, chargeOp⁆ = 0 := by
  rw [colourImg, Submodule.mem_map] at hy
  obtain ⟨d, hd, rfl⟩ := hy
  have hc : Commute (imRep d) chargeOp := colour_commute_chargeOp d hd
  show (imRepL d) * chargeOp - chargeOp * (imRepL d) = 0
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq, hc.eq, sub_self]

/-! ## COLOUR su(3) IS LIE-BRACKET CLOSED (a Lie subalgebra of so(7)). -/

/-- ★★ COLOUR su(3) IS BRACKET-CLOSED: `⁅x, y⁆ ∈ colourImg` for `x, y ∈ colourImg`. Any two colour
    elements are `imRepL d`, `imRepL d'` with `d, d' ∈ colourCentralizer`; their bracket is
    `imRepL ⁅d, d'⁆` (the Lie-hom identity `LieHom.map_lie imRep`) with `⁅d, d'⁆ ∈ colourCentralizer`
    (colour is a Lie SUBALGEBRA of Der(O ℚ), N201 `colourCentralizer.lie_mem`). Colour su(3) is a
    genuine Lie subalgebra sitting inside so(7). -/
theorem colourImg_lie_closed (x y : Module.End ℚ ImO)
    (hx : x ∈ colourImg) (hy : y ∈ colourImg) : ⁅x, y⁆ ∈ colourImg := by
  rw [colourImg, Submodule.mem_map] at hx hy
  obtain ⟨d, hd, rfl⟩ := hx
  obtain ⟨d', hd', rfl⟩ := hy
  have hbr : (⁅d, d'⁆ : derivationLieQ) ∈ colourCentralizer := colourCentralizer.lie_mem hd hd'
  rw [colourImg, Submodule.mem_map]
  exact ⟨⁅d, d'⁆, hbr, by rw [show imRepL ⁅d, d'⁆ = imRep ⁅d, d'⁆ from rfl, LieHom.map_lie]; rfl⟩

/-! ## THE u(1) CHARGE LINE — BRACKETS TO ZERO AGAINST EVERYTHING IN THE JOIN. -/

/-- The charge line brackets to `0` against colour su(3): `⁅x, y⁆ = 0` for `x ∈ chargeLine`,
    `y ∈ colourImg`. (`x = a • chargeOp`, then `chargeOp_lie_colourImg`.) -/
theorem chargeLine_lie_colourImg (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine) (hy : y ∈ colourImg) : ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hx
  obtain ⟨a, rfl⟩ := hx
  rw [smul_lie, chargeOp_lie_colourImg y hy, smul_zero]

/-- The other order: `⁅x, y⁆ = 0` for `x ∈ colourImg`, `y ∈ chargeLine`. -/
theorem colourImg_lie_chargeLine (x y : Module.End ℚ ImO)
    (hx : x ∈ colourImg) (hy : y ∈ chargeLine) : ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hy
  obtain ⟨b, rfl⟩ := hy
  rw [lie_smul, colourImg_lie_chargeOp x hx, smul_zero]

/-- The charge line is self-abelian: `⁅x, y⁆ = 0` for `x, y ∈ chargeLine` (both `• chargeOp`,
    `⁅chargeOp, chargeOp⁆ = 0`). -/
theorem chargeLine_lie_chargeLine (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine) (hy : y ∈ chargeLine) : ⁅x, y⁆ = 0 := by
  rw [chargeLine, Submodule.mem_span_singleton] at hx hy
  obtain ⟨a, rfl⟩ := hx
  obtain ⟨b, rfl⟩ := hy
  have hs : (⁅chargeOp, chargeOp⁆ : Module.End ℚ ImO) = 0 := lie_self chargeOp
  rw [smul_lie, lie_smul, hs, smul_zero, smul_zero]

/-! ## THE DERIVED SUBALGEBRA OF THE JOIN LANDS IN COLOUR — THE REDUCTIVE SPLITTING. -/

/-- ★★★ THE DERIVED SUBALGEBRA LANDS IN COLOUR: `⁅x, y⁆ ∈ colourImg` for `x, y ∈ chargeLine ⊔
    colourImg`. Writing `x = xc + xk`, `y = yc + yk` with `xc, yc ∈ chargeLine` and
    `xk, yk ∈ colourImg`, the bracket expands into four terms; THREE vanish — `⁅xc, yc⁆ = 0`
    (charge line abelian), `⁅xc, yk⁆ = 0` and `⁅xk, yc⁆ = 0` (the u(1) charge line commutes with
    colour, N245) — leaving only `⁅xk, yk⁆ ∈ colourImg` (colour bracket-closed). So the abelian
    u(1) direction is LOST under bracketing: the derived subalgebra of the reductive `u(1) ⊕ su(3)`
    is exactly colour su(3). -/
theorem joint_derived_le_colourImg (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine ⊔ colourImg) (hy : y ∈ chargeLine ⊔ colourImg) :
    ⁅x, y⁆ ∈ colourImg := by
  rw [Submodule.mem_sup] at hx hy
  obtain ⟨xc, hxc, xk, hxk, rfl⟩ := hx
  obtain ⟨yc, hyc, yk, hyk, rfl⟩ := hy
  rw [add_lie, lie_add, lie_add,
      chargeLine_lie_chargeLine xc yc hxc hyc, chargeLine_lie_colourImg xc yk hxc hyk,
      colourImg_lie_chargeLine xk yc hxk hyc, add_zero, zero_add, zero_add]
  exact colourImg_lie_closed xk yk hxk hyk

/-- The join is bracket-closed: `⁅x, y⁆ ∈ chargeLine ⊔ colourImg` (the derived subalgebra lands in
    `colourImg ≤ chargeLine ⊔ colourImg`). -/
theorem joint_lie_mem (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine ⊔ colourImg) (hy : y ∈ chargeLine ⊔ colourImg) :
    ⁅x, y⁆ ∈ chargeLine ⊔ colourImg :=
  Submodule.mem_sup_right (joint_derived_le_colourImg x y hx hy)

/-! ## THE REDUCTIVE GAUGE LIE ALGEBRA OBJECT. -/

/-- ★★★ THE REDUCTIVE GAUGE LIE ALGEBRA `u(1) ⊕ su(3)`: the join `chargeLine ⊔ colourImg` packaged
    as a genuine LIE SUBALGEBRA of the ambient endomorphism algebra `Module.End ℚ ImO`,
    bracket-closed by `joint_lie_mem`. This is the commuting SU(3)×U(1) realized as ONE derived Lie
    object inside the single so(7) the gather tear produces — the abelian u(1) charge line plus
    colour su(3), the field's posited product group DERIVED as a reductive Lie subalgebra. -/
def chargeColourLie : LieSubalgebra ℚ (Module.End ℚ ImO) where
  __ := chargeLine ⊔ colourImg
  lie_mem' {x y} hx hy := joint_lie_mem x y hx hy

/-- The carrier of the reductive gauge Lie algebra is the N246 join. -/
@[simp] theorem chargeColourLie_toSubmodule :
    chargeColourLie.toSubmodule = chargeLine ⊔ colourImg := rfl

/-- Membership in the reductive gauge Lie algebra is membership in the join. -/
theorem mem_chargeColourLie {x : Module.End ℚ ImO} :
    x ∈ chargeColourLie ↔ x ∈ chargeLine ⊔ colourImg := Iff.rfl

/-! ## THE REDUCTIVE GAUGE LIE ALGEBRA SITS INSIDE THE GATHER ARENA so(7). -/

/-- The charge line lies in so(7): it is spanned by `chargeOp ∈ so(7)` (N240 `chargeOp_mem_so7`). -/
theorem chargeLine_le_so7 :
    chargeLine ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  rw [chargeLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact chargeOp_mem_so7

/-- Colour su(3) lies in so(7): each `imRepL d` is skew-adjoint for the Born form (N223
    `imRep_mem_so7`). -/
theorem colourImg_le_so7 :
    colourImg ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  intro x hx
  rw [colourImg, Submodule.mem_map] at hx
  obtain ⟨d, _hd, rfl⟩ := hx
  show (imRepL d) ∈ (skewAdjointLieSubalgebra bornBil).toSubmodule
  have hEq : (imRepL d) = imRep d := rfl
  rw [hEq]; exact imRep_mem_so7 d

/-- ★★ THE REDUCTIVE GAUGE LIE ALGEBRA SITS INSIDE so(7):
    `chargeColourLie ≤ skewAdjointLieSubalgebra bornBil`. Both factors — the u(1) charge line
    (`chargeLine_le_so7`) and colour su(3) (`colourImg_le_so7`) — are skew-adjoint for the Born
    form, so their join is a Lie subalgebra of the concrete gather arena so(7) = 14 ⊕ 7. -/
theorem chargeColourLie_le_so7 :
    chargeColourLie ≤ skewAdjointLieSubalgebra bornBil := by
  rw [LieSubalgebra.le_def]
  intro x hx
  have hx' : x ∈ chargeLine ⊔ colourImg := hx
  exact (sup_le chargeLine_le_so7 colourImg_le_so7) hx'

/-! ## THE u(1) CHARGE LINE IS A CENTRAL IDEAL OF THE REDUCTIVE ALGEBRA. -/

/-- ★★★ THE u(1) CHARGE LINE IS CENTRAL IN THE REDUCTIVE ALGEBRA: `⁅x, y⁆ = 0` for every
    `x ∈ chargeLine` and every `y ∈ chargeColourLie`. Decomposing `y = yc + yk`
    (`yc ∈ chargeLine`, `yk ∈ colourImg`): `⁅x, yc⁆ = 0` (charge line abelian) and `⁅x, yk⁆ = 0`
    (the u(1) charge line commutes with colour, N245). So the abelian u(1) factor is a genuine
    CENTRAL abelian ideal of the reductive gauge Lie algebra `u(1) ⊕ su(3)`. -/
theorem chargeLine_central (x y : Module.End ℚ ImO)
    (hx : x ∈ chargeLine) (hy : y ∈ chargeColourLie) : ⁅x, y⁆ = 0 := by
  rw [mem_chargeColourLie, Submodule.mem_sup] at hy
  obtain ⟨yc, hyc, yk, hyk, rfl⟩ := hy
  rw [lie_add, chargeLine_lie_chargeLine x yc hx hyc, chargeLine_lie_colourImg x yk hx hyk, add_zero]

/-! ## W8 TEETH — THE CENTRALITY IS PROPER (the charge is NOT central in all of so(7)). -/

/-- ★★ W8 TEETH — THE CENTRALITY IS A PROPER PROPERTY: the u(1) charge is central in the JOINT
    `u(1) ⊕ su(3)` but NOT in ALL of the gather arena so(7). The off-Cartan isospin generator `DJ`
    (N202, `DJ ∉ colourCentralizer`) does NOT commute with the charge operator:
    `⁅imRep DJ, chargeOp⁆ ≠ 0` (banked `chargeOp_stabilizer_proper`, N240). So `chargeLine_central`
    is genuine reductive-algebra content, NOT a vacuous "everything commutes." -/
theorem chargeOp_not_central_in_so7 : ⁅imRep DJ, chargeOp⁆ ≠ 0 :=
  chargeOp_stabilizer_proper

/-! ## THE FINRANK OF THE REDUCTIVE ALGEBRA — 9 = 1 + 8, TRANSPORTED TO THE LIE OBJECT. -/

/-- ★★ THE REDUCTIVE GAUGE LIE ALGEBRA IS 9-DIMENSIONAL: `finrank ℚ chargeColourLie.toSubmodule = 9`
    (= `1 + 8`, the N246 direct-sum dimension `finrank_chargeLine_sup_colourImg`, transported to the
    NEW Lie object). The reductive `u(1) ⊕ su(3)` is genuinely `9`-dimensional — W8: not `8` (charge
    absorbed into colour) and not `1` (colour trivial). -/
theorem chargeColourLie_finrank :
    Module.finrank ℚ chargeColourLie.toSubmodule = 9 :=
  finrank_chargeLine_sup_colourImg

/-! ## THE CAPSTONE. -/

/-- ★★★ THE REDUCTIVE GAUGE LIE ALGEBRA `u(1) ⊕ su(3)` AS ONE LIE SUBALGEBRA OF `so(7)`, from the
    gather obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, inside
    the concrete `so(7) = skewAdjointLieSubalgebra bornBil` on the fundamental 7 `ImO`, with the
    forced charge operator `chargeOp = crossOp u1` (N240), the u(1) charge line `chargeLine` and
    colour su(3) `colourImg` (N246):
    (i)   colour su(3) is BRACKET-CLOSED (`⁅x, y⁆ ∈ colourImg` for `x, y ∈ colourImg`) — a Lie
          subalgebra;
    (ii)  the u(1) charge line brackets to `0` against the whole join (`chargeLine_central`) — a
          central abelian ideal;
    (iii) the DERIVED subalgebra of the join lands in colour su(3) (`joint_derived_le_colourImg`) —
          the abelian u(1) lost under bracketing, the reductive splitting;
    (iv)  the join is a genuine LIE SUBALGEBRA `chargeColourLie` of `Module.End ℚ ImO`, sitting
          inside so(7) (`chargeColourLie_le_so7`), of dimension `9 = 1 + 8`
          (`chargeColourLie_finrank`);
    (v)   the centrality is PROPER — the charge is NOT central in all of so(7)
          (`chargeOp_not_central_in_so7`, `⁅imRep DJ, chargeOp⁆ ≠ 0`).
    The commuting SU(3)×U(1) the field POSITS as a product group is realized as the reductive Lie
    algebra `u(1) ⊕ su(3)` — one derived Lie subalgebra of the single so(7) the gather tear
    produces, abelian factor central, semisimple factor colour su(3) — DERIVED, not posited. -/
theorem reductive_gauge_lie_structure :
    (∀ x y : Module.End ℚ ImO, x ∈ colourImg → y ∈ colourImg → ⁅x, y⁆ ∈ colourImg) ∧
    (∀ x y : Module.End ℚ ImO, x ∈ chargeLine → y ∈ chargeColourLie → ⁅x, y⁆ = 0) ∧
    (∀ x y : Module.End ℚ ImO, x ∈ chargeLine ⊔ colourImg → y ∈ chargeLine ⊔ colourImg →
      ⁅x, y⁆ ∈ colourImg) ∧
    chargeColourLie.toSubmodule = chargeLine ⊔ colourImg ∧
    chargeColourLie ≤ skewAdjointLieSubalgebra bornBil ∧
    Module.finrank ℚ chargeColourLie.toSubmodule = 9 ∧
    ⁅imRep DJ, chargeOp⁆ ≠ 0 :=
  ⟨colourImg_lie_closed, chargeLine_central, joint_derived_le_colourImg,
   chargeColourLie_toSubmodule, chargeColourLie_le_so7, chargeColourLie_finrank,
   chargeOp_not_central_in_so7⟩

end

end Phys.Algebra
