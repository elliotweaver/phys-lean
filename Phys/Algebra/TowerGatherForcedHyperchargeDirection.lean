/-
  Phys.Algebra.TowerGatherForcedHyperchargeDirection — N255.
  ===========================================================================
  THE FORCED HYPERCHARGE DIRECTION: the isospin-commuting neutral generator is the gather
  cross-product of the isospin-NEUTRAL branching singlet — the TWIN of the charge operator.

  Over the fundamental 7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, N254 proved a
  SECOND independent neutral direction is FORCED (the gather charge `chargeOp = crossOp u1` and the
  doubling weak-isospin Cartan `imRep DI` grade the 7 in MISALIGNED ways). That was the EXISTENCE.
  This node PINS WHICH direction it is — the IDENTITY:

    hyperOp := crossOp (kappaO 1)  : Module.End ℚ ImO

  the gather cross-product of the isospin-FIXED branching singlet `kappaO 1` (N189), the TWIN of
  `chargeOp = crossOp u1` (the cross-product of the isospin-CHARGED unit `u1`).

  THE TWIN STRUCTURE. The gather tear embeds the fundamental 7 into `so(7)` via the cross-product
  `crossOp`, g₂-EQUIVARIANTLY: `crossOp_imRep_intertwine` (N225) gives
  `⁅imRep D, crossOp a⁆ = crossOp (D a)` for every derivation `D`. So the commutation of a gather
  cross-product with an isospin generator is CONTROLLED BY how that generator moves the seed vector:

    • the charge seed `u1` is isospin-CHARGED (`DJ u1 ≠ 0`), so `chargeOp = crossOp u1` commutes with
      colour su(3) ONLY (N245), NOT with all weak isospin — `⁅imRep DJ, chargeOp⁆ ≠ 0` (N240);
    • the hypercharge seed `kappaO 1` is the su(2)_L branching singlet — EVERY inner derivation
      annihilates it (`innerDeriv_kappaO_one` N189: `DI, DJ, DK` all send it to 0). So its gather
      cross-product `hyperOp = crossOp (kappaO 1)` commutes with the ENTIRE weak isospin su(2)_L:
      `⁅imRep D, hyperOp⁆ = crossOp (D (kappaO 1)) = crossOp 0 = 0` for every `D ∈ {DI, DJ, DK}`.

  The two U(1)s are the cross-products of the two branching singlets, and each has a MAXIMAL
  non-abelian commutant = the OTHER factor (charge↔colour, hypercharge↔isospin) — the DUAL symmetry.

  THE DELIVERABLE (all objects banked; ground = derived ℚ; `O ℚ = CD (H ℚ)`):
    • THE OBJECT — `hyperOp := crossOp (kappaO 1) : Module.End ℚ ImO`.
    • THE HEADLINE (isospin-commuting) — `hyperOp` commutes with ALL of su(2)_L = {DI,DJ,DK}:
      `hyperOp_commute_DI/DJ/DK` (`Commute (imRep D) hyperOp`) and the bracket forms
      `hyperOp_bracket_DI/DJ/DK` (`⁅imRep D, hyperOp⁆ = 0`), packaged in `hyperOp_commute_isospin`.
    • THE CONTRAST (W8 teeth, the twin asymmetry) — `chargeOp` does NOT: `⁅imRep DJ, chargeOp⁆ ≠ 0`
      (banked `chargeOp_stabilizer_proper` N240). Packaged as `charge_not_isospin_commuting` and
      `hyper_charge_differ` — the two U(1)s are GENUINELY DIFFERENT operators with different
      commutants: `hyperOp` is isospin-neutral, `chargeOp` is not.
    • W8 NON-VACUITY — `hyperOp ≠ 0` (`hyperOp_ne_zero`), coordinate-free through the banked FAITHFUL
      embedding `crossEmb_injective` (the isospin-commuting property is not the trivial `0 = 0`).
    • CAPSTONE — `forced_hypercharge_structure`.

  THE ROUTE (THE ONE LAW / W9-LIGHT — NO coordinate bash of the non-associative `O ℚ` product).
  Headline: the banked g₂-intertwiner `crossOp_imRep_intertwine` (N225) turns
  `⁅imRep D, crossOp (kappaO 1)⁆` into `crossOp (D (kappaO 1))`; the banked singlet annihilation
  `innerDeriv_kappaO_one` (N189) gives `D (kappaO 1) = 0`; `crossOp_zero` closes it. Three rewrites,
  ONE generic lemma for all three DI/DJ/DK. Nonzero: the banked FAITHFULNESS `crossEmb_injective`
  (N225, itself a consequence of Born POSITIVITY / self-blindness) + `kappaO_one_ne_zero` (N189) — no
  kernel-trust bypass, no octonion-product bash, no coordinate witness.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "hypercharge / charge / isospin / weak / gauge /
  neutral / U(1) / Standard Model": what remains is — over the derived field ℚ and the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, the cross-product endomorphism `crossOp (kappaO 1)` of the
  fundamental 7-module `ImO` COMMUTES with every element of the derived 3-dim subalgebra
  `{imRep DI, imRep DJ, imRep DK}` (⊂ g₂), whereas `crossOp u1` does NOT commute with `imRep DJ`; and
  `crossOp (kappaO 1) ≠ 0`. No theorem STATEMENT needs a physics word; every one mentions the banked
  tower objects `crossOp / kappaO / imRep / DI,DJ,DK / ImO / chargeOp` on the derived `O ℚ`.

  ⚠ SCOPE (do NOT overclaim; respects the ≥5× hypercharge-normalization deferral). This banks the
  forced isospin-commuting DIRECTION `crossOp (kappaO 1)` and its asymmetry vs `chargeOp`. It does
  NOT claim the weak MIXING ANGLE, the coupling NORMALIZATION, or a Gell-Mann–Nishijima
  `Q = T₃ + Y/2` relation (numerically FALSE as a span relation here: `chargeOp ∉ span{imRep DI,
  hyperOp}`). It twins N254's forced-EXISTENCE with a forced IDENTITY; the normalization stays a
  separate downstream node. The UNIQUENESS of this direction (the 1-dim so(7)-centralizer of su(2)_L
  equals span{hyperOp}) is numerically confirmed but its `g₂`-side vanishing is a heavier obligation,
  scoped to a dedicated child node (W1 — never bypass, never shrink).

  UNBROKEN: `crossOp / crossOp_zero / crossOp_imRep_intertwine / crossEmb / crossEmb_apply /
  crossEmb_injective` (N225), `chargeOp / chargeOp_stabilizer_proper` (N240), `imRep / DI,DJ,DK`
  (N22/N202), `kappaO / kappaO_one_mem_ImO / kappaO_one_ne_zero / innerDeriv_kappaO_one /
  innerDerivQ_apply` (N189). Ground = derived ℚ; `O ℚ = CD (H ℚ)`; NO Mathlib ℝ/ℂ/number/algebra as
  content; nothing posited; no bridge.
-/
import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

/-! ## (A) THE OBJECT — the forced hypercharge operator. -/

/-- ★ THE FORCED HYPERCHARGE OPERATOR: the gather cross-product of the isospin-neutral branching
    singlet `kappaO 1`. The TWIN of `chargeOp = crossOp u1` (which is `crossOp` of the isospin-
    CHARGED unit `u1`). -/
noncomputable def hyperOp : Module.End ℚ ImO := crossOp (kappaO 1)

/-! ## (B) THE HEADLINE — `hyperOp` commutes with the WHOLE weak isospin su(2)_L. -/

/-- Every isospin generator `D = ⟨innerDerivQ q⟩` annihilates the branching singlet `kappaO 1` as an
    `O ℚ` endomorphism (`innerDeriv_kappaO_one` N189: `DI, DJ, DK` all fix it). -/
theorem D_kappaO_one_zero (q : H ℚ) (hq : IsDerivQ (innerDerivQ q)) :
    ((⟨innerDerivQ q, hq⟩ : derivationLieQ) : Module.End ℚ (O ℚ)) (kappaO 1) = 0 := by
  change innerDerivQ q (kappaO 1) = 0
  rw [innerDerivQ_apply]
  exact innerDeriv_kappaO_one q

/-- The generic bracket vanishing: for EVERY isospin generator `D = ⟨innerDerivQ q⟩`, the bracket of
    its fundamental-7 image with `hyperOp` is zero. Route (THE ONE LAW / W9-LIGHT): the N225
    g₂-intertwiner `crossOp_imRep_intertwine` rewrites `⁅imRep D, crossOp (kappaO 1)⁆` to
    `crossOp (D (kappaO 1))`; the N189 singlet annihilation `D_kappaO_one_zero` gives
    `D (kappaO 1) = 0`; `crossOp_zero` closes it. -/
theorem hyperOp_bracket_gen (q : H ℚ) (hq : IsDerivQ (innerDerivQ q)) :
    ⁅imRep (⟨innerDerivQ q, hq⟩ : derivationLieQ), hyperOp⁆ = 0 := by
  rw [hyperOp, crossOp_imRep_intertwine (⟨innerDerivQ q, hq⟩ : derivationLieQ) (kappaO 1),
    D_kappaO_one_zero q hq, crossOp_zero]

/-- ★ `⁅imRep DI, hyperOp⁆ = 0`. -/
theorem hyperOp_bracket_DI : ⁅imRep DI, hyperOp⁆ = 0 := hyperOp_bracket_gen hI DI.2
/-- ★ `⁅imRep DJ, hyperOp⁆ = 0`. -/
theorem hyperOp_bracket_DJ : ⁅imRep DJ, hyperOp⁆ = 0 := hyperOp_bracket_gen hJ DJ.2
/-- ★ `⁅imRep DK, hyperOp⁆ = 0`. -/
theorem hyperOp_bracket_DK : ⁅imRep DK, hyperOp⁆ = 0 := hyperOp_bracket_gen hK DK.2

/-- ★ `hyperOp` COMMUTES with the isospin Cartan `imRep DI`. -/
theorem hyperOp_commute_DI : Commute (imRep DI) hyperOp := sub_eq_zero.mp hyperOp_bracket_DI
/-- ★ `hyperOp` COMMUTES with `imRep DJ`. -/
theorem hyperOp_commute_DJ : Commute (imRep DJ) hyperOp := sub_eq_zero.mp hyperOp_bracket_DJ
/-- ★ `hyperOp` COMMUTES with `imRep DK`. -/
theorem hyperOp_commute_DK : Commute (imRep DK) hyperOp := sub_eq_zero.mp hyperOp_bracket_DK

/-- ★★ THE HEADLINE: `hyperOp` commutes with the WHOLE weak isospin su(2)_L = {DI, DJ, DK}. -/
theorem hyperOp_commute_isospin :
    Commute (imRep DI) hyperOp ∧ Commute (imRep DJ) hyperOp ∧ Commute (imRep DK) hyperOp :=
  ⟨hyperOp_commute_DI, hyperOp_commute_DJ, hyperOp_commute_DK⟩

/-! ## (C) THE CONTRAST — `chargeOp` does NOT commute with all su(2)_L (the twin asymmetry). -/

/-- ★ THE CONTRAST (W8 teeth): the charge operator does NOT commute with all of su(2)_L —
    `⁅imRep DJ, chargeOp⁆ ≠ 0` (banked `chargeOp_stabilizer_proper` N240, since `DJ ∉ colour`).
    Whereas `hyperOp` DOES (`hyperOp_bracket_DJ`). The two U(1)s are GENUINELY DIFFERENT operators
    with different commutants. -/
theorem charge_not_isospin_commuting : ⁅imRep DJ, chargeOp⁆ ≠ 0 := chargeOp_stabilizer_proper

/-- ★ The twin asymmetry as a single statement: `hyperOp` commutes with `imRep DJ` but `chargeOp`
    does NOT — so the two forced neutral generators have DIFFERENT `DJ`-commutants. `hyperOp` is
    isospin-neutral; `chargeOp` is not. -/
theorem hyper_charge_differ :
    ⁅imRep DJ, hyperOp⁆ = 0 ∧ ⁅imRep DJ, chargeOp⁆ ≠ 0 :=
  ⟨hyperOp_bracket_DJ, chargeOp_stabilizer_proper⟩

/-! ## (D) W8 non-vacuity — `hyperOp ≠ 0`. -/

/-- The isospin singlet `kappaO 1 = ⟨0,1⟩` as a vector of the fundamental 7 `ImO`. -/
noncomputable def kap1' : ImO := ⟨kappaO 1, kappaO_one_mem_ImO⟩

/-- The singlet vector is NONZERO in `ImO` (`kappaO_one_ne_zero` N189). -/
theorem kap1'_ne_zero : kap1' ≠ 0 := fun h => kappaO_one_ne_zero (congrArg Subtype.val h)

/-- ★ W8 NON-VACUITY: `hyperOp ≠ 0`. The isospin-commuting property is not the trivial `0 = 0`.
    Coordinate-free, straight from the trunk: the gather cross-product embedding
    `crossEmb : a ↦ crossOp a` is FAITHFUL (`crossEmb_injective` N225, itself a consequence of Born
    POSITIVITY / self-blindness), and the singlet vector `kap1' = ⟨kappaO 1⟩` is nonzero
    (`kappaO_one_ne_zero` N189), so `hyperOp = crossEmb kap1' = crossOp (kappaO 1) ≠ 0`. -/
theorem hyperOp_ne_zero : hyperOp ≠ 0 := by
  have hemb : crossEmb kap1' = hyperOp := by rw [crossEmb_apply]; rfl
  intro h
  rw [h] at hemb
  exact kap1'_ne_zero (crossEmb_injective (by rw [hemb, map_zero]))

/-! ## (E) THE CAPSTONE. -/

/-- ★★★ THE FORCED HYPERCHARGE DIRECTION. Over the fundamental 7 = `ImO` of the derived octonion
    rung `O ℚ = CD (H ℚ)`, the gather cross-product of the isospin-neutral branching singlet
    `hyperOp = crossOp (kappaO 1)` (the TWIN of `chargeOp = crossOp u1`):
    (i)   is NONZERO (`hyperOp ≠ 0`);
    (ii)  COMMUTES with the WHOLE weak isospin su(2)_L = {DI, DJ, DK};
    (iii) whereas `chargeOp` does NOT commute with all of su(2)_L (`⁅imRep DJ, chargeOp⁆ ≠ 0`) — so
          the two forced neutral directions are GENUINELY DIFFERENT operators with different
          commutants (`hyperOp` isospin-neutral, `chargeOp` not). A second neutral generator
          (hypercharge) is not merely forced (N254) — its DIRECTION is PINNED, not chosen. -/
theorem forced_hypercharge_structure :
    hyperOp ≠ 0 ∧
    (Commute (imRep DI) hyperOp ∧ Commute (imRep DJ) hyperOp ∧ Commute (imRep DK) hyperOp) ∧
    ⁅imRep DJ, chargeOp⁆ ≠ 0 :=
  ⟨hyperOp_ne_zero, hyperOp_commute_isospin, chargeOp_stabilizer_proper⟩

end Phys.Algebra
