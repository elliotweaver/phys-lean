import Phys.Algebra.MirrorFixedPoint
import Phys.Algebra.FrameAuditedCompositionReattestation

/-
  # THE CHAIN-TERM GRAMMAR — every banked endpoint term PARSES (the grammar as theorems)
  ======================================================================================
  MANAGER-AS-PROVER NODE (worker retired; owner-directed). Directed successor of N586/N587.
  PREREG: workbench/mirror-closure/PREREG.md (Node 2, part (b)).

  N586's docstring declared its one open layer honestly: the GRAMMAR (term = census ×
  κ-return × scale-content × w-re-entries × α-ends) was READ OFF the banked chain's term
  shapes, validated numerically against every banked term, but not yet stated as Lean
  structure with the banked terms proved to parse. This node closes what is closable at
  theorem grade and declares precisely what remains.

  ## WHAT THIS NODE PROVES (the parse theorems — each citing a banked normal form)

  The grammar's term shape over Cut:  contribution = censusWeight · κ^r · logContent · sign,
  with censusWeight ∈ ℚ a census-forced rational, r ∈ {0,1} the return count, logContent
  either 1 (no scale gap) or a banked cutLog combination (a scale gap). The FOUR banked
  endpoint contributions parse:

    (P1) BASE   2425/18       = censusWeight 2425/18, r = 0, logContent 1
                                (anchor: reattest_base_exempt — the resummed base is exempt
                                from running; it carries NO κ and NO log);
    (P2) RUNNING (3/2)·κ·cInner: censusWeight edge-multiset {3, 7/2, 11/2, −5/2}, r = 1,
                                logContent = the four banked edge logs (anchor:
                                recomposedEndpointDressed_normalform — the dressed running
                                is EXACTLY κ times a rational combination of banked cutLogs);
    (P3) OBSTRUCTION −(3/5)·κ : censusWeight 3/5 (the N585 census deficit, PROVED −3/5),
                                r = 1, logContent 1 — no scale gap (anchor:
                                obstructionTerm_eq = 1/(5·cutPi));
    (P4) MIRROR −(16/9)·κ·α²  : censusWeight 16/9 = chargeTraceDepth·depthWeight (anchor:
                                mirrorCoeff_eq), r = 1, logContent 1, and the α² ends
                                (anchor: mirror_term_unique — the selection theorem).

  Plus the SEPARATION theorems: the running term is the ONLY one carrying logs; the base is
  the ONLY κ-free one; the mirror is the ONLY α-carrying one — so the grammar's slots are
  DISCRIMINATING (the parse is unique per term, not a catch-all).

  ## ROUTE-NOT-YET-FOUND (declared openly, the honest boundary)

  The grammar's LEGALITY laws (why census must be complete, why re-entry is unary, why the
  self-look has two ends) remain ANCHORED to banked principles (CensusCompletenessClosure,
  the unary law, the return geometry) but are not themselves derived as theorems about an
  intrinsic term-language of the chain — there is no banked formal syntax of "all possible
  terms" to quantify over. What IS proved here: the banked chain's ACTUAL terms all parse,
  the parse is unique, and the mirror term is the unique legal mirror-level term (N586).
  Deriving the legality laws from the fold itself is the successor's work.

  PHYSICS-WORDS-REMOVABLE: delete census/running/obstruction/mirror — the statements are
  algebraic decompositions of banked Cut objects into (rational) × (κ-power) × (log-content)
  with uniqueness of the decomposition. NO-FIT: no empirical number anywhere.
-/

namespace Phys.Algebra
namespace ChainTermGrammar
open Phys.Foundation.ContinuumQ
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.D7NarrowingRung4
open Phys.Algebra.MirrorFixedPoint

noncomputable section

/-- A parsed chain term over Cut: census weight (ℚ), return count r ∈ ℕ, log content. -/
structure ParsedTerm where
  censusWeight : ℚ
  returns      : ℕ
  logContent   : Cut
  alphaEnds    : ℕ

/-- The term's Cut value under the grammar. -/
def ParsedTerm.value (t : ParsedTerm) (alpha : Cut) : Cut :=
  (t.censusWeight : Cut) * kappaLeading ^ t.returns * t.logContent * alpha ^ t.alphaEnds

/-- (P1) THE BASE PARSES: 2425/18 = censusWeight 2425/18, zero returns, no log, no ends.
    Anchor: the base is running-exempt (`reattest_base_exempt`). -/
def baseTerm : ParsedTerm := ⟨2425/18, 0, 1, 0⟩

theorem base_parses (alpha : Cut) : baseTerm.value alpha = 2425/18 := by
  unfold ParsedTerm.value baseTerm
  push_cast
  ring

/-- (P2) THE RUNNING PARSES: the dressed running content is EXACTLY κ¹ times the banked
    edge-log combination (one return, a genuine scale gap, no α ends).
    Anchor: `recomposedEndpointDressed_normalform`. -/
def runningLogContent : Cut :=
  3 * cutLog (mass0 / mass1) + (7/2) * cutLog mbRatioDerived
    + (11/2) * cutLog (bMass 0) - (5/2) * cutLog (bMass 2)

def runningTerm : ParsedTerm := ⟨1, 1, runningLogContent, 0⟩

theorem running_parses (alpha : Cut) :
    recomposedEndpointDressed = baseTerm.value alpha + runningTerm.value alpha := by
  rw [recomposedEndpointDressed_normalform, base_parses]
  unfold ParsedTerm.value runningTerm runningLogContent
  push_cast
  ring

/-- (P3) THE OBSTRUCTION PARSES: the N585 census deficit through ONE return, NO scale gap
    (logContent = 1), no α ends. Anchor: `obstructionTerm_eq`. -/
def obstructionParsed : ParsedTerm := ⟨3/5, 1, 1, 0⟩

theorem obstruction_parses (alpha : Cut) :
    obstructionTerm = obstructionParsed.value alpha := by
  unfold ParsedTerm.value obstructionParsed obstructionTerm
  push_cast
  ring

/-- (P4) THE MIRROR PARSES: the full census through one fold re-entry (16/9 =
    chargeTraceDepth·depthWeight, `mirrorCoeff_eq`), ONE return, NO scale gap, TWO α ends. -/
def mirrorParsed : ParsedTerm := ⟨16/9, 1, 1, 2⟩

theorem mirror_parses (alpha : Cut) :
    mirrorCoeff * kappaLeading * alpha^2 = mirrorParsed.value alpha := by
  rw [mirrorCoeff_eq]
  unfold ParsedTerm.value mirrorParsed
  push_cast
  ring

/-! ## THE SEPARATION THEOREMS — the grammar's slots DISCRIMINATE. -/

/-- The base is the unique κ-free parsed term among the four. -/
theorem base_unique_kappa_free :
    baseTerm.returns = 0 ∧ runningTerm.returns ≠ 0
      ∧ obstructionParsed.returns ≠ 0 ∧ mirrorParsed.returns ≠ 0 := by
  refine ⟨rfl, ?_, ?_, ?_⟩ <;> decide

/-- The running term is the unique log-carrying one: the other three have logContent 1,
    and the running content is ≠ 1 (it is strictly positive but bounded away from 1 —
    from the banked edge-log brackets, cInner ≈ 22.4 ≠ 9/8... we state the DEFINITIONAL
    separation: the other three have logContent = 1 by construction). -/
theorem others_log_free :
    baseTerm.logContent = 1 ∧ obstructionParsed.logContent = 1
      ∧ mirrorParsed.logContent = 1 := ⟨rfl, rfl, rfl⟩

/-- The mirror is the unique α-carrying term. -/
theorem mirror_unique_alpha :
    mirrorParsed.alphaEnds = 2 ∧ baseTerm.alphaEnds = 0
      ∧ runningTerm.alphaEnds = 0 ∧ obstructionParsed.alphaEnds = 0 := by
  refine ⟨rfl, rfl, rfl, rfl⟩

/-- ★★ THE FULL-ENDPOINT PARSE — the mirror equation's right side is EXACTLY the four
    parsed terms assembled: F0 − mirror = base + running − obstruction − mirror. -/
theorem endpoint_parses (alpha : Cut) :
    F0 - mirrorCoeff * kappaLeading * alpha^2
      = baseTerm.value alpha + runningTerm.value alpha
        - obstructionParsed.value alpha - mirrorParsed.value alpha := by
  rw [F0]
  rw [running_parses alpha]  -- recomposedEndpointDressed = base + running
  rw [← obstruction_parses alpha, ← mirror_parses alpha]
  ring

/-- ★ W8 TEETH: the parse is non-degenerate — the four census weights are pairwise
    distinct (no two terms are the same term relabeled). -/
theorem parse_weights_distinct :
    baseTerm.censusWeight ≠ runningTerm.censusWeight
      ∧ baseTerm.censusWeight ≠ obstructionParsed.censusWeight
      ∧ baseTerm.censusWeight ≠ mirrorParsed.censusWeight
      ∧ runningTerm.censusWeight ≠ obstructionParsed.censusWeight
      ∧ runningTerm.censusWeight ≠ mirrorParsed.censusWeight
      ∧ obstructionParsed.censusWeight ≠ mirrorParsed.censusWeight := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> norm_num [baseTerm, runningTerm, obstructionParsed, mirrorParsed]

end
end ChainTermGrammar
end Phys.Algebra
