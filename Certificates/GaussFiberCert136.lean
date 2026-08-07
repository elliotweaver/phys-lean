/-
  Certificates.GaussFiberCert136 — fiber-h=136 EXCLUSION certificate for
  D = −21736707 (first odd-disc fundamental above X₀(136)).
  136 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −21736707 has size > 136,
  so h(−21736707) ≥ 137 — D is excluded from every fiber ≤ 136.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert136
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 7, 23, 31, 37, 53, 67, 73, 79, 103, 109, 131, 139, 149, 151, 157, 163, 173, 179, 181, 191, 197, 199, 223, 227, 229, 241, 251, 263, 283, 293, 307, 311, 347, 349, 359, 379, 383, 397, 419, 431, 443, 461, 479, 487, 491, 503, 509, 563, 569, 571, 587, 593, 607, 631, 653, 661, 683, 691, 751, 757, 761, 769, 797, 811, 821, 829, 839, 853, 857, 887, 907, 919, 941, 947, 953, 983, 1009, 1013, 1019, 1031, 1049, 1061, 1063, 1069, 1087, 1117, 1123, 1129, 1153, 1201, 1217, 1223, 1229, 1231, 1249, 1259, 1279, 1297, 1301, 1307, 1321, 1367, 1373, 1399, 1409, 1423, 1427, 1433, 1439, 1451, 1459, 1481, 1483, 1487, 1489, 1543, 1567, 1571, 1579, 1583, 1609, 1613, 1619, 1669, 1697, 1699, 1709, 1721, 1733, 1741, 1747, 1753, 1759, 1783, 1787]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -21736707) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -21736707 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    136 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -21736707) (c₀ := 5434177) (ps := ps) (h := 136)
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
    fin_cases hp <;> [exact ⟨1, 1811393, by norm_num⟩; exact ⟨0, 776311, by norm_num⟩; exact ⟨7, 236271, by norm_num⟩; exact ⟨5, 175297, by norm_num⟩; exact ⟨16, 146877, by norm_num⟩; exact ⟨8, 102533, by norm_num⟩; exact ⟨30, 81121, by norm_num⟩; exact ⟨24, 74449, by norm_num⟩; exact ⟨35, 68803, by norm_num⟩; exact ⟨0, 52759, by norm_num⟩; exact ⟨44, 49873, by norm_num⟩; exact ⟨37, 41493, by norm_num⟩; exact ⟨17, 39097, by norm_num⟩; exact ⟨1, 36471, by norm_num⟩; exact ⟨68, 36019, by norm_num⟩; exact ⟨73, 34647, by norm_num⟩; exact ⟨70, 33369, by norm_num⟩; exact ⟨16, 31413, by norm_num⟩; exact ⟨57, 30377, by norm_num⟩; exact ⟨68, 30049, by norm_num⟩; exact ⟨47, 28463, by norm_num⟩; exact ⟨21, 27587, by norm_num⟩; exact ⟨68, 27331, by norm_num⟩; exact ⟨10, 24369, by norm_num⟩; exact ⟨70, 23961, by norm_num⟩; exact ⟨54, 23743, by norm_num⟩; exact ⟨11, 22549, by norm_num⟩; exact ⟨119, 21707, by norm_num⟩; exact ⟨103, 20703, by norm_num⟩; exact ⟨16, 19203, by norm_num⟩; exact ⟨116, 18593, by norm_num⟩; exact ⟨5, 17701, by norm_num⟩; exact ⟨153, 17549, by norm_num⟩; exact ⟨60, 15671, by norm_num⟩; exact ⟨65, 15583, by norm_num⟩; exact ⟨2, 15137, by norm_num⟩; exact ⟨111, 14371, by norm_num⟩; exact ⟨14, 14189, by norm_num⟩; exact ⟨130, 13731, by norm_num⟩; exact ⟨75, 12983, by norm_num⟩; exact ⟨186, 12689, by norm_num⟩; exact ⟨119, 12299, by norm_num⟩; exact ⟨23, 11789, by norm_num⟩; exact ⟨205, 11433, by norm_num⟩; exact ⟨174, 11221, by norm_num⟩; exact ⟨26, 11069, by norm_num⟩; exact ⟨232, 10911, by norm_num⟩; exact ⟨237, 10787, by norm_num⟩; exact ⟨21, 9653, by norm_num⟩; exact ⟨18, 9551, by norm_num⟩; exact ⟨5, 9517, by norm_num⟩; exact ⟨131, 9287, by norm_num⟩; exact ⟨106, 9183, by norm_num⟩; exact ⟨244, 9051, by norm_num⟩; exact ⟨287, 8743, by norm_num⟩; exact ⟨264, 8429, by norm_num⟩; exact ⟨310, 8367, by norm_num⟩; exact ⟨316, 8103, by norm_num⟩; exact ⟨150, 7897, by norm_num⟩; exact ⟨325, 7377, by norm_num⟩; exact ⟨286, 7287, by norm_num⟩; exact ⟨217, 7203, by norm_num⟩; exact ⟨58, 7071, by norm_num⟩; exact ⟨184, 6861, by norm_num⟩; exact ⟨176, 6739, by norm_num⟩; exact ⟨57, 6623, by norm_num⟩; exact ⟨377, 6727, by norm_num⟩; exact ⟨108, 6491, by norm_num⟩; exact ⟨274, 6459, by norm_num⟩; exact ⟨301, 6447, by norm_num⟩; exact ⟨304, 6231, by norm_num⟩; exact ⟨380, 6151, by norm_num⟩; exact ⟨449, 6133, by norm_num⟩; exact ⟨44, 5777, by norm_num⟩; exact ⟨50, 5741, by norm_num⟩; exact ⟨410, 5879, by norm_num⟩; exact ⟨347, 5651, by norm_num⟩; exact ⟨227, 5437, by norm_num⟩; exact ⟨309, 5459, by norm_num⟩; exact ⟨221, 5381, by norm_num⟩; exact ⟨198, 5309, by norm_num⟩; exact ⟨442, 5367, by norm_num⟩; exact ⟨530, 5387, by norm_num⟩; exact ⟨438, 5293, by norm_num⟩; exact ⟨383, 5221, by norm_num⟩; exact ⟨477, 5209, by norm_num⟩; exact ⟨170, 4891, by norm_num⟩; exact ⟨4, 4839, by norm_num⟩; exact ⟨141, 4831, by norm_num⟩; exact ⟨135, 4729, by norm_num⟩; exact ⟨350, 4627, by norm_num⟩; exact ⟨46, 4467, by norm_num⟩; exact ⟨246, 4493, by norm_num⟩; exact ⟨225, 4463, by norm_num⟩; exact ⟨187, 4443, by norm_num⟩; exact ⟨287, 4417, by norm_num⟩; exact ⟨579, 4583, by norm_num⟩; exact ⟨429, 4393, by norm_num⟩; exact ⟨120, 4201, by norm_num⟩; exact ⟨114, 4187, by norm_num⟩; exact ⟨226, 4197, by norm_num⟩; exact ⟨175, 4137, by norm_num⟩; exact ⟨317, 4049, by norm_num⟩; exact ⟨455, 4109, by norm_num⟩; exact ⟨226, 3921, by norm_num⟩; exact ⟨305, 3923, by norm_num⟩; exact ⟨272, 3871, by norm_num⟩; exact ⟨699, 4151, by norm_num⟩; exact ⟨112, 3801, by norm_num⟩; exact ⟨285, 3833, by norm_num⟩; exact ⟨587, 3983, by norm_num⟩; exact ⟨564, 3943, by norm_num⟩; exact ⟨187, 3693, by norm_num⟩; exact ⟨113, 3673, by norm_num⟩; exact ⟨61, 3657, by norm_num⟩; exact ⟨46, 3651, by norm_num⟩; exact ⟨239, 3559, by norm_num⟩; exact ⟨413, 3577, by norm_num⟩; exact ⟨507, 3623, by norm_num⟩; exact ⟨462, 3577, by norm_num⟩; exact ⟨432, 3551, by norm_num⟩; exact ⟨76, 3381, by norm_num⟩; exact ⟨4, 3369, by norm_num⟩; exact ⟨697, 3657, by norm_num⟩; exact ⟨158, 3271, by norm_num⟩; exact ⟨735, 3521, by norm_num⟩; exact ⟨177, 3217, by norm_num⟩; exact ⟨850, 3603, by norm_num⟩; exact ⟨260, 3197, by norm_num⟩; exact ⟨341, 3203, by norm_num⟩; exact ⟨764, 3457, by norm_num⟩; exact ⟨743, 3427, by norm_num⟩; exact ⟨566, 3283, by norm_num⟩; exact ⟨401, 3181, by norm_num⟩; exact ⟨761, 3373, by norm_num⟩; exact ⟨9, 3041, by norm_num⟩]
  · show 136 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert136
