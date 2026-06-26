import Phys.Algebra.LorentzContinuumCartan

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C89): MISREADING THE INFINITESIMAL CARTAN SPLIT — claiming the infinitesimal
-- boost generator `boostGenC` (which is EvC-SYMMETRIC, the NONCOMPACT 𝔭 part, `boostGenC_EvC_symm`)
-- satisfies the EvC-SKEW condition `E(T p) q + E p (T q) = 0` (the COMPACT 𝔨 membership). The banked
-- Cartan split `𝔰𝔬(1,9) = 𝔨 ⊕ 𝔭` is genuine: the boost is EvC-symmetric and provably NOT EvC-skew
-- (`boostGenC_not_EvC_skew`), the compact (rotation) and noncompact (boost) parts being distinct.
-- Putting the boost — a positive/noncompact, EvC-symmetric generator — into the compact rotation
-- part is exactly the failure a sloppy polar/KAK `g = k·exp(p)` extraction would commit.
--   CORRECT:  boostGenC is EvC-SYMMETRIC,  E(T p) q = E p (T q),  and is NOT EvC-skew.
-- The boost sends `(t,x,v) ↦ (x,t,0)`. Reading the WRONG EvC-skew identity at the concrete witness
-- `p = (5,0,0)`, `q = (0,5,0)`:
--   T p = boostGenC (5,0,0) = (0,5,0),   T q = boostGenC (0,5,0) = (5,0,0).
--   E(T p) q = E (0,5,0) (0,5,0) = 0·0 + 5·5 + gFormC 0 0 = 25.
--   E p (T q) = E (5,0,0) (5,0,0) = 5·5 + 0·0 + gFormC 0 0 = 25.
-- The WRONG EvC-skew claim asserts  E(T p) q + E p (T q) = 0,  i.e.  25 + 25 = 0,  i.e.  50 = 0.
-- So the WRONG Cartan-split claim reduces, through the actual `EvC`/`boostGenC` definitions, to the
-- false numeric `50 = 0` and MUST FAIL to compile. (The CORRECT EvC-SYMMETRIC reading gives the
-- equality `25 = 25`, as `boostGenC_EvC_symm` proves.) The bite is `50 = 0` (distinct from C84
-- 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4).
theorem boostGenC_EvC_skew_BOGUS :
    EvC (boostGenC ((5 : Cut), (0 : Cut), (0 : O Cut))) ((0 : Cut), (5 : Cut), (0 : O Cut))
  + EvC ((5 : Cut), (0 : Cut), (0 : O Cut)) (boostGenC ((0 : Cut), (5 : Cut), (0 : O Cut))) = 0 := by
  simp only [boostGenC, LinearMap.coe_mk, AddHom.coe_mk, EvC,
    show gFormC (0 : O Cut) 0 = 0 from gFormC_zero_left 0]
  ring_nf

end

end Counterexamples
