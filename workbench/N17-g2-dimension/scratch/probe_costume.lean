import Phys.Algebra.DerivationSkew
import Mathlib.Tactic
namespace Probe
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- The witness value on iota(iota(ιJ)) : its re.re.im coordinate.
-- x := iota (iota (ιJ ℚ)) : O ℚ is REAL? star x =?  x.
-- Actually iota(iota(ιJ)) has the form ⟨⟨ιJ, 0⟩, 0⟩. star negates the imaginary slices.
-- star x = ⟨star ⟨ιJ,0⟩, 0⟩ = ⟨⟨star ιJ, 0⟩, 0⟩, and star ιJ = ⟨star J, 0⟩ = ⟨-J... no.
-- Let's just see if witnessDeriv kills it (it should NOT — it's not self-conjugate).

-- Probe: is iota(ιJ) : O ℚ self-conjugate?  star (iota (ιJ ℚ)) =? iota (ιJ ℚ)
example : star (CD.iota (ιJ ℚ)) = CD.iota (star (ιJ ℚ)) := by
  ext <;> simp [CD.iota]

-- the witness value coordinate we want for the costume's false numeric:
-- (witnessDeriv (iota (ιJ ℚ))).re.im = ⟨0,-2⟩  (computed in probe_val)
example : (witnessDeriv (CD.iota (ιJ ℚ))).re.im.im = -2 := by
  show (CD.e2 * (ιJ ℚ) - (ιJ ℚ) * CD.e2).im.im = -2
  simp [CD.e2, ιJ, CD.iota, Dbl.J] ; ring

end Probe
