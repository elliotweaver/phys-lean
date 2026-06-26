import Phys.Algebra.LorentzContinuumExpIntegration

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

-- WRONG (costume C83): claiming the GLOBAL boost is the exp-polynomial in the N51 infinitesimal
-- generator `boostGenC` with the WRONG coefficient `a` (instead of the correct `a − 1`) on the
-- generator-squared (time–space-block projection) term. The banked `boostFunC_eq_gen_poly` proves
-- `boostFunC a b p = p + b•(boostGenC p) + (a−1)•(boostGenC (boostGenC p))`; the `a` coefficient is
-- a WRONG integration of the generator. Evaluated on the first coordinate at `a = 2`, `b = 0`,
-- `p = (1,0,0)`: the correct boost gives `(boostFunC 2 0 (1,0,0)).1 = 2·1 + 0·0 = 2`, while the
-- WRONG exp-poly first coordinate is `p.1 + b·(boostGenC p).1 + a·(boostGenC² p).1 = 1 + 0·0 + 2·1
-- = 3` (since `(boostGenC (1,0,0)).1 = 0` and `(boostGenC (boostGenC (1,0,0))).1 = 1`). So the
-- unhypothesized claim is FALSE — it reduces to the false numeric `2 = 3`. Must FAIL to compile.
theorem boostExp_wrong_coeff_BOGUS :
    (boostFunC (2 : Cut) (0 : Cut) ((1 : Cut), (0 : Cut), (0 : O Cut))).1
      = (((1 : Cut), (0 : Cut), (0 : O Cut)) : STVC).1
        + (0 : Cut) * (boostGenC (((1 : Cut), (0 : Cut), (0 : O Cut)) : STVC)).1
        + (2 : Cut) * (boostGenC (boostGenC (((1 : Cut), (0 : Cut), (0 : O Cut)) : STVC))).1 := by
  show (2 : Cut) * 1 + 0 * 0 = 1 + 0 * 0 + 2 * 1
  ring_nf

end Counterexamples
