import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic
#check @Rat.num_pow
#check @Rat.den_pow
#check @Rat.num_intCast
#check @Rat.den_intCast
-- A reduced q with q^2 = 2: den(q^2)=den(q)^2=den(2)=1 => den q =1 => q integer
example (q : ℚ) (h : q ^ 2 = 2) : False := by
  have hd : (q ^ 2).den = 1 := by rw [h]; rfl
  rw [Rat.den_pow] at hd
  -- hd : q.den ^ 2 = 1
  have hden1 : q.den = 1 := by nlinarith [Nat.one_le_iff_ne_zero.mpr q.den_nz, hd]
  -- now q is integer: q.num^2 = 2
  have hnum : (q.num) ^ 2 = 2 := by
    have := Rat.num_pow q 2
    rw [h] at this
    simpa [hden1] using this
  -- no integer squares to 2
  interval_cases q.num <;> omega
