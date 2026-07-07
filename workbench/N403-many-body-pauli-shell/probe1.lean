import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.ExchangeStatisticsDichotomy

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

noncomputable section

-- Carrier: banked derived-ℝ fibre (N391), dim 2 over Cut.
-- Probe A: capacity formula over derived Cut.
example : finrank ContinuumQ.Cut (⋀[ContinuumQ.Cut]^2 Phys.Quantum.StateFibre)
    = Nat.choose 2 2 := by
  rw [exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]

-- Probe B: closure — the 3-body antisymmetric sector over the 2D fibre is trivial (capacity closes).
example : finrank ContinuumQ.Cut (⋀[ContinuumQ.Cut]^3 Phys.Quantum.StateFibre) = 0 := by
  rw [exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]
  exact Nat.choose_eq_zero_of_lt (by decide)

-- Probe C: closure as Subsingleton (no 3-fermion antisymmetric state exists).
example : Subsingleton (⋀[ContinuumQ.Cut]^3 Phys.Quantum.StateFibre) := by
  rw [← Module.finrank_zero_iff (R := ContinuumQ.Cut)]
  rw [exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]
  exact Nat.choose_eq_zero_of_lt (by decide)

-- Probe D: filling nonvacuity — capacity is positive up to dim.
example : 0 < finrank ContinuumQ.Cut (⋀[ContinuumQ.Cut]^2 Phys.Quantum.StateFibre) := by
  rw [exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]
  decide

-- Probe E: the diagonal-wedge vanishing (many-body Pauli at degree 2): same state twice → 0.
example (v : Phys.Quantum.StateFibre) :
    exteriorPower.ιMulti ContinuumQ.Cut 2 (fun _ => v) = 0 := by
  apply AlternatingMap.map_eq_zero_of_eq _ (fun _ => v) (i := 0) (j := 1)
  · rfl
  · decide

-- Probe F: weld to the banked N373 carrier ImO over ℚ — closure at 8.
example : finrank ℚ (⋀[ℚ]^8 Phys.Algebra.ImO) = 0 := by
  rw [exteriorPower.finrank_eq, Phys.Algebra.finrank_ImO]
  exact Nat.choose_eq_zero_of_lt (by decide)

-- Probe G: the banked N373 two-body Pauli is still available (cite it).
example (v : Phys.Algebra.ImO) : Phys.Algebra.ExchStat.fermiProj (v ⊗ₜ[ℚ] v) = 0 :=
  Phys.Algebra.ExchStat.pauli_exclusion v

end
