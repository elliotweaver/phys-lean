import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure

namespace Probe393b
open Phys.Foundation Phys.Cascade Phys.Quantum
open Phys.Foundation.ContinuumQ

noncomputable def kahlerForm (x y : StateFibre) : ContinuumQ.Cut := bornForm (foldComplex x) y
theorem kahlerForm_apply (x y : StateFibre) : kahlerForm x y = x.1 * y.2 - x.2 * y.1 := by
  unfold kahlerForm bornForm; simp only [foldComplex_apply]; ring
noncomputable def bornProb (φ ψ : StateFibre) : ContinuumQ.Cut :=
  (bornForm φ ψ) ^ 2 + (kahlerForm φ ψ) ^ 2

-- W8 non-vacuity witness: the amplitude between the two orthogonal look-back directions
-- is PURELY IMAGINARY (g=0, ω=1), so its Born probability is 1 — coming entirely from ω.
theorem kahlerForm_eInward_eOutward : kahlerForm eInward eOutward = 1 := by
  rw [kahlerForm_apply]; simp [eInward, eOutward]
theorem bornProb_eInward_eOutward : bornProb eInward eOutward = 1 := by
  unfold bornProb
  rw [bornForm_eInward_eOutward, kahlerForm_eInward_eOutward]; ring
-- if someone dropped ω (claimed Born = g²) they'd get 0 ≠ 1:
theorem g_sq_eInward_eOutward : (bornForm eInward eOutward)^2 = 0 := by
  rw [bornForm_eInward_eOutward]; ring
end Probe393b
