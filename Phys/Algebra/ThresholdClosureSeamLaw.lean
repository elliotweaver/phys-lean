import Phys.Algebra.FreezeoutCorrectedDissolution
import Phys.Algebra.DecouplingCensusRemoval
import Mathlib.Tactic

/-!
  # N693 — THE SEAM LAW (THRESHOLD CLOSURE campaign, Phase B, handoff item 1)
  ==============================================================================
  The verdict's §6 handoff, item 1 — the single load-bearing NEW-DERIVATION step
  (CLOSURE-VERDICT.md §2 S2): formalize the descent's cover and prove that the local
  active-span sections glue to the global (band) sections iff the closure cocycle —
  one census-valued defect per seam, equal to the just-decoupled flavour's
  `colouredCensusTerm` — is added.

  THE COVER (the descent as a ladder): the three spans are charts; each chart's LOCAL
  section is its active-span census; the LADDER identities (target 2) show each local
  section IS the global (band) section one level down — the cover is a ladder and the
  seam defects are its rungs' increments. The GLOBAL section at each level is the band
  census; global = local + defect is the gluing form (target 4); the defects telescope
  to the full descent drop (target 3); the screening decomposition per seam (weight 1,
  on that seam's own span-log, `bandScreen` linearity) is Q2/Q3/Q4 (target 4); and the
  gather-level composition (old summand = corrected summand + closure screening,
  including the gem defect `16/9 − 40/27 = 8/27` on the light rung) is target 5.

  Grep facts consumed (kill-check discharged):
    • `censusBottomBand`/`censusCharmBand`/`censusLightBand` (+ `_val`)
      (SubBandCompletion L190-207) — the GLOBAL band sections `bandCensus [2,1,1,2,1]`,
      `[2,1,1,2]`, `[2,1,1]`;
    • `censusActiveBottomSpan`/`censusActiveCharmSpan`/`censusActiveLightSpan` (+ `_val`),
      `overcount_bottom`/`overcount_charm`/`overcount_light`,
      `active_step_charm`/`active_step_strange` (PerEdgeCensusRederived L178-240) —
      the LOCAL active sections `bandCensus [2,1,1,2]`, `[2,1,1]`, `[2,1]` and the
      banked per-seam deltas;
    • `bandCensus` (FineStructureCensusBands L150), `colouredCensusTerm` (L136),
      `colouredCensusTerm_one` = 1/3 (L139), `colouredCensusTerm_two` = 4/3 (L143);
    • `bandScreen` (FineStructureZeroMomentum L145) — `κ · c · cutLog r`, LINEAR in
      the census with unit coefficient (Q4's weight-1);
    • `colouredCensus`/`colouredCensus_val` = 10/3, `leptonCensus`/`leptonCensus_val` = 2
      (DecouplingCensusRemoval L153-167) — the honest tie for the telescope total;
    • `freezeoutBankedSummand`/`freezeoutCorrectedSummand`/`corrected_vs_banked`
      (FreezeoutCorrectedDissolution, N689) — the two dissolved summands at the pinned
      edges `rb = mbRatioDerived·(bMass 0/bMass 2)`, `rc = 1/mbRatioDerived`,
      `rl = downConfBundle·bMass 2` (ComposedFreezeoutDissolved) and their exact
      difference `8/27 + κ·[−(2/3)L_mb + (1/3)L_b0]`.

  HONEST NOTE (target 3's name-tie): the telescoped cocycle total is
  `2·colouredCensusTerm 1 + colouredCensusTerm 2 = 2`. The prereg asked whether this
  equals `colouredCensus`; it does NOT — `colouredCensus_val = 10/3 ≠ 2`
  (`cocycle_total_ne_colouredCensus` below). The banked census-valued objects it DOES
  equal by name are `censusLightBand` (= `bandCensus [2,1,1]` — the SAME multiset of
  census terms {2,1,1} as the defect list {1,2,1}) and `leptonCensus` (= 2, the
  singlet slice). Both ties are banked below; the mismatch is stated, not hidden.

  PHYSICS-WORDS-REMOVABLE: delete seam/flavour/screening — the statements are exact
  ℚ-valued list identities over the derived `Cut`, a subtraction-vs-addition gluing
  form, and linear decompositions of `κ·c·log r` in `c`. Classical only through the
  banked foundations.

  NO sorry / admit / axiom. No lake, no git, no endpoint arithmetic.
-/

namespace Phys.Algebra.ThresholdClosureSeamLaw

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.FreezeoutCorrectedDissolution
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE SEAM DEFECT — the census-valued gluing defect on each overlap. -/

/-- THE SEAM DEFECT: the census-valued local→global gluing defect on a seam — the
    GLOBAL (band) section minus the LOCAL (active-span) section. The descent's
    analogue of `gluingDefect` (TowerGatherObstruction), valued in census space. -/
def seamDefect (bandC activeC : Cut) : Cut := bandC - activeC

/-- ★★ (TARGET 1a) THE BOTTOM SEAM DEFECT IS THE BOTTOM FLAVOUR'S CENSUS TERM:
    `seamDefect censusBottomBand censusActiveBottomSpan = colouredCensusTerm 1`
    (= 1/3, down-type, level 1) — the banked `overcount_bottom`, RE-DERIVED as an
    instance of the seam law's defect object. -/
theorem seamDefect_bottom :
    seamDefect censusBottomBand censusActiveBottomSpan
      = ((colouredCensusTerm 1 : ℚ) : Cut) := by
  unfold seamDefect; exact overcount_bottom

/-- ★★ (TARGET 1b) THE CHARM SEAM DEFECT IS THE CHARM FLAVOUR'S CENSUS TERM:
    `seamDefect censusCharmBand censusActiveCharmSpan = colouredCensusTerm 2`
    (= 4/3, up-type, level 2) — the banked `overcount_charm` as a seam-law instance.
    The nontrivial 4/3-vs-1/3 alternation by up/down type. -/
theorem seamDefect_charm :
    seamDefect censusCharmBand censusActiveCharmSpan
      = ((colouredCensusTerm 2 : ℚ) : Cut) := by
  unfold seamDefect; exact overcount_charm

/-- ★★ (TARGET 1c) THE LIGHT SEAM DEFECT IS THE STRANGE FLAVOUR'S CENSUS TERM:
    `seamDefect censusLightBand censusActiveLightSpan = colouredCensusTerm 1`
    (= 1/3, down-type, level 1) — the banked `overcount_light` as a seam-law instance. -/
theorem seamDefect_light :
    seamDefect censusLightBand censusActiveLightSpan
      = ((colouredCensusTerm 1 : ℚ) : Cut) := by
  unfold seamDefect; exact overcount_light

/-- The three seam defects as plain `Cut` rationals (for the ring-level welds below):
    bottom = 1/3. -/
theorem seamDefect_bottom_val :
    seamDefect censusBottomBand censusActiveBottomSpan = 1 / 3 := by
  unfold seamDefect; rw [censusBottomBand_val, censusActiveBottomSpan_val]; norm_num

/-- Charm seam defect = 4/3. -/
theorem seamDefect_charm_val :
    seamDefect censusCharmBand censusActiveCharmSpan = 4 / 3 := by
  unfold seamDefect; rw [censusCharmBand_val, censusActiveCharmSpan_val]; norm_num

/-- Light seam defect = 1/3. -/
theorem seamDefect_light_val :
    seamDefect censusLightBand censusActiveLightSpan = 1 / 3 := by
  unfold seamDefect; rw [censusLightBand_val, censusActiveLightSpan_val]; norm_num

/-! ## (2) THE LADDER — the local section at each level IS the global section one
    level down. The descent's cover is a LADDER; the defects are its rungs' increments. -/

/-- ★★★ (TARGET 2a) THE LADDER, BOTTOM RUNG: `censusActiveBottomSpan = censusCharmBand`
    DEFINITIONALLY — both are `((bandCensus [2,1,1,2] : ℚ) : Cut)`, the SAME banked
    list. The bottom span's LOCAL section is the charm level's GLOBAL section. -/
theorem ladder_bottom : censusActiveBottomSpan = censusCharmBand := rfl

/-- ★★★ (TARGET 2b) THE LADDER, CHARM RUNG: `censusActiveCharmSpan = censusLightBand`
    DEFINITIONALLY — both are `((bandCensus [2,1,1] : ℚ) : Cut)`, the SAME banked
    list. The charm span's LOCAL section is the light level's GLOBAL section. -/
theorem ladder_charm : censusActiveCharmSpan = censusLightBand := rfl

/-- ★★ THE LADDER, STATED ONCE: the descent's cover is a ladder — each level's local
    active-span section IS the band (global) section one level down. (Target 2 as one
    conjunction.) -/
theorem census_ladder :
    censusActiveBottomSpan = censusCharmBand ∧ censusActiveCharmSpan = censusLightBand :=
  ⟨ladder_bottom, ladder_charm⟩

/-! ## (3) THE COCYCLE / TELESCOPE — the per-seam defects sum to the full descent drop. -/

/-- ★★★ (TARGET 3) THE CLOSURE COCYCLE TELESCOPES: because the cover is a ladder
    (target 2), the three seam defects sum EXACTLY to the full descent drop
    `censusBottomBand − censusActiveLightSpan` — the total closure cocycle across all
    seams. Pure ring on the defect definition + the ladder. -/
theorem cocycle_telescope :
    seamDefect censusBottomBand censusActiveBottomSpan
      + seamDefect censusCharmBand censusActiveCharmSpan
      + seamDefect censusLightBand censusActiveLightSpan
    = censusBottomBand - censusActiveLightSpan := by
  unfold seamDefect
  rw [ladder_bottom, ladder_charm]
  ring

/-- ★★ THE TELESCOPE'S VALUE: the total closure cocycle is `2·colouredCensusTerm 1 +
    colouredCensusTerm 2 = 2·(1/3) + 4/3 = 2` — exactly `11/3 − 5/3` on the banked
    censuses. -/
theorem cocycle_total_val :
    seamDefect censusBottomBand censusActiveBottomSpan
      + seamDefect censusCharmBand censusActiveCharmSpan
      + seamDefect censusLightBand censusActiveLightSpan
    = 2 := by
  rw [seamDefect_bottom_val, seamDefect_charm_val, seamDefect_light_val]; norm_num

/-- The total as census terms: `2·cCT1 + cCT2 = 2` over ℚ (the defect multiset
    {1, 2, 1} summed). -/
theorem cocycle_total_censusTerms :
    2 * colouredCensusTerm 1 + colouredCensusTerm 2 = 2 := by
  rw [colouredCensusTerm_one, colouredCensusTerm_two]; norm_num

/-- ★★ THE NAME-TIE (honest): the total closure cocycle equals the banked
    `censusLightBand` — the defect multiset {cCT 1, cCT 2, cCT 1} is the SAME multiset
    of census terms as the light band's list `[2,1,1]`; both sum to `2`. The ledger's
    conserved content at the descent's floor. -/
theorem cocycle_total_eq_censusLightBand :
    seamDefect censusBottomBand censusActiveBottomSpan
      + seamDefect censusCharmBand censusActiveCharmSpan
      + seamDefect censusLightBand censusActiveLightSpan
    = censusLightBand := by
  rw [cocycle_total_val, censusLightBand_val]

/-- ★★ THE SECOND NAME-TIE: the total closure cocycle equals the banked `leptonCensus`
    (= 2, DecouplingCensusRemoval `leptonCensus_val`) — the singlet slice of the one
    charge census. -/
theorem cocycle_total_eq_leptonCensus :
    seamDefect censusBottomBand censusActiveBottomSpan
      + seamDefect censusCharmBand censusActiveCharmSpan
      + seamDefect censusLightBand censusActiveLightSpan
    = leptonCensus := by
  rw [cocycle_total_val, leptonCensus_val]

/-- HONEST NON-TIE (the prereg's conjecture checked and refuted): the total closure
    cocycle (= 2) is NOT `colouredCensus` (= 10/3, banked `colouredCensus_val`). The
    coloured census is the STAIRCASE total `2·(cCT1 + cCT2)`; the cocycle total is
    `2·cCT1 + cCT2` — one cCT2 short. Stated so no one ties the wrong name. -/
theorem cocycle_total_ne_colouredCensus :
    seamDefect censusBottomBand censusActiveBottomSpan
      + seamDefect censusCharmBand censusActiveCharmSpan
      + seamDefect censusLightBand censusActiveLightSpan
    ≠ colouredCensus := by
  rw [cocycle_total_val, colouredCensus_val]; norm_num

/-! ## (4) THE GLUING THEOREM — the seam law proper. Local + closure = global, per
    seam; and the screening version (Q2 content × Q3 anchor × Q4 weight-1) via
    `bandScreen` census-linearity. -/

/-- ★★★ (TARGET 4, the iff) SECTIONS GLUE IFF THE CLOSURE COCYCLE IS ADDED: a candidate
    closure `d` glues the local section `activeC` to the global section `bandC`
    (i.e. `bandC = activeC + d`) IFF `d` IS the seam defect. Existence AND uniqueness
    of the closure cocycle — the `gluesGlobally_iff_defect` analogue on the descent's
    cover (Q1's existence, answered). -/
theorem sections_glue_iff (bandC activeC d : Cut) :
    bandC = activeC + d ↔ d = seamDefect bandC activeC := by
  unfold seamDefect
  constructor <;> intro h <;> linarith

/-- ★★ (TARGET 4a) THE GLUING FORM, BOTTOM SEAM: global = local + closure. -/
theorem glue_bottom :
    censusBottomBand
      = censusActiveBottomSpan + seamDefect censusBottomBand censusActiveBottomSpan := by
  unfold seamDefect; ring

/-- ★★ (TARGET 4b) THE GLUING FORM, CHARM SEAM: global = local + closure. -/
theorem glue_charm :
    censusCharmBand
      = censusActiveCharmSpan + seamDefect censusCharmBand censusActiveCharmSpan := by
  unfold seamDefect; ring

/-- ★★ (TARGET 4c) THE GLUING FORM, LIGHT SEAM: global = local + closure. -/
theorem glue_light :
    censusLightBand
      = censusActiveLightSpan + seamDefect censusLightBand censusActiveLightSpan := by
  unfold seamDefect; ring

/-- Q4's WEIGHT-1 MECHANISM: `bandScreen` is LINEAR in the census with unit
    coefficient — a census-valued closure entering a band enters its screening
    directly, weight 1 (not w, not 1/(1−w)). -/
theorem bandScreen_census_additive (a b r : Cut) :
    bandScreen (a + b) r = bandScreen a r + bandScreen b r := by
  unfold bandScreen; ring

/-- ★★★ (TARGET 4, Q2×Q3×Q4, BOTTOM SEAM) THE SCREENING GLUING LAW: on the bottom
    span's own pinned edge `rb = mbRatioDerived·(bMass 0/bMass 2)`
    (ComposedFreezeoutDissolved), the GLOBAL screening = the LOCAL screening + the
    CLOSURE screening — the defect enters `bandScreen` with weight 1 on THAT seam's
    span-log (Q3 anchor: the span below the bottom edge; Q4 weight: 1). -/
theorem seam_screen_bottom :
    bandScreen censusBottomBand (mbRatioDerived * (bMass 0 / bMass 2))
      = bandScreen censusActiveBottomSpan (mbRatioDerived * (bMass 0 / bMass 2))
        + bandScreen (seamDefect censusBottomBand censusActiveBottomSpan)
            (mbRatioDerived * (bMass 0 / bMass 2)) := by
  unfold seamDefect bandScreen; ring

/-- ★★★ (TARGET 4, Q2×Q3×Q4, CHARM SEAM) THE SCREENING GLUING LAW on the charm span's
    pinned edge `rc = 1/mbRatioDerived`: global = local + closure, weight 1. -/
theorem seam_screen_charm :
    bandScreen censusCharmBand (1 / mbRatioDerived)
      = bandScreen censusActiveCharmSpan (1 / mbRatioDerived)
        + bandScreen (seamDefect censusCharmBand censusActiveCharmSpan)
            (1 / mbRatioDerived) := by
  unfold seamDefect bandScreen; ring

/-- ★★★ (TARGET 4, Q2×Q3×Q4, LIGHT SEAM) THE SCREENING GLUING LAW on the light span's
    pinned edge `rl = downConfBundle·bMass 2`: global = local + closure, weight 1. -/
theorem seam_screen_light :
    bandScreen censusLightBand (downConfBundle * bMass 2)
      = bandScreen censusActiveLightSpan (downConfBundle * bMass 2)
        + bandScreen (seamDefect censusLightBand censusActiveLightSpan)
            (downConfBundle * bMass 2) := by
  unfold seamDefect bandScreen; ring

/-! ## (5) THE GATHER COMPOSITION — the OLD (banked) staircase summand IS the
    CORRECTED (active/local) summand PLUS the closure cocycle's total screening. -/

/-- ★★★ (TARGET 5) THE GLOBAL SECTION IS THE LOCAL SECTIONS PLUS THE COCYCLE: the OLD
    staircase summand (`freezeoutBankedSummand`, weights 11/3, 10/3, 2 — dissolving to
    `16/9 + κ[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]`, banked `freezeout_summand_dissolved`)
    EQUALS the CORRECTED summand (`freezeoutCorrectedSummand`, weights 10/3, 2, 5/3 —
    dissolving to `40/27 + κ[3L_mb + (10/3)L_b0 − (5/3)L_b2]`, banked
    `freezeoutActive_summand_dissolved`) PLUS the closure cocycle's total screening:
    each seam's defect times ITS OWN span-log, weight 1. An EXACT ring identity from
    the banked defs — the old composition IS the global section, derived. -/
theorem global_section_is_local_plus_cocycle :
    freezeoutBankedSummand
      = freezeoutCorrectedSummand
        + bandScreen (seamDefect censusBottomBand censusActiveBottomSpan)
            (mbRatioDerived * (bMass 0 / bMass 2))
        + bandScreen (seamDefect censusCharmBand censusActiveCharmSpan)
            (1 / mbRatioDerived)
        + bandScreen (seamDefect censusLightBand censusActiveLightSpan)
            (downConfBundle * bMass 2) := by
  rw [seamDefect_bottom_val, seamDefect_charm_val, seamDefect_light_val]
  unfold freezeoutBankedSummand freezeoutCorrectedSummand bandScreen
  ring

/-- ★★ (TARGET 5, dissolved form) THE CLOSURE SCREENING'S CLOSED FORM: the cocycle's
    total screening (the three defect·log terms) equals `8/27 + κ[−(2/3)L_mb +
    (1/3)L_b0]` — the GEM DEFECT `16/9 − 40/27 = 8/27` (the closure's contribution on
    the light rung's confinement exponential, π cancelled) plus the log-weight shift.
    Welds `global_section_is_local_plus_cocycle` to the banked N689
    `corrected_vs_banked` (which consumed N688's `full_correction_shape`). -/
theorem closure_screening_dissolved :
    bandScreen (seamDefect censusBottomBand censusActiveBottomSpan)
        (mbRatioDerived * (bMass 0 / bMass 2))
      + bandScreen (seamDefect censusCharmBand censusActiveCharmSpan)
          (1 / mbRatioDerived)
      + bandScreen (seamDefect censusLightBand censusActiveLightSpan)
          (downConfBundle * bMass 2)
    = 8 / 27
      + kappaLeading * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  have h1 := global_section_is_local_plus_cocycle
  have h2 := corrected_vs_banked
  linarith

/-- THE GEM DEFECT is real and exact: `16/9 − 40/27 = 8/27 ≠ 0` — the closure's pure
    rational on the light rung (banked gems `confinement_rung_rational` 16/9 and
    `gem_active` 40/27). -/
theorem gem_defect : (16 / 9 : Cut) - 40 / 27 = 8 / 27 := by norm_num

/-! ## (6) THE CAPSTONE — the seam law as one named theorem. -/

/-- ★★★ (TARGET 6) THE THRESHOLD-CLOSURE SEAM LAW, in ONE statement:

    (1) THE LADDER (the descent's cover): each local active-span section IS the global
        band section one level down — `censusActiveBottomSpan = censusCharmBand` and
        `censusActiveCharmSpan = censusLightBand` (definitional, same banked lists);
    (2) THE THREE SEAM DEFECTS are EXACTLY the just-decoupled flavours' census terms —
        bottom cCT 1, charm cCT 2, light cCT 1 (the banked overcounts, re-derived as
        seam-law instances: Q2 content matched);
    (3) THE TELESCOPE: the defects sum to the full descent drop
        `censusBottomBand − censusActiveLightSpan` (the closure cocycle is exact);
    (4) THE GLUING FORM, per seam: global = local + closure (weight 1 — Q4), and
    (5) THE GATHER COMPOSITION: the OLD staircase summand = the CORRECTED summand +
        the closure cocycle's total screening on the seams' own span-logs (Q3 anchor)
        — the old composition IS the global section.

    Statable from no single conjunct alone (non-hollow). NO-FIT: every rational is a
    banked census value; no measured number appears anywhere in statement or proof. -/
theorem threshold_closure_seam_law :
    -- (1) the ladder
    (censusActiveBottomSpan = censusCharmBand ∧ censusActiveCharmSpan = censusLightBand)
    -- (2) the three seam defects = the decoupled flavours' census terms
    ∧ (seamDefect censusBottomBand censusActiveBottomSpan
        = ((colouredCensusTerm 1 : ℚ) : Cut))
    ∧ (seamDefect censusCharmBand censusActiveCharmSpan
        = ((colouredCensusTerm 2 : ℚ) : Cut))
    ∧ (seamDefect censusLightBand censusActiveLightSpan
        = ((colouredCensusTerm 1 : ℚ) : Cut))
    -- (3) the telescope
    ∧ (seamDefect censusBottomBand censusActiveBottomSpan
        + seamDefect censusCharmBand censusActiveCharmSpan
        + seamDefect censusLightBand censusActiveLightSpan
      = censusBottomBand - censusActiveLightSpan)
    -- (4) the gluing form, per seam
    ∧ (censusBottomBand
        = censusActiveBottomSpan + seamDefect censusBottomBand censusActiveBottomSpan)
    ∧ (censusCharmBand
        = censusActiveCharmSpan + seamDefect censusCharmBand censusActiveCharmSpan)
    ∧ (censusLightBand
        = censusActiveLightSpan + seamDefect censusLightBand censusActiveLightSpan)
    -- (5) the gather composition: global section = local sections + closure cocycle
    ∧ (freezeoutBankedSummand
        = freezeoutCorrectedSummand
          + bandScreen (seamDefect censusBottomBand censusActiveBottomSpan)
              (mbRatioDerived * (bMass 0 / bMass 2))
          + bandScreen (seamDefect censusCharmBand censusActiveCharmSpan)
              (1 / mbRatioDerived)
          + bandScreen (seamDefect censusLightBand censusActiveLightSpan)
              (downConfBundle * bMass 2)) :=
  ⟨census_ladder, seamDefect_bottom, seamDefect_charm, seamDefect_light,
   cocycle_telescope, glue_bottom, glue_charm, glue_light,
   global_section_is_local_plus_cocycle⟩

/-! ## (W8) NON-VACUITY WITH TEETH. -/

/-- ★ W8 — THE COCYCLE IS GENUINELY NONZERO: each seam defect is strictly positive —
    the closures are real content, not degenerate zeros. -/
theorem seam_defects_pos :
    0 < seamDefect censusBottomBand censusActiveBottomSpan
    ∧ 0 < seamDefect censusCharmBand censusActiveCharmSpan
    ∧ 0 < seamDefect censusLightBand censusActiveLightSpan := by
  refine ⟨?_, ?_, ?_⟩ <;>
    simp only [seamDefect_bottom_val, seamDefect_charm_val, seamDefect_light_val] <;>
    norm_num

/-- ★ W8 — THE DEFECT SLOT BITES: a WRONG closure (the charm defect's 4/3 in the
    bottom seam's slot) does NOT glue the bottom seam — `sections_glue_iff` refutes it. -/
theorem wrong_closure_fails_to_glue :
    ¬ (censusBottomBand
        = censusActiveBottomSpan + ((colouredCensusTerm 2 : ℚ) : Cut)) := by
  intro h
  rw [sections_glue_iff] at h
  rw [seamDefect_bottom_val, colouredCensusTerm_two] at h
  have : ((4 / 3 : ℚ) : Cut) = 1 / 3 := h
  norm_num at this

end

end Phys.Algebra.ThresholdClosureSeamLaw
