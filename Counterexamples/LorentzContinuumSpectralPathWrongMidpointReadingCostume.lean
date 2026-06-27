import Phys.Algebra.LorentzContinuumSpectralPath

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C128): A BOGUS AFFINE-SPECTRAL-PATH MIDPOINT CLAIM — "THE MIDPOINT EIGENVALUE
-- READING OF THE PATH IS 13".
-- N96 banks `specPathOp_mix4_mid_read`: the affine spectral path `specPathOp ![4,9,25,64] mix4` —
-- whose eigenvalues travel along the straight segment `(1−t)·1 + t·cutSqrt(c i)` from `id` (t=0) to
-- the spectral square root `specOpN ![2,3,5,8] mix4` (t=1) — at the MIDPOINT `t = 1/2` reads, on its
-- first frame vector `mix4 0 = mixA`, the diagonal eigenvalue `(1 − 1/2) + (1/2)·cutSqrt 4
-- = 1/2 + (1/2)·2 = 3/2` (the genuine CONVEX MIDPOINT of `1` and `cutSqrt 4 = 2`). The BOGUS claim
-- that the midpoint reading is `13` (a stand-in for ANY wrong "the path does not interpolate convexly
-- / the midpoint eigenvalue is something other than the average of the endpoints" — e.g. mistaking
-- the convex midpoint for the t=1 endpoint reading 2, or any other value) forces `3 / 2 = 13`, and
-- must NOT compile.
--   The bite is a true counterexample, not vacuous: `specPathOp_mix4_mid_read` is a banked theorem,
-- so the reading genuinely IS `3/2`, and the costume's claim of `13` is genuinely FALSE.
--   The false numeric `3 / 2 = 13` is DISTINCT from the banked battery (… C124 7=8, C125 6=5,
-- C126 1=9, C127 1=12).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/isometry/connectedness/path/positive part/
-- spectral/eigen*/identity/midpoint/rapidity/KAK/polar/cone": over the derived complete ordered field
-- `Cut` and `O Cut := CD(H Cut)`, for the EvC-orthonormal 4-frame `mix4` and the operator
-- `specOpN (fun i => (1 − 1/2)·1 + (1/2)·cutSqrt (![4,9,25,64] i)) mix4`, the bilinear reading
-- `EvC (· (mix4 0)) (mix4 0)` equals `(1 − 1/2) + (1/2)·cutSqrt 4 = 3/2`; claiming `13` forces
-- `3 / 2 = 13`. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the affine spectral path `specPathOp ![4,9,25,64] mix4` at the midpoint `t = 1/2` has
    first-frame eigenvalue reading `3/2` (`specPathOp_mix4_mid_read`); the WRONG claim that this
    midpoint reading is `13` (the path does not interpolate convexly — e.g. mistaking the convex
    midpoint of `1` and `2` for some other value) forces the false numeric `3 / 2 = 13`, so this
    must NOT compile. -/
theorem spectral_path_midpoint_wrong_reading_BOGUS :
    EvC (specPathOp ![(4:Cut),9,25,64] mix4 (1/2) (mix4 0)) (mix4 0) = 13 := by
  rw [specPathOp_mix4_mid_read]

end

end Counterexamples
