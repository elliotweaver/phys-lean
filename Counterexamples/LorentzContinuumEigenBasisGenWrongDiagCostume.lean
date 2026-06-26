import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C96): A BOGUS UNEQUAL-DIAGONAL EIGENDECOMPOSITION of the concretely-presented
-- unequal-diagonal symmetric operator `txOp 73 36 52` (the `(t,x)`-plane map
-- `(t,x,v) ↦ (73t+36x, 36t+52x, 0)`, diagonal `73 ≠ 52`, off-diagonal `36 ≠ 0`) — claiming it
-- diagonalizes as `specOp 100 30` in the constructed rational rotation eigenbasis
-- {rotA (4/5)(3/5), rotB (4/5)(3/5)}, i.e. with second eigenvalue `30` on the rotB direction. The
-- banked GENERAL forward decomposition (`specOp_rot_eq_txOp`) is genuine: for ALL `l₁,l₂,c,s`,
-- `specOp l₁ l₂ (rotA c s)(rotB c s) = txOp (l₁c²+l₂s²)((l₁−l₂)cs)(l₁s²+l₂c²)`; with the Pythagorean
-- rotation `c=4/5, s=3/5` and eigenvalues `100,25` this gives `txOp 73 36 52` exactly
-- (`txOp_73_36_52_diag`: `txOp 73 36 52 = specOp 100 25 (rotA (4/5)(3/5)) (rotB (4/5)(3/5))`), the
-- rotB eigenvalue being `25`, NOT `30`. A sloppy unequal-diagonal diagonalization that mis-solved the
-- characteristic polynomial `λ² − (a+d)λ + (ad−b²) = λ² − 125λ + (73·52 − 36²) = λ² − 125λ + 2500`
-- (roots `100,25`) and read the smaller eigenvalue as `30` would commit exactly this.
--   CORRECT:  txOp 73 36 52 = specOp 100 25 (rotA (4/5)(3/5)) (rotB (4/5)(3/5))  (txOp_73_36_52_diag),
--             the rotB eigenvalue being the characteristic root 25.
-- Reading the WRONG diagonalization at the rotB eigenblock — `EvC (· (rotB …)) (rotB …)` of both
-- sides (the rotated-basis eigenblock reader, N63 `specOp_read₂` with `rotB_norm`/`rotAB_orth`,
-- where `(4/5)²+(3/5)² = 1`):
--   EvC ((txOp 73 36 52) (rotB …)) (rotB …) = EvC ((specOp 100 25 …) (rotB …)) (rotB …) = 25.
--   EvC ((specOp 100 30 …) (rotB …)) (rotB …) = 30.
-- The WRONG eigendecomposition asserts these are equal, i.e. `25 = 30`. So the BOGUS unequal-diagonal
-- eigendecomposition reduces, through the actual banked `txOp_73_36_52_diag`/N63 `specOp_read₂`
-- definitions, to the false numeric `25 = 30` and MUST FAIL to compile. The bite is `25 = 30`
-- (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7,
-- C92 9=10, C93 9=11, C94 16=15, C95 1=7).
theorem txOp_73_36_52_diag_BOGUS :
    EvC ((txOp (73:Cut) 36 52) (rotB (4/5) (3/5))) (rotB (4/5) (3/5))
      = EvC ((specOp (100:Cut) (30:Cut) (rotA (4/5) (3/5)) (rotB (4/5) (3/5))) (rotB (4/5) (3/5)))
            (rotB (4/5) (3/5)) := by
  have hn : (4/5:Cut)*(4/5) + (3/5)*(3/5) = 1 := by norm_num
  rw [txOp_73_36_52_diag, specOp_read₂ (rotB_norm hn) (rotAB_orth (4/5) (3/5)),
      specOp_read₂ (rotB_norm hn) (rotAB_orth (4/5) (3/5))]

end

end Counterexamples
