import Phys.Algebra.DerivationBracket
import Mathlib.Tactic

namespace Phys.Algebra.Scratch
open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ★ star as a ℚ-linear endomorphism of O ℚ.
noncomputable def starL : Module.End ℚ (O ℚ) where
  toFun := star
  map_add' := star_add
  map_smul' := by
    intro q x
    show star (q • x) = q • star x
    ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

@[simp] theorem starL_apply (x : O ℚ) : starL x = star x := rfl

-- the imaginary subspace ImO = ker(starL + 1)
noncomputable def ImO : Submodule ℚ (O ℚ) := LinearMap.ker (starL + 1)

theorem mem_ImO {x : O ℚ} : x ∈ ImO ↔ star x = -x := by
  simp only [ImO, LinearMap.mem_ker, LinearMap.add_apply, starL_apply,
    Module.End.one_apply]
  constructor
  · intro h; linear_combination (norm := abel) h
  · intro h; rw [h]; abel

-- the range of (starL + 1) is exactly ℚ • 1 (one-dimensional), from trace_id.
theorem starL_add_one_apply (x : O ℚ) : (starL + 1) x = (2 * reQ x) • (1 : O ℚ) := by
  show star x + x = _
  rw [add_comm]; exact trace_id x

#check @LinearMap.finrank_range_add_finrank_ker
