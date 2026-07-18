import Phys.Algebra.HadronicSpectrum
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.D2eProbe

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- The per-level occupancy set: lattice curvatures whose Born self-overlap = level n.
def levelOccupancy (n : ℕ) : Set (O ℚ) := { w | IntLat w ∧ gForm w w = (n : ℚ) }

-- levelOccupancy is exactly the fiber that gapSpectrum quantifies over.
theorem levelOccupancy_iff_spectrum (n : ℕ) :
    (levelOccupancy n).Nonempty ↔ (n : ℚ) ∈ gapSpectrum := by
  constructor
  · rintro ⟨w, hlat, hval⟩; exact ⟨w, hlat, hval⟩
  · rintro ⟨w, hlat, hval⟩; exact ⟨w, hlat, hval⟩

-- Populated at every level (banked X4 surjectivity).
theorem levelOccupancy_populated (n : ℕ) : (levelOccupancy n).Nonempty :=
  (levelOccupancy_iff_spectrum n).mpr (spectrum_surjective_nat n)

-- A signed unit octonion: ±1 in coordinate i, 0 elsewhere.
def signedUnit (i : Fin 8) (s : Bool) : O ℚ :=
  coordO.symm (Pi.single i (if s then (1 : ℚ) else -1))

-- coordO of a signedUnit reads back the single nonzero coordinate.
theorem coordO_signedUnit (i : Fin 8) (s : Bool) :
    coordO (signedUnit i s) = Pi.single i (if s then (1 : ℚ) else -1) := by
  unfold signedUnit; exact coordO.apply_symm_apply _

-- The Born self-overlap of a signedUnit is exactly 1 (the floor level).
theorem gForm_signedUnit (i : Fin 8) (s : Bool) :
    gForm (signedUnit i s) (signedUnit i s) = 1 := by
  rw [gForm_polarization, coordO_signedUnit]
  rw [Finset.sum_eq_single i]
  · simp [Pi.single_eq_same]; cases s <;> norm_num
  · intro j _ hj; rw [Pi.single_eq_of_ne hj]; ring
  · intro h; exact absurd (Finset.mem_univ i) h

end

end Phys.Algebra.D2eProbe
