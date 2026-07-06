import Mathlib.Tactic

def sinSqMix {F : Type*} [Field F] (ms ml : F) : F := ms / (ms + ml)

-- candidate 1: one_add_div + div_div_div route
theorem c1 {F : Type*} [Field F] (ms ml : F) (hml : ml ≠ 0) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml = (ms / ml) / (1 + ms / ml) := by
  unfold sinSqMix
  rw [one_add_div hml, div_div_div_cancel_right₀]
  rw [add_comm ml ms]

-- candidate 2: symm + div_eq_iff chain
theorem c2 {F : Type*} [Field F] (ms ml : F) (hml : ml ≠ 0) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml = (ms / ml) / (1 + ms / ml) := by
  have hone : (1 : F) + ms / ml ≠ 0 := by
    have h : (1 : F) + ms / ml = (ml + ms) / ml := by field_simp
    rw [h, add_comm ml ms]; exact div_ne_zero hsum hml
  unfold sinSqMix
  rw [div_eq_div_iff hsum hone]
  field_simp
  ring
