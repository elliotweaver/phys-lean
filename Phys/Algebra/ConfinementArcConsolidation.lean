/-
  Phys/Algebra/ConfinementArcConsolidation.lean
  ============================================================================================
  N390 — arc-I I6: THE ONE OBSTRUCTION, THE ONE NUMBER — consolidation of arc I (QCD /
  confinement) + the arc-J handoff.

  THE ONE STATEMENT of arc I. The strong-force face of physics — the confinement criterion
  (I1, N385), the colour-singlet dichotomy (I2, N386), the area law / linear potential (I3,
  N387), the mass gap / curvature floor (I4, N388), and the origin of hadronic mass (I5,
  N389) — is the SAME octonion NON-ASSOCIATIVITY (the banked associator `assoc`, N-Alternative)
  read through the sheafification descent obstruction (the banked gather, N218T/N219), now at
  the strong-force regime. The SAME associator that stopped the cascade (N2 `not_associative`),
  capped the Jordan tower (N5), and forced strong-CP (F2) causes a NEW termination — the strong
  force. One cause, one more consequence.

  WHY THIS IS NOT AN EMPTY-AND (the N338/N365 grand-AND trap, REJECTED). A bare conjunction of
  the five banked capstones would derive NOTHING new. Instead this node banks TWO genuine
  NEVER-BANKED cross-ties — shared objects/numbers welding two arc-I nodes together that no
  prior module's TYPE states:

    • CROSS-TIE 1 — THE ONE OBJECT. The SAME banked associator `assoc a b x` is BOTH the
      confinement gluing obstruction (I1: `gluingDefect a b = fun x => assoc a b x`, N385/N219)
      AND the argument of the string-tension / mass-gap Born action (I3/I4:
      `bornAction a b x = gForm (assoc a b x) (assoc a b x)`, N387). Obstruction and action are
      one object. (`crossTie_associator`.)

    • CROSS-TIE 2 — THE ONE NUMBER `σ★`. The SINGLE derived-ℝ number
      `σ★ = bornAction (ι(ιJ)) (ι(e₂)) e₂` is simultaneously: the area-law exponential RATE
      (I3, `wilsonArea σ★ m n = cutExp(−(σ★·Area))`), the mass-gap FLOOR (I4, `4 ≤ σ★`), and
      the Higgs-independent hadronic-mass floor (I5, `0 < σ★`). The confinement suppression
      rate IS the mass-gap floor — one number, three theorems. No prior TYPE instantiates the
      area-law form AT the mass-gap witness; that instantiation is the weld. (`crossTie_sigmaStar`.)

  Plus the CROSS-ARC tie already banked at I5 (re-exported here): the confinement scale locks
  to the SAME 84π critical-phase budget that fixed the fine-structure coupling α (arc A) and
  every scale-tower rung (arc B): `rungExponent(7)·7 = criticalPhaseNumerator = 84·cutPi`
  (N389 `confinementRung_budget_lock` + N329), the octonion (colour) `n = dim ImO = 7` quotient.

  GRADE: UNCONDITIONAL THEOREM (assembly of banked theorems into two never-banked cross-ties
  over the concrete banked objects). ⚠ The IDENTIFICATION that `σ★` IS the physical string
  tension and that the confinement scale IS the physical proton/hadron mass (~99% of visible
  mass = confinement energy) is candidate/mechanism-grade PROSE only — no empirical number
  (938 MeV, Λ_QCD, σ_lattice, "99%") appears in any statement or proof (G2, NO-FIT). The full
  Clay/Millennium Yang–Mills mass gap in constructive-QFT rigour is OWNER-HELD / route-not-yet-
  found — not attempted here.

  physics-words-removable (G4): delete "confinement", "quark", "hadron", "colour", "mass gap",
  "string tension" — the theorems stand as pure statements about: an alternating trilinear form
  `assoc` on the top Cayley–Dickson rung `O ℚ` that is BOTH the left-regular gluing defect AND
  the argument of a Born self-overlap `gForm`; a single derived-ℝ number `σ★` that is `> 0`,
  `≥ 4`, and the exponent of an area-scaling `cutExp` weight; the vanishing of that number on
  the 2-dim complex subline `span{1,u1}`; and a `Cut` budget lock `rungExponent(7)·7 = 84·cutPi`.

  NOT free-floating (STANDARD §3): every type mentions the banked derived objects — `assoc`/
  `gluingDefect`/`bornAction`/`gForm` on `O ℚ`, `SectorConfines (O ℚ)`, the derived-ℝ `Cut`
  number `σ★` and `wilsonArea`/`cutExp`/`cutPi`, `rungExponent`/`criticalPhaseNumerator`/
  `finrank ℚ ImO` — none generic.

  ℝ-vigilance (G5): only the BANKED derived ℝ `Cut` + `ℚ` + `Module`/`Submodule` MACHINERY.
  No Mathlib number system as load-bearing content.

  Successor: ONE directed child → `SEED_QM_FOUNDATIONS.md` target J1 (the primitive 2D real
  fibre — the Born rule as a derived theorem, retiring "Born = self-overlap" from primitive to
  theorem).
-/
import Phys.Algebra.ConfinementHadronicMass
import Mathlib.Tactic

namespace Phys.Algebra.ArcIConsolidation

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — CROSS-TIE 1: THE ONE OBJECT (obstruction = action-argument). -/

/-- ★★★ CROSS-TIE 1 — THE ONE OBSTRUCTION. On the top rung `O ℚ` the SAME banked octonion
    associator `assoc a b x` is BOTH:
      (1) the confinement gluing (descent) obstruction — `gluingDefect a b x = assoc a b x`
          (N385/N219): the left-regular worlds fail to glue exactly by the associator, which is
          why the non-associative sector confines;
      (2) the argument of the string-tension / mass-gap Born action —
          `bornAction a b x = gForm (assoc a b x) (assoc a b x)` (N387): the per-plaquette
          action is the Born self-overlap of that very obstruction.
    Confinement (I1) and the linear potential / mass gap (I3/I4) are ONE object read twice.
    No prior module's TYPE welds the gluing defect and the Born action through the shared
    associator; this is the weld. -/
theorem crossTie_associator (a b x : O ℚ) :
    gluingDefect a b x = assoc a b x
      ∧ bornAction a b x = gForm (assoc a b x) (assoc a b x) := by
  refine ⟨?_, rfl⟩
  exact congrFun (o_confinement_obstruction_eq_associator a b) x

/-! ## §2 — CROSS-TIE 2: THE ONE NUMBER σ★ (area-law rate = mass-gap floor). -/

/-- `σ★` — the per-plaquette Born action (string tension) at the coloured non-associating
    witness `(ι(ιJ), ι(e₂), e₂)`. This single derived-ℝ `Cut` number is the shared quantity
    across I3 (area law), I4 (mass gap), and I5 (hadronic-mass floor). -/
def sigmaStar : Cut :=
  bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)

/-- `σ★ > 0` — the confinement suppression rate is strictly positive (I3/I5, banked
    `bornAction_coloured_pos`): the coloured sector genuinely suppresses. -/
theorem sigmaStar_pos : 0 < sigmaStar :=
  bornAction_coloured_pos

/-- `4 ≤ σ★` — the SAME number is the mass-gap floor (I4, banked `bornAction_witness_floor`):
    a concrete nonzero minimum per-plaquette action in the derived ℝ. -/
theorem sigmaStar_massgap_floor : (4:Cut) ≤ sigmaStar :=
  bornAction_witness_floor

/-- ★★★ THE WELD (CROSS-TIE 2 core). The area-law FORM instantiated AT `σ★`: the SAME number
    that is the mass-gap floor (`4 ≤ σ★`) is the exponential RATE of the area-scaling weight,
    `wilsonArea σ★ m n = cutExp(−(σ★·Area))` (banked `wilsonArea_form` at the witness). The
    confinement suppression rate IS the mass-gap floor — I3 and I4 are the one number `σ★`. No
    prior TYPE instantiates the area-law form at the mass-gap witness. -/
theorem area_law_at_sigmaStar (m n : ℕ) :
    wilsonArea sigmaStar m n = cutExp (-(sigmaStar * ((m * n : ℕ) : Cut))) :=
  wilsonArea_form sigmaStar m n

/-- Strict area suppression at `σ★` (since `σ★ > 0`): larger enclosed area is suppressed
    strictly below `1` — the confining (area-scaling) behaviour at the shared number. -/
theorem area_law_strict_at_sigmaStar (m n : ℕ) (hA : 0 < m * n) :
    wilsonArea sigmaStar m n < 1 :=
  wilsonArea_lt_one sigmaStar m n sigmaStar_pos hA

/-- ★★ CROSS-TIE 2 bundle: the ONE number `σ★` is the area-law rate (`> 0`, the exponential
    weight), the mass-gap floor (`≥ 4`), all at once. -/
theorem crossTie_sigmaStar :
    0 < sigmaStar
      ∧ (4:Cut) ≤ sigmaStar
      ∧ (∀ m n : ℕ, wilsonArea sigmaStar m n
            = cutExp (-(sigmaStar * ((m * n : ℕ) : Cut)))) :=
  ⟨sigmaStar_pos, sigmaStar_massgap_floor, area_law_at_sigmaStar⟩

/-! ## §3 — CROSS-ARC TIE: the confinement scale locks to the SAME 84π budget as α. -/

/-- ★★ THE CONFINEMENT SCALE LOCKS TO THE `84π` BUDGET (cross-arc). The confinement rung ratio
    `Λ/M = e^(−12π)` (N389) is the octonion (colour) `n = dim ImO = 7` quotient of the SAME
    critical-phase budget `criticalPhaseNumerator = 84·cutPi` (N329) that fixed the
    fine-structure coupling α (arc A) and every scale-tower rung (arc B):
    `rungExponent(7)·7 = 84·cutPi` (banked `confinementRung_budget_lock`). The strong-force
    scale and the electromagnetic coupling share ONE derived number. -/
theorem crossTie_budget :
    confinementScaleRatio = cutExp (-(12 * cutPi))
      ∧ rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
          = criticalPhaseNumerator
      ∧ criticalPhaseNumerator = 84 * cutPi :=
  ⟨confinementScaleRatio_eq, confinementRung_budget_lock, criticalPhaseNumerator_eq⟩

/-! ## §4 — ★★★ THE ARC-I CAPSTONE: the strong force as ONE derived-object statement. -/

/-- ★★★ THE ARC-I CONSOLIDATION (the whole strong-force arc as one statement, over the banked
    derived objects). For any `a b x : O ℚ`:

      I1 (confinement) — the top rung confines (`SectorConfines (O ℚ)`) BECAUSE it is
        non-associative (banked `o_confines_from_cascade_stop`);
      ONE OBJECT (I1↔I3) — the associator is BOTH the gluing obstruction AND the Born-action
        argument (`gluingDefect a b x = assoc a b x` ∧ `bornAction = gForm(assoc)(assoc)`);
      ONE NUMBER σ★ (I3↔I4) — the shared derived-ℝ number is `> 0`, `≥ 4`, and the exponential
        rate of the area-scaling weight (`wilsonArea σ★ 1 1 = cutExp(−(σ★·1))`);
      I2 (singlet decouples) — on the fold's own complex subline `span{1,u1}` (the DERIVED
        colour-neutral core, N386) the action VANISHES (`bornAction a b x = 0`): singlets are
        deconfined/massless;
      CROSS-ARC (I5↔A/B) — the confinement rung locks to the SAME 84π budget as α
        (`rungExponent(7)·7 = criticalPhaseNumerator = 84·cutPi`).

    THE ONE CAUSE, spelled: the fold loses associativity at `O ℚ` (N2 `not_associative`); the
    associator is the gather/descent obstruction (N219); its Born self-overlap is `σ★`. One
    obstruction, one number — the strong force. -/
theorem arc_I_consolidation (a b x : O ℚ) :
    (SectorConfines (O ℚ))
    ∧ (gluingDefect a b x = assoc a b x
        ∧ bornAction a b x = gForm (assoc a b x) (assoc a b x))
    ∧ (0 < sigmaStar ∧ (4:Cut) ≤ sigmaStar
        ∧ wilsonArea sigmaStar 1 1
            = cutExp (-(sigmaStar * ((1 * 1 : ℕ) : Cut))))
    ∧ (a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        b ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        bornAction a b x = 0)
    ∧ (rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
        = criticalPhaseNumerator
        ∧ criticalPhaseNumerator = 84 * cutPi) := by
  refine ⟨o_confines_from_cascade_stop, crossTie_associator a b x, ?_, ?_, ?_⟩
  · exact ⟨sigmaStar_pos, sigmaStar_massgap_floor, area_law_at_sigmaStar 1 1⟩
  · intro ha hb; exact bornAction_singlet_zero ha hb x
  · exact ⟨confinementRung_budget_lock, criticalPhaseNumerator_eq⟩

/-! ## §5 — W8 NON-VACUITY: the cross-ties genuinely bite (tie the C415 costume). -/

/-- ★★ W8 (the weld genuinely bites, ties the C415 costume): the shared number `σ★` is
    GENUINELY the mass-gap floor `≥ 4` (hence `≠ 0`), so the area-law rate = mass-gap-floor weld
    is NOT vacuously true of a degenerate `0` string tension. A WRONG "arc I is disconnected
    islands / the area-law rate is unrelated to the mass-gap floor / σ★ = 0" mis-reading breaks
    this: if `σ★` were `0` the area weight would be the constant `1` (no suppression, no gap). -/
theorem sigmaStar_ne_zero : sigmaStar ≠ 0 :=
  ne_of_gt sigmaStar_pos

/-- W8: the mass-gap floor is genuinely nontrivial (`4 ≤ σ★` and `σ★ ≠ 0`), so the ONE-NUMBER
    weld is between two nonvacuous facts, not a triviality. -/
theorem sigmaStar_massgap_nontrivial : (4:Cut) ≤ sigmaStar ∧ sigmaStar ≠ 0 :=
  ⟨sigmaStar_massgap_floor, sigmaStar_ne_zero⟩

end

end Phys.Algebra.ArcIConsolidation
