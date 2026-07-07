-- PROBE 3: wave-particle duality (two faces g/ω) + the vacuum (self-blind origin).
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum.Probe3

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

-- the two faces
noncomputable def particleFace (p q : StateFibre) : ContinuumQ.Cut := bornForm p q
noncomputable def waveFace (p q : StateFibre) : ContinuumQ.Cut := kahlerForm p q

-- the Born content splits into the two faces (from N393)
theorem born_two_faces (φ ψ : StateFibre) :
    bornProb φ ψ = (particleFace φ ψ)^2 + (waveFace φ ψ)^2 := rfl

-- complementarity extremes on the frame: pure wave (particle face 0, wave face 1)
theorem frame_pure_wave :
    particleFace eInward eOutward = 0 ∧ waveFace eInward eOutward = 1 := by
  constructor
  · exact bornForm_eInward_eOutward
  · unfold waveFace; rw [kahlerForm_apply]; simp [eInward, eOutward]

-- pure particle (a self-overlap has zero wave face, nonzero particle face)
theorem self_pure_particle :
    waveFace eInward eInward = 0 ∧ particleFace eInward eInward = 1 := by
  constructor
  · unfold waveFace; exact kahlerForm_self eInward
  · exact bornForm_eInward_self

-- the vacuum: the self-blind origin
noncomputable def foldVacuum : StateFibre := 0

theorem vacuum_zero_overlap : bornForm foldVacuum foldVacuum = 0 := by
  rw [(bornForm_self_eq_zero foldVacuum).2 rfl]

theorem vacuum_unique_zero (p : StateFibre) : bornForm p p = 0 ↔ p = foldVacuum :=
  bornForm_self_eq_zero p

theorem vacuum_J_fixed : foldComplex foldVacuum = foldVacuum := by
  simp [foldVacuum]

-- the vacuum is the UNIQUE J-fixed state (self-blind)
theorem vacuum_unique_J_fixed (p : StateFibre) : foldComplex p = p ↔ p = foldVacuum :=
  ⟨fun h => foldComplex_self_blind p h, fun h => by rw [h]; exact vacuum_J_fixed⟩

end Phys.Quantum.Probe3
