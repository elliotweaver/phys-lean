/-
  # N468 — ARC-X (EXACT DRESSING) X9: THE QUARK / HADRON MASS SECTOR ON THE ONE COUPLING BAND TOWER
  ============================================================================================

  DIRECTED successor of N467 / X8 (`LeptonMassTower.lean`). The arc-X seed (docs/SEED_EXACT_DRESSING.md
  §X9) asks for "the absolute quark masses + any other forced constant along the way", each a real
  theorem traced to the fold, each honestly graded.

  ## THE NON-DUPLICATION CHECK (the X8 lesson — run in the PREREG, recorded here)
  The banked quark/hadron sector already holds the confinement SCALE `Λ/M = cutExp(−12π)` (the octonion
  colour `n = dim ImO = 7` rung), the ordering `Λ/M < v/M` and `Λ < v`, the 84π budget lock
  `rungExponent(7)·7 = 84·cutPi`, the Higgs-independent positive mass floor, and the mass-gap spectrum
  `gapSpectrum = ℕ` (X4). All of that is CITED here, never re-derived. The LEPTON Koide mass ratios
  (`GenerationMassRatiosNumeric`, N340) are the ONLY banked flavour-ratio content — there is NO banked
  QUARK-sector Yukawa texture. So the genuinely NEW, forced, theory-native X9 content — nowhere in the
  corpus (grep-verified) — is the confinement-sector analogue of the X8 lepton WELD: placing the
  confinement/hadron mass SCALE on the SAME finite coupling band tower assembled in X6/X8, at the SAME
  electroweak band edge `ewClosureRatio = topBandRatio⁻¹` the coupling and the lepton masses read.

  ## THE NEW JOINT (★ the confinement-sector weld)
  `confBundle := confinementScaleRatio · topBandRatio = (Λ/M)·(M/v) = Λ/v`, the confinement scale
  measured in the coupling tower's electroweak-edge units. It EQUALS the pure derived closed ratio
  `cutExp(−8·cutPi/3)` (`confBundle_eq` — the exact scale rung cancels against the shared edge, exactly
  as the lepton mass scale did in X8). The rung gap `12·cutPi − 28·cutPi/3 = 8·cutPi/3` is the
  colour/space quotient-difference of the ONE 84π budget (`84π·(1/7 − 1/9) = 8π/3`). The confinement
  scale then factors through the SAME edge: `confinementScaleRatio = ewClosureRatio · confBundle`
  (`confinement_eq_edge_bundle`) — the confinement scale IS the electroweak band edge × the confinement
  suppression bundle, the SAME edge the coupling reads `invAlphaZero [(chargeTraceDepth, topBandRatio)]
  = 1582/27` (`coupling_reading`, cited X6). ONE finite tower from the octonion ceiling; the coupling,
  the lepton masses, and the confinement scale are all readings at the SAME electroweak edge.

  THE MOAT: the SM treats α, the fermion masses, and Λ_QCD as unrelated inputs measured at unrelated
  scales; the theory forces all three from the ONE finite band tower at the SAME electroweak edge, as
  exact closed ratios of the octonion (colour/space) rung structure of the single 84π budget.

  ## HONEST GRADE (per piece — the point of arc X)
  - THEOREM-EXACT NOW: `confBundle = cutExp(−8π/3)` (Λ/v as an exact closed derived ratio), the
    edge factoring `confinementScaleRatio = ewClosureRatio·confBundle`, the strict suppression
    `confBundle < 1`, the rung-gap 84π-budget identity, the shared-edge coupling reading `1582/27`.
  - ANCHORED-ON-DERIVED-SCALE: the absolute confinement scale `Λ = M·cutExp(−12π)` (cited
    `ConfinementHadronicMass`); "hadron mass is confinement energy, Higgs-independent" (cited
    `hadronic_mass_origin`, candidate/mechanism prose).
  - ROUTE-NOT-YET-FOUND (enumerated for the X10 attestation, NEVER asserted / NEVER fitted): the
    individual current-quark Yukawa mass ratios / absolutes (there is NO banked quark texture — only
    the LEPTON Koide N340), and the physical MeV numeral of any scale (needs the M_oct → MeV unit
    choice). These are enumerated open sub-facts for the X10 attestation, not fabricated values.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5). Delete "confinement" / "hadron" / "quark" /
  "coupling" / "electroweak" / "mass": what remains is `cutExp(−12π)·cutExp(28π/3) = cutExp(−8π/3)`,
  `0 < cutExp(−8π/3) < 1`, `cutExp(−12π) = cutExp(−28π/3)·cutExp(−8π/3)`,
  `12·cutPi − 28·cutPi/3 = 8·cutPi/3`, and `invAlphaZero [(d, t)] = 1582/27` — pure real analysis on
  the derived ℝ `Cut`.

  Foundations-only: no posited axiom, no sorry, no kernel-compilation bypass, no heartbeat
  inflation, no Mathlib
  number system as content, no bridge. IMPORT GUARD: imports the banked `ConfinementHadronicMass` (the
  F-native confinement scale, foundations-only) and `FineStructureZeroMomentum` (X6) — NEVER
  `MassGapOne` (which carries `foldRetention`). No `foldRetention` reaches this coupling/scale content.

  NO EMPIRICAL NUMBER: the PDG quark masses, Λ_QCD ≈ 200 MeV, the measured α, the proton mass are
  REMOVABLE PROSE / costume only, NEVER a proof step (G2). NO FIT (G7).
-/
import Phys.Algebra.ConfinementHadronicMass
import Phys.Algebra.FineStructureZeroMomentum

namespace Phys.Algebra.QuarkHadronTower

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## (1) THE CONFINEMENT-SECTOR BUNDLE `Λ/v = confinementScaleRatio · topBandRatio`. -/

/-- ★ THE CONFINEMENT SUPPRESSION BUNDLE `Λ/v`: the banked confinement scale ratio `Λ/M =
    confinementScaleRatio` (arc I, colour `n=7` rung) times the SHARED coupling-tower edge unit
    `M/v = topBandRatio = ewClosureRatio⁻¹` (X6). This is the confinement-sector analogue of the X8
    lepton `leptonBundle = massScale · topBandRatio`: the confinement scale measured in the coupling
    tower's electroweak-edge units. -/
def confBundle : Cut := confinementScaleRatio * topBandRatio

/-- ★★★ THE WELD IDENTITY: the confinement scale in the coupling tower's electroweak-edge units is
    the pure DERIVED closed ratio `cutExp(−8·cutPi/3) = Λ/v`. The banked confinement rung
    `cutExp(−12π)` times the banked exact edge `cutExp(28π/3) = M/v` gives `cutExp(−12π + 28π/3) =
    cutExp(−8π/3)` — the shared edge cancels the scale rung down to the colour/space quotient gap.
    (`cutExp_add`, `confinementScaleRatio_eq`, `topBandRatio_eq`.) -/
theorem confBundle_eq : confBundle = cutExp (-(8 * cutPi / 3)) := by
  unfold confBundle
  rw [confinementScaleRatio_eq, topBandRatio_eq, cutExp_add]
  congr 1
  ring

/-- ★ THE RUNG GAP IS THE COLOUR/SPACE QUOTIENT-DIFFERENCE OF THE ONE 84π BUDGET: `12·cutPi −
    28·cutPi/3 = 8·cutPi/3`. Since `12π·7 = (28π/3)·9 = 84π` (banked triple lock), this gap is
    `84π·(1/7 − 1/9) = 84π·(2/63) = 8π/3`. The confinement bundle exponent is a forced quotient of
    the single critical-phase numerator, not an independent scale. -/
theorem rung_gap_eq : (12 * cutPi) - (28 * cutPi / 3) = 8 * cutPi / 3 := by ring

/-- THE RATIO READING: `Λ/v = (Λ/M) / (v/M)` — the confinement bundle is literally the confinement
    scale ratio divided by the electroweak scale ratio, both banked. (`topBandRatio = ewClosureRatio⁻¹`.) -/
theorem confBundle_eq_confToEw :
    confBundle = confinementScaleRatio / ewClosureRatio := by
  unfold confBundle
  rw [topBandRatio, div_eq_mul_inv]

/-- ★★ THE EDGE FACTORING: `confinementScaleRatio = ewClosureRatio · confBundle`. The confinement
    scale IS the electroweak band edge `v/M = ewClosureRatio` × the confinement suppression bundle
    `Λ/v` — the SAME electroweak edge the coupling reads (X6) and the lepton mass scale factors through
    (X8). The confinement-sector analogue of X8 `massScale_eq_edge_bundle`. -/
theorem confinement_eq_edge_bundle :
    confinementScaleRatio = ewClosureRatio * confBundle := by
  unfold confBundle
  rw [topBandRatio]
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp

/-! ## (2) BORN POSITIVITY AND STRICT SUPPRESSION BELOW THE EDGE. -/

/-- Born positivity: `0 < Λ/v` (banked `cutExp_pos`). -/
theorem confBundle_pos : 0 < confBundle := by
  rw [confBundle_eq]; exact cutExp_pos _

/-- ★★ STRICT SUPPRESSION: `Λ/v < 1`. The bundle exponent `−8·cutPi/3` is strictly negative
    (`cutPi_pos`), so `cutExp(−8π/3) < cutExp 0 = 1` (`cutExp_strictMono`, `cutExp_zero`). The
    confinement scale is strictly BELOW the electroweak edge — the hadron scale is genuinely deeper
    than the electroweak/Higgs scale, not pinned at it. -/
theorem confBundle_lt_one : confBundle < 1 := by
  rw [confBundle_eq]
  have hneg : -(8 * cutPi / 3) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-- The confinement bundle strictly EXCEEDS the electroweak edge itself: `v/M < Λ/v`, i.e.
    `ewClosureRatio < confBundle`. Since `−28π/3 < −8π/3`, `cutExp(−28π/3) < cutExp(−8π/3)`
    (`cutExp_strictMono`). Load-bearing for the tooth `confBundle ≠ ewClosureRatio` below. -/
theorem ewClosureRatio_lt_confBundle : ewClosureRatio < confBundle := by
  rw [confBundle_eq, ewClosureRatio_eq]
  apply cutExp_strictMono
  have := cutPi_pos; nlinarith [this]

/-! ## (3) THE SHARED-EDGE COUPLING READING (cited X6): the ONE-CAUSE weld. -/

/-- ★★ THE SHARED-EDGE COUPLING READING: `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27`
    (cited X6 `invAlphaZero_topBand_value`). The confinement scale factors through the SAME
    `topBandRatio` electroweak edge as this coupling reading — the ONE-CAUSE weld: one finite band
    tower from the octonion ceiling, three observables (the coupling, the lepton masses, the
    confinement scale), one electroweak edge. -/
theorem coupling_reading :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

/-! ## (4) NON-VACUITY / TEETH (W8): the weld is a genuine suppression, distinct from the edge. -/

/-- W8: `Λ/v ≠ 1` — the bundle is a genuine suppression, not the trivial identity (`confBundle_lt_one`).
    A WRONG "hadron scale = electroweak scale" reading would give `1`. -/
theorem confBundle_ne_one : confBundle ≠ 1 := by
  have := confBundle_lt_one; intro h; rw [h] at this; linarith

/-- W8: `Λ/v ≠ 0` — the bundle is a genuine positive ratio (`confBundle_pos`). -/
theorem confBundle_ne_zero : confBundle ≠ 0 := ne_of_gt confBundle_pos

/-- W8: `Λ/v ≠ v/M` — the confinement bundle is genuinely distinct from the electroweak edge itself
    (`ewClosureRatio_lt_confBundle`). The confinement rung and the electroweak rung do NOT collapse; a
    WRONG "confinement suppression equals the electroweak edge" reading is provably excluded. -/
theorem confBundle_ne_ewClosureRatio : confBundle ≠ ewClosureRatio :=
  (ne_of_lt ewClosureRatio_lt_confBundle).symm

/-- W8: the rung gap `8·cutPi/3` is genuinely nonzero — the confinement and electroweak rungs are
    distinct (`cutPi_pos`). A WRONG collapse of the two rungs would give a zero gap. -/
theorem rung_gap_ne_zero : (8 * cutPi / 3 : Cut) ≠ 0 := by
  have := cutPi_pos; positivity

/-! ## The capstone. -/

/-- ★★★ THE QUARK / HADRON MASS SECTOR ON THE ONE COUPLING BAND TOWER — the welded landing on the
    banked derived objects. For the confinement / hadron mass sector:
    (1) THE WELD: `Λ/v = confinementScaleRatio · topBandRatio = cutExp(−8·cutPi/3)`, the confinement
        scale in the coupling tower's electroweak-edge units, an EXACT closed derived ratio (the scale
        rung cancels against the SHARED edge, exactly as the lepton mass scale did in X8);
    (2) THE EDGE FACTORING: `confinementScaleRatio = ewClosureRatio · confBundle` — the confinement
        scale IS the electroweak band edge × the suppression bundle, the SAME edge the coupling reads;
    (3) THE RUNG GAP: `12·cutPi − 28·cutPi/3 = 8·cutPi/3`, the colour/space quotient-difference of the
        ONE 84π budget (`84π·(1/7 − 1/9)`);
    (4) STRICT SUPPRESSION: `0 < Λ/v < 1` — the hadron scale strictly below the electroweak edge;
    (5) THE SHARED-EDGE COUPLING READING: `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27`,
        the SAME `topBandRatio` edge — the ONE-CAUSE weld (one finite tower, three observables).
    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(5) are theorem-exact NOW;
    the absolute confinement scale `Λ = M·cutExp(−12π)` is anchored-on-derived-scale (cited
    `ConfinementHadronicMass`); the individual current-quark Yukawa masses (no banked quark texture)
    and the physical MeV numeral of any scale are ROUTE-NOT-YET-FOUND, enumerated for the X10
    attestation, NEVER asserted, NEVER fitted. -/
theorem quarkHadronTower_landing :
    confBundle = cutExp (-(8 * cutPi / 3))
    ∧ confinementScaleRatio = ewClosureRatio * confBundle
    ∧ (12 * cutPi) - (28 * cutPi / 3) = 8 * cutPi / 3
    ∧ 0 < confBundle
    ∧ confBundle < 1
    ∧ ewClosureRatio < confBundle
    ∧ invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  ⟨confBundle_eq, confinement_eq_edge_bundle, rung_gap_eq, confBundle_pos,
   confBundle_lt_one, ewClosureRatio_lt_confBundle, coupling_reading⟩

end

end Phys.Algebra.QuarkHadronTower
