import Phys.Algebra.LorentzContinuumAdjoint

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C90): MISREADING THE OPERATOR-LEVEL CARTAN SPLIT — claiming the imaginary
-- rotation generator `rotGenC e₂` (which is SKEW-adjoint, `g* = −g`, the COMPACT 𝔨 part, via
-- N59 `rotGenC_adjoint` + N58 `rotGenC_EvC_skew`) is SELF-adjoint, i.e. EvC-SYMMETRIC
-- (`EvC (T p) q = EvC p (T q)`, the NONCOMPACT 𝔭 / self-adjoint membership). The banked operator
-- Cartan split is genuine: the rotation is skew-adjoint and provably NOT EvC-symmetric
-- (`rotGenC_e2_not_EvC_symm`), the self-adjoint (boost) and skew-adjoint (rotation) parts being
-- DISTINCT. Putting the compact, skew-adjoint rotation into the noncompact, self-adjoint part is
-- exactly the failure a sloppy operator-level polar/KAK `g = k·exp(p)` extraction would commit
-- (the operator-level analogue of C89's wrong infinitesimal split).
--   CORRECT:  rotGenC e₂ is SKEW-adjoint (g* = −rotGenC e₂),  E(T p) q + E p (T q) = 0,  and is
--             NOT EvC-symmetric (rotGenC_e2_not_EvC_symm).
-- The rotation sends `(t,x,v) ↦ (0,0,e₂·v)`. Reading the WRONG EvC-symmetric (self-adjoint)
-- identity at the concrete witness `p = (0,0,1)`, `q = (0,0,e₂)`:
--   T p = rotGenC e₂ (0,0,1)  = (0,0, e₂·1) = (0,0,e₂),   T q = rotGenC e₂ (0,0,e₂) = (0,0, e₂·e₂).
--   E(T p) q = E (0,0,e₂)(0,0,e₂) = gFormC e₂ e₂ = 1.
--   E p (T q) = E (0,0,1)(0,0, e₂·e₂) = gFormC 1 (e₂·e₂) = gFormC 1 (−1) = −1.
-- The WRONG self-adjoint claim asserts  E(T p) q = E p (T q),  i.e.  1 = −1.  So the WRONG operator
-- Cartan-split claim reduces, through the actual `EvC`/`rotGenC` definitions and the banked
-- `e2_alt`/`e2_gFormC_self`/`gFormC_one`, to the false numeric `1 = −1` and MUST FAIL to compile.
-- (The CORRECT SKEW-adjoint reading gives `1 + (−1) = 0`, as `rotGenC_adjoint` proves.) The bite is
-- `1 = -1` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0).
theorem rotGenC_e2_self_adjoint_BOGUS :
    EvC (rotGenC (CD.e2 : O Cut) ((0:Cut), (0:Cut), (1 : O Cut))) ((0:Cut), (0:Cut), (CD.e2 : O Cut))
  = EvC ((0:Cut), (0:Cut), (1 : O Cut)) (rotGenC (CD.e2 : O Cut) ((0:Cut), (0:Cut), (CD.e2 : O Cut))) := by
  simp only [rotGenC, LinearMap.coe_mk, AddHom.coe_mk, EvC]
  rw [mul_one]
  rw [show (CD.e2 : O Cut) * (CD.e2 : O Cut) = -1 by
        have := e2_alt (1 : O Cut); rw [mul_one] at this; exact this]
  rw [e2_gFormC_self,
    show gFormC (1 : O Cut) (-1) = -1 by
      rw [gFormC_symm 1 (-1 : O Cut), gFormC_neg_left, gFormC_symm 1 1, gFormC_one]]
  ring_nf

end

end Counterexamples
