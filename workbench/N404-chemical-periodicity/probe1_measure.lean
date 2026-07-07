-- PROBE 1 (W9 measure-first): de-risk L3 combinatorial facts. FIXED closers.
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Choose.Sum
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.AtomicShellPauli

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

noncomputable section

-- (A) particle-hole duality: C(2,N) = C(2,2-N) for N ≤ 2.
example (N : ℕ) (h : N ≤ 2) :
    finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector N)
      = finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector (2 - N)) := by
  rw [Phys.Algebra.AtomicShell.sector_capacity, Phys.Algebra.AtomicShell.sector_capacity,
      Nat.choose_symm h]

-- (B) closed-shell top singlet: C(2,2) = 1.
example : finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector 2) = 1 := by
  rw [Phys.Algebra.AtomicShell.sector_capacity]; decide

-- (C) ImO closed shell C(7,7)=1.
example : finrank ℚ (⋀[ℚ]^7 Phys.Algebra.ImO) = 1 := by
  rw [Phys.Algebra.AtomicShell.imO_capacity]; decide

-- (D) ImO particle-hole: C(7,2)=C(7,5)=21.
example : finrank ℚ (⋀[ℚ]^2 Phys.Algebra.ImO) = finrank ℚ (⋀[ℚ]^5 Phys.Algebra.ImO) := by
  rw [Phys.Algebra.AtomicShell.imO_capacity, Phys.Algebra.AtomicShell.imO_capacity]; decide
example : finrank ℚ (⋀[ℚ]^2 Phys.Algebra.ImO) = 21 := by
  rw [Phys.Algebra.AtomicShell.imO_capacity]; decide

-- (E) mod-2 valence recurrence: dim recurs with period 2 in Z.
example (Z : ℕ) :
    finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector ((Z + 2) % 2))
      = finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector (Z % 2)) := by
  rw [Nat.add_mod_right]

-- (F) recurrence teeth: valence at Z=1 and Z=3 agree = 2 (open); at Z=2 = 1 (closed).
example : finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector (1 % 2)) = 2 := by
  rw [Phys.Algebra.AtomicShell.sector_capacity]; decide
example : finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector (3 % 2)) = 2 := by
  rw [Phys.Algebra.AtomicShell.sector_capacity]; decide
example : finrank ContinuumQ.Cut (Phys.Algebra.AtomicShell.fermiSector (2 % 2)) = 1 := by
  rw [Phys.Algebra.AtomicShell.sector_capacity]; decide

-- (G) closed-shell (noble) at positive multiples of the period: valence 0.
example (k : ℕ) : (2 * (k + 1)) % 2 = 0 := by omega

-- (H) full-shell total dimension: Σ_{N} C(2,N) = 2^2 (Nat.sum_range_choose).
example : ∑ N ∈ Finset.range (2 + 1), Nat.choose 2 N = 2 ^ 2 := by
  rw [Nat.sum_range_choose]

-- (H') ImO full total: Σ_{N} C(7,N) = 2^7 = 128.
example : ∑ N ∈ Finset.range (7 + 1), Nat.choose 7 N = 2 ^ 7 := by
  rw [Nat.sum_range_choose]

end
