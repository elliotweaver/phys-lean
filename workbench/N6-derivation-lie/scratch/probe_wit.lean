import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeWit
attribute [local instance] CD.narCD CD.srCD

-- ad_q as a function on H ℚ
noncomputable def adq (q : H ℚ) : H ℚ → H ℚ := fun x => q * x - x * q

-- THE NONZERO CHECK, theory-native (no coordinate bash): ad_{e2}(iota J) ≠ 0,
-- because e2 and iota J do NOT commute (banked iota_e2_comm_iff + J ≠ star J).
example : adq (CD.e2 : H ℚ) (ιJ ℚ) ≠ 0 := by
  unfold adq ιJ
  rw [sub_ne_zero]
  intro h
  -- h : e2 * iota J = iota J * e2 ; contradicts iota_e2_comm_iff (J ≠ star J)
  have hcomm : CD.iota (Dbl.J : Dbl ℚ) * (CD.e2 : H ℚ) = CD.e2 * CD.iota (Dbl.J : Dbl ℚ) := h.symm
  rw [CD.iota_e2_comm_iff] at hcomm
  exact Dbl.J_ne_star_J (by norm_num) hcomm

-- additive hom for ad_q
noncomputable def adqHom (q : H ℚ) : H ℚ →+ H ℚ :=
  AddMonoidHom.mk' (fun x => q * x - x * q) (by intro a b; simp [mul_add, add_mul]; abel)

-- lift to additive endo of O ℚ
noncomputable def dliftHom (δ : H ℚ →+ H ℚ) : O ℚ →+ O ℚ :=
  AddMonoidHom.mk' (fun z => (⟨δ z.re, δ z.im⟩ : O ℚ)) (by
    intro a b; ext <;> simp [CD.add_re, CD.add_im, map_add])

example (δ : O ℚ →+ O ℚ) : O ℚ →ₗ[ℤ] O ℚ := δ.toIntLinearMap

end ProbeWit
