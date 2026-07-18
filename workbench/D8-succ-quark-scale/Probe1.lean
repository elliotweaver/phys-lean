import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.ScaleTowerGearDecomposition
import Phys.Algebra.QuarkHadronTower
import Mathlib.Tactic

namespace Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear

noncomputable section

/-- q := the banked ℂ-fold Born amplitude cutCos(cutPi/4); q² = 1/2, q > 0. -/
def q : Cut := cutCos (cutPi / 4)

theorem q_sq : q * q = 1 / 2 := cutCos_quarter_sq
theorem q_pos : 0 < q := cutCos_quarter_pos

-- sin²(P) and cos²(P) at the fold phase P = cutPi/8 are determined derived values.
theorem cosP_sq : cutCos foldPhase * cutCos foldPhase = (1 + q) / 2 := by
  unfold foldPhase q; exact cutCos_eighth_sq

theorem sinP_sq : cutSin foldPhase * cutSin foldPhase = (1 - q) / 2 := by
  have hpy := cutSin_sq_add_cutCos_sq foldPhase
  have hc : cutCos foldPhase * cutCos foldPhase = (1 + q) / 2 := cosP_sq
  linarith [hpy, hc]

theorem cosP_pos : 0 < cutCos foldPhase := cutCos_eighth_pos

/-- THE PHASE-BORN FACTOR over the derived ℝ: `(tan²P·cosP)² = sin⁴P/cos²P`. -/
def foldPhaseBorn : Cut :=
  (cutSin foldPhase * cutSin foldPhase) * (cutSin foldPhase * cutSin foldPhase)
    / (cutCos foldPhase * cutCos foldPhase)

/-- THE CLOSED FORM: `foldPhaseBorn = (1-q)²/(2(1+q))`. -/
theorem foldPhaseBorn_closed : foldPhaseBorn = (1 - q) ^ 2 / (2 * (1 + q)) := by
  unfold foldPhaseBorn
  rw [sinP_sq, cosP_sq]
  have hq1 : 0 < 1 + q := by have := q_pos; linarith
  have hne : (1 + q) / 2 ≠ 0 := by positivity
  field_simp
  ring

theorem foldPhaseBorn_pos : 0 < foldPhaseBorn := by
  rw [foldPhaseBorn_closed]
  have h1 : 0 < 1 + q := by have := q_pos; linarith
  -- need 1 - q > 0: q² = 1/2 so q < 1
  have hq : q < 1 := by
    nlinarith [q_sq, q_pos]
  have h2 : 0 < 1 - q := by linarith
  positivity

/-- THE Cut-DOMAIN GEAR: `m_b/m_t` Born ratio = phaseBorn · (banked survival 2/3), over Cut. -/
def mbBornRatioCut (phaseBorn : Cut) : Cut := phaseBorn * ((s1BornProb : ℚ) : Cut)

/-- THE DERIVED DOWN/TOP BORN RATIO: the phaseBorn slot FILLED by the banked fold phase. -/
def mbRatioDerived : Cut := mbBornRatioCut foldPhaseBorn

theorem mbRatioDerived_eq : mbRatioDerived = foldPhaseBorn * (2 / 3) := by
  unfold mbRatioDerived mbBornRatioCut
  rw [s1BornProb_value]
  norm_num

theorem mbRatioDerived_closed : mbRatioDerived = (1 - q) ^ 2 / (3 * (1 + q)) := by
  rw [mbRatioDerived_eq, foldPhaseBorn_closed]
  have h1 : 0 < 1 + q := by have := q_pos; linarith
  field_simp
  ring

theorem mbRatioDerived_pos : 0 < mbRatioDerived := by
  rw [mbRatioDerived_eq]
  have := foldPhaseBorn_pos
  positivity

-- the Cut-gear restricts to the banked ℚ gear on rational slots
theorem mbBornRatioCut_restrict (p : ℚ) :
    mbBornRatioCut ((p : ℚ) : Cut) = ((mbBornRatio p : ℚ) : Cut) := by
  unfold mbBornRatioCut mbBornRatio
  push_cast
  ring

end
end Probe
