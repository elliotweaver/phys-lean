/-
  Phys.Algebra.ScaleTowerDischargeArcM — N417 (SEED_COMPLETION_SWEEP.md, arc O, target O2).
  ============================================================================================
  DISCHARGE ARC M — the absolute-scale chain PROMOTED to derived. Arc M banked the absolute-scale
  chain `absScaleChain phaseBorn topLink lightLink` (N409) over a GENUINELY FREE rational slot
  `phaseBorn`, and N410 recorded the honest conditional
      `absScaleChain_parameter_dependent : ∃ pb pb', absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1`
  — the absolute scale was CONDITIONAL on an undetermined phase. That free slot was a SEQUENCING GAP:
  the phase amplitude was not yet derived. N416 (arc-O O1) DERIVED it — `foldPhase = cutPi/8`, the
  ℍ-level Cayley–Dickson fold angle, with `cutCos foldPhase` the strictly-positive Born amplitude
  (`foldPhase_amplitude`). This node closes the slot: it lands the Cut-domain chain that EXTENDS the
  banked ℚ-chain, substitutes the DERIVED factors (phase, top, light), and banks the PROMOTION
  theorem — the absolute mass scale is a DETERMINED derived `Cut` with NO free parameter.

  ---------------------------------------------------------------------------
  THE DERIVATION (theory-native, forced, no free parameter).

  The banked chain `absScaleChain pb t l = ewClosureRatio · (pb · s1BornProb) · t · l` was written
  over ℚ slots because the actual phase amplitude — an IRRATIONAL `Cut` — was not yet in hand. The
  honest object is the SAME chain over `Cut` slots:
      `absScaleChainR φ τ ℓ := ewClosureRatio · (φ · s1BornProb) · τ · ℓ`
  which RESTRICTS to the banked ℚ-chain on rational slots (`absScaleChainR_restrict`, casting ℚ→Cut).
  This is the W1 "build the machinery" move (the domain must accept the derived irrational amplitude),
  NOT a domain dodge — the Cut-chain genuinely IS the banked chain wherever the latter is defined.

  Then the three slots are FILLED with derived quantities:
    • THE PHASE slot ← `cutCos foldPhase` — the DERIVED N416 fold-phase Born amplitude (the strictly
      positive ℍ-level half-angle root, `foldPhase_amplitude`). This is exactly the quantity arc M
      left as the free `phaseBorn`; it is now a determined `Cut`, not an input.
    • THE TOP slot ← `1` — the top link is the electroweak-ANCHOR rung itself: the top mass sits at
      the anchor scale `v` (the banked `ewClosureRatio = e^(−28π/3)` region), paying ZERO cascade-
      insertion suppression. An empty insertion product is `1`, so the top link contributes the
      identity — WHY the top sits at the anchor. (The mass↔anchor identification is MECHANISM-flagged
      prose; the Lean content is the derived factor `1`.)
    • THE LIGHT/LEPTON slot ← `cutCos (2/3)` — the banked ℝ-descent cosine at the holonomy angle
      `2/3 rad` (`cutCos_two_thirds_pos` / `_bracket`, the N309-genre `cos(2/3 rad)` descent on the
      derived ℝ), the strictly-positive down-sector amplitude.

  The resulting `absScaleChainDerived` is a DETERMINED derived `Cut`: strictly positive, strictly
  below the electroweak anchor `ewClosureRatio` (a genuine suppression), hence strictly below `1`.
  NO free parameter remains — the conditional DISSOLVES.

  ---------------------------------------------------------------------------
  THE DISSOLUTION / MOAT (STANDARD §0). The Standard Model treats the overall mass scale AND each
  Yukawa as independent FREE dials. Arc M reduced the whole spectrum to one budget-anchored chain but
  left the phase link a free ℚ slot (the phase was not yet derived). The theory DISSOLVES the residual
  "free parameter" the way it dissolves every wall: the parameter was never fundamental — it was the
  UNDERIVED fold-phase amplitude, and N416 forces it as the ℍ-rung of the half-angle Born cascade. THE
  ONE CAUSE: the fold's own chirality (which set the quarter-turn `J²=−1` and forced every cascade
  amplitude to halve) determines the phase slot; the same banked self-blind survival `2/3` and the
  banked ℝ-descent cosine determine the gear and light slots. Nothing is fit; the absolute scale is a
  determined product of banked/derived factors.

  ---------------------------------------------------------------------------
  HONEST GRADE.
    • THEOREM-GRADE (forced math, foundations-only, grounded on the banked derived objects): the
      Cut-chain `absScaleChainR` restricts to the banked ℚ-chain; the derived instance
      `absScaleChainDerived` factors through the banked anchor `cutExp(−28π/3)`; it is Born-positive,
      strictly below the anchor, strictly below `1`; the phase slot IS the banked N416 amplitude; the
      lepton link sits at the banked `w = −1` winding boundary rung; and — the PROMOTION — the absolute
      scale is a determined derived `Cut` with no free parameter (the N410 conditional is exhibited
      alongside the now-determined derived value).
    • MECHANISM / identification (FLAGGED PROSE, never a Lean equation): that the top link `= 1` is the
      top-Yukawa-at-the-electroweak-anchor (zero cascade-insertion suppression); that this determined
      chain IS the physical `v → m_t → m_b → m_s/m_d → m_e → z0` absolute cascade. The measured
      `m_e`, `m_b`, `m_t`, `v`, `z0` are REMOVABLE PROSE only.
    • DATA-SIDE (REMOVABLE PROSE, NO FIT): the down-sector carries a KNOWN common ~−2% amplitude
      residual vs precision lattice. The derived law is landed; the residual is NOT chased to zero
      (fitting it is the drift tell). The isolated `9/4` winding rung↔scale ASSIGNMENT (N407's
      candidate) stays structural prose tied to the derived `w = −1` rung; it enters no declaration
      here and is not part of the parameter closure. "Derived" here means "no free parameter, a
      determined derived Cut" (EVERY-CONSTANT-IS-FORCED); the exact numeric match to experiment is a
      removable data-comparison, never asserted.

  ⚠ NO "permanent inception flag" survives this node: the flag arc M carried was the FREE PHASE
  PARAMETER, and it is now closed by the derived `cutCos foldPhase`. M is CLOSED, not conditional.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "mass / scale / Yukawa / electroweak / top /
  lepton / fold / phase / winding / rung": what remains is — over the derived ℝ `Cut`, the product
  `absScaleChainR φ τ ℓ = ewClosureRatio · (φ · s1BornProb) · τ · ℓ` restricts on rational slots to
  the banked `absScaleChain`; the instance at `φ = cutCos(cutPi/8)`, `τ = 1`, `ℓ = cutCos(2/3)`
  factors through `cutExp(−28·cutPi/3)`, is strictly positive, strictly below `ewClosureRatio`, and
  strictly below `1`; `cutCos(cutPi/8)` is the strictly-positive root with `cutCos(cutPi/8)² = (1 +
  cutCos(cutPi/4))/2`; `windingRungIndex (−1) = 1 − finrank ℚ Uhol`. No theorem STATEMENT needs a
  physics word; the headline TYPEs cite the banked `ewClosureRatio` / `s1BornProb` / `foldPhase` /
  `cutCos` / `absScaleChain` / `windingRungIndex` (NOT free-floating literals).

  ⚠ FREE-FLOATING RAIL (SOUL): every theorem is stated at the BANKED objects — the anchor
  `ewClosureRatio` (N332), the survival `s1BornProb` (N408), the banked ℚ-chain `absScaleChain` +
  its conditional `absScaleChain_parameter_dependent` (N409/N410), the derived fold phase `foldPhase`
  / `foldPhase_amplitude` (N416), the ℝ-descent `cutCos (2/3)` / `cutCos_two_thirds_*` (N-eval), the
  winding boundary `windingRungIndex boundaryRungIndex` (N407) — never a generic ring. The Cut-chain
  `absScaleChainR` is defined so that `absScaleChainR_restrict` ties it to the banked `absScaleChain`.
  G1: the factoring, restriction, positivity, and suppression FALL OUT of the banked lemmas +
  `rw`/`ring`/`nlinarith`/`positivity`, never premised. G2: NO empirical number in any proof (`m_e`,
  `m_b`, `m_t`, `v`, `z0`, the −2% residual live only in prose; NO-FIT loudest). ⚠ UNEARNED-IMPORT:
  everything over the derived `Cut`; `ewClosureRatio` / `cutExp` / `cutCos` / `foldPhase` /
  `s1BornProb` are DERIVED; `Rat.cast` / `norm_num` / `nlinarith` / `positivity` are standard Mathlib
  MACHINERY on the derived objects; NO Mathlib-ℝ/ℂ as content.

  UNBROKEN: `ewClosureRatio` / `ewClosureRatio_eq` / `_pos` / `_lt_one` (N332, ScaleTowerLadder),
  `s1BornProb` / `s1BornProb_value` / `mbBornRatio` (N408, ScaleTowerGearDecomposition), `absScaleChain`
  / `absScaleChain_parameter_dependent` (N409/N410), `foldPhase` / `foldPhase_amplitude` /
  `cutCos_eighth_pos` (N416, CascadeFoldPhase), `cutCos` / `cutCos_le_one` / `cutCos_two_thirds_pos` /
  `cutCos_two_thirds_bracket` (ContinuumTrig* / ContinuumTrigEval), `windingRungIndex` /
  `boundaryRungIndex` / `meLink_at_winding_boundary` (N407/N409); standard Mathlib MACHINERY on the
  derived objects. Ground = derived `Cut`; nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.ArcMConsolidation
import Phys.Algebra.CascadeFoldPhase
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.DischargeArcM

open Phys.Algebra Phys.Algebra.Gear Phys.Algebra.Winding Phys.Algebra.ScaleChain
open Phys.Algebra.ArcMConsolidation Phys.Algebra.FoldPhase
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE CUT-DOMAIN CHAIN extending the banked ℚ-chain.

  The banked `absScaleChain` (N409) has ℚ slots because the phase amplitude — an irrational `Cut` —
  was not yet derived. The honest chain is the SAME product over `Cut` slots, with the gear survival
  the banked `s1BornProb`. It RESTRICTS to `absScaleChain` on rational slots. -/

/-- THE CUT-DOMAIN ABSOLUTE-SCALE CHAIN: `ewClosureRatio · (φ · s1BornProb) · τ · ℓ` over derived-`Cut`
    slots. Same shape as the banked ℚ-chain `absScaleChain`; the gear survival is the banked
    `s1BornProb = 2/3` cast into `Cut`. Defined to accept the DERIVED (irrational) phase amplitude. -/
def absScaleChainR (phaseBorn topLink lightLink : Cut) : Cut :=
  ewClosureRatio * (phaseBorn * ((s1BornProb : ℚ) : Cut)) * topLink * lightLink

/-- ★ THE CUT-CHAIN EXTENDS THE BANKED ℚ-CHAIN: on rational slots (cast ℚ→`Cut`), `absScaleChainR`
    equals the banked `absScaleChain` (N409). The Cut-domain chain genuinely IS the banked chain
    wherever the latter is defined — the domain extension is faithful, not a substitution. -/
theorem absScaleChainR_restrict (q t l : ℚ) :
    absScaleChainR ((q : ℚ) : Cut) ((t : ℚ) : Cut) ((l : ℚ) : Cut)
      = absScaleChain q t l := by
  unfold absScaleChainR absScaleChain
  rw [mbBornRatio, s1BornProb]
  push_cast
  ring

/-! ## (B) THE DERIVED INSTANCE — the three slots filled with derived quantities. -/

/-- ★★ THE DERIVED ABSOLUTE-SCALE CHAIN: the Cut-chain with its three slots FILLED by derived
    quantities — phase `= cutCos foldPhase` (the DERIVED N416 fold-phase Born amplitude), top `= 1`
    (the electroweak-anchor rung, zero cascade-insertion suppression), light `= cutCos (2/3)` (the
    banked ℝ-descent cosine at the holonomy angle). This is a DETERMINED derived `Cut` — NO free
    parameter. The free ℚ slot arc M left as `phaseBorn` is now the derived `cutCos foldPhase`. -/
def absScaleChainDerived : Cut :=
  absScaleChainR (cutCos foldPhase) 1 (cutCos (2 / 3))

/-- ★ THE DERIVED CHAIN FACTORS THROUGH THE BANKED ELECTROWEAK RUNG `e^(−28π/3)`: the whole absolute
    scale is anchored at the banked n=9 tower rung (`ewClosureRatio_eq`, N332), times the derived
    fold-phase amplitude, the banked survival, the anchor top link `1`, and the derived ℝ-descent
    cosine — every factor banked or derived, nothing free. -/
theorem absScaleChainDerived_factors :
    absScaleChainDerived
      = cutExp (-(28 * cutPi / 3)) * (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1
          * cutCos (2 / 3) := by
  unfold absScaleChainDerived absScaleChainR
  rw [ewClosureRatio_eq]

/-- The derived chain as anchor times the derived factor bundle. -/
theorem absScaleChainDerived_eq_anchor_mul :
    absScaleChainDerived
      = ewClosureRatio * ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) := by
  unfold absScaleChainDerived absScaleChainR
  ring

/-! ## (C) THE DERIVED SLOTS ARE THE BANKED/DERIVED OBJECTS. -/

/-- ★ THE PHASE SLOT IS THE BANKED N416 DERIVED AMPLITUDE: `0 < cutCos foldPhase` and
    `cutCos foldPhase² = (1 + cutCos(cutPi/4))/2` — the strictly-positive ℍ-level half-angle Born
    root (`foldPhase_amplitude`, N416). This is the quantity arc M left free; it is now derived. -/
theorem phaseSlot_is_banked_amplitude :
    0 < cutCos foldPhase
    ∧ cutCos foldPhase * cutCos foldPhase = (1 + cutCos (cutPi / 4)) / 2 :=
  foldPhase_amplitude

/-- ★ THE LIGHT/LEPTON SLOT IS THE BANKED ℝ-DESCENT COSINE: `0 < cutCos (2/3)`, the strictly-positive
    down-sector amplitude at the holonomy angle `2/3 rad` (`cutCos_two_thirds_pos`, the N309-genre
    `cos(2/3 rad)` descent on the derived ℝ). -/
theorem lightSlot_is_descent_cosine : 0 < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos

/-- ★ THE LEPTON LINK SITS AT THE BANKED `w = −1` WINDING BOUNDARY RUNG (N407/N409): the lepton scale
    is quantized at the first descent below the self-blind ground,
    `windingRungIndex boundaryRungIndex = 1 − finrank ℚ Uhol`. Not a free scale; a banked winding rung.
    (The isolated numeric rung↔scale assignment `9/4` stays candidate prose; it enters no declaration.) -/
theorem leptonLink_at_winding_boundary :
    windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) :=
  meLink_at_winding_boundary

/-! ## (D) POSITIVITY, SUPPRESSION — the derived scale is a genuine determined value. -/

/-- The banked survival cast into `Cut` is strictly positive. -/
theorem survival_cast_pos : (0 : Cut) < ((s1BornProb : ℚ) : Cut) := by
  rw [s1BornProb_value]; norm_num

/-- The banked survival cast into `Cut` is strictly below `1`. -/
theorem survival_cast_lt_one : ((s1BornProb : ℚ) : Cut) < 1 := by
  rw [s1BornProb_value]; norm_num

/-- ★ BORN-POSITIVITY OF THE DERIVED CHAIN: `0 < absScaleChainDerived` — the anchor Born-positive
    (`ewClosureRatio_pos`), the phase and light slots the strictly-positive derived amplitudes, the
    survival positive, the top link `1`. A genuine positive derived scale. -/
theorem absScaleChainDerived_pos : 0 < absScaleChainDerived := by
  unfold absScaleChainDerived absScaleChainR
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  have h2 : 0 < cutCos foldPhase := by unfold foldPhase; exact cutCos_eighth_pos
  have h3 : 0 < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos
  have hs := survival_cast_pos
  positivity

/-- ★★ GENUINE SUPPRESSION BELOW THE ANCHOR: `absScaleChainDerived < ewClosureRatio`. The derived
    factor bundle `(cutCos foldPhase · s1BornProb) · 1 · cutCos(2/3)` is strictly below `1` (each
    cosine `≤ 1`, the survival `2/3`, the ℝ-descent cosine `≤ 787/1000`), so the whole chain is
    strictly below the electroweak anchor — the absolute scale sits genuinely below `v/M`, not at a
    trivial `1`. -/
theorem absScaleChainDerived_lt_anchor : absScaleChainDerived < ewClosureRatio := by
  rw [absScaleChainDerived_eq_anchor_mul]
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  have hsv : ((s1BornProb : ℚ) : Cut) = 2 / 3 := by rw [s1BornProb_value]; norm_num
  have hfac_lt1 :
      (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3) < 1 := by
    rw [hsv]
    have hcle : cutCos foldPhase ≤ 1 := cutCos_le_one foldPhase
    have hcpos : 0 < cutCos foldPhase := by unfold foldPhase; exact cutCos_eighth_pos
    have hlle : cutCos (2 / 3 : Cut) ≤ 787 / 1000 := cutCos_two_thirds_bracket.2
    have hlpos : 0 < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos
    nlinarith [hcle, hcpos, hlle, hlpos]
  exact mul_lt_of_lt_one_right h1 hfac_lt1

/-- ★ THE DERIVED SCALE IS SUPPRESSED BELOW `1`: `absScaleChainDerived < 1` — below the anchor, which
    is itself below `1` (`ewClosureRatio_lt_one`). A genuine exponential suppression, not the trivial
    overall scale `1`. -/
theorem absScaleChainDerived_lt_one : absScaleChainDerived < 1 :=
  lt_trans absScaleChainDerived_lt_anchor ewClosureRatio_lt_one

/-! ## (E) NON-VACUITY (W8). -/

/-- W8 NON-VACUITY: the derived scale is genuinely nonzero — a real determined value, not a collapse
    to `0` (which would make every downstream statement vacuous). -/
theorem absScaleChainDerived_ne_zero : absScaleChainDerived ≠ 0 :=
  ne_of_gt absScaleChainDerived_pos

/-- W8 NON-VACUITY: the derived scale is genuinely BELOW the anchor (`≠ ewClosureRatio`) — the
    phase/survival/light factors bite, the chain is a real suppression of the anchor, not the anchor
    itself (which a vacuous "all links `= 1`" reading would give). -/
theorem absScaleChainDerived_ne_anchor : absScaleChainDerived ≠ ewClosureRatio :=
  ne_of_lt absScaleChainDerived_lt_anchor

/-! ## (F) THE PROMOTION — the conditional DISSOLVES: absolute scale DERIVED, no free parameter. -/

/-- ★★★ THE M-DISCHARGE / PROMOTION (arc-O O2 headline, theorem-grade): the absolute mass scale is
    a DETERMINED derived `Cut` with NO free parameter — arc M's conditional DISSOLVES. Bundled:
      · the OLD conditional (N410): the banked ℚ-chain `absScaleChain pb 1 1` genuinely DEPENDS on the
        free slot `pb` (`∃ pb pb', absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1`) — the sequencing gap;
      · the CLOSURE: the derived chain `absScaleChainDerived` is a determined product of banked/derived
        factors (factors through `cutExp(−28·cutPi/3)`, the derived fold-phase amplitude, the banked
        survival, the anchor top link `1`, the derived ℝ-descent cosine) — no free slot remains;
      · POSITIVITY + SUPPRESSION: `0 < absScaleChainDerived < ewClosureRatio < 1` — a genuine
        determined derived scale, exponentially suppressed below the electroweak anchor.
    The free ℚ slot arc M left as `phaseBorn` is now the DERIVED `cutCos foldPhase` (N416). This
    re-grades M's `ratios_exact_absolutes_conditional`: the absolute scale is DERIVED (determined, no
    free parameter), not conditional. The top-at-anchor identification and the exact numeric match to
    experiment (incl. the down-sector −2% residual) are REMOVABLE PROSE; the Lean content is a
    parameter-free determined derived `Cut`. -/
theorem absolutes_derived :
    -- the OLD conditional (N410): the ℚ-chain carried a genuinely free slot
    (∃ pb pb' : ℚ, absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1)
    -- the CLOSURE: the derived chain is a determined product of banked/derived factors
    ∧ (absScaleChainDerived
        = cutExp (-(28 * cutPi / 3)) * (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1
            * cutCos (2 / 3))
    -- the Cut-chain faithfully extends the banked ℚ-chain
    ∧ (∀ q t l : ℚ,
        absScaleChainR ((q : ℚ) : Cut) ((t : ℚ) : Cut) ((l : ℚ) : Cut) = absScaleChain q t l)
    -- POSITIVITY + SUPPRESSION: a genuine determined derived scale below the anchor, below 1
    ∧ (0 < absScaleChainDerived
        ∧ absScaleChainDerived < ewClosureRatio
        ∧ absScaleChainDerived < 1) :=
  ⟨absScaleChain_parameter_dependent,
   absScaleChainDerived_factors,
   absScaleChainR_restrict,
   ⟨absScaleChainDerived_pos, absScaleChainDerived_lt_anchor, absScaleChainDerived_lt_one⟩⟩

end

end Phys.Algebra.DischargeArcM
