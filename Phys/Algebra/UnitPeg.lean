/-
  Phys.Algebra.UnitPeg — ARC-M M1: THE ONE UNIT PEG (SEED_MASSES §M1).
  =====================================================================================
  THE SINGLE DIMENSIONFUL CONVENTION OF THE ENTIRE CHAIN, DECLARED ONCE AND FLAGGED, WITH THE
  UNIQUE-UP-TO-UNITS THEOREM.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  A dimensionful value like a mass "in MeV" is a pure number TIMES a unit convention. The unit is
  NOT physics — it is a peg. The chain has already derived EVERY scale as a pure DIMENSIONLESS ratio
  to the arena's natural closure unit `M_oct := 1`:
    · `ewClosureRatio = v/M = cutExp(−28π/3)`      (the n=9 electroweak grammar rung, N-ScaleTower),
    · `confinementScaleRatio = Λ/M = cutExp(−12π)`  (the octonion/colour n=7 rung, N-ConfHadronMass),
    · `massScale = absScaleChainDerived`            (the parameter-free derived absolute scale N417,
       which the AbsoluteMassSpectrum module ITSELF names "the absolute scale in the arena's natural
       unit `M_oct := 1`"),
    · `absMass_k = massScale · mass_k`              (the absolute lepton tower, N340 ratios × scale).
  Each of these is a positive derived `Cut`, a pure ratio to `M_oct`. The ONLY freedom left in the
  entire chain is which HUMAN unit names `M_oct` — a single positive multiplier, the G2-clean analogue
  of choosing the metre. That is THE PEG.

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS")

  Exactly ONE flagged unit convention is declared here (`UnitPeg`), cited everywhere downstream; it is
  never duplicated. A second dimensionful input anywhere = a fit = FORBIDDEN. The load-bearing content
  is NOT the convention itself (a peg carries no physics) but the THEOREM that the peg is
  UNIQUE-UP-TO-UNITS: any two pegs differ by a SINGLE global positive constant `c`, the same for all
  quantities, and NOTHING dimensionless moves — every ratio `x/y` is peg-invariant. So the chain has
  exactly one degree of unit-freedom, and no dimensionless prediction depends on it.

  ## WHAT THIS MODULE PROVES (all foundations-only, over the banked derived `Cut` scale tower)

    · `UnitPeg`                     — the ONE flagged convention: a positive derived `Cut` giving the
                                      human value of `M_oct := 1`.
    · `UnitPeg.human`               — the human value of a chain quantity (a `Cut` ratio to `M_oct`).
    · `peg_fixes_Moct`              — the peg IS the human value of the natural closure unit `M_oct`
                                      (`p.human 1 = p.val`) — the metre-choice made explicit.
    · `ratio_peg_invariant`         — the peg CANCELS in every dimensionless ratio (unconditional).
    · `ratio_peg_independent`       — every ratio is IDENTICAL under any two pegs — nothing moves.
    · `peg_unique_up_to_units`      — ★ the uniqueness theorem: ∃! global positive `c` with
                                      `q.human x = c · p.human x` for ALL `x`.
    · `tower_ratio_peg_invariant`   — the confinement/electroweak scale ratio `Λ/v` is peg-free
                                      (grounds on `ewClosureRatio`, `confinementScaleRatio`).
    · `absMass_ratio_peg_invariant` — the banked lepton mass ratio is peg-free (grounds on `massScale`,
                                      `absMass_k`, N340 `mass_k`) — the M2 numerals will be peg-free.
    · `human_scale_pos`             — human values of positive scales are positive under any peg.
    · `human_peg_dependent`         — ★ non-vacuity (W8): the peg GENUINELY moves absolute values.
    · `unitPeg_landing`             — the welded capstone (non-hollow).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "mass / scale / confinement / electroweak / unit / peg" and pure mathematics survives: for a
  positive `Cut` `p.val`, the map `x ↦ p.val·x` cancels in quotients (`ratio_peg_invariant`), any two
  positive multipliers differ by a positive quotient constant applied uniformly (`peg_unique_up_to_units`),
  and it genuinely separates points on positive inputs (`human_peg_dependent`). No physics word does any
  logical work; a physicist READS "the single unit convention and its uniqueness" out of the theorems.

  ## NOT FREE-FLOATING (SOUL, the free-floating rail)

  Every production TYPE cites the banked derived scale objects over `Cut`/`O ℚ`: `ewClosureRatio`,
  `confinementScaleRatio` (the banked M-scale tower rungs), `massScale` (N417), `absMass0/absMass1`
  (N340 × scale), `mass0/mass1` (N340). The peg is a `Cut` multiplier of THESE, not a generic real.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: exact identities/inequalities of the derived `Cut`; the peg a flagged CONVENTION
  carrying a uniqueness theorem, NOT a physics posit. NO empirical number in any proof; measured masses
  NOWHERE (they enter only future removable-prose comparison lines). Ground field the DERIVED `Cut`,
  NOT Mathlib-ℝ. NO `Real.*` as content, NO kernel-compiled decisions, NO floats, NO sorry, NO posited
  axiom. Import guard: NEVER `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate is
  a DETERMINED WAY-POINT (LeadingCarrierExhausted) that resumes AFTER this absolute-scale skeleton
  exists — the leading carrier is determined; the residual to measured is sub-leading structure the
  dimensionful skeleton (this arc) supplies.
-/
import Phys.Algebra.ConfinementHadronicMass
import Phys.Algebra.AbsoluteMassSpectrum
import Mathlib.Tactic

namespace Phys.Algebra.Peg

open Phys.Algebra Phys.Algebra.AbsMass Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE ONE FLAGGED UNIT PEG — the single dimensionful convention. -/

/-- ★ THE ONE UNIT PEG (SEED_MASSES §M1) — the chain's SINGLE dimensionful convention, declared once
    and flagged. `val` is a positive derived `Cut`: the value assigned, in the human unit, to the
    arena's natural closure unit `M_oct := 1`. This is the G2-clean analogue of choosing the metre —
    NOT a physics posit, NOT a fit. Every dimensionful reading downstream is `p.human` of a banked
    derived ratio; a SECOND `UnitPeg` anywhere is redundant by `peg_unique_up_to_units` — THE ONE-PEG
    LAW. Deleting the physics prose leaves: a positive element of the derived ordered field. -/
structure UnitPeg where
  /-- The human-unit value of the natural closure unit `M_oct := 1`. Positive derived `Cut`. -/
  val : Cut
  /-- The peg is a genuine positive scale (a unit has positive magnitude). -/
  pos : 0 < val

/-- THE HUMAN VALUE of a chain quantity `x` (a derived `Cut` ratio to `M_oct := 1`) under peg `p`:
    multiply the dimensionless ratio by the peg. Every downstream dimensionful numeral is `p.human`
    of a banked derived closed form. -/
def UnitPeg.human (p : UnitPeg) (x : Cut) : Cut := p.val * x

/-- THE PEG IS THE HUMAN VALUE OF `M_oct`: since `M_oct := 1`, `p.human 1 = p.val`. This is the
    metre-choice made explicit — the peg is exactly "how many human units is one closure scale". -/
theorem peg_fixes_Moct (p : UnitPeg) : p.human 1 = p.val := by
  unfold UnitPeg.human; rw [mul_one]

/-- Human values of positive scales are positive under any peg (`0 < x ⇒ 0 < p.human x`). -/
theorem human_scale_pos (p : UnitPeg) {x : Cut} (hx : 0 < x) : 0 < p.human x :=
  mul_pos p.pos hx

/-! ## (2) THE PEG CANCELS IN EVERY RATIO — nothing dimensionless moves. -/

/-- ★ RATIO IS PEG-INVARIANT: the peg CANCELS in every dimensionless ratio, unconditionally —
    `p.human x / p.human y = x / y`. The dimensionful convention has ZERO effect on any quotient. -/
theorem ratio_peg_invariant (p : UnitPeg) (x y : Cut) : p.human x / p.human y = x / y := by
  unfold UnitPeg.human
  exact mul_div_mul_left x y (ne_of_gt p.pos)

/-- ★ EVERY RATIO IS PEG-INDEPENDENT: any two pegs give the SAME value for every dimensionless ratio.
    So no dimensionless prediction of the chain depends on the choice of unit. -/
theorem ratio_peg_independent (p q : UnitPeg) (x y : Cut) :
    p.human x / p.human y = q.human x / q.human y := by
  rw [ratio_peg_invariant, ratio_peg_invariant]

/-! ## (3) ★ THE UNIQUE-UP-TO-UNITS THEOREM — the load-bearing content of M1. -/

/-- ★★ UNIQUE UP TO UNITS (THE M1 THEOREM): any two pegs differ by a SINGLE global positive constant
    `c = q.val/p.val`, the SAME for every quantity `x` (`q.human x = c · p.human x`), and NOTHING else
    moves. The chain therefore has exactly ONE degree of unit-freedom; re-pegging is a pure global
    rescale. This is why the ONE-PEG LAW is sound: a second convention is not new physics, only a
    rescaling of the one peg. -/
theorem peg_unique_up_to_units (p q : UnitPeg) :
    ∃ c : Cut, 0 < c ∧ ∀ x, q.human x = c * p.human x := by
  refine ⟨q.val / p.val, div_pos q.pos p.pos, ?_⟩
  intro x
  unfold UnitPeg.human
  have hp : p.val ≠ 0 := ne_of_gt p.pos
  field_simp

/-- THE GLOBAL RESCALE CONSTANT IS UNIQUE: if `c` uniformly relates `q.human` to `p.human`, then
    `c = q.val/p.val`. So "any two pegs differ by a global rescale" pins that rescale exactly. -/
theorem peg_rescale_unique (p q : UnitPeg) (c : Cut)
    (h : ∀ x, q.human x = c * p.human x) : c = q.val / p.val := by
  have h1 := h 1
  unfold UnitPeg.human at h1
  rw [mul_one, mul_one] at h1
  rw [h1, mul_div_assoc, div_self (ne_of_gt p.pos), mul_one]

/-! ## (4) THE BANKED SCALE-TOWER RATIOS ARE PEG-FREE — grounding on the M-scale tower. -/

/-- THE CONFINEMENT/ELECTROWEAK SCALE RATIO `Λ/v` IS PEG-FREE: `p.human Λ/p.human v = Λ/v`, the banked
    ratio `confinementScaleRatio/ewClosureRatio` (both banked M-scale-tower rungs). The scale-tower
    ratios are pure predictions, independent of the unit peg. -/
theorem tower_ratio_peg_invariant (p : UnitPeg) :
    p.human confinementScaleRatio / p.human ewClosureRatio
      = confinementScaleRatio / ewClosureRatio :=
  ratio_peg_invariant p _ _

/-- THE BANKED LEPTON MASS RATIO IS PEG-FREE: `absMass1/absMass0 = mass1/mass0` (N340), the peg
    cancels the derived scale `massScale`. The M2 lepton-mass numerals will be peg-free ratios; the
    peg only sets the overall dimensionful magnitude. -/
theorem absMass_ratio_peg_invariant (p : UnitPeg) :
    p.human absMass1 / p.human absMass0 = mass1 / mass0 := by
  rw [ratio_peg_invariant]
  unfold absMass1 absMass0
  exact mul_div_mul_left mass1 mass0 (ne_of_gt massScale_pos)

/-! ## (5) NON-VACUITY (W8) — the peg genuinely MOVES absolute values. -/

/-- ★ NON-VACUITY (W8): the peg GENUINELY moves a dimensionful (absolute) value — there exist pegs
    `p ≠ q` with `p.human absMass0 ≠ q.human absMass0`. So the unit convention is not vacuous: it acts
    on the absolute masses (while `ratio_peg_invariant` shows it does NOT act on ratios). Together
    these two facts ARE the M1 content: the peg touches magnitudes and nothing else. -/
theorem human_peg_dependent : ∃ p q : UnitPeg, p.human absMass0 ≠ q.human absMass0 := by
  refine ⟨⟨1, one_pos⟩, ⟨2, by norm_num⟩, ?_⟩
  unfold UnitPeg.human
  simp only
  intro h
  nlinarith [h, absMass0_pos]

/-! ## (6) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M1 LANDING — the ONE unit peg with the unique-up-to-units theorem, welded:
    (1) the peg fixes the human value of `M_oct`;
    (2) every dimensionless ratio is peg-invariant (unconditional);
    (3) any two pegs differ by a single global positive rescale (uniqueness);
    (4) the banked lepton mass ratio is peg-free (grounding on N340 × N417);
    (5) the peg genuinely moves absolute values (non-vacuity).
    Statable from no single conjunct alone (non-hollow). -/
theorem unitPeg_landing :
    (∀ p : UnitPeg, p.human 1 = p.val)
    ∧ (∀ (p : UnitPeg) (x y : Cut), p.human x / p.human y = x / y)
    ∧ (∀ p q : UnitPeg, ∃ c : Cut, 0 < c ∧ ∀ x, q.human x = c * p.human x)
    ∧ (∀ p : UnitPeg, p.human absMass1 / p.human absMass0 = mass1 / mass0)
    ∧ (∃ p q : UnitPeg, p.human absMass0 ≠ q.human absMass0) :=
  ⟨peg_fixes_Moct, ratio_peg_invariant, peg_unique_up_to_units,
   absMass_ratio_peg_invariant, human_peg_dependent⟩

end

end Phys.Algebra.Peg
