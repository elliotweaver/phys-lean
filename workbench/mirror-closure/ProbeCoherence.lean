import Phys.Algebra.DerivationStabilizerSplit

/- PROBE: can the kernel evaluate CD-octonion basis products / the coherence
   inner product fast enough for a 210-triple sum? Test one triple by rfl/decide. -/

open scoped BigOperators
open Phys.Cascade Phys.Algebra

-- the banked 7 imaginary basis units
#check (imBasis : Fin 7 → O ℚ)

-- inner product on O ℚ via coordinates: use the banked Nrm/polarization if present;
-- otherwise define the coordinate dot product locally.
namespace MirrorProbe

/-- coordinate dot product on O ℚ = CD (H ℚ) = pairs of pairs of pairs. -/
def dotO (x y : O ℚ) : ℚ :=
  x.re.re.re * y.re.re.re + x.re.re.im * y.re.re.im +
  x.re.im.re * y.re.im.re + x.re.im.im * y.re.im.im +
  x.im.re.re * y.im.re.re + x.im.re.im * y.im.re.im +
  x.im.im.re * y.im.im.re + x.im.im.im * y.im.im.im

/-- one coherence value: ⟨(u1·u2)·u4, u1·(u2·u4)⟩ — a non-Fano triple, expect −1. -/
example : dotO ((imBasis 0 * imBasis 1) * imBasis 3) (imBasis 0 * (imBasis 1 * imBasis 3)) = -1 := by
  decide

/-- a Fano triple: (u1·u2)·u3 associates, expect +1. -/
example : dotO ((imBasis 0 * imBasis 1) * imBasis 2) (imBasis 0 * (imBasis 1 * imBasis 2)) = 1 := by
  decide

end MirrorProbe
