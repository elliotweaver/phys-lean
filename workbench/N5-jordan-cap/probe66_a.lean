/- PROBE (run 66, W9.2): pieceA STRUCTURAL spine (should be near-instant, no coordinate expansion).
   (a) Gmat A := A*(jb A A) − (jb A A)*A. jdef A (Dg ...) = Dg*Gmat A − Gmat A*Dg  [banked master + Dg nuclearity].
   (b) commutator with central diagonal vanishes IF the matrix off-diagonal is 0. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe66A
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

/-- The un-normalised cube-associator of a matrix. -/
noncomputable def Gmat (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  A * (jb A A) - (jb A A) * A

set_option maxHeartbeats 400000 in
/-- pieceA master application: jdef A (Dg e) = Dg e * Gmat A − Gmat A * Dg e. -/
theorem jdef_diag2 (A : Matrix (Fin 3) (Fin 3) (O ℚ)) (e0 e1 e2 : ℚ) :
    jdef A (Dg e0 e1 e2) = Dg e0 e1 e2 * Gmat A - Gmat A * Dg e0 e1 e2 := by
  have := jdef_master A (Dg e0 e1 e2)
    (fun X Y => Dg_assocL e0 e1 e2 X Y)
    (fun X Y => Dg_assocM e0 e1 e2 X Y)
    (fun X Y => Dg_assocR e0 e1 e2 X Y)
  simpa [Gmat] using this

end Probe66A
