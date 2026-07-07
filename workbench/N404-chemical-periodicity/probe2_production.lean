-- PROBE 2 (W9): the actual L3 production theorems, anchored to banked objects via carrierDim.
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Choose.Sum
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.AtomicShellPauli

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra.AtomicShell

noncomputable section

-- THE PERIOD = the banked carrier dimension (finrank Cut StateFibre = 2, banked fibre_finrank).
def carrierDim : ℕ := Module.finrank ContinuumQ.Cut Phys.Quantum.StateFibre

theorem carrierDim_eq : carrierDim = 2 := Phys.Quantum.fibre_finrank

-- valence occupancy = Z mod carrierDim; completed shells = Z / carrierDim.
def valence (Z : ℕ) : ℕ := Z % carrierDim
def completedShells (Z : ℕ) : ℕ := Z / carrierDim

-- filling decomposition: Z = (completed shells)·carrierDim + valence
theorem filling_decomposition (Z : ℕ) :
    completedShells Z * carrierDim + valence Z = Z := by
  unfold completedShells valence
  rw [Nat.mul_comm]; exact Nat.div_add_mod Z carrierDim

-- ★ PERIODICITY: valence recurs with period = carrierDim.
theorem valence_periodic (Z : ℕ) : valence (Z + carrierDim) = valence Z := by
  unfold valence; rw [Nat.add_mod_right]

-- the banked valence SECTOR dimension recurs with period carrierDim.
theorem valenceSector_dim_periodic (Z : ℕ) :
    finrank ContinuumQ.Cut (fermiSector (valence (Z + carrierDim)))
      = finrank ContinuumQ.Cut (fermiSector (valence Z)) := by
  rw [valence_periodic]

-- ★★ FILLING RESTARTS AT CAPACITY (the load-bearing weld to banked closure):
-- in ONE shell the (carrierDim+1)th quantum has NO antisymmetric state (Subsingleton, banked),
-- but the modular filling (carrierDim+1)%carrierDim opens a fresh, NONVACUOUS shell.
theorem filling_restarts :
    Subsingleton (fermiSector (carrierDim + 1))
      ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim)) := by
  constructor
  · exact shell_subsingleton_beyond_capacity (by rw [carrierDim_eq]; decide)
  · have hidx : (carrierDim + 1) % carrierDim = 1 := by rw [carrierDim_eq]
    rw [hidx]
    apply Module.nontrivial_of_finrank_pos (R := ContinuumQ.Cut)
    rw [orbital_occupancy]; decide

-- particle-hole (group) symmetry within a period: dim at occupancy r = dim at carrierDim - r.
theorem group_particle_hole {r : ℕ} (h : r ≤ carrierDim) :
    finrank ContinuumQ.Cut (fermiSector r)
      = finrank ContinuumQ.Cut (fermiSector (carrierDim - r)) := by
  rw [sector_capacity, sector_capacity, carrierDim_eq]
  rw [carrierDim_eq] at h
  exact (Nat.choose_symm h).symm

-- NOBLE (closed-shell) landmark recurs with period carrierDim: at every positive multiple the
-- residue is 0 (shell boundary) and the just-filled shell is the top singlet (banked).
theorem noble_recurs (k : ℕ) : valence (carrierDim * (k + 1)) = 0 := by
  unfold valence; exact Nat.mul_mod_right carrierDim (k + 1)

theorem noble_shell_is_filled_singlet :
    Nontrivial (fermiSector carrierDim)
      ∧ finrank ContinuumQ.Cut (fermiSector carrierDim) = 1 := by
  rw [carrierDim_eq]
  exact ⟨orbital_nonvacuous, orbital_filled⟩

-- ONE-CAUSE WELD on the banked 7-carrier ImO (period 7): same modular recurrence + restart.
theorem imO_valenceSector_dim_periodic (Z : ℕ) :
    finrank ℚ (⋀[ℚ]^((Z + 7) % 7) Phys.Algebra.ImO)
      = finrank ℚ (⋀[ℚ]^(Z % 7) Phys.Algebra.ImO) := by
  rw [Nat.add_mod_right]

theorem imO_filling_restarts :
    Subsingleton (⋀[ℚ]^(7 + 1) Phys.Algebra.ImO)
      ∧ Nontrivial (⋀[ℚ]^((7 + 1) % 7) Phys.Algebra.ImO) := by
  constructor
  · rw [← Module.finrank_zero_iff (R := ℚ)]
    exact imO_closes_beyond_seven (by decide)
  · have hidx : (7 + 1) % 7 = 1 := by decide
    rw [hidx]
    apply Module.nontrivial_of_finrank_pos (R := ℚ)
    rw [imO_capacity]; decide

-- full-shell total (max distinct fillings of the carrier) = 2^carrierDim.
theorem shell_total_fillings :
    ∑ N ∈ Finset.range (carrierDim + 1), Nat.choose 2 N = 2 ^ 2 := by
  rw [carrierDim_eq, Nat.sum_range_choose]

end
