/-
  Phys.Algebra.TowerGatherForcedChargeColourComplementary — N246.
  ===========================================================================
  THE FORCED u(1) ⊕ su(3) COMMUTING PAIR AS COMPLEMENTARY SUMMANDS OF `so(7) = 14 ⊕ 7`, DERIVED
  from the gather-obstruction charge operator. Owner-authorized gather-side hypercharge front,
  under the TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native,
  NOT the parked invariant-tower ascent.

  THE JOINT (the deliverable — connecting the charge story N240–N245 to the N225 decomposition).
  N225 banked the EXPLICIT g₂-MODULE COMPLEMENT `so(7) = range imRepL ⊕ range crossEmb = 14 ⊕ 7`:
  the adjoint 14 (`range imRepL`, the derivation image g₂ = Der(O ℚ)) and the fundamental 7
  (`range crossEmb`, the cross-product embedding) MEET TRIVIALLY (`inter_eq_bot`, forced by the
  SIMPLICITY of Der(O ℚ), N28) and span so(7). N240 banked the forced charge operator
  `chargeOp = crossOp u1` and its colour su(3) covariance; N245 banked that colour su(3) COMMUTES
  with `chargeOp`. THIS node places both inside the N225 decomposition:

    ★★★ the CHARGE operator lives in the FUNDAMENTAL-7 summand (`chargeOp ∈ range crossEmb`, since
        `chargeOp = crossOp u1 = crossEmb sgl`), and NOT in the adjoint-14/colour summand
        (`chargeOp ∉ range imRepL`, forced by `inter_eq_bot` + `chargeOp ≠ 0`);
    ★★★ COLOUR su(3) lives in the ADJOINT-14 summand (`colourImg = (colourCentralizer).map imRepL
        ≤ range imRepL`, of dimension `8`);
    ★★★ so the u(1) charge LINE (`chargeLine = span{chargeOp}`, dim `1`) and colour su(3)
        (`colourImg`, dim `8`) MEET ONLY IN `0` (`chargeLine ⊓ colourImg = ⊥`) and form a genuine
        `u(1) ⊕ su(3)` COMMUTING DIRECT SUM of dimension `1 + 8 = 9` inside the concrete so(7)
        (`finrank (chargeLine ⊔ colourImg) = 9`), the two factors COMMUTING (N245).

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The SAME `inter_eq_bot` — the
  trivial intersection of the adjoint 14 and the fundamental 7, forced by the SIMPLICITY of the
  derivation algebra Der(O ℚ) (N28) — that separates the 14 from the 7 now separates COLOUR su(3)
  (which lives in the 14) from the CHARGE operator (which lives in the 7). Charge and colour are
  structurally in COMPLEMENTARY so(7)-summands, AND they commute (N245): the commuting SU(3)×U(1)
  is realized as a direct sum of complementary pieces of the gather arena so(7), DERIVED not posited.
  The field POSITS the gauge group as a product `SU(3) × U(1)`; here the two commuting factors are
  FORCED into complementary summands of the single so(7) the gather tear produces.

  W8 TEETH — the `9` is genuine. `finrank_chargeLine_sup_colourImg = 9` (`1 + 8`, the trivial
  intersection making it a direct sum) — NOT `8` (charge absorbed into colour, i.e. `chargeOp ∈
  range imRepL`, false by `chargeOp_not_mem_range_imRep`) and NOT `1` (colour trivial). The
  `chargeOp_not_mem_range_imRep` teeth (the charge is genuinely NOT an adjoint/colour generator)
  are the crux the whole complementarity rests on.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp`, `crossEmb`, `imRepL`, `imRep`, `colourCentralizer`, `chargeLine`, `colourImg`, `ImO`,
  `bornBil`-so(7) stay DERIVED REAL objects; `LinearMap.range`/`Submodule.map`/`span`/`finrank`/
  `Commute` are Mathlib machinery on them. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`, NO `ℚ[i]`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / colour / su(3) / u(1) /
  fundamental / adjoint / gauge": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for the fundamental
  7 `ImO`, the cross-product embedding `crossEmb`, the derivation embedding `imRepL`, and the
  centralizer `colourCentralizer`, the endomorphism `crossOp u1` lies in `range crossEmb` and not in
  `range imRepL`; the line `span{crossOp u1}` meets `range imRepL` only in `⊥`; the pushed centralizer
  `(colourCentralizer).map imRepL` has `finrank 8`, lies in `range imRepL`, and meets `span{crossOp u1}`
  only in `⊥`; and their sup has `finrank 9`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N245 (`chargeOp`/`chargeOp_ne_zero`/`colour_commute_chargeOp` via
  N240, `sgl`) and N225 (`crossEmb`/`crossEmb_apply`/`imRepL`/`imRep_injective`/`inter_eq_bot`/
  `finrank_colourCentralizer_eq_eight` via N201), and standard Mathlib range/map/span/finrank
  machinery (`LinearMap.range`, `LinearMap.map_le_range`, `Submodule.span`, `finrank_span_singleton`,
  `Submodule.equivMapOfInjective`, `Submodule.finrank_sup_add_finrank_inf_eq`). Ground = derived ℚ;
  nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedColourChargeCommute
import Phys.Algebra.TowerGatherObstructionComplementSo7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE CHARGE OPERATOR SITS IN THE FUNDAMENTAL-7 SUMMAND, NOT THE ADJOINT-14. -/

/-- ★ THE CHARGE IS A FUNDAMENTAL-7 ELEMENT: `chargeOp ∈ range crossEmb`. The forced charge
    operator `chargeOp = crossOp u1` is `crossEmb sgl` (the fundamental-7 embedding N224 evaluated
    on the branching singlet `sgl = ⟨u1⟩`), hence in the range of the fundamental-7 embedding — the
    `7` summand of `so(7) = 14 ⊕ 7` (N225). -/
theorem chargeOp_mem_range_crossEmb : chargeOp ∈ LinearMap.range crossEmb := by
  refine ⟨sgl, ?_⟩
  rw [crossEmb_apply]
  rfl

/-- ★★★ THE MOAT / THE CRUX: the charge operator is NOT an adjoint/colour generator —
    `chargeOp ∉ range imRepL`. If it were, it would sit in `range imRepL ⊓ range crossEmb`, which
    is `⊥` (N225 `inter_eq_bot`, the trivial intersection forced by the SIMPLICITY of Der(O ℚ),
    N28), forcing `chargeOp = 0` — contradicting `chargeOp ≠ 0` (N240). So the charge operator is
    genuinely NOT in the adjoint 14 = g₂: it lives strictly in the fundamental 7. THE SAME
    `inter_eq_bot` that separates the 14 from the 7 separates the charge from colour. -/
theorem chargeOp_not_mem_range_imRep : chargeOp ∉ LinearMap.range imRepL := by
  intro hmem
  have hin : chargeOp ∈ (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) := ⟨hmem, chargeOp_mem_range_crossEmb⟩
  rw [inter_eq_bot] at hin
  exact chargeOp_ne_zero (Submodule.mem_bot ℚ |>.mp hin)

/-! ## THE u(1) CHARGE LINE. -/

/-- The `u(1)` charge line: the span of the forced charge operator inside the gather arena so(7). -/
def chargeLine : Submodule ℚ (Module.End ℚ ImO) := Submodule.span ℚ {chargeOp}

/-- The charge line lies in the fundamental-7 summand `range crossEmb` (it is spanned by
    `chargeOp ∈ range crossEmb`). -/
theorem chargeLine_le_range_crossEmb : chargeLine ≤ LinearMap.range crossEmb := by
  rw [chargeLine, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact chargeOp_mem_range_crossEmb

/-- ★ THE CHARGE LINE IS 1-DIMENSIONAL: `finrank ℚ chargeLine = 1` (`finrank_span_singleton` on the
    nonzero `chargeOp`, N240). The abelian `u(1)` factor is a genuine single direction. (W8.) -/
theorem finrank_chargeLine : Module.finrank ℚ chargeLine = 1 :=
  finrank_span_singleton chargeOp_ne_zero

/-- ★★ THE CHARGE LINE MEETS THE ADJOINT 14 ONLY IN `0`: `chargeLine ⊓ range imRepL = ⊥`. The
    charge line lies in the fundamental-7 summand (`chargeLine_le_range_crossEmb`), which meets the
    adjoint-14 summand only trivially (N225 `inter_eq_bot`). The `u(1)` charge direction shares NO
    generator with the whole adjoint g₂ (in particular none with colour su(3)). -/
theorem chargeLine_inf_range_imRep_eq_bot :
    chargeLine ⊓ LinearMap.range imRepL = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro x hx
  obtain ⟨hxc, hxi⟩ := hx
  have hxcross : x ∈ LinearMap.range crossEmb := chargeLine_le_range_crossEmb hxc
  have hmem : x ∈ (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) := ⟨hxi, hxcross⟩
  rwa [inter_eq_bot] at hmem

/-! ## COLOUR su(3) IN THE ADJOINT-14 SUMMAND. -/

/-- Colour `su(3) = colourCentralizer` (N201) as an `8`-dimensional submodule of the gather arena
    so(7), via the derivation embedding `imRepL` (N225): `colourImg = (colourCentralizer).map imRepL`.
    This is the concrete colour su(3) acting on the fundamental 7, sitting inside the adjoint 14. -/
def colourImg : Submodule ℚ (Module.End ℚ ImO) :=
  (colourCentralizer.toSubmodule).map imRepL

/-- Colour su(3) lies in the adjoint-14 summand `range imRepL` (it is the image of a submodule under
    `imRepL`). -/
theorem colourImg_le_range_imRep : colourImg ≤ LinearMap.range imRepL :=
  LinearMap.map_le_range

/-- ★ COLOUR su(3) IS 8-DIMENSIONAL: `finrank ℚ colourImg = 8`. Since `imRepL` is INJECTIVE (N22
    `imRep_injective`), it embeds `colourCentralizer` isomorphically onto `colourImg`, transporting
    the banked `finrank_colourCentralizer_eq_eight` (N201). The non-abelian `su(3)` factor is a
    genuine 8-dimensional subalgebra inside so(7). -/
theorem finrank_colourImg : Module.finrank ℚ colourImg = 8 := by
  rw [colourImg, (Submodule.equivMapOfInjective imRepL imRep_injective
    colourCentralizer.toSubmodule).finrank_eq.symm]
  exact finrank_colourCentralizer_eq_eight

/-! ## THE u(1) ⊕ su(3) COMMUTING DIRECT SUM INSIDE so(7). -/

/-- ★★ THE CHARGE LINE AND COLOUR su(3) MEET ONLY IN `0`: `chargeLine ⊓ colourImg = ⊥`. Colour
    su(3) lies in the adjoint 14 (`colourImg_le_range_imRep`), and the charge line meets the adjoint
    14 only trivially (`chargeLine_inf_range_imRep_eq_bot`). So the abelian `u(1)` and the
    non-abelian `su(3)` share NO common generator — a genuine direct sum. -/
theorem chargeLine_inf_colourImg_eq_bot : chargeLine ⊓ colourImg = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro x hx
  obtain ⟨hxc, hxcol⟩ := hx
  have hmem : x ∈ chargeLine ⊓ LinearMap.range imRepL := ⟨hxc, colourImg_le_range_imRep hxcol⟩
  rw [chargeLine_inf_range_imRep_eq_bot] at hmem
  exact hmem

/-- ★★★ THE HEADLINE: the `u(1) ⊕ su(3)` is a genuine `9`-DIMENSIONAL COMMUTING DIRECT SUM inside
    the gather arena so(7): `finrank ℚ (chargeLine ⊔ colourImg) = 9 = 1 + 8`. By rank–nullity
    (`Submodule.finrank_sup_add_finrank_inf_eq`) with the trivial intersection
    (`chargeLine_inf_colourImg_eq_bot`): `finrank (⊔) + finrank (⊓ = ⊥) = finrank chargeLine +
    finrank colourImg = 1 + 8`, so the sup is `9`. The commuting SU(3)×U(1) — colour and charge
    COMMUTE (N245) and occupy COMPLEMENTARY summands of the single so(7) the gather produces — is a
    genuine 9-dimensional abelian-times-semisimple direct sum, DERIVED not posited. -/
theorem finrank_chargeLine_sup_colourImg :
    Module.finrank ℚ ↥(chargeLine ⊔ colourImg) = 9 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq chargeLine colourImg
  rw [chargeLine_inf_colourImg_eq_bot, finrank_bot, add_zero, finrank_chargeLine,
      finrank_colourImg] at key
  omega

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FORCED u(1) ⊕ su(3) COMMUTING PAIR AS COMPLEMENTARY SUMMANDS OF `so(7) = 14 ⊕ 7`, from
    the gather obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`,
    inside the concrete `so(7) = skewAdjointLieSubalgebra bornBil` on the fundamental 7 `ImO`, with
    the forced charge operator `chargeOp = crossOp u1` (N240), the fundamental-7 embedding `crossEmb`
    and adjoint-14 embedding `imRepL` (N224/N225), and colour `colourCentralizer = su(3)` (N201):
    (i)   the charge operator is a FUNDAMENTAL-7 element (`chargeOp ∈ range crossEmb`);
    (ii)  it is NOT an adjoint/colour generator (`chargeOp ∉ range imRepL`) — the moat crux, forced
          by the trivial intersection N225 `inter_eq_bot`;
    (iii) the u(1) charge line meets the adjoint 14 only in `⊥` (`chargeLine ⊓ range imRepL = ⊥`);
    (iv)  colour su(3) lies in the adjoint 14 (`colourImg ≤ range imRepL`) and is 8-dimensional;
    (v)   the u(1) charge line and colour su(3) meet only in `⊥` (`chargeLine ⊓ colourImg = ⊥`) and
          their sup is 9-dimensional (`finrank = 9 = 1 + 8`);
    (vi)  the two factors COMMUTE — for every `D ∈ colourCentralizer`, `Commute (imRep D) chargeOp`
          (N245 `colour_commute_chargeOp`).
    The commuting SU(3)×U(1) is realized as a `u(1) ⊕ su(3)` direct sum of COMPLEMENTARY summands of
    the single so(7) the gather tear produces — the abelian charge line in the fundamental 7, colour
    su(3) in the adjoint 14, forced apart by the SAME `inter_eq_bot` (simplicity of Der(O ℚ)) that
    separates the 14 from the 7 — DERIVED, not posited or normalized. -/
theorem forced_charge_colour_complementary_structure :
    chargeOp ∈ skewAdjointLieSubalgebra bornBil ∧
    chargeOp ∈ LinearMap.range crossEmb ∧
    chargeOp ∉ LinearMap.range imRepL ∧
    chargeLine ⊓ LinearMap.range imRepL = ⊥ ∧
    colourImg ≤ LinearMap.range imRepL ∧
    Module.finrank ℚ colourImg = 8 ∧
    chargeLine ⊓ colourImg = ⊥ ∧
    Module.finrank ℚ ↥(chargeLine ⊔ colourImg) = 9 ∧
    (∀ D : derivationLieQ, D ∈ colourCentralizer → Commute (imRep D) chargeOp) :=
  ⟨chargeOp_mem_so7, chargeOp_mem_range_crossEmb, chargeOp_not_mem_range_imRep,
   chargeLine_inf_range_imRep_eq_bot, colourImg_le_range_imRep, finrank_colourImg,
   chargeLine_inf_colourImg_eq_bot, finrank_chargeLine_sup_colourImg,
   colour_commute_chargeOp⟩

end

end Phys.Algebra
