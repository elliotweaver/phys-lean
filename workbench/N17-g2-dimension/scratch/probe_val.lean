import Phys.Algebra.Derivation
import Mathlib.Tactic
namespace Probe
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- The concrete nonzero derivation value witnessDeriv (iota (ιJ ℚ)).
-- Find a clean nonzero coordinate.
#eval "checking witnessDeriv (iota ιJ)"
-- witnessDeriv = innerDeriv e₂ ; innerDeriv q z = ⟨adHom q z.re, adHom q z.im⟩
-- on x = iota (ιJ ℚ) = ⟨ιJ, 0⟩ : O ℚ, re = ιJ : H ℚ, im = 0
-- so witnessDeriv x = ⟨adHom e₂ (ιJ), adHom e₂ 0⟩ = ⟨adHom e₂ ιJ, 0⟩
-- adHom e₂ ιJ = e₂ * ιJ - ιJ * e₂ : H ℚ.
-- Let's compute (witnessDeriv x).re.im (the H-im part) explicitly.
example : (witnessDeriv (CD.iota (ιJ ℚ))).re = CD.e2 * (ιJ ℚ) - (ιJ ℚ) * CD.e2 := by
  rfl

-- compute coordinates of e₂ * ιJ - ιJ * e₂ in H ℚ = CD (Dbl ℚ)
-- (this is an H-element; its .im : Dbl ℚ)
example : ((CD.e2 : H ℚ) * (ιJ ℚ) - (ιJ ℚ) * CD.e2).im = (⟨0,-2⟩ : Dbl ℚ) := by
  ext <;> simp [CD.e2, ιJ, CD.iota, Dbl.J, CD.mul_re, CD.mul_im] <;> ring

end Probe
