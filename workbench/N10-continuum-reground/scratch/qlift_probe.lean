import Phys.Foundation.OrderedTower
import Mathlib.Tactic

namespace Phys.Foundation
namespace Q

/-! Q-level lift probe: assuming Z.no_sq_two_Z, prove no q : Q has q² = 2. -/

-- stand-in signature (the real one is banked in production)
axiom no_sq_two_Z_stub {x y : Z} (hy : y ≠ 0) : x * x ≠ 2 * (y * y)

/-- `(2 : Q) = ofZ 2`. -/
theorem two_eq_ofZ : (2 : Q) = ofZ 2 := by
  rw [show (2:Q) = 1 + 1 from by ring, show (2:Z) = 1 + 1 from by ring, ofZ_add, ofZ_one]

theorem no_q_sq_two : ¬ ∃ q : Q, q * q = 2 := by
  rintro ⟨q, hq⟩
  revert hq
  refine Q.ind (fun p d => ?_) q
  intro hq
  -- mk p d * mk p d = mk (p*p) (d*d) = 2 = ofZ 2 = mk 2 1
  rw [mk_mul_mk, two_eq_ofZ, ofZ_def] at hq
  -- exact': (p*p) * 1 = 2 * (d*d).1  i.e. p*p*(NZ.one.1) = 2 * (NZ.mul d d).1
  have hcross := exact' hq
  simp only [NZ.mul_val, NZ.one_val, mul_one] at hcross
  -- hcross : p * p = 2 * (d.1 * d.1)
  exact no_sq_two_Z_stub d.2 hcross

end Q
end Phys.Foundation
