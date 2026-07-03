import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)
-- explore witnessDerivQ action on basis-ish octonions: try u1..u7 / e-elements
-- probe several coordinates of witnessDerivQ applied to a generic imaginary basis elt
open Phys.Algebra in
example : True := by
  -- print the type/def path by trying an evaluation
  trivial
-- try: does witnessDerivQ move u1? (u1 = the fold sqrt-1)
#check @u1
#check @imBasis
end Phys.Algebra.HJ
