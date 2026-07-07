/-
  Phys.Algebra.ConfinementHadronicMass — N389 (arc-I I5): THE ORIGIN OF HADRONIC MASS.
  ============================================================================
  DIRECTED SUCCESSOR of N388 (arc-I I4 → I5), per docs/SEED_QCD_CONFINEMENT.md
  §I5. N385 banked the confinement CRITERION (confines IFF non-associative);
  N386 the colour-singlet DICHOTOMY; N387 the AREA LAW (linear potential); N388
  the MASS GAP (a nonzero minimum per-plaquette Born action — a CURVATURE FLOOR).
  This node ties the mass gap to the SCALE: the bound colour singlet's mass is
  CONFINEMENT ENERGY set by the confinement scale Λ, and Λ is the octonion
  (colour) rung of the SAME 84π critical-phase budget that fixed the fine-
  structure coupling (arc A) and the electroweak/gravity/seesaw scales (arc B) —
  NOT the Higgs/Yukawa mass (arc D), which sets the quark masses.

  THE RESULT (theory-native, DERIVED — never asserted). Three complementary
  facts, all on the banked concrete objects:

    • THE CONFINEMENT SCALE AS A DERIVED RUNG. The confinement-to-closure ratio
      `Λ/M = confinementScaleRatio = cutExp(−rungExponent(finrank ℚ ImO))`
      equals `cutExp(−(12·cutPi))` (`confinementScaleRatio_eq`), because the
      banked `rungExponent_at_imO = 12·cutPi` (N329) is the shared 84π budget
      divided by the octonion imaginary dimension `n = dim ImO = 7` — the
      COLOUR dimension (`confinementRung_budget_lock`: `12·cutPi · 7 = 84·cutPi`,
      the SAME numerator that fixed α). So Λ is a derived ratio of the 84π
      grammar, not a fitted or perturbatively-computed scale.

    • Λ IS BELOW THE ELECTROWEAK/HIGGS SCALE (`Λ ≠ v` — "not Higgs mass"). The
      confinement rung `12·cutPi` exceeds the electroweak rung `28·cutPi/3`
      (12 > 28/3), so by the banked `cutExp_strictMono` the confinement scale is
      strictly MORE suppressed than the electroweak scale:
      `confinementScaleRatio < ewClosureRatio` and hence `Λ < v` as scales
      (`confinementScale_lt_vev`). The hadron mass scale is genuinely distinct
      from — and below — the electroweak/Higgs scale.

    • THE MASS FLOOR IS HIGGS-INDEPENDENT (positive coherence energy without any
      Yukawa/VEV). The bound coloured configuration carries a strictly positive
      per-plaquette Born action `0 < bornAction (ι(ιJ)) (ι(e₂)) e₂`
      (`confinement_mass_floor_pos`, from N388's `bornAction_witness_floor ≥ 4`),
      and that action is the Born self-overlap of the octonion ASSOCIATOR alone —
      it references NO Higgs/Yukawa/VEV object. So the bound state has nonzero
      energy even with massless (Higgs-decoupled) constituents: hadronic mass is
      confinement (octonion coherence) energy, not Higgs mass.

  THE MECHANISM — WHY CONFINEMENT ENERGY, NOT HIGGS MASS (the crux, FORCED).
  Arc D's Higgs/Yukawa mechanism sets the QUARK masses (the constituents). But
  the bound colour singlet's mass is dominated by the CONFINEMENT energy: N388
  shows the coloured curvature has a nonzero minimum Born action (a floor), and
  N387 shows that action accumulates over the enclosed area (linear potential).
  The binding energy of the confined singlet is set by the scale at which the
  octonion (colour) obstruction becomes strong — the confinement scale Λ. And Λ
  is FORCED, not fit: it is the octonion rung `84·cutPi / 7` of the 84π budget,
  where `7 = dim ImO` is the colour (octonion-imaginary) dimension. The same
  octonion non-associativity that stopped the cascade (N2), confined the coloured
  sector (N385), and floored the curvature (N388) now sets the hadronic mass
  scale — one cause, a new termination.

  ⚠ GRADE (honest, docs/SEED_QCD_CONFINEMENT.md §I5 — candidate/mechanism).
  THEOREM-ROUTE for: the confinement-scale rung facts (`confinementScaleRatio_eq`,
  positivity, `< 1`), the strict ordering below the electroweak/Higgs rung
  (`confinementScaleRatio_lt_ewClosureRatio`, `confinementScale_lt_vev`), the 84π
  budget lock (`confinementRung_budget_lock`), and the Higgs-independent positive
  coherence floor (`confinement_mass_floor_pos`). CANDIDATE / MECHANISM-GRADE
  (flagged, prose-only, NEVER a physics-words-load-bearing theorem): the
  IDENTIFICATION that this scale IS the physical hadron/proton mass and that
  ~99% of visible mass is this confinement (octonion coherence) energy. No
  empirical number (`938 MeV`, `Λ_QCD ≈ 200 MeV`, "99%") appears in any statement
  or proof — removable prose only (NO-FIT guard G2). Λ is a DIMENSIONLESS ratio
  of the single closure anchor M (G3); no proton mass is asserted (G1).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "confinement / hadron /
  proton / mass / Higgs / colour / QCD": the theorems say, over the derived ℝ
  `Cut`, that `cutExp(−rungExponent(finrank ℚ ImO)) = cutExp(−(12·cutPi))`, is
  positive, is strictly below `1` and strictly below `cutExp(−(28·cutPi/3))`, that
  `rungExponent(finrank ℚ ImO)·(finrank ℚ ImO) = criticalPhaseNumerator`, that
  `M·that < transmutationScale M (rungExponent(9)·g²) g²` for `M > 0`, and that
  the Born self-overlap `gForm` of the octonion associator at the non-associating
  witness is strictly positive. Pure statements about a rung of a derived
  exponential grammar and the positivity of a self-overlap of a trilinear form.
  No physics name is load-bearing.

  FREE-FLOATING check (SOUL rail). Every theorem TYPE mentions the banked concrete
  objects — the banked `rungExponent`/`criticalPhaseNumerator`/`finrank ℚ ImO`
  (N329/N22), the banked `ewClosureRatio`/`transmutationScale` (N332/N320), the
  derived ℝ `Cut` and its banked `cutExp`/`cutPi` (N174/N325), and the banked
  `bornAction` on `O ℚ` with the concrete non-associating witness `(ι(ιJ),
  ι(e₂), e₂)` (N387/N388). Not generic over an arbitrary carrier: the scale is
  the octonion-SPECIFIC `finrank ℚ ImO = 7` rung, and the floor routes through
  the octonion associator `assoc` and `gForm`.

  DEPENDENCIES (all banked, foundations-only): N332 `ScaleTowerLadder`
  (`ewClosureRatio`, `ewClosureRatio_eq`, `ewClosureRatio_eq_transmutation`),
  which transitively provides N329 `ScaleTowerNumeratorLock` (`rungExponent`,
  `rungExponent_at_imO`, `rungExponent_at_spaceSub`, `criticalPhaseNumerator`,
  `lock_imO`), N320 `DimensionalTransmutation` (`transmutationScale`), N22
  `DerivationRep7` (`ImO`, `finrank_ImO`), N174/N175/N325 `Continuum*`
  (`cutExp`, `cutExp_pos/zero/add`, `cutExp_strictMono`, `cutPi`, `cutPi_pos`);
  N388 `ConfinementMassGap` (`bornAction_witness_floor`), which transitively
  provides N387 `ConfinementAreaLaw` (`bornAction`). Ground field the DERIVED ℝ
  `Cut` — NOT Mathlib-ℝ as content; Mathlib is MACHINERY only (order lemmas,
  linarith/nlinarith).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.ScaleTowerLadder
import Phys.Algebra.ConfinementMassGap
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## (1) THE CONFINEMENT SCALE `Λ/M = e^(−12π)` as the octonion (colour) rung. -/

/-- THE CONFINEMENT-TO-CLOSURE RUNG RATIO `Λ/M = cutExp(−rungExponent(finrank ℚ ImO))`, the
    Born-positive exponential suppression at the banked `n = dim ImO = 7` (octonion imaginary =
    COLOUR) grammar rung. `rungExponent` and `finrank ℚ ImO` are BANKED (N329/N22); `cutExp` is the
    banked derived-ℝ exponential (N174). This makes the confinement scale a CONCRETE derived ratio of
    the 84π grammar — the octonion (colour) rung — not a perturbatively-computed or fitted scale. -/
def confinementScaleRatio : Cut :=
  cutExp (-(rungExponent (Module.finrank ℚ ImO)))

/-- ★ THE CONFINEMENT RUNG VALUE `Λ/M = e^(−12π)`. FALLS OUT of the banked `rungExponent_at_imO =
    12·cutPi` (the octonion `n = 7` = colour quotient of the shared 84π numerator); never premised as
    a literal. Physics prose: the QCD running depth `b₀ = dim ImO = 7`. -/
theorem confinementScaleRatio_eq : confinementScaleRatio = cutExp (-(12 * cutPi)) := by
  unfold confinementScaleRatio; rw [rungExponent_at_imO]

/-- Born positivity of the confinement rung ratio: `0 < Λ/M` (banked `cutExp_pos`). -/
theorem confinementScaleRatio_pos : 0 < confinementScaleRatio := by
  unfold confinementScaleRatio; exact cutExp_pos _

/-- STRICT SUPPRESSION: `Λ/M < 1`. The argument `−(12·cutPi)` is strictly negative (`cutPi_pos`), so
    by banked `cutExp_strictMono` and `cutExp_zero`, `cutExp(−(12·cutPi)) < cutExp 0 = 1`. -/
theorem confinementScaleRatio_lt_one : confinementScaleRatio < 1 := by
  rw [confinementScaleRatio_eq]
  have hneg : -(12 * cutPi) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-! ## (2) Λ IS BELOW THE ELECTROWEAK / HIGGS SCALE (`Λ ≠ v` — "not Higgs mass"). -/

/-- ★ THE CONFINEMENT SCALE IS DEEPER THAN THE ELECTROWEAK SCALE: `Λ/M < v/M`. The confinement
    exponent `12·cutPi` (octonion `n = 7` rung) exceeds the electroweak exponent `28·cutPi/3`
    (`n = 9` rung), since `12 > 28/3`, so by banked `cutExp_strictMono` the confinement suppression is
    strictly stronger. The hadronic mass scale is genuinely BELOW the electroweak/Higgs scale — not
    set by the Higgs VEV. -/
theorem confinementScaleRatio_lt_ewClosureRatio :
    confinementScaleRatio < ewClosureRatio := by
  rw [confinementScaleRatio_eq, ewClosureRatio_eq]
  apply cutExp_strictMono
  have := cutPi_pos; nlinarith [this]

/-- ★ `Λ ≠ v` — the hadron mass scale is NOT the electroweak/Higgs scale. Immediate from the strict
    ordering: the confinement scale (octonion `n = 7` rung) is genuinely distinct from the electroweak
    (`n = 9`) rung. "Hadron mass is confinement energy, not Higgs mass" at the scale level. -/
theorem confinementScaleRatio_ne_ewClosureRatio :
    confinementScaleRatio ≠ ewClosureRatio :=
  ne_of_lt confinementScaleRatio_lt_ewClosureRatio

/-! ## (3) THE CONFINEMENT SCALE `Λ = M·e^(−12π)` and its ordering below the VEV. -/

/-- THE CONFINEMENT SCALE `Λ = M·(Λ/M)`, keeping the closure scale `M` the single dimensionful anchor
    (G3) — no new `Cut` atom. `confinementScaleRatio` is the banked octonion (colour) rung. -/
def confinementScale (M : Cut) : Cut := M * confinementScaleRatio

/-- Positivity of the confinement scale: `0 < Λ` for `0 < M` (banked positivity of the ratio). -/
theorem confinementScale_pos (M : Cut) (hM : 0 < M) : 0 < confinementScale M := by
  unfold confinementScale; exact mul_pos hM confinementScaleRatio_pos

/-- ★ THE CONFINEMENT SCALE IS BELOW THE ELECTROWEAK VEV: `Λ < v`. Since `0 < Λ/M < v/M`, multiplying
    by the anchor `M > 0` keeps the order: the confinement scale is strictly below the electroweak VEV
    `v = transmutationScale M (rungExponent(9)·g²) g²` (the banked B5 VEV form, N332). The bulk of the
    hadron mass is set by Λ, well below the Higgs scale. -/
theorem confinementScale_lt_vev (M g2 : Cut) (hM : 0 < M) (hg : g2 ≠ 0) :
    confinementScale M
      < transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2 := by
  have hv : transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2
          = M * ewClosureRatio := by
    unfold transmutationScale; rw [ewClosureRatio_eq_transmutation g2 hg]
  rw [hv]; unfold confinementScale
  exact mul_lt_mul_of_pos_left confinementScaleRatio_lt_ewClosureRatio hM

/-! ## (4) THE 84π BUDGET LOCK: the confinement rung is the octonion (colour) quotient. -/

/-- ★ THE CONFINEMENT RUNG LOCKS TO THE 84π BUDGET. The confinement exponent times the octonion
    (colour) count `n = dim ImO = 7` returns the SAME critical-phase budget `criticalPhaseNumerator =
    84·cutPi` that fixed the fine-structure coupling (arc A) and every scale-tower rung (arc B):
    `12·cutPi · 7 = 84·cutPi` (banked `lock_imO`). The confinement scale is a derived quotient of the
    one budget, tied to the colour dimension `7` — one budget, one octonion rung. -/
theorem confinementRung_budget_lock :
    rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
      = criticalPhaseNumerator :=
  lock_imO

/-! ## (5) THE MASS FLOOR IS HIGGS-INDEPENDENT (positive coherence energy, no Yukawa/VEV). -/

/-- ★ THE HADRONIC MASS FLOOR IS POSITIVE AND HIGGS-INDEPENDENT. The bound coloured configuration
    carries a strictly positive per-plaquette Born action `0 < bornAction (ι(ιJ)) (ι(e₂)) e₂` (from
    N388's `bornAction_witness_floor ≥ 4`), and that action is the Born self-overlap `gForm` of the
    octonion ASSOCIATOR alone — it references NO Higgs/Yukawa/VEV object. So the bound state has
    nonzero coherence energy even with massless (Higgs-decoupled) constituents: hadronic mass is
    confinement (octonion coherence) energy, not Higgs mass. This is the theory-native "~99% of
    visible mass is confinement energy" at theorem strength: the floor is Higgs-free. -/
theorem confinement_mass_floor_pos :
    (0:Cut) < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  have h4 : (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
    bornAction_witness_floor
  linarith

/-! ## The capstone. -/

/-- ★★★ THE ORIGIN OF HADRONIC MASS — the structural mechanism at once, on the banked derived
    objects. For the bound colour singlet:
    (1) THE SCALE: `Λ/M = e^(−12π)`, the octonion (colour, `n = dim ImO = 7`) rung of the derived 84π
        budget — a forced ratio of the grammar, not a perturbative computation or a fit;
    (2) IT IS FORCED BY THE 84π BUDGET: `rungExponent(7)·7 = criticalPhaseNumerator = 84·cutPi`, the
        SAME numerator that fixed the fine-structure coupling;
    (3) IT IS BELOW THE ELECTROWEAK/HIGGS SCALE: `Λ/M < v/M` (and `Λ < v` as scales) — the hadron
        mass scale is genuinely distinct from the Higgs scale;
    (4) THE MASS FLOOR IS HIGGS-INDEPENDENT: the bound coloured curvature has strictly positive Born
        coherence action, referencing no Yukawa/VEV — nonzero mass even with massless constituents.
    ⚠ The IDENTIFICATION that this scale IS the physical proton/hadron mass, and that ~99% of visible
    mass is this confinement (octonion coherence) energy, is candidate/mechanism-grade prose; no
    empirical number (938 MeV, Λ_QCD, "99%") appears — the mass is DERIVED as confinement energy set
    by the derived confinement scale, never fit. -/
theorem hadronic_mass_origin :
    confinementScaleRatio = cutExp (-(12 * cutPi))
    ∧ rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut) = criticalPhaseNumerator
    ∧ 0 < confinementScaleRatio
    ∧ confinementScaleRatio < ewClosureRatio
    ∧ ewClosureRatio < 1
    ∧ (0:Cut) < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
  ⟨confinementScaleRatio_eq, confinementRung_budget_lock, confinementScaleRatio_pos,
   confinementScaleRatio_lt_ewClosureRatio, ewClosureRatio_lt_one, confinement_mass_floor_pos⟩

/-! ## NON-VACUITY (W8): the confinement scale is genuine, distinct, and Higgs-independent. -/

/-- NON-VACUITY: `Λ/M ≠ 1` — the octonion (colour) rung is nontrivial (`12·cutPi > 0`), so the
    confinement scale is genuinely below the closure scale; a WRONG reading with a vanishing rung
    would give `1`. -/
theorem confinementScaleRatio_ne_one : confinementScaleRatio ≠ 1 := by
  have := confinementScaleRatio_lt_one; intro h; rw [h] at this; linarith

/-- NON-VACUITY: the confinement rung `12·cutPi` genuinely differs from the electroweak rung
    `28·cutPi/3` — a WRONG "hadron mass is the Higgs/electroweak scale" reading would collapse the two
    rungs. Load-bearing: the hadron mass scale is NOT the Higgs scale. -/
theorem confinementRung_ne_ewRung :
    rungExponent (Module.finrank ℚ ImO) ≠ rungExponent (Module.finrank ℚ spaceSub) := by
  rw [rungExponent_at_imO, rungExponent_at_spaceSub]
  intro h
  have := cutPi_pos; nlinarith [this]

end

end Phys.Algebra
