/-
  Certificates.GaussFiberCert143 — fiber-h=143 EXCLUSION certificate for
  D = −22955899 (first odd-disc fundamental above X₀(143)).
  143 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −22955899 has size > 143,
  so h(−22955899) ≥ 144 — D is excluded from every fiber ≤ 143.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert143
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 11, 17, 31, 37, 41, 43, 53, 59, 61, 73, 79, 83, 89, 97, 101, 109, 113, 127, 157, 163, 167, 173, 179, 191, 193, 199, 239, 269, 293, 307, 313, 349, 353, 373, 397, 419, 431, 439, 443, 479, 487, 509, 521, 541, 557, 571, 577, 607, 631, 641, 653, 677, 683, 701, 709, 719, 727, 733, 751, 761, 769, 773, 787, 829, 857, 859, 863, 881, 887, 907, 911, 941, 967, 971, 983, 991, 1009, 1013, 1031, 1033, 1049, 1051, 1087, 1091, 1093, 1097, 1103, 1109, 1117, 1151, 1163, 1171, 1187, 1201, 1231, 1237, 1259, 1277, 1279, 1283, 1289, 1303, 1307, 1319, 1321, 1327, 1373, 1399, 1423, 1427, 1429, 1433, 1439, 1453, 1459, 1481, 1487, 1493, 1499, 1543, 1549, 1553, 1601, 1607, 1613, 1619, 1621, 1657, 1667, 1697, 1699, 1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811, 1831]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -22955899) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -22955899 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    143 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -22955899) (c₀ := 5738975) (ps := ps) (h := 143)
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
    fin_cases hp <;> [exact ⟨0, 1147795, by norm_num⟩; exact ⟨0, 521725, by norm_num⟩; exact ⟨8, 337591, by norm_num⟩; exact ⟨14, 185135, by norm_num⟩; exact ⟨11, 155111, by norm_num⟩; exact ⟨0, 139975, by norm_num⟩; exact ⟨4, 133465, by norm_num⟩; exact ⟨18, 108289, by norm_num⟩; exact ⟨11, 97273, by norm_num⟩; exact ⟨14, 94085, by norm_num⟩; exact ⟨25, 78625, by norm_num⟩; exact ⟨39, 72665, by norm_num⟩; exact ⟨32, 69157, by norm_num⟩; exact ⟨3, 64483, by norm_num⟩; exact ⟨5, 59165, by norm_num⟩; exact ⟨23, 56827, by norm_num⟩; exact ⟨20, 52655, by norm_num⟩; exact ⟨13, 50789, by norm_num⟩; exact ⟨42, 45203, by norm_num⟩; exact ⟨67, 36583, by norm_num⟩; exact ⟨41, 35219, by norm_num⟩; exact ⟨51, 34381, by norm_num⟩; exact ⟨31, 33179, by norm_num⟩; exact ⟨49, 32075, by norm_num⟩; exact ⟨1, 30047, by norm_num⟩; exact ⟨91, 29779, by norm_num⟩; exact ⟨93, 28883, by norm_num⟩; exact ⟨11, 24013, by norm_num⟩; exact ⟨62, 21349, by norm_num⟩; exact ⟨123, 19639, by norm_num⟩; exact ⟨91, 18721, by norm_num⟩; exact ⟨22, 18337, by norm_num⟩; exact ⟨85, 16465, by norm_num⟩; exact ⟨82, 16277, by norm_num⟩; exact ⟨33, 15389, by norm_num⟩; exact ⟨82, 14473, by norm_num⟩; exact ⟨166, 13763, by norm_num⟩; exact ⟨130, 13355, by norm_num⟩; exact ⟨8, 13073, by norm_num⟩; exact ⟨9, 12955, by norm_num⟩; exact ⟨123, 12013, by norm_num⟩; exact ⟨185, 11855, by norm_num⟩; exact ⟨0, 11275, by norm_num⟩; exact ⟨128, 11047, by norm_num⟩; exact ⟨240, 10715, by norm_num⟩; exact ⟨80, 10315, by norm_num⟩; exact ⟨268, 10177, by norm_num⟩; exact ⟨62, 9953, by norm_num⟩; exact ⟨14, 9455, by norm_num⟩; exact ⟨194, 9155, by norm_num⟩; exact ⟨255, 9055, by norm_num⟩; exact ⟨64, 8795, by norm_num⟩; exact ⟨132, 8503, by norm_num⟩; exact ⟨40, 8405, by norm_num⟩; exact ⟨140, 8215, by norm_num⟩; exact ⟨19, 8095, by norm_num⟩; exact ⟨241, 8063, by norm_num⟩; exact ⟨210, 7955, by norm_num⟩; exact ⟨241, 7909, by norm_num⟩; exact ⟨234, 7715, by norm_num⟩; exact ⟨223, 7607, by norm_num⟩; exact ⟨8, 7463, by norm_num⟩; exact ⟨132, 7447, by norm_num⟩; exact ⟨353, 7451, by norm_num⟩; exact ⟨273, 7013, by norm_num⟩; exact ⟨61, 6701, by norm_num⟩; exact ⟨41, 6683, by norm_num⟩; exact ⟨65, 6655, by norm_num⟩; exact ⟨135, 6535, by norm_num⟩; exact ⟨411, 6661, by norm_num⟩; exact ⟨306, 6431, by norm_num⟩; exact ⟨332, 6421, by norm_num⟩; exact ⟨333, 6217, by norm_num⟩; exact ⟨260, 6005, by norm_num⟩; exact ⟨250, 5975, by norm_num⟩; exact ⟨486, 6079, by norm_num⟩; exact ⟨76, 5797, by norm_num⟩; exact ⟨188, 5723, by norm_num⟩; exact ⟨381, 5809, by norm_num⟩; exact ⟨372, 5701, by norm_num⟩; exact ⟨37, 5557, by norm_num⟩; exact ⟨183, 5503, by norm_num⟩; exact ⟨160, 5485, by norm_num⟩; exact ⟨278, 5351, by norm_num⟩; exact ⟨285, 5335, by norm_num⟩; exact ⟨441, 5429, by norm_num⟩; exact ⟨160, 5255, by norm_num⟩; exact ⟨162, 5227, by norm_num⟩; exact ⟨176, 5203, by norm_num⟩; exact ⟨229, 5185, by norm_num⟩; exact ⟨323, 5077, by norm_num⟩; exact ⟨52, 4937, by norm_num⟩; exact ⟨365, 5015, by norm_num⟩; exact ⟨416, 4981, by norm_num⟩; exact ⟨260, 4835, by norm_num⟩; exact ⟨419, 4805, by norm_num⟩; exact ⟨371, 4751, by norm_num⟩; exact ⟨252, 4609, by norm_num⟩; exact ⟨561, 4741, by norm_num⟩; exact ⟨331, 4573, by norm_num⟩; exact ⟨49, 4475, by norm_num⟩; exact ⟨568, 4703, by norm_num⟩; exact ⟨307, 4477, by norm_num⟩; exact ⟨135, 4405, by norm_num⟩; exact ⟨641, 4663, by norm_num⟩; exact ⟨418, 4477, by norm_num⟩; exact ⟨412, 4453, by norm_num⟩; exact ⟨548, 4399, by norm_num⟩; exact ⟨33, 4103, by norm_num⟩; exact ⟨449, 4175, by norm_num⟩; exact ⟨546, 4231, by norm_num⟩; exact ⟨683, 4343, by norm_num⟩; exact ⟨120, 4015, by norm_num⟩; exact ⟨406, 4103, by norm_num⟩; exact ⟨507, 4127, by norm_num⟩; exact ⟨555, 4145, by norm_num⟩; exact ⟨53, 3877, by norm_num⟩; exact ⟨691, 4181, by norm_num⟩; exact ⟨193, 3869, by norm_num⟩; exact ⟨191, 3853, by norm_num⟩; exact ⟨234, 3755, by norm_num⟩; exact ⟨147, 3719, by norm_num⟩; exact ⟨704, 4015, by norm_num⟩; exact ⟨272, 3631, by norm_num⟩; exact ⟨137, 3583, by norm_num⟩; exact ⟨133, 3569, by norm_num⟩; exact ⟨19, 3545, by norm_num⟩; exact ⟨103, 3547, by norm_num⟩; exact ⟨782, 3833, by norm_num⟩; exact ⟨22, 3443, by norm_num⟩; exact ⟨791, 3751, by norm_num⟩; exact ⟨93, 3383, by norm_num⟩; exact ⟨319, 3355, by norm_num⟩; exact ⟨257, 3323, by norm_num⟩; exact ⟨689, 3545, by norm_num⟩; exact ⟨64, 3265, by norm_num⟩; exact ⟨165, 3245, by norm_num⟩; exact ⟨544, 3385, by norm_num⟩; exact ⟨801, 3571, by norm_num⟩; exact ⟨648, 3443, by norm_num⟩; exact ⟨28, 3187, by norm_num⟩; exact ⟨255, 3205, by norm_num⟩; exact ⟨194, 3155, by norm_num⟩]
  · show 143 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert143
