import Phys.Algebra.LorentzContinuumPathConnectedFull

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C186): A BOGUS KAK-PRODUCT / PATH-CONNECTEDNESS / Joined / PRECONNECTED-UNION /
-- SO⁺(1,9)-STRUCTURE READ-OFF — "THE KAK-PRODUCT ASSEMBLY DOES NOT GENUINELY ASSEMBLE A NONTRIVIAL
-- SO⁺(1,9) ELEMENT (so the identity is NOT path-joined to a rotation × boost product, the abstract
-- assembly engine fails, the full reduction to a single compact residual fails, the boost factor's
-- affine path does not begin at the identity, the right-translated compact-path image is not
-- preconnected, the two factor-image pieces do not glue at the shared point)".
-- N154 banks the abstract assembly engine joined_id_of_factor_paths (from a continuous boost path
-- id→p and a continuous compact path id→k, the product k·p lies in a single preconnected subset of
-- endOpC with the identity, via IsPreconnected.union at the shared point p), the FULL REDUCTION
-- bvIsom_joined_id_of_compact_joined (an arbitrary BvC-isometry lies in a preconnected set with the
-- identity, given the single compact-group residual — boost factor handled in full generality by the
-- N130 polar decomposition + the N152 boost path), and the CONCRETE UNCONDITIONAL witness
-- kakProduct_concrete_joins_id (the engine fires with NO residual on the genuine SO⁺(1,9) element
-- planeRotLin 0 1 · boostEndC (5/3) (4/3), quarter turn × boost). The concrete W8 non-vacuity anchor:
-- the product GENUINELY moves the timelike axis — applied to (3/5,0,0) its time coordinate reads
-- ((planeRotLin 0 1 · boostEndC (5/3)(4/3)) (3/5,0,0)).1 = 5/3·(3/5) + 4/3·0 = 1 (the boost rapidity
-- scaling the timelike axis, the rotation leaving the time coordinate fixed). A genuine nontrivial
-- assembly, not vacuous.
--   THE BOGUS claim that this KAK-product time-coordinate read-off reads 154 (a stand-in for ANY
-- wrong KAK-product / path-connectedness / Joined / preconnected-union / SO⁺(1,9)-structure value:
-- the engine does not assemble / the identity is not path-joined to the product / the reduction
-- fails / the affine boost path does not start at the identity / the right-translated image is not
-- preconnected / the pieces do not glue at the shared point) forces, after rewriting by the genuine
-- values (Module.End.mul_apply, boostEndC_apply, planeRotLin_apply), the false numeric
-- `(1 : Cut) = 154` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the assembled KAK product GENUINELY reads 1 on
-- the boosted timelike axis (a banked read-off over the derived field Cut), so the claim of 154 is
-- genuinely FALSE (1 ≠ 154 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 154` is DISTINCT from the banked battery (… C183 1=151, C184 1=152,
-- C185 1=153).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/Minkowski/isometry/KAK/polar/compact/
-- path-connected/topology/continuity/Joined/preconnected/SO(1,9)/SO(9)/Spin/octonion": over the
-- derived complete ordered field Cut, the linear operator (planeRotLin 0 1)·(boostEndC (5/3)(4/3))
-- applied to (3/5,0,0) has first coordinate 5/3·(3/5) + 4/3·0 = 1; claiming it equals 154 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the assembled KAK product `planeRotLin 0 1 · boostEndC (5/3) (4/3)` applied to the scaled
    timelike axis `(3/5,0,0)` has first coordinate `154`. It GENUINELY equals `1` (the boost rapidity
    scaling the timelike axis `5/3·(3/5) = 1`, the quarter-turn rotation fixing the first coordinate).
    The WRONG claim that it is `154` (the assembly engine fails / the identity is not path-joined to
    the product / the full reduction fails / the affine boost path does not start at the identity /
    the right-translated image is not preconnected / the two pieces do not glue at the shared point)
    reduces, after rewriting by the genuine values, to the false numeric `(1 : Cut) = 154`, so this
    must NOT compile. -/
theorem kak_product_wrong_value_BOGUS :
    ((planeRotLin 0 1 * boostEndC ((5:Cut)/3) ((4:Cut)/3))
      ((3:Cut)/5, (0:Cut), (0:O Cut))).1 = (154 : Cut) := by
  rw [Module.End.mul_apply, boostEndC_apply, planeRotLin_apply]
  show ((5:Cut)/3 * (3/5) + (4:Cut)/3 * 0) = 154
  have hval : ((5:Cut)/3 * (3/5) + (4:Cut)/3 * 0) = 1 := by norm_num
  rw [hval]

end

end Counterexamples
