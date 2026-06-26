import Phys.Algebra.LorentzContinuumOctSeedExtract

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C103): A BOGUS CONSTRUCTED SEED EIGENPAIR — THE WRONG EIGENVALUE FOR THE
-- CONSTRUCTED `omixA (4/5)(3/5)` EIGENDIRECTION OF THE OCTONION-COUPLING OPERATOR `toMix 73 36 52`.
-- N72 banks THE CONSTRUCTED SEED EIGENPAIR EXTRACTION from an octonion-coupling coordinate operator:
-- `toMix a b d` couples time to the octonion-real unit `1₍O₎`, and its eigenbasis is CONSTRUCTED from
-- the discriminant radical `R = cutSqrt(δ²+b²)`. Concretely `toMix 73 36 52 = specOp 100 25
-- (omixA (4/5)(3/5)) (omixB (4/5)(3/5))` (`toMix_73_36_52_diag`), so reading the constructed `λ₊`
-- eigenblock through the banked `specOp_read₁` over the EvC-orthonormality of the constructed pair
-- `{omixA,omixB}` gives `EvC (toMix 73 36 52 (omixA (4/5)(3/5))) (omixA (4/5)(3/5)) = 100` — the TRUE
-- constructed-seed eigenvalue (`toMix_73_36_52_read_seed`). A BOGUS constructed seed eigenpair claiming
-- the `omixA (4/5)(3/5)` eigenvalue is `40` would, through those actual banked definitions, reduce —
-- on the left to the read coefficient `100` — and on the right, through the bogus claim, to `40`. So
-- the BOGUS constructed seed eigenpair reduces, through the genuine banked machinery, to the false
-- numeric `100 = 40` and MUST FAIL to compile.
--   CORRECT: `toMix 73 36 52 (omixA (4/5)(3/5)) = 100 • omixA (4/5)(3/5)`; its constructed eigenblock
--            reads `100` — the genuine seed eigenvalue that satisfies the N70 deflation engine's
--            eigen-equation hypothesis on a CONSTRUCTED (not given) octonion-coupling eigenbasis.
-- The bite is `100 = 40` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7).
theorem toMix_constructed_seed_wrong_eigenvalue_BOGUS :
    EvC (toMix (73:Cut) 36 52 (omixA (4/5) (3/5))) (omixA (4/5) (3/5)) = (40:Cut) := by
  rw [toMix_73_36_52_read_seed]

end

end Counterexamples
