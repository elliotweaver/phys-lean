import Phys.Algebra.CabibboMixingNumeric
import Mathlib.Tactic

namespace Phys.Algebra.C3Scratch

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DepthDressedMixing
open Phys.Algebra.HJ
open Phys.Algebra.CabibboMixing

noncomputable section

def eCross (A B : Cut) : Cut := A * B * (1 - survivalCut)
def eNu (A B : Cut) : Cut := A ^ 2 + B ^ 2
def eNd (A B : Cut) : Cut := A ^ 2 + (survivalCut * B) ^ 2
def eAligned (A B : Cut) : Cut := A * A + B * (survivalCut * B)
def eMix2 (A B : Cut) : Cut := (eCross A B) ^ 2 / (eNu A B * eNd A B)
def eAln2 (A B : Cut) : Cut := (eAligned A B) ^ 2 / (eNu A B * eNd A B)

theorem eNu_pos (A B : Cut) (hA : 0 < A) : 0 < eNu A B := by
  unfold eNu; nlinarith [pow_pos hA 2, sq_nonneg B]
theorem eNd_pos (A B : Cut) (hA : 0 < A) : 0 < eNd A B := by
  unfold eNd; nlinarith [pow_pos hA 2, sq_nonneg (survivalCut * B)]
theorem eDen_pos (A B : Cut) (hA : 0 < A) : 0 < eNu A B * eNd A B :=
  mul_pos (eNu_pos A B hA) (eNd_pos A B hA)
theorem eCross_pos (A B : Cut) (hA : 0 < A) (hB : 0 < B) : 0 < eCross A B := by
  unfold eCross; rw [survivalCut_val]; nlinarith [mul_pos hA hB]

theorem e_brahmagupta (A B : Cut) :
    (eCross A B) ^ 2 + (eAligned A B) ^ 2 = eNu A B * eNd A B := by
  unfold eCross eAligned eNu eNd; rw [survivalCut_val]; ring
theorem e_unitarity (A B : Cut) (hA : 0 < A) : eMix2 A B + eAln2 A B = 1 := by
  unfold eMix2 eAln2
  rw [← add_div, e_brahmagupta, div_self (ne_of_gt (eDen_pos A B hA))]

theorem eMix2_lt (A1 B1 A2 B2 : Cut) (hA1 : 0 < A1) (hA2 : 0 < A2)
    (hfac1 : A2 ^ 2 * B1 ^ 2 < A1 ^ 2 * B2 ^ 2)
    (hfac2 : (4 / 9) * (B1 ^ 2 * B2 ^ 2) < A1 ^ 2 * A2 ^ 2) :
    eMix2 A1 B1 < eMix2 A2 B2 := by
  unfold eMix2
  rw [div_lt_div_iff₀ (eDen_pos A1 B1 hA1) (eDen_pos A2 B2 hA2)]
  unfold eCross eNu eNd
  rw [survivalCut_val]
  nlinarith [mul_pos (sub_pos.mpr hfac1) (sub_pos.mpr hfac2)]

-- squared helpers (mass* defeq b_^2)
theorem b0sq_lo : (237943 : Cut) / 100000 * (237943 / 100000) ≤ b0 ^ 2 := mass0_lo
theorem b0sq_hi : b0 ^ 2 ≤ (237944 : Cut) / 100000 * (237944 / 100000) := mass0_hi
theorem b1sq_lo : (4034 : Cut) / 100000 * (4034 / 100000) ≤ b1 ^ 2 := mass1_lo
theorem b1sq_hi : b1 ^ 2 ≤ (40365 : Cut) / 1000000 * (40365 / 1000000) := mass1_hi
theorem b2sq_lo : (5802 : Cut) / 10000 * (5802 / 10000) ≤ b2 ^ 2 := mass2_lo
theorem b2sq_hi : b2 ^ 2 ≤ (58022 : Cut) / 100000 * (58022 / 100000) := mass2_hi

-- product helpers
theorem b2b1_lo : (23405 : Cut) / 1000000 ≤ b2 * b1 :=
  le_trans (by norm_num) (mul_le_mul b2_lo b1_lo (by norm_num) (le_of_lt b2_pos))
theorem b2b1_hi : b2 * b1 ≤ (23421 : Cut) / 1000000 :=
  le_trans (mul_le_mul b2_hi b1_hi (le_of_lt b1_pos) (by norm_num)) (by norm_num)
theorem b0b1_lo : (95986 : Cut) / 1000000 ≤ b0 * b1 :=
  le_trans (by norm_num) (mul_le_mul b0_lo b1_lo (by norm_num) (le_of_lt b0_pos))
theorem b0b1_hi : b0 * b1 ≤ (96047 : Cut) / 1000000 :=
  le_trans (mul_le_mul b0_hi b1_hi (le_of_lt b1_pos) (by norm_num)) (by norm_num)

def mix12 : Cut := eMix2 b0 b2
def mix23 : Cut := eMix2 b2 b1
def mix13 : Cut := eMix2 b0 b1

theorem mix12_eq_cabMix2 : mix12 = cabMix2 := by
  unfold mix12 eMix2 eCross eNu eNd cabMix2 cabCross cabNu cabNd dressedDown
  ring

-- cross brackets
theorem cross23_lo : (78016 : Cut) / 10000000 ≤ eCross b2 b1 := by
  unfold eCross; rw [survivalCut_val]; nlinarith [b2b1_lo]
theorem cross23_hi : eCross b2 b1 ≤ (78070 : Cut) / 10000000 := by
  unfold eCross; rw [survivalCut_val]; nlinarith [b2b1_hi]
theorem cross13_lo : (319953 : Cut) / 10000000 ≤ eCross b0 b1 := by
  unfold eCross; rw [survivalCut_val]; nlinarith [b0b1_lo]
theorem cross13_hi : eCross b0 b1 ≤ (320157 : Cut) / 10000000 := by
  unfold eCross; rw [survivalCut_val]; nlinarith [b0b1_hi]

-- Nu/Nd brackets
theorem eNd_eq (A B : Cut) : eNd A B = A ^ 2 + (4 / 9) * B ^ 2 := by
  unfold eNd; rw [survivalCut_val]; ring
theorem Nu23_lo : (338259 : Cut) / 1000000 ≤ eNu b2 b1 := by
  unfold eNu; nlinarith [b2sq_lo, b1sq_lo]
theorem Nu23_hi : eNu b2 b1 ≤ (338285 : Cut) / 1000000 := by
  unfold eNu; nlinarith [b2sq_hi, b1sq_hi]
theorem Nd23_lo : (337355 : Cut) / 1000000 ≤ eNd b2 b1 := by
  rw [eNd_eq]; nlinarith [b2sq_lo, b1sq_lo]
theorem Nd23_hi : eNd b2 b1 ≤ (337380 : Cut) / 1000000 := by
  rw [eNd_eq]; nlinarith [b2sq_hi, b1sq_hi]
theorem Nu13_lo : (5663314 : Cut) / 1000000 ≤ eNu b0 b1 := by
  unfold eNu; nlinarith [b0sq_lo, b1sq_lo]
theorem Nu13_hi : eNu b0 b1 ≤ (5663365 : Cut) / 1000000 := by
  unfold eNu; nlinarith [b0sq_hi, b1sq_hi]
theorem Nd13_lo : (5662410 : Cut) / 1000000 ≤ eNd b0 b1 := by
  rw [eNd_eq]; nlinarith [b0sq_lo, b1sq_lo]
theorem Nd13_hi : eNd b0 b1 ≤ (5662459 : Cut) / 1000000 := by
  rw [eNd_eq]; nlinarith [b0sq_hi, b1sq_hi]

theorem mix23_pos : (0 : Cut) < mix23 := by
  unfold mix23 eMix2
  exact div_pos (pow_pos (eCross_pos b2 b1 b2_pos b1_pos) 2) (eDen_pos b2 b1 b2_pos)
theorem mix13_pos : (0 : Cut) < mix13 := by
  unfold mix13 eMix2
  exact div_pos (pow_pos (eCross_pos b0 b1 b0_pos b1_pos) 2) (eDen_pos b0 b1 b0_pos)

theorem mix23_lo : (5332 : Cut) / 10000000 ≤ mix23 := by
  unfold mix23 eMix2
  have hcross2 : ((78016 : Cut) / 10000000) ^ 2 ≤ (eCross b2 b1) ^ 2 := by
    have h0 : (0 : Cut) ≤ (78016 : Cut) / 10000000 := by norm_num
    nlinarith [cross23_lo, h0]
  have hden : eNu b2 b1 * eNd b2 b1 ≤ ((338285 : Cut) / 1000000) * ((337380 : Cut) / 1000000) :=
    mul_le_mul Nu23_hi Nd23_hi (le_of_lt (eNd_pos b2 b1 b2_pos)) (by norm_num)
  rw [le_div_iff₀ (eDen_pos b2 b1 b2_pos)]
  nlinarith [hcross2, hden]
theorem mix23_hi : mix23 ≤ (5342 : Cut) / 10000000 := by
  unfold mix23 eMix2
  have hcross2 : (eCross b2 b1) ^ 2 ≤ ((78070 : Cut) / 10000000) ^ 2 := by
    nlinarith [cross23_hi, eCross_pos b2 b1 b2_pos b1_pos]
  have hden : ((338259 : Cut) / 1000000) * ((337355 : Cut) / 1000000) ≤ eNu b2 b1 * eNd b2 b1 :=
    mul_le_mul Nu23_lo Nd23_lo (by norm_num) (le_of_lt (eNu_pos b2 b1 b2_pos))
  rw [div_le_iff₀ (eDen_pos b2 b1 b2_pos)]
  nlinarith [hcross2, hden]

theorem mix13_lo : (3191 : Cut) / 100000000 ≤ mix13 := by
  unfold mix13 eMix2
  have hcross2 : ((319953 : Cut) / 10000000) ^ 2 ≤ (eCross b0 b1) ^ 2 := by
    have h0 : (0 : Cut) ≤ (319953 : Cut) / 10000000 := by norm_num
    nlinarith [cross13_lo, h0]
  have hden : eNu b0 b1 * eNd b0 b1 ≤ ((5663365 : Cut) / 1000000) * ((5662459 : Cut) / 1000000) :=
    mul_le_mul Nu13_hi Nd13_hi (le_of_lt (eNd_pos b0 b1 b0_pos)) (by norm_num)
  rw [le_div_iff₀ (eDen_pos b0 b1 b0_pos)]
  nlinarith [hcross2, hden]
theorem mix13_hi : mix13 ≤ (3197 : Cut) / 100000000 := by
  unfold mix13 eMix2
  have hcross2 : (eCross b0 b1) ^ 2 ≤ ((320157 : Cut) / 10000000) ^ 2 := by
    nlinarith [cross13_hi, eCross_pos b0 b1 b0_pos b1_pos]
  have hden : ((5663314 : Cut) / 1000000) * ((5662410 : Cut) / 1000000) ≤ eNu b0 b1 * eNd b0 b1 :=
    mul_le_mul Nu13_lo Nd13_lo (by norm_num) (le_of_lt (eNu_pos b0 b1 b0_pos))
  rw [div_le_iff₀ (eDen_pos b0 b1 b0_pos)]
  nlinarith [hcross2, hden]

-- THE HIERARCHY ORDER via monotone comparison, forced by amplitude order b0 > b2 > b1
theorem mix12_gt_mix23 : mix23 < mix12 := by
  unfold mix12 mix23
  apply eMix2_lt b2 b1 b0 b2 b2_pos b0_pos
  · have h1 : b0 ^ 2 * b1 ^ 2 ≤ ((237944 : Cut)/100000*(237944/100000)) * ((40365:Cut)/1000000*(40365/1000000)) :=
      mul_le_mul b0sq_hi b1sq_hi (by positivity) (by norm_num)
    have h2 : ((5802:Cut)/10000*(5802/10000)) * ((5802:Cut)/10000*(5802/10000)) ≤ b2 ^ 2 * b2 ^ 2 :=
      mul_le_mul b2sq_lo b2sq_lo (by norm_num) (by positivity)
    nlinarith [h1, h2]
  · have h1 : (4/9) * (b1 ^ 2 * b2 ^ 2) ≤ (4/9) * (((40365:Cut)/1000000*(40365/1000000)) * ((58022:Cut)/100000*(58022/100000))) := by
      have := mul_le_mul b1sq_hi b2sq_hi (by positivity) (by norm_num)
      nlinarith [this]
    have h2 : ((5802:Cut)/10000*(5802/10000)) * ((237943:Cut)/100000*(237943/100000)) ≤ b2 ^ 2 * b0 ^ 2 :=
      mul_le_mul b2sq_lo b0sq_lo (by norm_num) (by positivity)
    nlinarith [h1, h2]
theorem mix23_gt_mix13 : mix13 < mix23 := by
  unfold mix23 mix13
  apply eMix2_lt b0 b1 b2 b1 b0_pos b2_pos
  · have h1 : b2 ^ 2 * b1 ^ 2 ≤ ((58022:Cut)/100000*(58022/100000)) * ((40365:Cut)/1000000*(40365/1000000)) :=
      mul_le_mul b2sq_hi b1sq_hi (by positivity) (by norm_num)
    have h2 : ((237943:Cut)/100000*(237943/100000)) * ((4034:Cut)/100000*(4034/100000)) ≤ b0 ^ 2 * b1 ^ 2 :=
      mul_le_mul b0sq_lo b1sq_lo (by norm_num) (by positivity)
    nlinarith [h1, h2]
  · have h1 : (4/9) * (b1 ^ 2 * b1 ^ 2) ≤ (4/9) * (((40365:Cut)/1000000*(40365/1000000)) * ((40365:Cut)/1000000*(40365/1000000))) := by
      have := mul_le_mul b1sq_hi b1sq_hi (by positivity) (by norm_num)
      nlinarith [this]
    have h2 : ((237943:Cut)/100000*(237943/100000)) * ((5802:Cut)/10000*(5802/10000)) ≤ b0 ^ 2 * b2 ^ 2 :=
      mul_le_mul b0sq_lo b2sq_lo (by norm_num) (by positivity)
    nlinarith [h1, h2]

end
end Phys.Algebra.C3Scratch
