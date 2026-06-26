import Phys.Algebra.LorentzContinuumRealClosed

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open Polynomial

-- WRONG (costume C108): A BOGUS EIGENVALUE READ OFF A GENUINE EIGEN-EQUATION ON AN ODD-DIMENSIONAL
-- SPACE. N77 banks THE GENERAL ODD-DEGREE ROOT over the derived ℝ `Cut` (`cut_odd_degree_has_root` —
-- every monic polynomial of ODD `natDegree` has a root, via the same IVT engine that built
-- `cutSqrt`/`cut_cubic_has_root` escalated to arbitrary odd degree), hence `IsRealClosed Cut` (the
-- derived ℝ is a REAL CLOSED FIELD), and `dim_odd_has_eigenvector` (every endomorphism of an
-- odd-`finrank` `Cut`-vector space has a NONZERO `v` with `T v = λ • v` — the re-seeding lever for the
-- odd rungs of the deflation cascade, generalizing N76's dim-3-only seed). The defining content of an
-- eigenpair is the vector eigen-equation `T v = λ • v`. Take the concrete scaling endomorphism `7 • id`
-- on the ODD-dimensional space `Fin 5 → Cut` and the concrete nonzero vector `e0 := fun i => if i = 0
-- then 1 else 0`: the genuine eigen-equation gives `(7 • id) e0 = 7 • e0`, whose `0`-th coordinate is
-- `7 · e0 0 = 7 · 1 = 7` — the TRUE eigenvalue read off the eigen-equation. A BOGUS claim that the
-- `0`-th coordinate of `(7 • id) e0` is `12` (i.e. that the eigenvalue of the eigen-equation were `12`)
-- reduces, through the genuine `Cut`-module scaling on `Fin 5 → Cut`, on the left to the genuine `7`,
-- hence to the false numeric `7 = 12`, and MUST FAIL to compile.
--   CORRECT: the eigen-equation `(7 • id) e0 = 7 • e0` on the odd-dimensional space has `0`-th
--            coordinate `7` — the genuine eigenvalue an eigenvector at a root of the odd-degree
--            characteristic polynomial satisfies, not a wrong value; the odd-dimensional eigen-seed is
--            honest, so the real-closed-field structure is real.
-- The bite is `7 = 12` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11, C105 25=13, C106 8=27,
-- C107 6=13).
def e0 : Fin 5 → Cut := fun i => if i = 0 then 1 else 0

theorem odd_dim_wrong_eigenvalue_BOGUS :
    (((7:Cut) • (LinearMap.id : Module.End Cut (Fin 5 → Cut))) e0) 0 = (12:Cut) := by
  rw [show (((7:Cut) • (LinearMap.id : Module.End Cut (Fin 5 → Cut))) e0) 0 = (7:Cut) from by
        simp [e0]]

end

end Counterexamples
