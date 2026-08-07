/-
  Certificates.GaussFiberCert145 — fiber-h=145 EXCLUSION certificate for
  D = −24169503 (first odd-disc fundamental above X₀(145)).
  145 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −24169503 has size > 145,
  so h(−24169503) ≥ 146 — D is excluded from every fiber ≤ 145.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert145
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 11, 17, 19, 23, 29, 31, 37, 43, 47, 61, 67, 73, 79, 89, 101, 107, 109, 127, 137, 149, 151, 157, 179, 197, 211, 257, 271, 283, 293, 311, 313, 337, 349, 367, 421, 431, 439, 449, 457, 461, 487, 491, 503, 521, 523, 547, 557, 569, 577, 587, 593, 599, 601, 613, 619, 647, 661, 673, 683, 691, 701, 719, 739, 751, 757, 761, 787, 823, 857, 859, 863, 877, 883, 907, 911, 929, 953, 967, 971, 983, 997, 1013, 1021, 1031, 1039, 1061, 1069, 1087, 1091, 1103, 1129, 1151, 1171, 1187, 1193, 1201, 1249, 1259, 1279, 1283, 1289, 1291, 1297, 1301, 1303, 1361, 1367, 1373, 1399, 1429, 1433, 1487, 1489, 1499, 1523, 1531, 1543, 1549, 1553, 1609, 1619, 1621, 1627, 1637, 1657, 1663, 1667, 1697, 1699, 1723, 1831, 1867, 1871, 1873, 1913, 1933, 1949, 1951, 1973, 1993, 1999, 2011, 2029, 2039]

theorem ps_pairwise : List.Pairwise (· ≠ ·) ps := by
  apply chain_lt_pairwise_ne
  unfold ps
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -24169503) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -24169503 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    145 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -24169503) (c₀ := 6042376) (ps := ps) (h := 145)
  · norm_num
  · norm_num
  · exact hpw
  · exact hmem
  · exact hcomplete
  · exact hpfL
  · exact hpfa
  · exact ps_pairwise
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> norm_num
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> norm_num
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> [exact ⟨1, 2014126, by norm_num⟩; exact ⟨3, 549308, by norm_num⟩; exact ⟨1, 355434, by norm_num⟩; exact ⟨6, 318022, by norm_num⟩; exact ⟨0, 262712, by norm_num⟩; exact ⟨2, 208358, by norm_num⟩; exact ⟨4, 194916, by norm_num⟩; exact ⟨4, 163308, by norm_num⟩; exact ⟨12, 140524, by norm_num⟩; exact ⟨11, 128564, by norm_num⟩; exact ⟨25, 99066, by norm_num⟩; exact ⟨27, 90196, by norm_num⟩; exact ⟨16, 82776, by norm_num⟩; exact ⟨25, 76494, by norm_num⟩; exact ⟨3, 67892, by norm_num⟩; exact ⟨45, 59846, by norm_num⟩; exact ⟨18, 56474, by norm_num⟩; exact ⟨43, 55452, by norm_num⟩; exact ⟨5, 47578, by norm_num⟩; exact ⟨20, 44108, by norm_num⟩; exact ⟨47, 40568, by norm_num⟩; exact ⟨18, 40018, by norm_num⟩; exact ⟨15, 38488, by norm_num⟩; exact ⟨17, 33758, by norm_num⟩; exact ⟨34, 30678, by norm_num⟩; exact ⟨48, 28648, by norm_num⟩; exact ⟨116, 23564, by norm_num⟩; exact ⟨50, 22306, by norm_num⟩; exact ⟨15, 21352, by norm_num⟩; exact ⟨120, 20672, by norm_num⟩; exact ⟨144, 19496, by norm_num⟩; exact ⟨138, 19366, by norm_num⟩; exact ⟨137, 17986, by norm_num⟩; exact ⟨14, 17314, by norm_num⟩; exact ⟨181, 16554, by norm_num⟩; exact ⟨138, 14398, by norm_num⟩; exact ⟨84, 14036, by norm_num⟩; exact ⟨4, 13764, by norm_num⟩; exact ⟨141, 13502, by norm_num⟩; exact ⟨31, 13224, by norm_num⟩; exact ⟨47, 13112, by norm_num⟩; exact ⟨185, 12478, by norm_num⟩; exact ⟨223, 12408, by norm_num⟩; exact ⟨234, 12122, by norm_num⟩; exact ⟨13, 11598, by norm_num⟩; exact ⟨81, 11566, by norm_num⟩; exact ⟨72, 11056, by norm_num⟩; exact ⟨176, 10904, by norm_num⟩; exact ⟨159, 10664, by norm_num⟩; exact ⟨33, 10474, by norm_num⟩; exact ⟨50, 10298, by norm_num⟩; exact ⟨115, 10212, by norm_num⟩; exact ⟨240, 10184, by norm_num⟩; exact ⟨277, 10182, by norm_num⟩; exact ⟨233, 9946, by norm_num⟩; exact ⟨193, 9822, by norm_num⟩; exact ⟨56, 9344, by norm_num⟩; exact ⟨282, 9262, by norm_num⟩; exact ⟨213, 9046, by norm_num⟩; exact ⟨59, 8852, by norm_num⟩; exact ⟨72, 8752, by norm_num⟩; exact ⟨76, 8628, by norm_num⟩; exact ⟨76, 8412, by norm_num⟩; exact ⟨92, 8188, by norm_num⟩; exact ⟨248, 8128, by norm_num⟩; exact ⟨182, 8026, by norm_num⟩; exact ⟨344, 8096, by norm_num⟩; exact ⟨14, 7678, by norm_num⟩; exact ⟨9, 7342, by norm_num⟩; exact ⟨147, 7076, by norm_num⟩; exact ⟨370, 7194, by norm_num⟩; exact ⟨111, 7016, by norm_num⟩; exact ⟨111, 6904, by norm_num⟩; exact ⟨129, 6862, by norm_num⟩; exact ⟨225, 6718, by norm_num⟩; exact ⟨275, 6716, by norm_num⟩; exact ⟨316, 6612, by norm_num⟩; exact ⟨295, 6432, by norm_num⟩; exact ⟨231, 6304, by norm_num⟩; exact ⟨465, 6446, by norm_num⟩; exact ⟨390, 6302, by norm_num⟩; exact ⟨251, 6124, by norm_num⟩; exact ⟨268, 6036, by norm_num⟩; exact ⟨416, 6088, by norm_num⟩; exact ⟨329, 5966, by norm_num⟩; exact ⟨376, 5952, by norm_num⟩; exact ⟨274, 5766, by norm_num⟩; exact ⟨101, 5662, by norm_num⟩; exact ⟨520, 5808, by norm_num⟩; exact ⟨422, 5702, by norm_num⟩; exact ⟨357, 5594, by norm_num⟩; exact ⟨82, 5358, by norm_num⟩; exact ⟨450, 5426, by norm_num⟩; exact ⟨481, 5358, by norm_num⟩; exact ⟨232, 5136, by norm_num⟩; exact ⟨210, 5102, by norm_num⟩; exact ⟨32, 5032, by norm_num⟩; exact ⟨563, 5092, by norm_num⟩; exact ⟨247, 4848, by norm_num⟩; exact ⟨353, 4822, by norm_num⟩; exact ⟨386, 4826, by norm_num⟩; exact ⟨90, 4694, by norm_num⟩; exact ⟨421, 4818, by norm_num⟩; exact ⟨454, 4818, by norm_num⟩; exact ⟨45, 4646, by norm_num⟩; exact ⟨521, 4846, by norm_num⟩; exact ⟨256, 4488, by norm_num⟩; exact ⟨304, 4488, by norm_num⟩; exact ⟨543, 4616, by norm_num⟩; exact ⟨606, 4582, by norm_num⟩; exact ⟨89, 4234, by norm_num⟩; exact ⟨440, 4352, by norm_num⟩; exact ⟨668, 4364, by norm_num⟩; exact ⟨393, 4162, by norm_num⟩; exact ⟨429, 4154, by norm_num⟩; exact ⟨229, 4002, by norm_num⟩; exact ⟨251, 3988, by norm_num⟩; exact ⟨3, 3916, by norm_num⟩; exact ⟨650, 4174, by norm_num⟩; exact ⟨287, 3944, by norm_num⟩; exact ⟨742, 4098, by norm_num⟩; exact ⟨54, 3734, by norm_num⟩; exact ⟨403, 3828, by norm_num⟩; exact ⟨449, 3838, by norm_num⟩; exact ⟨193, 3714, by norm_num⟩; exact ⟨811, 4044, by norm_num⟩; exact ⟨451, 3756, by norm_num⟩; exact ⟨672, 3896, by norm_num⟩; exact ⟨277, 3606, by norm_num⟩; exact ⟨561, 3742, by norm_num⟩; exact ⟨741, 3826, by norm_num⟩; exact ⟨637, 3522, by norm_num⟩; exact ⟨54, 3238, by norm_num⟩; exact ⟨561, 3398, by norm_num⟩; exact ⟨220, 3252, by norm_num⟩; exact ⟨741, 3446, by norm_num⟩; exact ⟨13, 3126, by norm_num⟩; exact ⟨58, 3102, by norm_num⟩; exact ⟨713, 3358, by norm_num⟩; exact ⟨485, 3182, by norm_num⟩; exact ⟨91, 3036, by norm_num⟩; exact ⟨773, 3322, by norm_num⟩; exact ⟨562, 3162, by norm_num⟩; exact ⟨168, 2992, by norm_num⟩; exact ⟨845, 3314, by norm_num⟩]
  · show 145 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert145
