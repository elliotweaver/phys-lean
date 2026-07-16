import Phys.Algebra.BandEdgeList
import Phys.Algebra.GenerationMassRatiosNumeric
import Mathlib.Tactic

namespace Z6Probe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.AbsMass
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) scale-bundle cancellation
theorem absRatio_02 : absMass0 / absMass2 = mass0 / mass2 := by
  unfold absMass0 absMass2
  exact mul_div_mul_left mass0 mass2 massScale_ne_zero

theorem absRatio_21 : absMass2 / absMass1 = mass2 / mass1 := by
  unfold absMass2 absMass1
  exact mul_div_mul_left mass2 mass1 massScale_ne_zero

-- positivity of the mass ratios (needed for cutLog_mul)
theorem mr02_pos : (0 : Cut) < mass0 / mass2 := div_pos mass0_pos mass2_pos
theorem mr21_pos : (0 : Cut) < mass2 / mass1 := div_pos mass2_pos mass1_pos

-- (C) telescoping: totalScreening of the two lepton sub-bands = one bandScreen of mass0/mass1
def leptonTail (d : Cut) : List (Cut × Cut) :=
  [(d, absMass0 / absMass2), (d, absMass2 / absMass1)]

theorem telescope (d : Cut) :
    totalScreening (leptonTail d) = bandScreen d (mass0 / mass1) := by
  unfold leptonTail totalScreening
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
  rw [absRatio_02, absRatio_21]
  unfold bandScreen
  -- κ·d·cutLog(m0/m2) + κ·d·cutLog(m2/m1) = κ·d·cutLog(m0/m1)
  have hlog : cutLog (mass0 / mass2) + cutLog (mass2 / mass1) = cutLog (mass0 / mass1) := by
    rw [← cutLog_mul mr02_pos mr21_pos]
    congr 1
    have h1 : mass1 ≠ 0 := ne_of_gt mass1_pos
    have h2 : mass2 ≠ 0 := ne_of_gt mass2_pos
    field_simp
  -- goal: κ*d*cutLog(m0/m2) + κ*d*cutLog(m2/m1) = κ*d*cutLog(m0/m1)
  have : kappaLeading * d * cutLog (mass0/mass2) + kappaLeading * d * cutLog (mass2/mass1)
       = kappaLeading * d * (cutLog (mass0/mass2) + cutLog (mass2/mass1)) := by ring
  rw [this, hlog]

end
end Z6Probe
