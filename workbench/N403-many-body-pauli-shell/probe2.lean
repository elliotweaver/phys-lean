import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.ExchangeStatisticsDichotomy

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

noncomputable section

namespace ProbeMatter

-- §1 the many-body antisymmetric sector as the exterior power of the banked fibre.
abbrev fermiSector (N : ℕ) := ⋀[ContinuumQ.Cut]^N Phys.Quantum.StateFibre

-- capacity = C(2,N)
theorem sector_capacity (N : ℕ) :
    finrank ContinuumQ.Cut (fermiSector N) = Nat.choose 2 N := by
  rw [fermiSector, exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]

-- many-body Pauli: repeated state annihilated.
theorem manyBodyPauli {N : ℕ} (a : Fin N → Phys.Quantum.StateFibre)
    (i j : Fin N) (hij : i ≠ j) (heq : a i = a j) :
    exteriorPower.ιMulti ContinuumQ.Cut N a = 0 :=
  AlternatingMap.map_eq_zero_of_eq _ a heq hij

-- §2 orbital occupancy / filling / closure
theorem orbital_occupancy : finrank ContinuumQ.Cut (fermiSector 1) = 2 := by
  rw [sector_capacity]; rfl

theorem orbital_filled : finrank ContinuumQ.Cut (fermiSector 2) = 1 := by
  rw [sector_capacity]; rfl

theorem orbital_closes : finrank ContinuumQ.Cut (fermiSector 3) = 0 := by
  rw [sector_capacity]; exact Nat.choose_eq_zero_of_lt (by decide)

theorem orbital_closed_subsingleton : Subsingleton (fermiSector 3) := by
  rw [← Module.finrank_zero_iff (R := ContinuumQ.Cut)]; exact orbital_closes

theorem orbital_nonvacuous : Nontrivial (fermiSector 2) := by
  apply Module.nontrivial_of_finrank_pos (R := ContinuumQ.Cut)
  rw [orbital_filled]; decide

-- §3 general closure: capacity-2 carrier closes at N > 2
theorem shell_closes_beyond_capacity {N : ℕ} (h : 2 < N) :
    finrank ContinuumQ.Cut (fermiSector N) = 0 := by
  rw [sector_capacity]; exact Nat.choose_eq_zero_of_lt h

theorem shell_subsingleton_beyond_capacity {N : ℕ} (h : 2 < N) :
    Subsingleton (fermiSector N) := by
  rw [← Module.finrank_zero_iff (R := ContinuumQ.Cut)]
  exact shell_closes_beyond_capacity h

-- §4 weld to N373 two-body Pauli + ImO capacity-7 closure
theorem two_body_pauli_imO (v : Phys.Algebra.ImO) :
    Phys.Algebra.ExchStat.fermiProj (v ⊗ₜ[ℚ] v) = 0 :=
  Phys.Algebra.ExchStat.pauli_exclusion v

theorem imO_capacity (N : ℕ) :
    finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = Nat.choose 7 N := by
  rw [exteriorPower.finrank_eq, Phys.Algebra.finrank_ImO]

theorem imO_closes_beyond_seven {N : ℕ} (h : 7 < N) :
    finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = 0 := by
  rw [imO_capacity]; exact Nat.choose_eq_zero_of_lt h

end ProbeMatter

end
