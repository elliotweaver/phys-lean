import Phys.Foundation.ContinuumTrig

namespace Phys.Foundation
namespace ContinuumQ
open scoped BigOperators
noncomputable section

-- Boundedness from the banked Pythagorean identity alone (no addition formula needed).
theorem cutCos_sq_le_one (x : Cut) : cutCos x * cutCos x ≤ 1 := by
  have h := cutSin_sq_add_cutCos_sq x
  nlinarith [mul_self_nonneg (cutSin x)]

theorem cutSin_sq_le_one (x : Cut) : cutSin x * cutSin x ≤ 1 := by
  have h := cutSin_sq_add_cutCos_sq x
  nlinarith [mul_self_nonneg (cutCos x)]

theorem cutCos_le_one (x : Cut) : cutCos x ≤ 1 := by
  nlinarith [cutCos_sq_le_one x, mul_self_nonneg (cutCos x - 1), mul_self_nonneg (cutCos x + 1)]

theorem neg_one_le_cutCos (x : Cut) : -1 ≤ cutCos x := by
  nlinarith [cutCos_sq_le_one x, mul_self_nonneg (cutCos x - 1), mul_self_nonneg (cutCos x + 1)]

theorem cutSin_le_one (x : Cut) : cutSin x ≤ 1 := by
  nlinarith [cutSin_sq_le_one x, mul_self_nonneg (cutSin x - 1), mul_self_nonneg (cutSin x + 1)]

theorem neg_one_le_cutSin (x : Cut) : -1 ≤ cutSin x := by
  nlinarith [cutSin_sq_le_one x, mul_self_nonneg (cutSin x - 1), mul_self_nonneg (cutSin x + 1)]

theorem abs_cutCos_le_one (x : Cut) : |cutCos x| ≤ 1 :=
  abs_le.mpr ⟨neg_one_le_cutCos x, cutCos_le_one x⟩

theorem abs_cutSin_le_one (x : Cut) : |cutSin x| ≤ 1 :=
  abs_le.mpr ⟨neg_one_le_cutSin x, cutSin_le_one x⟩

end
end ContinuumQ
end Phys.Foundation
