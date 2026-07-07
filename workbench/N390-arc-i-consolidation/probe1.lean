import Phys.Algebra.ConfinementHadronicMass
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN390

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## CROSS-TIE 1 — THE ONE OBJECT: the SAME associator is both the gluing
    (confinement) obstruction (N385/N219) and the argument of the string-tension /
    mass-gap Born action (N387). -/

theorem crossTie_associator_is_obstruction_and_action (a b x : O ℚ) :
    gluingDefect a b x = assoc a b x
      ∧ bornAction a b x = gForm (assoc a b x) (assoc a b x) := by
  refine ⟨?_, ?_⟩
  · have h := o_confinement_obstruction_eq_associator a b
    exact congrFun h x
  · rfl

/-! ## CROSS-TIE 2 — THE ONE NUMBER σ★: the SAME derived-ℝ number is the area-law
    exponential rate (N387), the mass-gap floor ≥4 (N388), and floors the hadronic
    mass (N389). -/

/-- σ★ — the per-plaquette Born action at the coloured non-associating witness. -/
def stringTension : Cut :=
  bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)

theorem stringTension_pos : 0 < stringTension :=
  bornAction_coloured_pos

theorem stringTension_massgap_floor : (4:Cut) ≤ stringTension :=
  bornAction_witness_floor

/-- THE WELD: the area law instantiated at σ★ — the SAME number that is the mass-gap
    floor (≥4) is the exponential rate of the area-scaling weight. -/
theorem area_law_at_stringTension (m n : ℕ) :
    wilsonArea stringTension m n = cutExp (-(stringTension * ((m * n : ℕ) : Cut))) :=
  wilsonArea_form stringTension m n

/-- Strict area suppression at σ★ (σ★ > 0). -/
theorem area_law_strict_at_stringTension (m n : ℕ) (hA : 0 < m * n) :
    wilsonArea stringTension m n < 1 :=
  wilsonArea_lt_one stringTension m n stringTension_pos hA

/-- ★★ CROSS-TIE 2 bundle. -/
theorem crossTie_stringTension_is_massgap :
    0 < stringTension
      ∧ (4:Cut) ≤ stringTension
      ∧ (∀ m n : ℕ, wilsonArea stringTension m n
            = cutExp (-(stringTension * ((m * n : ℕ) : Cut)))) :=
  ⟨stringTension_pos, stringTension_massgap_floor, area_law_at_stringTension⟩

/-! ## CROSS-ARC TIE — the confinement scale locks to the SAME 84π budget as α. -/

theorem crossTie_confinement_budget :
    confinementScaleRatio = cutExp (-(12 * cutPi))
      ∧ rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
          = criticalPhaseNumerator
      ∧ criticalPhaseNumerator = 84 * cutPi :=
  ⟨confinementScaleRatio_eq, confinementRung_budget_lock, criticalPhaseNumerator_eq⟩

/-! ## THE CAPSTONE consolidation. -/

theorem arc_I_consolidation (a b x : O ℚ) :
    -- confinement criterion (I1): 𝕆 confines because it is non-associative
    (SectorConfines (O ℚ))
    -- ONE OBJECT (I1↔I3): the associator is both obstruction and action-argument
    ∧ (gluingDefect a b x = assoc a b x
        ∧ bornAction a b x = gForm (assoc a b x) (assoc a b x))
    -- ONE NUMBER σ★ (I3↔I4↔I5): area-law rate = mass-gap floor
    ∧ (0 < stringTension ∧ (4:Cut) ≤ stringTension
        ∧ wilsonArea stringTension 1 1
            = cutExp (-(stringTension * ((1 * 1 : ℕ) : Cut))))
    -- singlet decouples (deconfined, massless)
    ∧ (∀ (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
          (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}),
          bornAction a b x = 0)
    -- 84π budget lock (cross-arc: same numerator as α)
    ∧ (rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
        = criticalPhaseNumerator
        ∧ criticalPhaseNumerator = 84 * cutPi) := by
  refine ⟨o_confines_from_cascade_stop, ?_, ?_, ?_, ?_⟩
  · exact crossTie_associator_is_obstruction_and_action a b x
  · exact ⟨stringTension_pos, stringTension_massgap_floor, area_law_at_stringTension 1 1⟩
  · intro ha hb; exact bornAction_singlet_zero ha hb x
  · exact ⟨confinementRung_budget_lock, criticalPhaseNumerator_eq⟩

/-! ## W8 non-vacuity: σ★ is genuinely ≥4 (not the degenerate 0), so the weld bites. -/

theorem stringTension_ne_zero : stringTension ≠ 0 :=
  ne_of_gt stringTension_pos

end

end Phys.Algebra.ProbeN390
