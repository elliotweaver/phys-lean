import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Algebra.Star.Basic
open Phys.Cascade
-- Can we form CD over a non-commutative *-ring base (M₂ ℚ)?
abbrev M2 := Matrix (Fin 2) (Fin 2) ℚ
example : Ring M2 := inferInstance
example : StarRing M2 := inferInstance
-- Does CD M2 get a NonAssocRing + StarRing so bilin is defined?
example : NonAssocRing (CD M2) := inferInstance
example : StarRing (CD M2) := inferInstance
#check (CD.bilin : CD M2 → CD M2 → M2)
