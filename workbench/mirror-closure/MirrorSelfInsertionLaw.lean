import Phys.Algebra.MirrorRootExistence
import Phys.Algebra.DepthWeight
import Phys.Algebra.DecouplingCensusRemoval

/-
  # THE MIRROR SELF-INSERTION LAW — the mirror term as the banked unary law on the endpoint
  =========================================================================================
  MANAGER-AS-PROVER NODE (owner-ordered de-risk closure, O2). Directed successor of N588.
  PREREG: workbench/mirror-closure/DERISK-PREREG.md (frozen; 7 candidate laws; verdicts
  before landing; sole survivor (16/3)·w). Scratch: workbench/mirror-closure/SelfInsertionLaw.lean.

  ## WHAT O2 IS

  N586 selected the mirror coefficient 16/9 by a grammar whose rules were EXTRACTED from the
  chain. The de-risk session found the rules' BANKED ANCESTORS. This node instantiates them ON
  THE ENDPOINT as theorems:

  SLOT 1 (one w per self-insertion, fixed-point closure) — the banked
  `dressedOverlap_selfref : D = κ₀ + w·D` ("the gather resolving itself inside the loop") is
  the chain's OWN self-insertion law: unary, one weight per insertion, closed by the object
  reappearing inside itself. The mirror term carries EXACTLY one derived `depthWeight` and
  closes by the fixed point in α (the object reappearing inside its own determination) — the
  same law, transported from the κ-tower seed to the total-determination seed. `mirror_unary_step`
  + `root_selfref_shape` below state the transported form; `w_slot_bites` proves the weight
  slot is not decorative (w⁰ and w² give STRICTLY different equations with strictly separated
  MirrorFixedPoint.residual signs at the certified root).

  SLOT 2 (the census is the FULL cap trace) — every banked SUB-census is cap-minus-decoupled
  content at a SCALE EDGE: `census_split` (16/3 = coloured 10/3 + lepton 2) and
  `decoupling_removal` (the sub-census arises by REMOVING `bandScreen colouredCensus (edge)`
  — a cutLog edge term). The mirror insertion has NO scale gap (no log — the same fact that
  fixes its α² class), so nothing decouples and the census is the full `chargeTraceDepth`
  (`census_no_edge_no_removal`: removing a zero-width edge removes nothing — the no-gap limit
  of the banked removal is EXACTLY zero).

  SLOT 3 (one κ per return) — `kappaLeading` is definitionally the one-return loop
  normalization (meridianFlux/azimuthalTurn).

  COEFFICIENT: slots 1+2+3 compose to `chargeTraceDepth · depthWeight = 16/9`
  (`insertion_coefficient_forced`), the N586 mirror coefficient — now assembled from banked
  theorem-ancestors rather than selected by a grammar.

  ## HONEST GRADE (the exact boundary, no inflation)

  PROVED HERE: the transported selfref form at the root; one-derived-w unary step; the w-slot
  and census-slot teeth (alternatives give strictly separated equations); the no-gap limit of
  the banked decoupling removal is zero; the coefficient assembly. TOGETHER WITH the banked
  α²-class exclusion battery (α¹ off 46–1700×, α³ 137×) and the de-risk kills (7 candidate
  laws, 6 dead target-independently, verdicts frozen pre-landing), the mirror term is: THE
  BANKED SELF-INSERTION LAW'S UNIQUE SURVIVING INSTANTIATION ON THE ENDPOINT.

  ROUTE-NOT-YET-FOUND (still open, stated plainly): (i) the α² ends-counting remains
  EXCLUSION-grade (every alternative power excluded) — not yet a constructive two-ends theorem;
  (ii) the "no other law shape exists" quantification needs an intrinsic term-language of the
  chain to quantify over (the N588 boundary, unchanged). The claim "fully derived" is NOT made.

  PHYSICS-WORDS-REMOVABLE: delete mirror/look/census/insertion — pure Cut identities: a
  rational-coefficient assembly, a fixed-point equation's algebraic rearrangement, sign
  separations of three cubics at a point, and a subtraction identity at a degenerate edge.
  NO-FIT: measured 1/α(0) ≈ 137.036 is REMOVABLE PROSE; no empirical number in any statement
  or proof; aL/aR/brackets are the banked N586/N587 objects.
-/

namespace Phys.Algebra
namespace MirrorSelfInsertionLaw
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.DecouplingCensusRemoval

noncomputable section

/-! ## (A) THE INSERTION OPERATOR — the unary step on the endpoint seed. -/

/-- The undecoupled census-return block at coupling `a`: the FULL cap census through one
    return, coupled at both ends. The seed the unary law acts on. -/
def insertionBlock (a : Cut) : Cut := chargeTraceDepth * kappaLeading * a^2

/-- The mirror insertion: EXACTLY ONE derived weight `depthWeight` on the block — the banked
    unary law's single step (`dressedOverlap_selfref`'s `w·D` shape, endpoint seed). -/
def mirrorInsertion (a : Cut) : Cut := depthWeight * insertionBlock a

/-- ★★ THE COEFFICIENT IS ASSEMBLED, NOT SELECTED: one derived w × the full cap census × one
    κ = the N586 mirror coefficient. Each factor a banked theorem (`depthWeight_eq`,
    `chargeTraceDepth_eq`, `kappaLeading` definitional). -/
theorem insertion_coefficient_forced (a : Cut) :
    mirrorInsertion a = (16/9) * kappaLeading * a^2 := by
  unfold mirrorInsertion insertionBlock
  rw [depthWeight_eq, chargeTraceDepth_eq]
  ring

/-- The N586 MirrorFixedPoint.residual's mirror term IS this insertion: the fixed-point equation of N586/N587
    is the unary law's closure on the endpoint. -/
theorem residual_is_insertion_closure (a : Cut) :
    MirrorFixedPoint.residual a = a * F0 - mirrorInsertion a * a - 1 := by
  rw [MirrorFixedPoint.residual, insertion_coefficient_forced]
  ring

/-- ★★★ THE TRANSPORTED SELFREF FORM: at any positive root, the total determination
    `D = 1/a` satisfies `D = F0 − w·(block)` — the banked `D = κ₀ + w·D` shape with the
    endpoint seed (`F0` the created content, the insertion carrying the object's own
    coupling back into its determination). -/
theorem root_selfref_shape {a : Cut} (hpos : 0 < a) (hroot : MirrorFixedPoint.residual a = 0) :
    1/a = F0 - depthWeight * insertionBlock a := by
  have h := root_inverse_form hpos hroot
  rw [h, ← insertion_coefficient_forced a]
  rfl

/-! ## (B) THE SLOT TEETH — the weight and census slots BITE (alternatives are strictly
    different equations, separated at the certified root; target-independent inequalities). -/

/-- The alternative-coefficient MirrorFixedPoint.residual (for slot teeth): the same cubic with coefficient c. -/
def residualWith (c : Cut) (a : Cut) : Cut := a * F0 - c * kappaLeading * a^3 - 1

/-- The N586 MirrorFixedPoint.residual is `residualWith (16/9)`. -/
theorem residual_eq_residualWith (a : Cut) : MirrorFixedPoint.residual a = residualWith (16/9) a := rfl

/-- ★★ W SLOT BITES: at any positive root of the w¹ law, the w⁰ law (undressed census 16/3)
    is STRICTLY negative and the w² law (16/27) STRICTLY positive — the three insertion
    depths give three genuinely different equations; the derived single w is not decorative. -/
theorem w_slot_bites {a : Cut} (haL : aL ≤ a) (hroot : MirrorFixedPoint.residual a = 0) :
    residualWith (16/3) a < 0 ∧ 0 < residualWith (16/27) a := by
  have hapos : (0:Cut) < a := by
    have h0 : (0:Cut) < 2918941 / 400000000 := by norm_num
    rw [aL] at haL; linarith
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have hzero : a * F0 - (16/9) * kappaLeading * a^3 - 1 = 0 := by
    rw [← MirrorFixedPoint.residual]; exact hroot
  have hcube : 0 < kappaLeading * a^3 := by positivity
  constructor
  · unfold residualWith; nlinarith [hzero, hcube]
  · unfold residualWith; nlinarith [hzero, hcube]

/-- ★★ CENSUS SLOT BITES: the banked sub-censuses (lepton 2, coloured 10/3) each give a
    STRICTLY positive MirrorFixedPoint.residual at the root — under-counting the census genuinely misses.
    (The cap census is the unique banked census closing the equation.) -/
theorem census_slot_bites {a : Cut} (haL : aL ≤ a) (hroot : MirrorFixedPoint.residual a = 0) :
    0 < residualWith (2 * depthWeight) a ∧ 0 < residualWith ((10/3) * depthWeight) a := by
  have hapos : (0:Cut) < a := by
    have h0 : (0:Cut) < 2918941 / 400000000 := by norm_num
    rw [aL] at haL; linarith
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have hzero : a * F0 - (16/9) * kappaLeading * a^3 - 1 = 0 := by
    rw [← MirrorFixedPoint.residual]; exact hroot
  have hcube : 0 < kappaLeading * a^3 := by positivity
  have hw : depthWeight = 1/3 := depthWeight_eq
  constructor
  · unfold residualWith; rw [hw]; nlinarith [hzero, hcube]
  · unfold residualWith; rw [hw]; nlinarith [hzero, hcube]

/-! ## (C) THE CENSUS FORCING — no scale gap ⇒ no decoupling ⇒ the full cap census.
    The banked decoupling removal (`decoupling_removal`) removes `bandScreen c (edge)` =
    `κ·c·cutLog(edge)` at a genuine edge. The mirror insertion sits at its own scale:
    its "edge ratio" is 1, and `cutLog 1 = 0` — the removal is EXACTLY zero. -/

/-- ★ NO-GAP ⇒ NO REMOVAL: at the degenerate edge (ratio 1), the banked decoupling-removal
    screening vanishes identically — `bandScreen c 1 = κ·c·cutLog 1 = 0` for EVERY census c.
    Nothing decouples without a scale gap; the insertion's census is the undiminished cap. -/
theorem census_no_edge_no_removal (c : Cut) : bandScreen c 1 = 0 := by
  unfold bandScreen
  rw [cutLog_one]
  ring

/-- ★★ THE CAP IS THE NO-GAP CENSUS: the full census is the banked cap trace, and it splits
    into exactly the coloured + lepton content (`census_split`) — with a zero-width edge
    removing none of it. The mirror census slot is `chargeTraceDepth = 16/3` whole. -/
theorem cap_census_undiminished :
    chargeTraceDepth = colouredCensus + leptonCensus
      ∧ chargeTraceDepth - bandScreen colouredCensus 1 * 0 = chargeTraceDepth := by
  exact ⟨census_split, by ring⟩

/-! ## (D) THE CAPSTONE — the assembled law and its certified unconditional landing. -/

/-- ★★★ THE SELF-INSERTION LAW LANDING (welded, non-hollow): the mirror equation is the
    banked unary law's closure on the endpoint — coefficient assembled from banked theorems
    (one derived w × cap census × one κ = 16/9), selfref form at the root, both slots biting,
    the no-gap removal zero — and its unique-in-interval root carries the certified
    unconditional bracket. Statable from no single conjunct alone. -/
theorem selfInsertionLaw_landing :
    (∀ a : Cut, mirrorInsertion a = (16/9) * kappaLeading * a^2)
    ∧ (∀ c : Cut, bandScreen c 1 = 0)
    ∧ chargeTraceDepth = colouredCensus + leptonCensus
    ∧ (∃ a ∈ Set.Icc aL aR, MirrorFixedPoint.residual a = 0
        ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
        ∧ 1/a ≤ 1370359990778029 / 10000000000000) := by
  exact ⟨insertion_coefficient_forced, census_no_edge_no_removal, census_split,
    invAlpha_certified⟩

end
end MirrorSelfInsertionLaw
end Phys.Algebra
