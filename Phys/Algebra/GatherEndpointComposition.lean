import Phys.Algebra.ThresholdClosureSeamLaw
import Phys.Algebra.CorrectedMirrorFixedPoint
import Phys.Algebra.MirrorRootGlobal
import Mathlib.Tactic

/-!
  # N694 — GATHER ENDPOINT COMPOSITION (THRESHOLD CLOSURE campaign, Phase C)
  ==============================================================================
  The landing. Phase B (N693) proved the seam law: the OLD staircase summand is the
  GLOBAL section = the CORRECTED (local) sections + the closure cocycle, per seam,
  weight 1 on each seam's own span-log. This node lifts that composition to the
  GATHER-LEVEL ENDPOINT and the FIXED POINT:

  (1) the closure cocycle's screening is ONE object (`closureCocycleScreening`, the
      LHS of N693's `closure_screening_dissolved` — the gem defect `8/27` PLUS the
      log-weight shift `κ·[−(2/3)L_mb + (1/3)L_b0]`, already one total);
  (2) THE GATHER ENDPOINT IDENTITY: the banked dressed endpoint
      `recomposedEndpointDressed` EQUALS the corrected (local-section) dressed
      endpoint PLUS the closure cocycle with its RUNNING part dressed by the
      fold-forced `3/2` and its rational part (the gem defect `8/27`) UNDRESSED —
      exactly the banked dressing scope (the base is dressing-exempt,
      `reattest_base_exempt`/`scopeC_exempts_base`; the running content is dressed);
  (3) `F0Gather = F0` — the gather-level obstructed endpoint IS the banked `F0`,
      now DERIVED as local + cocycle − obstruction rather than posited;
  (4) the banked landing bracket (`solution_bracket` / `invAlpha_certified_global`)
      RESTATED as the GLOBAL SECTION's fixed point, with the seam law as its
      provenance and N692's corrected fixed point as the LOCAL sections' fixed point.

  EXACT ARITHMETIC, re-derived before writing (all verified):
    • `cInner − cInnerCorrected = (7/3 − 3)·L_mb + (11/3 − 10/3)·L_b0
       = −(2/3)·L_mb + (1/3)·L_b0` (mass0/mass1 and bMass 2 weights cancel);
    • base gap `2425/18 − 7259/54 = 7275/54 − 7259/54 = 16/54 = 8/27` (the gem
      defect, N693 `gem_defect` = `16/9 − 40/27`);
    • so banked dressed − corrected dressed
       = `8/27 + (3/2)·κ·(−(2/3)·L_mb + (1/3)·L_b0)` (N690's
      `corrected_vs_banked_endpoint_weights`, negated);
    • N693's `closure_screening_dissolved` total = `8/27 + κ·(−(2/3)L_mb + (1/3)L_b0)`
      — the UNDRESSED cocycle; the endpoint difference is EXACTLY this cocycle with
      its log part dressed by `3/2` (i.e. + `(1/2)·κ·(log part)`) and its rational
      part untouched.

  Grep facts consumed (kill-check discharged):
    • `recomposedEndpointDressed` / `recomposedEndpointDressed_closed` / `cInner`
      (D7DepthTwoComposed L174/185/191) — banked dressed endpoint
      `2425/18 + (3/2)·κ·cInner`;
    • `recomposedEndpointCorrectedDressed` / `corrected_dressed_closed` /
      `cInnerCorrected` / `corrected_vs_banked_endpoint_weights`
      (CorrectedEndpointComposition, N690) — corrected dressed endpoint
      `7259/54 + (3/2)·κ·cInnerCorrected`;
    • `closure_screening_dissolved` / `global_section_is_local_plus_cocycle` /
      `seamDefect` / `threshold_closure_seam_law` (ThresholdClosureSeamLaw, N693);
    • `MirrorFixedPoint.F0` (= `recomposedEndpointDressed − obstructionTerm`),
      `obstructionTerm`, `residual`, `aL`, `aR`, `solution_bracket`
      (MirrorFixedPoint), `invAlpha_certified_global` (MirrorRootGlobal);
    • `CorrectedMirrorFixedPoint.F0Corrected` / `residualCorrected` /
      `solution_bracket_corrected` (N692) — the LOCAL sections' fixed point.

  NO new numerics: every bracket below is consumed from a banked theorem BY NAME;
  the 11-digit endpoints appear ONLY inside restatements proved by citing
  `solution_bracket` / `invAlpha_certified_global`. NO-FIT / K3 clean.

  PHYSICS-WORDS-REMOVABLE: delete gather/seam/dressing — the statements are exact
  ring identities over the derived `Cut` plus name-level equalities and a
  re-export of banked root brackets. Classical only through the banked foundations.

  NO sorry / admit / axiom. No lake, no git.
-/

namespace Phys.Algebra.GatherEndpointComposition

open Set
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
open Phys.Algebra.ThresholdClosureSeamLaw
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.CorrectedEndpointComposition
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE CLOSURE COCYCLE'S SCREENING — one object, the LHS of N693's
    `closure_screening_dissolved`: the three seam defects each times its OWN
    span-log, weight 1. Its dissolved value ALREADY CONTAINS the gem defect
    `8/27` (the light rung's rational part, π cancelled against the confinement
    exponential) — the cocycle is ONE total, not `8/27 + something separate`. -/

/-- ★★★ (TARGET 1) THE CLOSURE COCYCLE'S TOTAL SCREENING: the three seam-defect
    screening terms of N693 (`bandScreen defect (own pinned span edge)`, weight 1),
    summed — the cocycle's entire contribution to the gather. -/
def closureCocycleScreening : Cut :=
  bandScreen (seamDefect censusBottomBand censusActiveBottomSpan)
      (mbRatioDerived * (bMass 0 / bMass 2))
    + bandScreen (seamDefect censusCharmBand censusActiveCharmSpan)
        (1 / mbRatioDerived)
    + bandScreen (seamDefect censusLightBand censusActiveLightSpan)
        (downConfBundle * bMass 2)

/-- ★★ (TARGET 1, dissolved) THE COCYCLE'S CLOSED FORM, by name from N693:
    `closureCocycleScreening = 8/27 + κ·[−(2/3)·L_mb + (1/3)·L_b0]` — the gem
    defect plus the log-weight shift, ONE object
    (`closure_screening_dissolved`, folded through the def). -/
theorem closureCocycleScreening_dissolved :
    closureCocycleScreening
      = 8 / 27
        + kappaLeading
          * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  unfold closureCocycleScreening
  exact closure_screening_dissolved

/-- ★★ THE GATHER COMPOSITION AT SUMMAND LEVEL, folded through the def: N693's
    `global_section_is_local_plus_cocycle` with the cocycle as ONE object —
    old (banked) staircase summand = corrected (local) summand + the cocycle. -/
theorem summand_is_local_plus_cocycle :
    freezeoutBankedSummand
      = freezeoutCorrectedSummand + closureCocycleScreening := by
  have h := global_section_is_local_plus_cocycle
  unfold closureCocycleScreening
  linarith

/-! ## (2) THE GATHER ENDPOINT IDENTITY — the banked dressed endpoint IS the
    corrected (local-section) dressed endpoint PLUS the closure cocycle with its
    RUNNING part dressed by the fold-forced `3/2` and its rational part (the gem
    defect, base content) UNDRESSED — the banked dressing scope
    (`scopeC_exempts_base` / `reattest_base_exempt`: base exempt, running dressed). -/

/-- ★★ THE DRESSED CLOSURE COCYCLE: the cocycle as it enters the DRESSED gather —
    the gem defect `8/27` untouched (base content, dressing-exempt), the log part
    carrying the fold-forced all-orders factor `3/2 = 1/(1 − depthWeight)`. -/
def dressedClosureCocycle : Cut :=
  8 / 27
    + (3 / 2) * kappaLeading
      * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0))

/-- ★★★ (TARGET 2) THE GATHER ENDPOINT IDENTITY: the banked dressed endpoint EQUALS
    the corrected (local-section) dressed endpoint PLUS the dressed closure cocycle —
    `recomposedEndpointDressed = recomposedEndpointCorrectedDressed + 8/27 +
    (3/2)·κ·[−(2/3)·L_mb + (1/3)·L_b0]`. Pure ring from the two banked closed forms
    (`recomposedEndpointDressed_closed`, `corrected_dressed_closed`) and the two
    banked inner-log defs. The banked-frame endpoint is DERIVED: local + cocycle. -/
theorem gather_endpoint_eq :
    recomposedEndpointDressed
      = recomposedEndpointCorrectedDressed + dressedClosureCocycle := by
  rw [recomposedEndpointDressed_closed, corrected_dressed_closed]
  unfold dressedClosureCocycle cInner cInnerCorrected
  ring

/-- ★★ THE DRESSING SCOPE ON THE COCYCLE, exact: the dressed cocycle is the
    (undressed) cocycle screening PLUS the depth-2 increment on its LOG PART ONLY —
    `dressedClosureCocycle = closureCocycleScreening + (1/2)·κ·(log part)`. The
    rational gem defect receives NO dressing increment (base-exempt); the running
    content receives exactly the `(3/2 − 1) = 1/2` all-orders increment. -/
theorem dressed_cocycle_scope :
    dressedClosureCocycle
      = closureCocycleScreening
        + (1 / 2) * kappaLeading
          * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  have h := closureCocycleScreening_dissolved
  unfold dressedClosureCocycle
  linarith

/-- ★★★ (TARGET 2, welded) THE GATHER IS THE GLOBAL SECTION: in one statement —
    (a) the endpoint identity (banked dressed = corrected dressed + dressed cocycle);
    (b) the dressing scope (dressed cocycle = N693's cocycle screening + the `1/2`·κ
        increment on the log part only — base exempt, running dressed);
    (c) the summand-level seam law it lifts (old = corrected + cocycle, N693's
        `global_section_is_local_plus_cocycle` folded through the def). -/
theorem gather_is_global_section :
    (recomposedEndpointDressed
        = recomposedEndpointCorrectedDressed + dressedClosureCocycle)
    ∧ (dressedClosureCocycle
        = closureCocycleScreening
          + (1 / 2) * kappaLeading
            * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)))
    ∧ (freezeoutBankedSummand
        = freezeoutCorrectedSummand + closureCocycleScreening) :=
  ⟨gather_endpoint_eq, dressed_cocycle_scope, summand_is_local_plus_cocycle⟩

/-! ## (3) THE GATHER F0 — the fixed-point seed at the gather level IS the banked F0. -/

/-- ★★★ (TARGET 3) THE GATHER OBSTRUCTED ENDPOINT: the gather-level endpoint (now
    DERIVED as local + cocycle by `gather_endpoint_eq`) minus the banked
    gather-coherence obstruction. -/
def F0Gather : Cut :=
  recomposedEndpointDressed - MirrorFixedPoint.obstructionTerm

/-- ★★★ (TARGET 3) `F0Gather = F0`, definitionally — the gather F0 IS the banked
    `MirrorFixedPoint.F0`; what changes is its PROVENANCE: the endpoint inside it
    is now the global section (local + cocycle), not a posited composition. -/
theorem F0Gather_eq_F0 : F0Gather = MirrorFixedPoint.F0 := rfl

/-- ★★ THE GATHER F0, composed: `F0Gather` = the corrected (local) dressed endpoint
    + the dressed closure cocycle − the obstruction — and simultaneously the banked
    `F0`. The seam-law decomposition of the fixed-point seed. -/
theorem F0Gather_composed :
    F0Gather
      = recomposedEndpointCorrectedDressed + dressedClosureCocycle
          - MirrorFixedPoint.obstructionTerm := by
  unfold F0Gather
  rw [gather_endpoint_eq]

/-! ## (4) THE FIXED POINT — the banked landing bracket RESTATED as the GLOBAL
    SECTION's fixed point, consumed BY NAME from `solution_bracket` and
    `invAlpha_certified_global`; N692's corrected fixed point is the LOCAL
    sections' fixed point (its seed `F0Corrected` = corrected dressed − obstruction). -/

/-- ★★★ (TARGET 4a) THE BANKED LANDING IS THE GLOBAL SECTION'S FIXED POINT:
    (a) ANY root of the banked residual in the certification window carries the
        banked 11-digit bracket (`MirrorFixedPoint.solution_bracket`, BY NAME —
        the endpoints below are ITS endpoints, re-exported, not re-derived);
    (b) the residual's seed `F0` IS the gather endpoint − obstruction with the
        gather endpoint = local sections + closure cocycle (the seam-law
        provenance, welding `F0Gather_eq_F0` with `gather_endpoint_eq`). -/
theorem gather_fixed_point_is_banked :
    (∀ a : Cut, MirrorFixedPoint.aL ≤ a → a ≤ MirrorFixedPoint.aR →
        MirrorFixedPoint.residual a = 0 →
        (1370359990777677 : Cut) / 10000000000000 ≤ 1 / a
          ∧ 1 / a ≤ 1370359990778029 / 10000000000000)
    ∧ (MirrorFixedPoint.F0
        = recomposedEndpointCorrectedDressed + dressedClosureCocycle
            - MirrorFixedPoint.obstructionTerm) := by
  constructor
  · intro a haL haR hroot
    exact MirrorFixedPoint.solution_bracket haL haR hroot
  · rw [← F0Gather_eq_F0]
    exact F0Gather_composed

/-- ★★ (TARGET 4b) THE GLOBAL ROOT, unique on the coupling domain, restated at the
    gather level: EXACTLY ONE root of the banked residual in `(0,1)`, carrying the
    banked bracket (`MirrorFixedPoint.invAlpha_certified_global`, BY NAME). -/
theorem gather_root_certified_global :
    ∃! a : Cut, a ∈ Ioo (0 : Cut) 1 ∧ MirrorFixedPoint.residual a = 0
      ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1 / a
      ∧ 1 / a ≤ 1370359990778029 / 10000000000000 :=
  MirrorFixedPoint.invAlpha_certified_global

/-- ★ THE LOCAL SECTIONS' FIXED POINT, placed: N692's `F0Corrected` is the corrected
    (local-section) dressed endpoint minus the SAME obstruction — the corrected
    fixed point is the LOCAL sections' fixed point, the diagnostic companion of
    the global landing (definitional, N692's def re-exported). -/
theorem local_fixed_point_seed :
    CorrectedMirrorFixedPoint.F0Corrected
      = recomposedEndpointCorrectedDressed - MirrorFixedPoint.obstructionTerm := rfl

/-! ## (5) THE CAPSTONE. -/

/-- ★★★ (CAPSTONE) THE GATHER LANDING, DERIVED — in ONE statement:

    (1) THE GATHER ENDPOINT IDENTITY: the banked dressed endpoint = the corrected
        (local-section) dressed endpoint + the dressed closure cocycle
        (`gather_endpoint_eq` — the composition DERIVED via the seam law);
    (2) THE DRESSING SCOPE: dressed cocycle = N693's cocycle screening + the `1/2`·κ
        increment on the log part only (base exempt, running dressed);
    (3) THE SEAM LAW CITED: the summand-level composition (old = corrected + cocycle)
        and the ladder (N693's `threshold_closure_seam_law`, conjuncts consumed);
    (4) THE GATHER F0: `F0Gather = F0` — the banked fixed-point seed IS the global
        section's obstructed endpoint;
    (5) THE LANDING: exactly one root of the banked residual on `(0,1)`, carrying
        the banked 11-digit bracket (`invAlpha_certified_global`, BY NAME) — the
        banked-frame landing bracket IS the GLOBAL SECTION's fixed point;
    (6) THE LOCAL COMPANION: N692's `F0Corrected` = corrected dressed − obstruction
        — the corrected fixed point is the LOCAL sections' fixed point.

    The auditor's question answered at its root: the old composition was never a
    wrong count — it is the global section; the corrected count is its local
    sections; the landing returns as a DERIVED gather-level object with the seam
    law as its provenance. Statable from no single conjunct alone (non-hollow).
    NO-FIT: every bracket endpoint is consumed from a banked theorem by name. -/
theorem gather_landing_derived :
    -- (1) the gather endpoint identity
    (recomposedEndpointDressed
        = recomposedEndpointCorrectedDressed + dressedClosureCocycle)
    -- (2) the dressing scope on the cocycle
    ∧ (dressedClosureCocycle
        = closureCocycleScreening
          + (1 / 2) * kappaLeading
            * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)))
    -- (3) the seam law, cited: summand composition + the ladder (N693)
    ∧ (freezeoutBankedSummand
        = freezeoutCorrectedSummand + closureCocycleScreening)
    ∧ (censusActiveBottomSpan = censusCharmBand
        ∧ censusActiveCharmSpan = censusLightBand)
    -- (4) the gather F0 is the banked F0
    ∧ (F0Gather = MirrorFixedPoint.F0)
    -- (5) the landing: the banked bracket as the global section's fixed point
    ∧ (∃! a : Cut, a ∈ Ioo (0 : Cut) 1 ∧ MirrorFixedPoint.residual a = 0
        ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1 / a
        ∧ 1 / a ≤ 1370359990778029 / 10000000000000)
    -- (6) the local sections' fixed point (N692), placed
    ∧ (CorrectedMirrorFixedPoint.F0Corrected
        = recomposedEndpointCorrectedDressed - MirrorFixedPoint.obstructionTerm) :=
  ⟨gather_endpoint_eq, dressed_cocycle_scope, summand_is_local_plus_cocycle,
   threshold_closure_seam_law.1, F0Gather_eq_F0,
   MirrorFixedPoint.invAlpha_certified_global, local_fixed_point_seed⟩

/-! ## (W8) NON-VACUITY WITH TEETH. -/

/-- ★ W8 — THE DRESSED COCYCLE IS NOT THE UNDRESSED ONE unless the log part
    vanishes: the dressing scope has content — the increment is exactly
    `(1/2)·κ·(log part)`, so the two agree iff the running content is zero.
    (Stated as the exact difference; genuine scope, not a relabeling.) -/
theorem dressing_scope_bites :
    dressedClosureCocycle - closureCocycleScreening
      = (1 / 2) * kappaLeading
          * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  have h := dressed_cocycle_scope
  linarith

end

end Phys.Algebra.GatherEndpointComposition
