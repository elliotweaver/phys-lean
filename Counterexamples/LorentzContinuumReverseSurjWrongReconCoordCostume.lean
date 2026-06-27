import Phys.Algebra.LorentzContinuumReverseSurj

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C129): A BOGUS POLAR-PATH-DECOMPOSITION RECONSTRUCTION CLAIM — "THE RECONSTRUCTED
-- OPERATOR k∘γ(1) OF THE BOOST (5/3, 4/3), READ AT THE PURE-TIME VECTOR, HAS SPACE COORDINATE 40".
-- N97 banks `boost_polar_recon_coord`: for a boost `(5/3, 4/3)` (a point on the unit hyperbola
-- `(5/3)²−(4/3)² = 1`), the polar-path decomposition `isometry_polar_path_decomp` reconstructs the
-- boost as `g = (g∘(p^{1/2})⁻¹)∘γ(1) = k∘γ(1)` — and the reconstructed operator, read at the
-- pure-time vector `(1,0,0)`, has SPACE coordinate `4/3` (the boost's own `b`-parameter:
-- `boostEndC (5/3) (4/3) (1,0,0) = (5/3, 4/3, 0)`, space `= b·1 = 4/3`). The BOGUS claim that this
-- coordinate is `40` (a stand-in for ANY wrong "the reconstruction does not return the genuine boost
-- / the polar factors do not recompose" — e.g. dropping the compact factor, mis-scaling the positive
-- part) forces `4 / 3 = 40`, and must NOT compile.
--   The reconstruction hypothesis is genuinely SATISFIABLE — `boost_polar_path_decomp` produces a
-- concrete `n, c, u` with exactly `(k∘γ(1)) = boostEndC (5/3) (4/3)` — so the coordinate genuinely IS
-- `4/3` and the costume's claim of `40` is genuinely FALSE, not vacuous; the bite is a true
-- counterexample.
--   The false numeric `4 / 3 = 40` is DISTINCT from the banked battery (… C126 1=9, C127 1=12,
-- C128 3/2=13).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/isometry/compact/orthogonal/polar/KAK/positive
-- part/spectral/eigen*/square-root/path/connectedness/cone/reconstruction/reverse-surjectivity":
-- over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, given that the operator
-- `(boostEndC (5/3) (4/3) ∘ specOpN ((cutSqrt∘c)⁻¹) u) ∘ specPathOp c u 1` equals
-- `boostEndC (5/3) (4/3)`, its image of `(1,0,0)` has second-coordinate `(5/3)·1 + (4/3)·0`-paired
-- space entry `4/3`; claiming `40` forces `4 / 3 = 40`. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the polar-path decomposition `isometry_polar_path_decomp` reconstructs the boost
    `(5/3, 4/3)` as `k∘γ(1)` whose pure-time space coordinate is `4/3` (`boost_polar_recon_coord`);
    the WRONG claim that this coordinate is `40` (the reconstruction does not return the genuine
    boost) forces the false numeric `4 / 3 = 40`, so this must NOT compile. -/
theorem boost_polar_recon_wrong_coord_BOGUS
    {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC)
    (hrecon : ((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (specPathOp c u 1)
          = boostEndC ((5 : Cut)/3) ((4 : Cut)/3)) :
    (((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (specPathOp c u 1)
          ((1 : Cut), (0 : Cut), (0 : O Cut))).2.1 = 40 := by
  rw [boost_polar_recon_coord c u hrecon]

end

end Counterexamples
