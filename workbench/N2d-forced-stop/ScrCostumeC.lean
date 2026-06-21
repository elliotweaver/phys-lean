import Phys.Cascade.ForcedStop
import Mathlib.Tactic
open Phys.Cascade

-- The wrong claim "the forward link needs COMMUTATIVITY, not associativity" means:
-- multiplicativity already FAILS at the associative-NONcommutative base O ℚ.
-- My Nrm_mul_on_O proves it HOLDS there. So a concrete failure claim at O is FALSE.
-- Test signature: pick witnesses, claim Nrm(a*b) ≠ Nrm a * Nrm b, watch it fail.

-- candidate: a small witness in O ℚ = CD (CD (Dbl ℚ)). Use ι(ιJ) and e2.
noncomputable def aO : O ℚ := CD.iota (ιJ ℚ)
noncomputable def bO : O ℚ := CD.e2

example : CD.Nrm (aO * bO) ≠ CD.Nrm aO * CD.Nrm bO := by
  unfold aO bO
  intro h
  exact absurd (Nrm_mul_on_O _ _) h
