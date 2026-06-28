import Phys.Algebra.LorentzContinuumCliffordCoverKernel

namespace Phys.Algebra.N137Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The orthogonality read-offs (the (t,x) / octonion-block BvC-orthogonality). -/

theorem bvC_oct_time (v : O Cut) :
    BvC ((0, 0, v) : STVC) (mTimeUnit : STVC) = 0 := by
  show (0:Cut) * 1 - 0 * 0 - gFormC v 0 = 0
  rw [gFormC_zero_right']; ring

theorem bvC_oct_space (v : O Cut) :
    BvC ((0, 0, v) : STVC) (mSpaceUnit : STVC) = 0 := by
  show (0:Cut) * 0 - 0 * 1 - gFormC v 0 = 0
  rw [gFormC_zero_right']; ring

/-! ## The stabilizer predicate: BvC-isometry fixing the (t,x) plane pointwise. -/

/-- THE OCTONION-BLOCK STABILIZER predicate: a `BvC`-isometry of `STVC` fixing the (t,x) plane
    (`mTimeUnit` and `mSpaceUnit`) pointwise. The gauge subgroup of the Lorentz group. -/
def IsOctStab (S : Module.End Cut STVC) : Prop :=
  IsBvIsomLin S ∧ S mTimeUnit = mTimeUnit ∧ S mSpaceUnit = mSpaceUnit

/-! ## THE GAUGE CONTENT — a stabilizer element preserves the octonion block. -/

/-- ★ A stabilizer element sends the octonion block into itself: the time component vanishes.
    `(S (0,0,v)).1 = BvC (S (0,0,v)) mTimeUnit = BvC (S (0,0,v)) (S mTimeUnit) = BvC (0,0,v) mTimeUnit = 0`. -/
theorem octStab_time_comp_zero {S : Module.End Cut STVC} (hS : IsOctStab S) (v : O Cut) :
    (S ((0, 0, v) : STVC)).1 = 0 := by
  obtain ⟨hiso, ht, _hx⟩ := hS
  have key : BvC (S ((0, 0, v) : STVC)) (mTimeUnit : STVC) = 0 := by
    rw [← ht, hiso ((0, 0, v) : STVC) (mTimeUnit : STVC), bvC_oct_time]
  -- BvC w mTimeUnit = w.1 * 1 - w.2.1 * 0 - gFormC w.2.2 0 = w.1
  have hval : BvC (S ((0, 0, v) : STVC)) (mTimeUnit : STVC) = (S ((0, 0, v) : STVC)).1 := by
    simp only [BvC, mTimeUnit, gFormC_zero_right']; ring
  rw [hval] at key; exact key

theorem octStab_space_comp_zero {S : Module.End Cut STVC} (hS : IsOctStab S) (v : O Cut) :
    (S ((0, 0, v) : STVC)).2.1 = 0 := by
  obtain ⟨hiso, _ht, hx⟩ := hS
  have key : BvC (S ((0, 0, v) : STVC)) (mSpaceUnit : STVC) = 0 := by
    rw [← hx, hiso ((0, 0, v) : STVC) (mSpaceUnit : STVC), bvC_oct_space]
  have hval : BvC (S ((0, 0, v) : STVC)) (mSpaceUnit : STVC) = -(S ((0, 0, v) : STVC)).2.1 := by
    simp only [BvC, mSpaceUnit, gFormC_zero_right']; ring
  rw [hval] at key
  linarith [key]

/-- ★★ THE GAUGE CONTENT: the octonion-block component of a stabilizer element preserves the Born
    form `gFormC`. For block vectors `(0,0,v)`, `(0,0,w)`, the `BvC`-isometry identity
    `BvC (S(0,0,v))(S(0,0,w)) = BvC (0,0,v)(0,0,w)` collapses (the time/space components of the
    images vanish, `octStab_time_comp_zero`/`octStab_space_comp_zero`) to
    `−gFormC (S(0,0,v)).2.2 (S(0,0,w)).2.2 = −gFormC v w`, i.e. the induced block map is a
    `gFormC`-isometry — the internal-symmetry (gauge) group SO(8)⊃Spin(7)⊃G₂=Aut(O). -/
theorem octStab_block_gFormC_isom {S : Module.End Cut STVC} (hS : IsOctStab S) (v w : O Cut) :
    gFormC (S ((0, 0, v) : STVC)).2.2 (S ((0, 0, w) : STVC)).2.2 = gFormC v w := by
  obtain ⟨hiso, ht, hx⟩ := hS
  have hbase : BvC (S ((0, 0, v) : STVC)) (S ((0, 0, w) : STVC))
      = BvC ((0, 0, v) : STVC) ((0, 0, w) : STVC) := hiso _ _
  have htv := octStab_time_comp_zero ⟨hiso, ht, hx⟩ v
  have hxv := octStab_space_comp_zero ⟨hiso, ht, hx⟩ v
  -- expand both sides of hbase
  have hL : BvC (S ((0, 0, v) : STVC)) (S ((0, 0, w) : STVC))
      = (S ((0, 0, v) : STVC)).1 * (S ((0, 0, w) : STVC)).1
        - (S ((0, 0, v) : STVC)).2.1 * (S ((0, 0, w) : STVC)).2.1
        - gFormC (S ((0, 0, v) : STVC)).2.2 (S ((0, 0, w) : STVC)).2.2 := rfl
  have hR : BvC ((0, 0, v) : STVC) ((0, 0, w) : STVC) = - gFormC v w := by
    show (0:Cut) * 0 - 0 * 0 - gFormC v w = - gFormC v w; ring
  rw [hL, htv, hxv, hR] at hbase
  -- hbase : 0 * (...).1 - 0 * (...).2.1 - gFormC ... = - gFormC v w
  rw [zero_mul, zero_mul] at hbase
  linarith [hbase]

end

end Phys.Algebra.N137Probe
