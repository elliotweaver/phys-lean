/-
  Phys.Algebra.BaryogenesisAsymmetry — N381 (arc-H H3, per docs/SEED_COSMOLOGY_COMPLETION.md §H3).
  ============================================================================================
  THE MATTER-ANTIMATTER ASYMMETRY `η_B` — the three Sakharov conditions as THREE BANKED FOLD
  OBSTRUCTIONS, composed. DIRECTED SINGLE SUCCESSOR of N380 (arc-H H2, inflation slow-roll).

  ---------------------------------------------------------------------------
  THE STANDARD PROBLEM (dissolved here). Sakharov's three conditions for a baryon asymmetry —
  (1) baryon-number violation, (2) C and CP violation, (3) departure from thermal equilibrium —
  are, in the Standard Model, three INDEPENDENT requirements that a baryogenesis MODEL must be
  engineered to satisfy (leptogenesis, electroweak baryogenesis, …), each with a fitted scale
  (a reheating temperature, a washout rate). The observed `η_B ≈ 6×10⁻¹⁰` is then reproduced by
  tuning those scales.

  WHAT THE THEORY DOES (the three conditions are ONE fold, read three ways). Each Sakharov
  condition is NOT a model requirement to be arranged — it is an OBSTRUCTION already forced by the
  fold and already banked:

    • (1) BARYON-NUMBER VIOLATION — the colour exterior ladder's charge conjugation is the Hodge
      complement `S ↦ Sᶜ`; the B−L-type charge is complement-ODD (conserved), and the
      complement-EVEN (B+L) channel is where baryon number changes, quantized in units of the
      DERIVED generation count: `baryonShift (finrank ℚ Uhol) k = 3 k` (N366/N368). The B-violating
      rate factor is `bViolationRate k = (baryonShift (finrank ℚ Uhol) k : Cut) = 3 k`.

    • (2) CP VIOLATION — the fold's cascade-STOP is the octonion non-associativity; its
      G₂-invariant imaginary associator 3-form `assoc3` is NONZERO, `assoc3 u2 u1 (octCross u1 u2)
      = −1` (N209/N367 — the SAME associator that pins strong-CP `θ̄ = 0` in the real channel while
      leaving `J ≠ 0` in the imaginary channel). The CP source factor is
      `cpSource = (assoc3 u2 u1 (octCross u1 u2) : Cut) = −1` — a DEFINITE, nonzero value, not a
      tunable phase.

    • (3) DEPARTURE FROM EQUILIBRIUM — C6: the fold's coherence flow is never at a fixed point.
      At the state level (N375) a same-budget deviation from the maxent equilibrium carries a
      STRICTLY POSITIVE self-datum `relInfo p q > 0` (the arrow of time). The out-of-equilibrium
      factor is `nonEqMeasure p q = relInfo p q ≥ 0`, `= 0` iff `p = q` (equilibrium).

  THE ASYMMETRY is the PRODUCT of the three fold obstructions:
      `baryonAsymmetry k p q = bViolationRate k · cpSource · nonEqMeasure p q`.

  Because it is a product, it is ZERO if ANY factor is zero (Sakharov NECESSITY, derived as a
  contrapositive `sakharov_necessity`) — no B-violation (`k = 0`), no CP source, or equilibrium
  (`p = q`) each kills it. With all three present (`k = 1`, the concrete off-equilibrium witness
  `pWit ≠ qWit`) it is nonzero AND DEFINITE-SIGNED: `baryonAsymmetry 1 pWit qWit = −3·relInfo < 0`
  (the negative CP value −1 times the positive B-rate 3 times the positive self-datum). A
  definite, non-cancelling sign is the mechanism content: matter and antimatter are produced at
  DIFFERENT rates, so a net excess of one survives — there is no fine-tuning, the sign is fixed by
  the banked associator's value and the positivity of the self-datum.

  ---------------------------------------------------------------------------
  HONEST GRADE (carry it, do NOT over-claim). MECHANISM / CANDIDATE (SEED §H3, like the Jarlskog).
    • THEOREM-GRADE (forced math, foundations-only over ℤ / ℚ / the derived ℝ `Cut`): the three
      factor values (`3 k`, `−1`, `relInfo`), each factor's (non)vanishing, the Sakharov NECESSITY
      (product zero if any factor zero), the equilibrium/no-violation vanishing, the concrete
      witness's nonzeroness and DEFINITE (negative) SIGN, the linear-in-`nonEqMeasure` suppression
      (→ 0 at equilibrium), and the W8 off-equilibrium ≠ equilibrium teeth.
    • MECHANISM identification (FLAGGED PROSE, never a Lean equation): the definite sign = a net
      matter excess; the three factors = the three Sakharov conditions; `cpSource` = the physical
      CP source, `bViolationRate` = the physical B-violation quantum, `nonEqMeasure` = the physical
      departure from equilibrium. The ORDER of magnitude / the precise `η_B` needs the reheating and
      sphaleron-freeze-out SCALES (route-not-yet-found at the scale level, a BUILD target, flagged).
    • NO FIT: the measured `η_B ≈ 6×10⁻¹⁰` is REMOVABLE PROSE only — it appears in NO proof.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "baryon / lepton / CP / Sakharov / asymmetry /
  equilibrium / matter / antimatter": what remains is — over the derived ℝ `Cut`, the product of
  three banked quantities `((baryonShift (finrank ℚ Uhol) k : ℤ) : Cut) = 3 k`, `((assoc3 …) : ℚ)
  : Cut) = −1`, and `relInfo p q` is `3 k · (−1) · relInfo p q`; it is `0` if any factor is `0`; at
  `k = 1`, `p = pWit`, `q = qWit` it equals `−3·relInfo pWit qWit`, which is `< 0` because
  `relInfo pWit qWit > 0`. Pure `Cut`-arithmetic over three banked objects; no name is load-bearing.

  ⚠ FREE-FLOATING RAIL (SOUL): every headline TYPE mentions the banked derived objects —
  `baryonShift`/`Module.finrank ℚ Uhol` (N368), `assoc3`/`u1`/`u2`/`octCross` (N209), `relInfo`/
  `pWit`/`qWit` (N375) — and the derived ℝ `Cut`. NOT a generic "product of three nonzero reals"
  abstraction. G1: the factor values FALL OUT of the banked `baryon_violation_quantum`,
  `assoc3_witness`, and `relInfo_self`/`maxent_deviation_pos` — never premised. G2: NO empirical
  number in any proof. ⚠ ℝ-VIGILANCE (UNEARNED-IMPORT): the ground is the BANKED derived ℝ `Cut`
  (via `Phys.Foundation.ContinuumLog`, transitively from N375's `MaxEntArrowOfTime`); ℤ/ℚ are the
  banked derived rings; `Int.cast`/`Rat.cast` into `Cut` are standard Mathlib MACHINERY on the
  derived object; NO Mathlib `Real` analysis / number-system as content.

  UNBROKEN: `baryonShift`/`baryon_violation_quantum`/`Uhol` (N368), `assoc3`/`assoc3_witness`/
  `u1`/`u2`/`octCross` (N209), `relInfo`/`relInfo_self`/`pWit`/`qWit`/`maxent_deviation_pos` (N375),
  all over the banked derived ℝ `Cut`. Nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Algebra.StrongCPTheta
import Phys.Algebra.MaxEntArrowOfTime
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

/-! ## §1 — THE THREE SAKHAROV FACTORS, each a banked fold obstruction cast to the derived ℝ. -/

/-- SAKHAROV (1) — THE BARYON-NUMBER-VIOLATION FACTOR: the complement-EVEN (B+L) channel's
    baryon-number shift of one gauge-universal topological transition, quantized in units of the
    DERIVED generation count `finrank ℚ Uhol`, cast to the derived ℝ. (N366/N368.) -/
def bViolationRate (k : ℤ) : Cut := ((baryonShift (Module.finrank ℚ Uhol) k : ℤ) : Cut)

/-- The B-violation factor is `3 k` (the derived generation count is `3`). -/
theorem bViolationRate_eq (k : ℤ) : bViolationRate k = ((3 * k : ℤ) : Cut) := by
  unfold bViolationRate; rw [baryon_violation_quantum]

/-- One transition (`k = 1`) shifts baryon number by the generation count: `bViolationRate 1 = 3`. -/
theorem bViolationRate_one : bViolationRate 1 = 3 := by
  rw [bViolationRate_eq]; push_cast; ring

/-- No transition (`k = 0`) violates baryon number: `bViolationRate 0 = 0`. -/
theorem bViolationRate_zero : bViolationRate 0 = 0 := by
  rw [bViolationRate_eq]; push_cast; ring

/-- The B-violation factor is nonzero for any nonzero winding `k`. -/
theorem bViolationRate_ne_zero {k : ℤ} (hk : k ≠ 0) : bViolationRate k ≠ 0 := by
  rw [bViolationRate_eq]
  have : (3 * k : ℤ) ≠ 0 := by intro h; apply hk; omega
  exact_mod_cast this

/-- SAKHAROV (2) — THE CP-VIOLATION SOURCE FACTOR: the fold's cascade-stop associator 3-form
    `assoc3` on the imaginary witnesses (N209/N367), cast to the derived ℝ. -/
def cpSource : Cut := ((assoc3 u2 u1 (octCross u1 u2) : ℚ) : Cut)

/-- The CP source has the DEFINITE nonzero value `−1` (banked `assoc3_witness`, N209). It is not a
    tunable phase — the fold's own non-associativity fixes it. -/
theorem cpSource_eq : cpSource = -1 := by
  unfold cpSource; rw [assoc3_witness]; push_cast; ring

/-- The CP source is nonzero. -/
theorem cpSource_ne_zero : cpSource ≠ 0 := by rw [cpSource_eq]; norm_num

/-- The CP source is strictly NEGATIVE — a definite sign, load-bearing for the net-excess sign. -/
theorem cpSource_neg : cpSource < 0 := by rw [cpSource_eq]; norm_num

/-- SAKHAROV (3) — THE OUT-OF-EQUILIBRIUM FACTOR: the state-level self-datum `relInfo p q` of a
    departure from the maxent equilibrium (N375). Zero exactly at equilibrium (`p = q`), strictly
    positive off it (C6, the arrow of time). -/
def nonEqMeasure {n : ℕ} (p q : Fin n → Cut) : Cut := relInfo p q

/-- The out-of-equilibrium factor vanishes at equilibrium: `nonEqMeasure q q = 0`. -/
theorem nonEqMeasure_equilibrium {n : ℕ} (q : Fin n → Cut) : nonEqMeasure q q = 0 := by
  unfold nonEqMeasure; exact relInfo_self q

/-! ## §2 — THE ASYMMETRY: the product of the three fold obstructions. -/

/-- ★ THE BARYON ASYMMETRY as the PRODUCT of the three Sakharov factors — the B-violation quantum,
    the CP source, and the out-of-equilibrium self-datum. Because it is a product it vanishes if
    ANY factor vanishes (Sakharov necessity) and inherits a DEFINITE sign from the factors. -/
def baryonAsymmetry {n : ℕ} (k : ℤ) (p q : Fin n → Cut) : Cut :=
  bViolationRate k * cpSource * nonEqMeasure p q

/-- ★★ SAKHAROV NECESSITY (all three conditions are required): a nonzero asymmetry FORCES all
    three factors to be nonzero — B-violation present, CP source present, AND out of equilibrium.
    The contrapositive of "a product with a zero factor is zero." This is the theory-native form of
    Sakharov's theorem: the three conditions are not independently posited requirements but the
    joint non-vanishing of one product of banked obstructions. -/
theorem sakharov_necessity {n : ℕ} (k : ℤ) (p q : Fin n → Cut)
    (h : baryonAsymmetry k p q ≠ 0) :
    bViolationRate k ≠ 0 ∧ cpSource ≠ 0 ∧ nonEqMeasure p q ≠ 0 := by
  unfold baryonAsymmetry at h
  refine ⟨?_, ?_, ?_⟩
  · intro hb; apply h; rw [hb]; ring
  · intro hc; apply h; rw [hc]; ring
  · intro hn; apply h; rw [hn]; ring

/-- ★ NO ASYMMETRY AT EQUILIBRIUM (Sakharov 3 is necessary): if the state is at the maxent
    equilibrium (`p = q`), the asymmetry vanishes. The eternal-approach (C6) departure from
    equilibrium is REQUIRED. -/
theorem asymmetry_zero_at_equilibrium {n : ℕ} (k : ℤ) (q : Fin n → Cut) :
    baryonAsymmetry k q q = 0 := by
  unfold baryonAsymmetry
  rw [nonEqMeasure_equilibrium]; ring

/-- ★ NO ASYMMETRY WITHOUT B-VIOLATION (Sakharov 1 is necessary): with no topological transition
    (`k = 0`) the asymmetry vanishes. -/
theorem asymmetry_zero_no_bviolation {n : ℕ} (p q : Fin n → Cut) :
    baryonAsymmetry 0 p q = 0 := by
  unfold baryonAsymmetry; rw [bViolationRate_zero]; ring

/-- THE ASYMMETRY IS LINEAR IN THE OUT-OF-EQUILIBRIUM MEASURE: `baryonAsymmetry k p q =
    (bViolationRate k · cpSource) · nonEqMeasure p q`. The asymmetry is proportional to the
    departure from equilibrium — it is SUPPRESSED as the state approaches equilibrium
    (`nonEqMeasure → 0`), the theory-native content of "the asymmetry freezes out as the expansion
    slows." -/
theorem asymmetry_linear_in_nonEq {n : ℕ} (k : ℤ) (p q : Fin n → Cut) :
    baryonAsymmetry k p q = (bViolationRate k * cpSource) * nonEqMeasure p q := by
  unfold baryonAsymmetry; ring

/-! ## §3 — THE WITNESS: all three present ⇒ nonzero AND definite-signed (net matter excess). -/

/-- The asymmetry at the concrete off-equilibrium witness (`k = 1`, `pWit ≠ qWit`, N375):
    `baryonAsymmetry 1 pWit qWit = −3 · relInfo pWit qWit`. The negative CP value times the
    positive B-rate times the positive self-datum. -/
theorem asymmetry_witness_eq : baryonAsymmetry 1 pWit qWit = -3 * relInfo pWit qWit := by
  unfold baryonAsymmetry nonEqMeasure
  rw [bViolationRate_one, cpSource_eq]; ring

/-- ★★ THE NET-EXCESS SIGN (the mechanism): with all three Sakharov factors present the asymmetry
    is strictly NEGATIVE — a DEFINITE, non-cancelling sign. Matter and antimatter are produced at
    different rates; a net excess of one survives. No fine-tuning: the sign is fixed by the banked
    associator value (`−1`) and the positivity of the out-of-equilibrium self-datum. -/
theorem asymmetry_witness_neg : baryonAsymmetry 1 pWit qWit < 0 := by
  rw [asymmetry_witness_eq]
  nlinarith [maxent_deviation_pos]

/-- ★ THE ASYMMETRY IS GENUINELY NONZERO with all three conditions present. -/
theorem asymmetry_witness_ne_zero : baryonAsymmetry 1 pWit qWit ≠ 0 :=
  ne_of_lt asymmetry_witness_neg

/-! ## §4 — THE CAPSTONE + W8 non-vacuity. -/

/-- ★★★ CAPSTONE — H3 baryogenesis: the matter-antimatter asymmetry as the product of the three
    banked fold obstructions (the three Sakharov conditions), bundled:

    (1) `bViolationRate k = 3 k` — the B+L complement-even channel's baryon shift (N366/N368);
    (2) `cpSource = −1` — the fold's cascade-stop associator, a DEFINITE nonzero CP source (N209);
    (3) `nonEqMeasure q q = 0` — the out-of-equilibrium self-datum vanishes at equilibrium (N375);
    (4) SAKHAROV NECESSITY — a nonzero asymmetry forces all three factors nonzero;
    (5) the concrete witness is nonzero and strictly NEGATIVE — a definite net-excess sign.

    ONE CAUSE (the fold: self-blindness → complement / cascade-stop / C6), THREE terminations that
    together force a nonzero, definite-signed asymmetry. MECHANISM / CANDIDATE grade: the mechanism
    and its SIGN are theorem-grade; the precise `η_B` needs the reheating / freeze-out SCALES
    (flagged, never fit). -/
theorem baryogenesis_asymmetry_structure :
    (∀ k : ℤ, bViolationRate k = ((3 * k : ℤ) : Cut)) ∧
    (cpSource = -1) ∧
    (∀ (n : ℕ) (q : Fin n → Cut), nonEqMeasure q q = 0) ∧
    (∀ (n : ℕ) (k : ℤ) (p q : Fin n → Cut), baryonAsymmetry k p q ≠ 0 →
        bViolationRate k ≠ 0 ∧ cpSource ≠ 0 ∧ nonEqMeasure p q ≠ 0) ∧
    (baryonAsymmetry 1 pWit qWit < 0) :=
  ⟨bViolationRate_eq, cpSource_eq, fun _ q => nonEqMeasure_equilibrium q,
   fun _ k p q h => sakharov_necessity k p q h, asymmetry_witness_neg⟩

/-- ★★ W8 NON-VACUITY: the asymmetry with all three conditions present GENUINELY DIFFERS from the
    equilibrium (all-conditions-but-out-of-equilibrium) case — `baryonAsymmetry 1 pWit qWit ≠
    baryonAsymmetry 1 qWit qWit`. The out-of-equilibrium condition is load-bearing: without it
    (at `p = q`) the asymmetry is zero; with it, it is nonzero. A "the asymmetry survives even at
    equilibrium / a Sakharov condition is dispensable" mis-reading is refuted. -/
theorem asymmetry_offeq_ne_eq :
    baryonAsymmetry 1 pWit qWit ≠ baryonAsymmetry 1 qWit qWit := by
  rw [asymmetry_zero_at_equilibrium]; exact asymmetry_witness_ne_zero

end

end Phys.Algebra
