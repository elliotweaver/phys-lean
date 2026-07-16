import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement

namespace Phys.Quantum.NoHiddenVariableProbe

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Quantum

/-! ## §1 — the definite-record exclusion (cite banked self-blindness). -/

-- A pre-existing definite record = a state fixed by the fold's self-look-back.
theorem definiteRecord_void (p : StateFibre) (h : foldComplex p = p) : p = 0 :=
  foldComplex_self_blind p h

/-! ## §2 — the outcome is NOT a function of the Born-observable data. -/

-- weights of the two frame axes
theorem w_eInward : dblNormSq (toDbl eInward) = 1 := by
  unfold dblNormSq; simp [toDbl, eInward]
theorem w_eOutward : dblNormSq (toDbl eOutward) = 1 := by
  unfold dblNormSq; simp [toDbl, eOutward]

-- the phase-partner of eInward is eOutward, same observable, different outcome
theorem phase_partner : foldComplex eInward = eOutward := foldComplex_eInward

theorem outcome_not_observable_function :
    ¬ ∃ h : ContinuumQ.Cut → StateFibre, ∀ p : StateFibre,
        gatherIn p = h (dblNormSq (toDbl p)) := by
  rintro ⟨h, hh⟩
  have key : gatherIn eInward = gatherIn eOutward := by
    rw [hh eInward, hh eOutward, w_eInward, w_eOutward]
  rw [gatherIn_apply, gatherIn_apply] at key
  have : (1 : ContinuumQ.Cut) = 0 := by
    have := congrArg Prod.fst key
    simpa [eInward, eOutward] using this
  exact one_ne_zero this

/-! ## §3 — the collision witness teeth + the i-origin tie. -/

theorem collision_witness :
    dblNormSq (toDbl eInward) = dblNormSq (toDbl (foldComplex eInward)) ∧
    gatherIn eInward ≠ gatherIn (foldComplex eInward) := by
  refine ⟨?_, ?_⟩
  · rw [phase_partner, w_eInward, w_eOutward]
  · rw [phase_partner, gatherIn_apply, gatherIn_apply]
    intro hcon
    have : (1 : ContinuumQ.Cut) = 0 := by
      have := congrArg Prod.fst hcon
      simpa [eInward, eOutward] using this
    exact one_ne_zero this

-- the i-origin tie: the hidden-variable-compatible sign is the one self-blindness rejected
theorem hv_sign_has_fixed_point :
    Jexch 1 (eInward + eOutward) = eInward + eOutward ∧ eInward + eOutward ≠ 0 :=
  ⟨plus_completion_has_lookback_fixed_point, eInwOut_ne_zero⟩

end Phys.Quantum.NoHiddenVariableProbe
