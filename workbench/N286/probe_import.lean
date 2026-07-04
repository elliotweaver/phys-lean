import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000
-- import baseline only
example : True := trivial
end Phys.Algebra.HJ
