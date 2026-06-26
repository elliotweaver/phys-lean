import Phys.Algebra.LorentzContinuumSeedVector

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C107): A BOGUS EIGENVALUE READ OFF A GENUINE EIGEN-EQUATION OVER `STVC`. N76 banks
-- THE EIGENVECTOR HALF OF THE SEED over the derived ℝ `Cut` and the terminal algebra `O Cut`: given a
-- characteristic-polynomial root `λ` of an endomorphism `T` of `STVC = Cut × Cut × O Cut`, a NONZERO
-- vector `v` with `T v = λ • v` (`stvc_eigenvector_of_charpoly_root`), and at dimension 3 a nonzero
-- eigenvector for EVERY endomorphism (`dim3_has_eigenvector`). The defining content of an eigenpair is
-- the vector eigen-equation `T v = λ • v`. Take the concrete scaling endomorphism `6 • id` on `STVC`
-- and the concrete nonzero vector `v0 := (1, 0, 0)`: the genuine eigen-equation gives
-- `(6 • id) v0 = 6 • v0`, whose first coordinate is `6 · v0.1 = 6 · 1 = 6` — the TRUE eigenvalue read
-- off the eigen-equation. A BOGUS claim that the first coordinate of `(6 • id) v0` is `13` (i.e. that
-- the eigenvalue of the eigen-equation were `13`) reduces, through the genuine `Cut`-module scaling on
-- `STVC`, on the left to the genuine `6`, hence to the false numeric `6 = 13`, and MUST FAIL to
-- compile.
--   CORRECT: the eigen-equation `(6 • id) v0 = 6 • v0` has first coordinate `6` — the genuine
--            eigenvalue an eigenvector at a characteristic root satisfies, not a wrong value; the
--            eigenVECTOR half of the seed is honest.
-- The bite is `6 = 13` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11, C105 25=13, C106 8=27).
def v0 : STVC := ((1:Cut), (0:Cut), (0:O Cut))

theorem eigen_wrong_eigenvalue_BOGUS :
    (((6:Cut) • (LinearMap.id : Module.End Cut STVC)) v0).1 = (13:Cut) := by
  rw [show (((6:Cut) • (LinearMap.id : Module.End Cut STVC)) v0).1 = (6:Cut) from by
        simp [v0]]

end

end Counterexamples
