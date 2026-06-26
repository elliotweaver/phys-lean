import Phys.Algebra.LorentzContinuumSpin9

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C86): claiming the TWO-SIDED Moufang / Spin(9) bimultiplication `v ↦ u·(v·u')`
-- multiplies the Born self-overlap by only a SINGLE factor (the left multiplication `gFormC u u`),
-- FORGETTING the right multiplication by `u'`. The banked three-factor composition law
-- (`biMul_gFormC`, via `gFormC_comp` applied TWICE) is
--   CORRECT:  gFormC (u·(v·u')) (u·(v·u')) = gFormC u u · (gFormC v v · gFormC u' u')   [THREE factors]
-- The WRONG claim drops the right factor `gFormC u' u'`, treating the two-sided product as if it
-- were a single LEFT-multiplication `u·v` (the N53/N54 single-unit generator):
--   WRONG:    gFormC (u·(v·u')) (u·(v·u')) = gFormC u u · gFormC v v                    [TWO factors]
-- The right factor `gFormC u' u'` is EXACTLY what distinguishes the genuine two-sided Spin(9)
-- generator from a single-unit rotation — dropping it is the error of confusing the two-sided
-- bimultiplication with the single-sided multiplication. Evaluated at the concrete Born norms
-- gFormC u u = gFormC v v = gFormC u' u' = 3:
--   CORRECT three-factor: 3 · (3 · 3) = 3 · 9 = 27.
--   WRONG   two-factor:   3 · 3       = 9.
-- So the WRONG single-sided claim reduces to the false numeric `27 = 9` and MUST FAIL to compile.
-- (The CORRECT three-factor law `biMul_gFormC` gives 27 = 27, as `gFormC_comp` applied twice proves.)
theorem biMul_drop_right_factor_BOGUS :
    (3 : Cut) * ((3 : Cut) * (3 : Cut)) = (3 : Cut) * (3 : Cut) := by
  ring_nf

end

end Counterexamples
