import Phys.Algebra.D7NarrowingRung4
import Phys.Algebra.GatherCoherenceCensus

/-
  # THE MIRROR FIXED POINT — the endpoint's self-inclusion, 1/α = F0 − (16/9)·κ·α²
  ================================================================================
  MANAGER-AS-PROVER NODE (worker retired; owner-directed). PREREG: workbench/mirror-closure/PREREG.md.
  Directed successor of GatherCoherenceCensus (the proved −3/5 bracketing census).

  ## THE TYPE CHANGE (the One axiom applied to the derivation itself)

  Every banked endpoint so far is an ASSIGNMENT: a closed real of Cut computed from the fold's
  created content. The mirror closure states the coupling's own participation: the object that
  determines the coupling is itself coupled — with the coupling's strength ("nothing outruns
  the fold", read at the level of the computation). The physical value solves the FIXED POINT

      1/α = F0 − mirrorCoeff · κ · α²,      F0 := recomposedEndpointDressed − (3/5)·kappaLeading,

  where (3/5) is the GatherCoherenceCensus deficit (census_mean, PROVED −3/5) times the banked
  loop factor κ, and mirrorCoeff := chargeTraceDepth · depthWeight = (16/3)·(1/3) = 16/9.

  ## THE GRAMMAR (each slot anchored to a banked principle; ℚ selection layer below)

    census 16/3 : the self-look sees the WHOLE created census (CensusCompletenessClosure —
                  nothing omitted, nothing double-counted);
    one w = 1/3 : ONE re-entry of the fold into itself (the UNARY law D = κ₀ + w·D of
                  FineStructureAllOrdersNormalization); the fixed-point equation itself
                  iterates the tower — a hand-written 1/(1−w) would double-count;
    one κ       : the insertion returns through the fold once;
    no log      : self-application has no scale gap;
    α²          : the self-look couples at its two ends (out + back): α⁰ is F0-static
                  (census-complete), α¹ never returns, α³ needs a third end (contradicts
                  the unary law).

  ## HONEST GRADE (exactly what is theorem and what is not)

  THEOREM (this node): the ℚ selection layer (unique legal term + five controls each failing
  a NAMED legality); the exact obstruction identity (3/5)·κ = 1/(5·cutPi); the certified F0
  bracket (banked N584 dressed bracket + banked ext8 1/cutPi bracket, worst-case rational
  arithmetic); the SIGN CHANGE of the fixed-point residual across [aL, aR]; STRICT
  MONOTONICITY there (uniqueness of any root); and the SOLUTION BRACKET — every root in
  [aL, aR] has 137.0359990777677 ≤ 1/α ≤ 137.0359990778029 (width ≈ 3.5×10⁻¹¹).

  ROUTE-NOT-YET-FOUND (the directed successor's work, declared openly): the GRAMMAR itself
  (term = census × κ × scale × wⁿ × α^ends) is read off the banked chain's term shapes and
  validated against every banked term; making the grammar a theorem ABOUT the banked chain is
  the successor. Likewise ROOT EXISTENCE via IVT (continuity of the cubic over Cut) is handed
  to the successor; this node banks sign-change + strict monotonicity + the conditional
  bracket — every claim in this file is a proved theorem of the stated hypotheses.

  NO-FIT: measured 1/α(0) ≈ 137.036 is REMOVABLE ORIENTATION PROSE (in no statement, no
  proof). aL/aR are chosen where the residual's SIGN is certifiable from the banked brackets,
  not by any measured value. PHYSICS-WORDS-REMOVABLE: delete mirror/look/coupling/census —
  pure Cut arithmetic: a cubic's sign change, monotonicity, and a quotient bracket.
-/

namespace Phys.Algebra
namespace MirrorFixedPoint
open Phys.Cascade
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.D7NarrowingRung4

/-! ## (A) THE ℚ SELECTION LAYER — the grammar's finite term-space. -/

/-- A mirror-level term candidate: (census, re-entry count, coupling ends). -/
structure MirrorTerm where
  census : ℚ
  wPow   : ℕ
  aPow   : ℕ
deriving DecidableEq

/-- Census legality: the whole-look census is the FULL charge trace 16/3
    (anchor: `census_completeness_closure` — the one census, nothing omitted). -/
def censusLegal (t : MirrorTerm) : Prop := t.census = 16/3

/-- Re-entry legality: exactly ONE fold re-entry (anchor: the UNARY law `D = κ₀ + w·D`;
    the fixed point iterates the tower — more hand-written w's double-count). -/
def reentryLegal (t : MirrorTerm) : Prop := t.wPow = 1

/-- Ends legality: the self-look couples at its TWO ends, out + back (anchor: the fold's
    return geometry; α⁰ is F0-static, α¹ never returns, α³ has no third end under unary). -/
def endsLegal (t : MirrorTerm) : Prop := t.aPow = 2

/-- The unique legal term. -/
def theMirrorTerm : MirrorTerm := ⟨16/3, 1, 2⟩

/-- ★★ THE SELECTION: any legal term IS the mirror term, and its census·w weight is 16/9. -/
theorem mirror_term_unique (t : MirrorTerm)
    (hc : censusLegal t) (hr : reentryLegal t) (he : endsLegal t) :
    t = theMirrorTerm ∧ t.census * (1/3 : ℚ) ^ t.wPow = 16/9 := by
  obtain ⟨c, wp, ap⟩ := t
  simp only [censusLegal, reentryLegal, endsLegal] at hc hr he
  subst hc; subst hr; subst he
  exact ⟨rfl, by norm_num⟩

/-- ★ W8 TEETH — five controls each FAIL a named legality (not merely "land wrong"):
    lepton sub-census 2, coloured sub-census 10/3, undressed (zero re-entries),
    double-dressed (two re-entries), one-ended look. -/
theorem controls_excluded :
    ¬ censusLegal ⟨2, 1, 2⟩ ∧ ¬ censusLegal ⟨10/3, 1, 2⟩ ∧
    ¬ reentryLegal ⟨16/3, 0, 2⟩ ∧ ¬ reentryLegal ⟨16/3, 2, 2⟩ ∧
    ¬ endsLegal ⟨16/3, 1, 1⟩ := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> simp [censusLegal, reentryLegal, endsLegal] <;> norm_num

/-- The legality predicates are non-vacuous: the mirror term satisfies all three. -/
theorem theMirrorTerm_legal :
    censusLegal theMirrorTerm ∧ reentryLegal theMirrorTerm ∧ endsLegal theMirrorTerm :=
  ⟨rfl, rfl, rfl⟩

/-! ## (B) THE Cut LAYER — obstruction identity, F0, and the fixed-point brackets. -/

/-- The mirror coefficient over Cut: the full census through one fold re-entry. -/
noncomputable def mirrorCoeff : Cut := chargeTraceDepth * depthWeight

theorem mirrorCoeff_eq : mirrorCoeff = 16/9 := by
  rw [mirrorCoeff, chargeTraceDepth_eq, depthWeight_eq]; norm_num

/-- The gather-coherence obstruction term: the PROVED census deficit magnitude 3/5
    (GatherCoherence.census_mean) times the banked loop factor κ. -/
noncomputable def obstructionTerm : Cut := (3/5) * kappaLeading

/-- ★ THE OBSTRUCTION IDENTITY: (3/5)·κ = 1/(5·cutPi) exactly. -/
theorem obstructionTerm_eq : obstructionTerm = 1 / (5 * cutPi) := by
  have hpi := cutPi_pos
  rw [obstructionTerm, kappaLeading_eq]
  rw [div_mul_div_comm, div_eq_div_iff (by positivity) (by positivity)]
  ring

/-- Certified obstruction bracket, from the banked ext8 1/cutPi bracket. -/
theorem obstructionTerm_bracket :
    (63661977236 : Cut) / 1000000000000 ≤ obstructionTerm
      ∧ obstructionTerm ≤ 63661977237 / 1000000000000 := by
  have hpi := cutPi_pos
  have hip := inv_cutPi_bracket_ext8
  have heq : obstructionTerm = (1/5) * (1/cutPi) := by
    rw [obstructionTerm, kappaLeading_eq, div_mul_div_comm, div_mul_div_comm,
      div_eq_div_iff (by positivity) (by positivity)]
    ring
  constructor
  · rw [heq]; nlinarith [hip.1]
  · rw [heq]; nlinarith [hip.2]

/-- Certified κ bracket, from the banked ext8 bracket (κ = (1/cutPi)/3). -/
theorem kappa_bracket_mirror :
    (106103295394 : Cut) / 1000000000000 ≤ kappaLeading
      ∧ kappaLeading ≤ 106103295395 / 1000000000000 := by
  have hpi := cutPi_pos
  have hip := inv_cutPi_bracket_ext8
  have heq : kappaLeading = (1/3) * (1/cutPi) := by
    rw [kappaLeading_eq, div_mul_div_comm, div_eq_div_iff (by positivity) (by positivity)]
    ring
  constructor
  · rw [heq]; nlinarith [hip.1]
  · rw [heq]; nlinarith [hip.2]

/-- The obstructed (bare) endpoint: everything the fold's created content contains. -/
noncomputable def F0 : Cut := recomposedEndpointDressed - obstructionTerm

/-- ★★ THE CERTIFIED F0 BRACKET — banked N584 dressed bracket minus the obstruction bracket:
    F0 ∈ [137.03600912247947…, 137.03600912248055…]. -/
theorem F0_bracket :
    (3425900228061987 : Cut) / 25000000000000 ≤ F0
      ∧ F0 ≤ 2740720182449611 / 20000000000000 := by
  have hd := recomposedEndpointDressed_restated_r4
  have hob := obstructionTerm_bracket
  constructor
  · rw [F0]; linarith [hd.1, hob.2]
  · rw [F0]; linarith [hd.2, hob.1]

/-- The fixed-point residual: h(a) = a·F0 − (16/9)·κ·a³ − 1. A positive root a is exactly
    a value with 1/a = F0 − (16/9)·κ·a². -/
noncomputable def residual (a : Cut) : Cut := a * F0 - (16/9) * kappaLeading * a^3 - 1

/-- The bracketing interval endpoints (chosen where the SIGN is certifiable). -/
noncomputable def aL : Cut := 2918941 / 400000000
noncomputable def aR : Cut := 36486763 / 5000000000

/-- ★★★ SIGN CHANGE, LEFT: h(aL) < 0 (worst case: F0 high, κ low). -/
theorem residual_neg_at_aL : residual aL < 0 := by
  have hF := F0_bracket.2
  have hk := kappa_bracket_mirror.1
  rw [residual, aL]
  nlinarith [hF, hk]

/-- ★★★ SIGN CHANGE, RIGHT: h(aR) > 0 (worst case: F0 low, κ high). -/
theorem residual_pos_at_aR : 0 < residual aR := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  rw [residual, aR]
  nlinarith [hF, hk]

/-- ★★ STRICT MONOTONICITY on [aL, aR] — uniqueness of any root: for a < b in the interval,
    h(a) < h(b). Factorization: h(b) − h(a) = (b−a)·(F0 − (16/9)·κ·(a²+ab+b²)), and the second
    factor stays ≥ F0_lo − (16/9)·κ_hi·3·aR² ≈ 137.036 ≫ 0. -/
theorem residual_strictMono {a b : Cut}
    (haL : aL ≤ a) (hbR : b ≤ aR) (hab : a < b) : residual a < residual b := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have key : residual b - residual a
      = (b - a) * (F0 - (16/9) * kappaLeading * (a^2 + a*b + b^2)) := by
    rw [residual, residual]; ring
  have hapos : (0:Cut) < a := by
    have : (0:Cut) < 2918941 / 400000000 := by norm_num
    rw [aL] at haL; linarith
  have hbpos : (0:Cut) < b := lt_trans hapos hab
  have haR : a ≤ 36486763 / 5000000000 := by
    rw [aR] at hbR; linarith
  have hbR' : b ≤ 36486763 / 5000000000 := by rw [aR] at hbR; exact hbR
  have hquad : a^2 + a*b + b^2 ≤ 3 * (36486763/5000000000)^2 := by
    nlinarith [hapos, hbpos, haR, hbR', hab]
  have hfac : 0 < F0 - (16/9) * kappaLeading * (a^2 + a*b + b^2) := by
    nlinarith [hF, hk, hkpos, hquad, hapos, hbpos]
  have : 0 < residual b - residual a := by
    rw [key]
    exact mul_pos (by linarith) hfac
  linarith

/-- At a positive root, 1/a = F0 − (16/9)·κ·a² exactly (the fixed-point form). -/
theorem root_inverse_form {a : Cut}
    (hpos : 0 < a) (hroot : residual a = 0) :
    1/a = F0 - (16/9) * kappaLeading * a^2 := by
  have h : a * F0 - (16/9) * kappaLeading * a^3 = 1 := by
    rw [residual] at hroot; linarith
  have hne : a ≠ 0 := ne_of_gt hpos
  field_simp
  nlinarith [h]

/-- ★★★ THE SOLUTION BRACKET — the certified landing: ANY root of the residual in [aL, aR]
    satisfies 137.0359990777677 ≤ 1/α ≤ 137.0359990778029. From banked brackets alone; no
    measured value anywhere. -/
theorem solution_bracket {a : Cut}
    (haL : aL ≤ a) (haR : a ≤ aR) (hroot : residual a = 0) :
    (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
      ∧ 1/a ≤ 1370359990778029 / 10000000000000 := by
  have hapos : (0:Cut) < a := by
    have : (0:Cut) < 2918941 / 400000000 := by norm_num
    rw [aL] at haL; linarith
  have hform := root_inverse_form hapos hroot
  have hF := F0_bracket
  have hk := kappa_bracket_mirror
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have haL' : (2918941 : Cut)/400000000 ≤ a := by rw [aL] at haL; exact haL
  have haR' : a ≤ (36486763 : Cut)/5000000000 := by rw [aR] at haR; exact haR
  constructor
  · rw [hform]
    nlinarith [hF.1, hk.2, hkpos, haR', hapos]
  · rw [hform]
    nlinarith [hF.2, hk.1, hkpos, haL', hapos]

/-- ★ W8 TEETH: at any root in the interval the mirror term is strictly positive and the
    fixed point sits strictly BELOW the bare F0 — a genuine, downward, one-law correction. -/
theorem mirror_strictly_lowers {a : Cut}
    (haL : aL ≤ a) (hroot : residual a = 0) :
    1/a < F0 := by
  have hapos : (0:Cut) < a := by
    have : (0:Cut) < 2918941 / 400000000 := by norm_num
    rw [aL] at haL; linarith
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have hform := root_inverse_form hapos hroot
  have hterm : 0 < (16/9) * kappaLeading * a^2 := by positivity
  linarith [hform, hterm]

/-- ★ W8 TEETH: the fixed-point landing genuinely differs from the bare F0 bracket — the
    solution bracket's UPPER end sits strictly below the F0 bracket's LOWER end (the mirror
    correction is bigger than both bracket widths combined; nothing is vacuous). -/
theorem mirror_correction_resolved :
    (1370359990778029 : Cut) / 10000000000000 < 3425900228061987 / 25000000000000 := by
  norm_num

end MirrorFixedPoint
end Phys.Algebra
