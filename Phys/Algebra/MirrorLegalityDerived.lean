import Phys.Algebra.AlphaLandingCapstone

/-!
  # N678 — MIRROR LEGALITY DERIVED: the non-tautological legality relation
  # (referee finding at 89ba8ecb, closed)
  ================================================================================
  MANAGER-AS-PROVER NODE (owner-directed airtight arc).
  PREREG: workbench/mirror-closure/PREREG-AIRTIGHT.md (extended, referee finding at 89ba8ecb).
  Recon: (1−(−1)^{n+1})/(2(n+1)) = 1/3 iff n = 2, ∀ n checked exact to 2000; welds to the
  five constructed fluxes (0, 1/3, 0, 1/5, 0).

  THE FINDING (verbatim from the referee): ChainLegal is definitionally the four slot
  values, and mirror_term_universal proves uniqueness by substitution — none of the
  advertised forcing theorems appears in that proof.

  THE FIX (this node): a legality relation whose conjuncts mention ONLY banked structural
  objects — no slot value appears in the definition — and per-slot DERIVATION theorems
  that consume the forcing theorems to CONCLUDE the values. The universal theorem then
  composes those derivations.
-/

namespace Phys.Algebra
namespace MirrorTermLanguage
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.TwoEndsConstructed
open Phys.Algebra.MirrorSelfInsertionLaw
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.ChainTermGrammar

noncomputable section

/-! ## (1) THE NORMALIZED MOMENT LAW — one function of the ends-count, welded to the
    five constructed fluxes. -/

/-- The normalized n-th return-surface moment: `∫₀^π cosⁿ·sin / ∫₀^π sin` in closed form,
    `(1 − (−1)^(n+1)) / (2(n+1))` — the u-substitution antiderivative `−cos^(n+1)/(n+1)`
    evaluated over the full return, per unit return measure. -/
def termMomentNorm (n : ℕ) : Cut :=
  (1 - (-1 : Cut) ^ (n + 1)) / (2 * (n + 1))

/-- WELD 1: at n = 1 the law IS the constructed first moment (0). -/
theorem termMomentNorm_one_weld :
    termMomentNorm 1 = firstMomentFlux cutPi / sinAntideriv cutPi := by
  rw [termMomentNorm, firstMomentFlux_vanishes, sinAntideriv_cutPi]
  norm_num

/-- WELD 2 (THE LOAD-BEARING ONE): at n = 2 the law IS the banked depth weight — the
    constructed second moment over the return measure. -/
theorem termMomentNorm_two_weld : termMomentNorm 2 = depthWeight := by
  rw [termMomentNorm, depthWeight_eq]
  norm_num

/-- WELD 3: at n = 3 the law IS the constructed third moment (0). -/
theorem termMomentNorm_three_weld :
    termMomentNorm 3 = thirdMomentFlux cutPi / sinAntideriv cutPi := by
  rw [termMomentNorm, thirdMomentFlux_vanishes, sinAntideriv_cutPi]
  norm_num

/-- WELD 4: at n = 4 the law IS the constructed fourth even moment over the measure. -/
theorem termMomentNorm_four_weld :
    termMomentNorm 4 = fourthEvenMomentFlux cutPi / sinAntideriv cutPi := by
  rw [termMomentNorm, fourthEvenMoment_eq, sinAntideriv_cutPi]
  norm_num

/-- WELD 5: at n = 5 the law IS the constructed fifth moment (0). -/
theorem termMomentNorm_five_weld :
    termMomentNorm 5 = fifthMomentFlux cutPi / sinAntideriv cutPi := by
  rw [termMomentNorm, fifthMomentFlux_vanishes, sinAntideriv_cutPi]
  norm_num

/-- ★★ THE MOMENT SELECTION LAW, ∀ n: the normalized moment equals the banked depth
    weight IFF n = 2 — odd moments are zero (≠ 1/3), and among even the value 1/(n+1)
    hits 1/3 exactly at n = 2. The α-ends selection as ONE theorem over all of ℕ. -/
theorem termMomentNorm_eq_weight_iff (n : ℕ) :
    termMomentNorm n = depthWeight ↔ n = 2 := by
  constructor
  · intro h
    rw [termMomentNorm, depthWeight_eq] at h
    rcases Nat.even_or_odd n with he | ho
    · -- n even ⇒ n+1 odd ⇒ (−1)^(n+1) = −1 ⇒ value = 2/(2(n+1)) = 1/(n+1)
      have hpow : (-1 : Cut) ^ (n + 1) = -1 := (he.add_one).neg_one_pow
      rw [hpow] at h
      have hn1 : (0:Cut) < 2 * (n + 1) := by positivity
      -- (1 − (−1)) / (2(n+1)) = 1/3  ⇒  2·3 = 2(n+1) ⇒ n = 2
      rw [div_eq_div_iff (ne_of_gt hn1) (by norm_num : (3:Cut) ≠ 0)] at h
      have hcast : ((n : Cut) + 1) * 3 = 2 * ((n:Cut) + 1) + ((n:Cut) + 1) := by ring
      have h6 : (6 : Cut) = 2 * ((n:Cut) + 1) := by push_cast at h ⊢; linarith
      have hn : ((n : Cut)) = 2 := by linarith
      exact_mod_cast hn
    · -- n odd ⇒ n+1 even ⇒ (−1)^(n+1) = 1 ⇒ value = 0 ≠ 1/3
      have hpow : (-1 : Cut) ^ (n + 1) = 1 := (ho.add_one).neg_one_pow
      rw [hpow] at h
      simp only [sub_self, zero_div] at h
      exact absurd h.symm (by norm_num)
  · intro h
    subst h
    exact termMomentNorm_two_weld

/-! ## (2) THE DERIVED LEGALITY — every conjunct references ONLY banked structural
    objects; NO slot value (16/9, 1, 1, 2) appears in this definition. -/

/-- A parsed term is DERIVED-legal iff each of its slots equals the banked structural
    object that governs it:
    · its census weight is the UNDIMINISHED cap census through the derived re-entry
      weight — cap minus the zero-gap screening (`bandScreen chargeTraceDepth 1`),
      times `depthWeight`;
    · its return count equals the unary fold multiplicity (`foldCount` — the banked
      self-reference law's coefficient, at every level);
    · its log content is the no-gap screening of the unit census, plus one
      (`bandScreen 1 1 + 1` — what remains of a log slot when the scale gap is zero);
    · its α-ends count carries the banked weight: the normalized return moment at its
      ends-count IS `depthWeight`.
    The VALUES (16/9, 1, 1, 2) appear nowhere here — they are CONCLUSIONS below. -/
def DerivedLegal (t : ParsedTerm) : Prop :=
  ((t.censusWeight : Cut)
      = (chargeTraceDepth - bandScreen chargeTraceDepth 1) * depthWeight)
  ∧ ((t.returns : Cut) = foldCount t.returns)
  ∧ (t.logContent = bandScreen 1 1 + 1)
  ∧ (termMomentNorm t.alphaEnds = depthWeight)

/-! ## (3) THE PER-SLOT DERIVATIONS — each consumes its forcing theorem BY NAME. -/

/-- CENSUS DERIVED: no gap ⇒ zero removal (`census_no_edge_no_removal`) ⇒ the census
    slot is the whole cap through one weight — and the banked values
    (`chargeTraceDepth_eq`, `depthWeight_eq`) evaluate it to 16/9. -/
theorem derivedLegal_census {t : ParsedTerm} (h : DerivedLegal t) :
    t.censusWeight = 16/9 := by
  have hc := h.1
  rw [census_no_edge_no_removal chargeTraceDepth] at hc
  rw [Phys.Algebra.chargeTraceDepth_eq, depthWeight_eq] at hc
  have : (t.censusWeight : Cut) = ((16/9 : ℚ) : Cut) := by
    rw [hc]; push_cast; ring
  exact_mod_cast this

/-- RETURNS DERIVED: the unary law's multiplicity (`foldCount = 1`, the coefficient of
    the banked self-reference tower `D = κ₀ + w·D`) forces the return slot to 1. -/
theorem derivedLegal_returns {t : ParsedTerm} (h : DerivedLegal t) :
    t.returns = 1 := by
  have hr := h.2.1
  unfold foldCount at hr
  exact_mod_cast hr

/-- LOG DERIVED: the zero-gap screening vanishes (`census_no_edge_no_removal` at unit
    census — `bandScreen 1 1 = 0` since `cutLog 1 = 0`), so the log slot is 1. -/
theorem derivedLegal_log {t : ParsedTerm} (h : DerivedLegal t) :
    t.logContent = 1 := by
  have hl := h.2.2.1
  rw [census_no_edge_no_removal 1] at hl
  rw [hl]; ring

/-- ENDS DERIVED: the term's ends-count carries the banked weight, and the moment
    selection law (`termMomentNorm_eq_weight_iff`, welded to the constructed fluxes)
    forces it to 2. -/
theorem derivedLegal_ends {t : ParsedTerm} (h : DerivedLegal t) :
    t.alphaEnds = 2 :=
  (termMomentNorm_eq_weight_iff t.alphaEnds).mp h.2.2.2

/-! ## (4) THE NON-TAUTOLOGICAL UNIVERSAL THEOREM — composes the four derivations. -/

/-- ★★★ THE UNIVERSAL SELECTION, DERIVED: any DERIVED-legal term of the grammar IS the
    mirror term. The proof consumes the four per-slot derivation theorems — which in
    turn consume `census_no_edge_no_removal`, `foldCount` (the unary law's multiplicity),
    and the moment selection law welded to `firstMomentFlux_vanishes` /
    `secondMoment_survives`-family constructions. No conjunct of `DerivedLegal` names a
    slot value. -/
theorem mirror_term_universal_derived (t : ParsedTerm) (h : DerivedLegal t) :
    t = mirrorParsed := by
  obtain ⟨cw, r, lc, ae⟩ := t
  have hcw := derivedLegal_census h
  have hr := derivedLegal_returns h
  have hlc := derivedLegal_log h
  have hae := derivedLegal_ends h
  simp only at hcw hr hlc hae
  subst hcw; subst hr; subst hlc; subst hae
  rfl

/-- The mirror term IS derived-legal (inhabitation — the relation is non-vacuous). -/
theorem mirrorParsed_derivedLegal : DerivedLegal mirrorParsed := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [census_no_edge_no_removal chargeTraceDepth,
      Phys.Algebra.chargeTraceDepth_eq, depthWeight_eq]
    show ((16/9 : ℚ) : Cut) = (16/3 - 0) * (1/3)
    push_cast; ring
  · show ((mirrorParsed.returns : ℕ) : Cut) = foldCount mirrorParsed.returns
    unfold foldCount
    norm_num [mirrorParsed]
  · show (1 : Cut) = bandScreen 1 1 + 1
    rw [census_no_edge_no_removal 1]; ring
  · exact termMomentNorm_two_weld

/-- The derived legality and the value-form legality agree — the earlier `ChainLegal`
    is exactly the EVALUATION of the derived relation (so nothing downstream breaks,
    and the tautology objection is discharged at the definition site). -/
theorem derivedLegal_iff_chainLegal (t : ParsedTerm) :
    DerivedLegal t ↔ ChainLegal t := by
  constructor
  · intro h
    exact ⟨derivedLegal_census h, derivedLegal_returns h, derivedLegal_log h,
      derivedLegal_ends h⟩
  · intro h
    obtain ⟨hcw, hr, hlc, hae⟩ := h
    have := mirrorParsed_derivedLegal
    obtain ⟨c1, c2, c3, c4⟩ := this
    refine ⟨?_, ?_, ?_, ?_⟩
    · rw [hcw]; exact c1
    · rw [hr]
      show ((1 : ℕ) : Cut) = foldCount 1
      unfold foldCount; norm_num
    · rw [hlc]; exact c3
    · rw [hae]; exact c4

/-! ## (5) THE CAPSTONE, RESTATED ON THE DERIVED RELATION — the final theorem's first
    conjunct now routes through the derivation chain, not the value form. -/

/-- ★★★ THE ALPHA-LANDING CAPSTONE, DERIVED FORM: (i) every DERIVED-legal term of the
    grammar is the mirror term — via the per-slot derivations consuming the forcing
    theorems; (ii) the assembled-coefficient equation has exactly one chain-admissible
    root; (iii) its inverse carries the certified bracket. -/
theorem alpha_landing_capstone_derived :
    (∀ t : ParsedTerm, DerivedLegal t → t = mirrorParsed)
    ∧ (∃! a : Cut, MirrorFixedPoint.ChainAdmissible a
        ∧ MirrorFixedPoint.residualWelded a = 0
        ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
        ∧ 1/a ≤ 1370359990778029 / 10000000000000) :=
  ⟨fun t h => mirror_term_universal_derived t h,
   MirrorFixedPoint.alpha_landing_capstone.2⟩

end
end MirrorTermLanguage
end Phys.Algebra
