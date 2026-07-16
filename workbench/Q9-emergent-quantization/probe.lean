import Phys.Algebra.ScaleTowerWindingQuantization
import Phys.Algebra.ConfinementMassGap
import Phys.Quantum.PrimitiveFibre
import Mathlib.Tactic

open Phys.Algebra Phys.Algebra.Winding Phys.Quantum
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Module

noncomputable section

-- (A) integer invariant probes
example (k : ℤ) : windingPhase k = azimuthalTurn * ((windingRungIndex k : ℤ) : Cut) := by
  unfold windingPhase; rfl

example (k : ℤ) (h : azimuthalTurn ≠ 0) :
    windingPhase k / azimuthalTurn = ((windingRungIndex k : ℤ) : Cut) := by
  unfold windingPhase
  field_simp

example : Function.Injective windingRungIndex := windingRungIndex_injective

example (k : ℤ) : windingRungIndex k % (3 : ℤ) = 1 := by
  have := windingRungIndex_residue k
  rw [finrank_Uhol] at this; exact this

-- azimuthalTurn ≠ 0 from cutPi_pos
example : azimuthalTurn ≠ 0 := by
  unfold azimuthalTurn
  have := cutPi_pos
  positivity

-- (B) exactness = ℤ discreteness
example (n : ℤ) (h : n ≠ 0) : 1 ≤ n.natAbs := by
  omega

example (k : ℤ) :
    windingPhase (k + 1) - windingPhase k = (3 : Cut) * azimuthalTurn := by
  have := windingPhase_step k
  rw [finrank_Uhol] at this
  rw [this]; push_cast; ring

-- weld to mass gap I4: the citations resolve
example (w : O ℚ) (hlat : IntLat w) (hne : w ≠ 0) : 1 ≤ gForm w w :=
  bornAction_lattice_floor w hlat hne

example (w : O ℚ) (hne : w ≠ 0) (n : ℕ) :
    gForm ((1 / (n + 1 : ℚ)) • w) ((1 / (n + 1 : ℚ)) • w) = gForm w w / (n + 1)^2 :=
  no_floor_over_continuum w hne n

-- (C) flux quantum = doubled fold
example : ((finrank Cut StateFibre : ℤ) : Cut) = (2 : Cut) := by
  rw [fibre_finrank]; norm_num

example (h : azimuthalTurn ≠ 0) :
    ((finrank Cut StateFibre : Cut)) * (azimuthalTurn / (finrank Cut StateFibre : Cut)) = azimuthalTurn := by
  rw [fibre_finrank]
  push_cast
  field_simp

-- (D) non-vacuity
example : windingRungIndex 1 - windingRungIndex 0 ≠ 1 := windingRungIndex_spacing_ne_one

example (h : azimuthalTurn ≠ 0) :
    azimuthalTurn / (finrank Cut StateFibre : Cut) ≠ azimuthalTurn := by
  rw [fibre_finrank]
  push_cast
  intro hcon
  -- azimuthalTurn/2 = azimuthalTurn → azimuthalTurn = 0
  have : azimuthalTurn = 2 * azimuthalTurn := by
    field_simp at hcon; linarith [hcon]
  have : azimuthalTurn = 0 := by linarith
  exact h this

end
