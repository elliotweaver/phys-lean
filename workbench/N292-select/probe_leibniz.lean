import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Mathlib.Tactic

/- N292 crux de-risk: the closure bracket via the derivation-property Jacobi route.
   Target: [kAB, kBC] = -innerMul (slotA 1)(slotC 1)   where
     kAB = innerMul (slotA u1)(slotB 1), kBC = innerMul (slotB u1)(slotC 1).
   Route: kAB is a derH3 inner-derivation; the mixed Leibniz
     [innerMul A B, L_C] = L_{innerMul A B applied to C}  for Hermitian C
   plus kAB.(slotB u1) = -slotA 1, kAB.(slotC 1) = 0.
   Here we probe the SHAPE: does a general innerMul-Leibniz lever exist / need building?
   First: can we even state [kAB, innerMul C D] and reduce it? Measure feasibility of the
   operator-level Leibniz `⁅innerMul A B, L C⁆ = L (innerMul A B C)` for Hermitian C. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- Does the banked innerMul_gauge_leibniz generalize? It is stated for jActL D (a derivation via
-- jAct_jb). For an inner-derivation kAB we need: kAB is a derivation of jb on Hermitian args.
-- That is exactly the derH3 membership (coupling_mem_derH3). Check the Leibniz field is accessible.
example : IsHermJordanDerivQ (innerMul (slotA u1) (slotB (1:O ℚ))) :=
  coupling_mem_derH3

-- The Leibniz law for kAB on Hermitian A,B (the second projection of IsHermJordanDerivQ):
example (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) (hA : Aᴴ = A) (hB : Bᴴ = B) :
    (innerMul (slotA u1) (slotB (1:O ℚ))) (jb A B)
      = jb ((innerMul (slotA u1) (slotB (1:O ℚ))) A) B
        + jb A ((innerMul (slotA u1) (slotB (1:O ℚ))) B) :=
  coupling_mem_derH3.2 A B hA hB

end Phys.Algebra.HJ
