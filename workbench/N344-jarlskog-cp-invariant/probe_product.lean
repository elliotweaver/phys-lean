import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra

noncomputable section

-- assume the banked factor brackets (proven in probe_factors)
variable (g12 g23 h13 : Cut)

-- product of three positive bracketed factors: J2 = g12*g23*h13 ∈ [72/1e9, 74/1e9]
-- test the monotone product bound shape
example (hg12lo : (4786:Cut)/1000000 ≤ g12) (hg12hi : g12 ≤ (4797:Cut)/1000000) (hg12p : (0:Cut)<g12)
    (hg23lo : (5295:Cut)/100000 ≤ g23) (hg23hi : g23 ≤ (5305:Cut)/100000) (hg23p : (0:Cut)<g23)
    (hh13lo : (2868:Cut)/10000000 ≤ h13) (hh13hi : h13 ≤ (2879:Cut)/10000000) (hh13p : (0:Cut)<h13) :
    (72:Cut)/1000000000 ≤ g12*g23*h13 ∧ g12*g23*h13 ≤ (74:Cut)/1000000000 := by
  constructor
  · -- lower: product of lowers via mul_le_mul chain
    have p1 : (4786:Cut)/1000000 * ((5295:Cut)/100000) ≤ g12 * g23 :=
      mul_le_mul hg12lo hg23lo (by norm_num) (by linarith)
    have p1p : (0:Cut) ≤ g12 * g23 := by positivity
    have p2 : ((4786:Cut)/1000000 * ((5295:Cut)/100000)) * ((2868:Cut)/10000000) ≤ (g12*g23)*h13 :=
      mul_le_mul p1 hh13lo (by norm_num) p1p
    calc (72:Cut)/1000000000 ≤ ((4786:Cut)/1000000 * ((5295:Cut)/100000)) * ((2868:Cut)/10000000) := by norm_num
      _ ≤ g12*g23*h13 := by rw [mul_assoc]; linarith [p2]
  · have p1 : g12 * g23 ≤ (4797:Cut)/1000000 * ((5305:Cut)/100000) :=
      mul_le_mul hg12hi hg23hi (by linarith) (by norm_num)
    have p1p : (0:Cut) ≤ (4797:Cut)/1000000 * ((5305:Cut)/100000) := by norm_num
    have p2 : (g12*g23)*h13 ≤ ((4797:Cut)/1000000 * ((5305:Cut)/100000)) * ((2879:Cut)/10000000) :=
      mul_le_mul p1 hh13hi (le_of_lt hh13p) p1p
    calc g12*g23*h13 = (g12*g23)*h13 := by rw [mul_assoc]
      _ ≤ ((4797:Cut)/1000000 * ((5305:Cut)/100000)) * ((2879:Cut)/10000000) := p2
      _ ≤ (74:Cut)/1000000000 := by norm_num
