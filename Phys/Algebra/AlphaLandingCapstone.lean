import Phys.Algebra.MirrorResidualWelded

/-!
  # N677 — ALPHA-LANDING CAPSTONE: derived admissibility + second-root anti-vacuity +
  # the α⁴ normalization exclusion + the one welded capstone theorem
  ================================================================================
  MANAGER-AS-PROVER NODE (owner-directed airtight arc; referee battery). PREREG:
  workbench/mirror-closure/PREREG-AIRTIGHT.md (extended). Recon: residual(30) < 0
  worst-case (−982.9); 1/root ≥ 136.8 > 42; (2/5)/2 = 1/5 ≠ 1/3 = depthWeight.
-/

namespace Phys.Algebra
namespace MirrorFixedPoint
open Phys.Foundation.ContinuumQ
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.ChainTermGrammar
open Phys.Algebra.DepthWeight
open Set

noncomputable section

/-! ## (1) THE DERIVED ADMISSIBLE DOMAIN — from the chain's own running, not declared. -/

/-- A chain-admissible coupling: positive, and its inverse at least the chain's own
    undressed intercept `invAlphaHigh = 42` (the banked screening theorem: below the deep
    scale, 1/α only GROWS above 42 — the chain's own running keeps every coupling at or
    below the undressed share 1/42). This is the admissibility DERIVED from banked
    structure; no numerical landing interval enters. -/
def ChainAdmissible (a : Cut) : Prop := 0 < a ∧ invAlphaHigh ≤ 1/a

/-- Admissible couplings live in (0, 1/42], hence strictly inside the unit interval:
    a ≤ 1/42 < 1. Derived from `invAlphaHigh_eq` (the banked 42). -/
theorem chainAdmissible_sub_unit {a : Cut} (h : ChainAdmissible a) :
    0 < a ∧ a < 1 := by
  obtain ⟨hpos, hinv⟩ := h
  rw [invAlphaHigh_eq] at hinv
  constructor
  · exact hpos
  · by_contra hnot
    have hnot' : 1 ≤ a := not_lt.mp hnot
    have h1a : 1/a ≤ 1 := by
      rw [div_le_one hpos]
      exact hnot'
    linarith

/-- ★ ANY ROOT IN THE UNIT INTERVAL IS CHAIN-ADMISSIBLE: at a root, 1/a = F0 − c·a² ≥
    F0_lo − c_hi ≈ 136.85 > 42. The admissibility is not assumed of the root — the root
    EARNS it from the certified brackets. -/
theorem root_is_chainAdmissible {a : Cut}
    (ha : a ∈ Ioo (0:Cut) 1) (hroot : residual a = 0) : ChainAdmissible a := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have hform := root_inverse_form ha.1 hroot
  refine ⟨ha.1, ?_⟩
  rw [invAlphaHigh_eq, hform]
  have ha2 : a^2 ≤ 1 := by nlinarith [ha.1, ha.2]
  nlinarith [hF, hk, hkpos, ha2]

/-! ## (2) STRUCTURAL UNIQUENESS ON THE DERIVED DOMAIN — no landing interval anywhere. -/

/-- ★★ UNIQUENESS ON THE DERIVED ADMISSIBLE DOMAIN: two chain-admissible roots coincide.
    Proof through the unit-band monotonicity ONLY — `aL`/`aR` do not appear. -/
theorem mirror_root_unique_admissible {a b : Cut}
    (ha : ChainAdmissible a) (hb : ChainAdmissible b)
    (hra : residual a = 0) (hrb : residual b = 0) : a = b := by
  have ha' := chainAdmissible_sub_unit ha
  have hb' := chainAdmissible_sub_unit hb
  exact mirror_root_unique_on_unit ⟨ha'.1, ha'.2⟩ ⟨hb'.1, hb'.2⟩ hra hrb

/-! ## (3) SECOND-ROOT ANTI-VACUITY — the cubic is NOT globally one-rooted, so the
    derived admissibility condition does REAL selection work. -/

/-- ★ THE CUBIC HAS A SECOND POSITIVE ROOT (beyond the unit interval): residual(1) > 0
    and residual(30) < 0 (worst case: F0 high, κ low — the −c·a³ term wins), so by IVT a
    root exists in [1, 30] — OUTSIDE the admissible domain. Global uniqueness was never
    available; the admissibility theorem is load-bearing, not decorative. -/
theorem residual_neg_at_thirty : residual 30 < 0 := by
  have hF := F0_bracket.2
  have hk := kappa_bracket_mirror.1
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  rw [residual]
  nlinarith [hF, hk, hkpos]

/-- ★ THE SECOND ROOT EXISTS in [1, 30] — the cubic genuinely has more than one positive
    root; only ONE is chain-admissible. -/
theorem second_root_exists : ∃ b ∈ Icc (1:Cut) 30, residual b = 0 := by
  have h130 : (1:Cut) ≤ 30 := by norm_num
  have hcont : ContinuousOn residual (Icc 1 30) := residual_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (residual 30) (residual 1) :=
    ⟨le_of_lt residual_neg_at_thirty, le_of_lt residual_one_pos⟩
  obtain ⟨b, hb, hbval⟩ := (intermediate_value_Icc' h130 hcont) hmem
  exact ⟨b, hb, hbval⟩

/-- The second root is NOT chain-admissible: any root b ≥ 1 fails admissibility
    (admissible couplings are < 1). -/
theorem second_root_not_admissible {b : Cut} (hb : b ∈ Icc (1:Cut) 30) :
    ¬ ChainAdmissible b := by
  intro hadm
  have h := chainAdmissible_sub_unit hadm
  linarith [hb.1, h.2]

/-! ## (4) THE α⁴ EXCLUSION AT THEOREM LEVEL — the fourth moment survives but is NOT the
    banked normalization: the ONLY moment the banked weight normalizes is the second. -/

/-- ★ THE FOURTH MOMENT IS NOT THE BANKED WEIGHT: normalized by the same return measure
    (`sinAntideriv cutPi = 2`), the fourth even moment gives (2/5)/2 = 1/5 ≠ 1/3 =
    depthWeight. The two-ended step's weight IS the banked w; the four-ended direct
    term's would-be weight is a DIFFERENT number that equals no banked object — the
    grammar's w-slot cannot host it. Higher even powers enter only by ITERATING the
    two-ended step (the fixed point's own recursion), never as direct terms. -/
theorem fourth_moment_not_banked_weight :
    fourthEvenMomentFlux cutPi / sinAntideriv cutPi ≠ depthWeight := by
  rw [fourthEvenMoment_eq, sinAntideriv_cutPi, depthWeight_eq]
  norm_num

/-! ## (5) THE WELDED CAPSTONE — one theorem, the whole claim, no comments load-bearing. -/

/-- ★★★ THE ALPHA-LANDING CAPSTONE (the referee's requested single statement):
    (i) the mirror term is the UNIQUE legal term of the formal grammar
        (`mirror_term_universal`, every slot forced by a prior theorem);
    (ii) the ASSEMBLED-coefficient equation has EXACTLY ONE chain-admissible root —
        admissibility DERIVED from the chain's own running (1/α ≥ 42), the numerical
        window nowhere in the selection;
    (iii) that root's inverse is certified: 137.0359990777677 ≤ 1/α ≤ 137.0359990778029.
    The landing interval `[aL,aR]` enters ONLY through the bracket certification
    (`invAlpha_certified` / `solution_bracket`), never through root selection.

    COMPOSITION PROVENANCE (N688–N694, the threshold-closure campaign): the endpoint
    this equation is seeded from (`F0 = recomposedEndpointDressed − obstructionTerm`)
    is the GLOBAL SECTION of the descent's cover — DERIVED, not merely computed:
    the local (active-span) sections are the N688-adjudicated counting; the closure
    cocycle (one census-valued defect per decoupling seam, the just-decoupled
    flavour's term, weight 1 on its own span-log) is the N693 seam law; their sum is
    the banked composition (`GatherEndpointComposition.gather_endpoint_eq`,
    `F0Gather_eq_F0`, `gather_landing_derived`). The corrected local-sections fixed
    point (N692, ≈136.2138) is this landing's LOCAL companion, not its competitor. -/
theorem alpha_landing_capstone :
    (∀ t : ParsedTerm, ChainLegal t → t = mirrorParsed)
    ∧ (∃! a : Cut, ChainAdmissible a ∧ residualWelded a = 0
        ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
        ∧ 1/a ≤ 1370359990778029 / 10000000000000) := by
  constructor
  · exact fun t h => mirror_term_universal t h
  · obtain ⟨a, ⟨haIoo, hroot, hlo, hhi⟩, _⟩ := invAlpha_certified_global
    have hadm : ChainAdmissible a :=
      root_is_chainAdmissible haIoo ((residualWelded_root_iff a).mp
        ((residualWelded_root_iff a).mpr hroot))
    refine ⟨a, ⟨hadm, (residualWelded_root_iff a).mpr hroot, hlo, hhi⟩, ?_⟩
    intro b ⟨hbadm, hbroot, _, _⟩
    exact mirror_root_unique_admissible hbadm hadm
      ((residualWelded_root_iff b).mp hbroot)
      ((residualWelded_root_iff a).mp ((residualWelded_root_iff a).mpr hroot))

end
end MirrorFixedPoint
end Phys.Algebra
