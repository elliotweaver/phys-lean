/-
  Certificates.GaussFiberCert144 — fiber-h=144 EXCLUSION certificate for
  D = −23354571 (first odd-disc fundamental above X₀(144)).
  144 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −23354571 has size > 144,
  so h(−23354571) ≥ 145 — D is excluded from every fiber ≤ 144.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert144
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 19, 29, 53, 59, 67, 71, 73, 89, 97, 103, 107, 127, 131, 137, 157, 163, 173, 193, 197, 227, 233, 239, 241, 263, 269, 277, 283, 313, 317, 331, 353, 367, 379, 383, 389, 401, 409, 421, 433, 439, 443, 449, 461, 479, 487, 499, 521, 541, 569, 577, 593, 601, 607, 613, 617, 631, 659, 683, 691, 739, 743, 757, 761, 769, 787, 809, 821, 823, 829, 839, 853, 857, 881, 883, 887, 907, 911, 919, 929, 937, 971, 983, 991, 1013, 1019, 1021, 1033, 1049, 1051, 1061, 1087, 1093, 1097, 1117, 1151, 1153, 1163, 1171, 1187, 1201, 1231, 1237, 1249, 1279, 1289, 1301, 1303, 1319, 1361, 1373, 1409, 1429, 1447, 1451, 1481, 1483, 1493, 1511, 1523, 1531, 1549, 1567, 1571, 1597, 1601, 1607, 1609, 1613, 1619, 1627, 1637, 1657, 1667, 1697, 1709, 1747, 1753, 1811, 1823, 1873, 1877, 1879]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -23354571) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -23354571 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    144 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -23354571) (c₀ := 5838643) (ps := ps) (h := 144)
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
    fin_cases hp <;> [exact ⟨1, 1946215, by norm_num⟩; exact ⟨1, 1167729, by norm_num⟩; exact ⟨0, 307297, by norm_num⟩; exact ⟨8, 201335, by norm_num⟩; exact ⟨20, 110171, by norm_num⟩; exact ⟨7, 98961, by norm_num⟩; exact ⟨8, 87145, by norm_num⟩; exact ⟨6, 82235, by norm_num⟩; exact ⟨31, 79995, by norm_num⟩; exact ⟨19, 65607, by norm_num⟩; exact ⟨16, 60195, by norm_num⟩; exact ⟨39, 56701, by norm_num⟩; exact ⟨15, 54569, by norm_num⟩; exact ⟨13, 45975, by norm_num⟩; exact ⟨20, 44573, by norm_num⟩; exact ⟨48, 42635, by norm_num⟩; exact ⟨5, 37189, by norm_num⟩; exact ⟨22, 35823, by norm_num⟩; exact ⟨78, 33785, by norm_num⟩; exact ⟨60, 30271, by norm_num⟩; exact ⟨15, 29639, by norm_num⟩; exact ⟨104, 25769, by norm_num⟩; exact ⟨78, 25085, by norm_num⟩; exact ⟨52, 24441, by norm_num⟩; exact ⟨118, 24285, by norm_num⟩; exact ⟨77, 22223, by norm_num⟩; exact ⟨1, 21705, by norm_num⟩; exact ⟨15, 21079, by norm_num⟩; exact ⟨140, 20701, by norm_num⟩; exact ⟨77, 18673, by norm_num⟩; exact ⟨121, 18465, by norm_num⟩; exact ⟨34, 17643, by norm_num⟩; exact ⟨104, 16571, by norm_num⟩; exact ⟨46, 15915, by norm_num⟩; exact ⟨90, 15427, by norm_num⟩; exact ⟨79, 15261, by norm_num⟩; exact ⟨54, 15017, by norm_num⟩; exact ⟨145, 14613, by norm_num⟩; exact ⟨25, 14277, by norm_num⟩; exact ⟨120, 13903, by norm_num⟩; exact ⟨68, 13495, by norm_num⟩; exact ⟨81, 13315, by norm_num⟩; exact ⟨70, 13191, by norm_num⟩; exact ⟨139, 13047, by norm_num⟩; exact ⟨203, 12755, by norm_num⟩; exact ⟨134, 12227, by norm_num⟩; exact ⟨0, 11989, by norm_num⟩; exact ⟨12, 11701, by norm_num⟩; exact ⟨199, 11283, by norm_num⟩; exact ⟨211, 10875, by norm_num⟩; exact ⟨88, 10275, by norm_num⟩; exact ⟨4, 10119, by norm_num⟩; exact ⟨94, 9861, by norm_num⟩; exact ⟨8, 9715, by norm_num⟩; exact ⟨9, 9619, by norm_num⟩; exact ⟨13, 9525, by norm_num⟩; exact ⟨99, 9479, by norm_num⟩; exact ⟨0, 9253, by norm_num⟩; exact ⟨27, 8861, by norm_num⟩; exact ⟨66, 8555, by norm_num⟩; exact ⟨156, 8485, by norm_num⟩; exact ⟨172, 7941, by norm_num⟩; exact ⟨289, 7971, by norm_num⟩; exact ⟨110, 7729, by norm_num⟩; exact ⟨322, 7809, by norm_num⟩; exact ⟨131, 7615, by norm_num⟩; exact ⟨10, 7419, by norm_num⟩; exact ⟨155, 7247, by norm_num⟩; exact ⟨160, 7143, by norm_num⟩; exact ⟨312, 7213, by norm_num⟩; exact ⟨177, 7081, by norm_num⟩; exact ⟨220, 7017, by norm_num⟩; exact ⟨261, 6925, by norm_num⟩; exact ⟨323, 6935, by norm_num⟩; exact ⟨150, 6653, by norm_num⟩; exact ⟨352, 6753, by norm_num⟩; exact ⟨286, 6675, by norm_num⟩; exact ⟨83, 6445, by norm_num⟩; exact ⟨374, 6563, by norm_num⟩; exact ⟨200, 6397, by norm_num⟩; exact ⟨44, 6287, by norm_num⟩; exact ⟨430, 6429, by norm_num⟩; exact ⟨429, 6203, by norm_num⟩; exact ⟨186, 5975, by norm_num⟩; exact ⟨363, 6025, by norm_num⟩; exact ⟨500, 6011, by norm_num⟩; exact ⟨311, 5825, by norm_num⟩; exact ⟨370, 5853, by norm_num⟩; exact ⟨475, 5871, by norm_num⟩; exact ⟨141, 5585, by norm_num⟩; exact ⟨228, 5605, by norm_num⟩; exact ⟨46, 5505, by norm_num⟩; exact ⟨351, 5485, by norm_num⟩; exact ⟨332, 5443, by norm_num⟩; exact ⟨351, 5435, by norm_num⟩; exact ⟨141, 5245, by norm_num⟩; exact ⟨19, 5073, by norm_num⟩; exact ⟨464, 5251, by norm_num⟩; exact ⟨247, 5073, by norm_num⟩; exact ⟨569, 5263, by norm_num⟩; exact ⟨14, 4919, by norm_num⟩; exact ⟨456, 5035, by norm_num⟩; exact ⟨121, 4755, by norm_num⟩; exact ⟨105, 4729, by norm_num⟩; exact ⟨587, 4951, by norm_num⟩; exact ⟨50, 4567, by norm_num⟩; exact ⟨83, 4535, by norm_num⟩; exact ⟨506, 4685, by norm_num⟩; exact ⟨535, 4701, by norm_num⟩; exact ⟨629, 4727, by norm_num⟩; exact ⟨402, 4409, by norm_num⟩; exact ⟨159, 4271, by norm_num⟩; exact ⟨479, 4307, by norm_num⟩; exact ⟨533, 4285, by norm_num⟩; exact ⟨1, 4035, by norm_num⟩; exact ⟨591, 4265, by norm_num⟩; exact ⟨125, 3953, by norm_num⟩; exact ⟨618, 4195, by norm_num⟩; exact ⟨706, 4245, by norm_num⟩; exact ⟨651, 4145, by norm_num⟩; exact ⟨131, 3845, by norm_num⟩; exact ⟨448, 3945, by norm_num⟩; exact ⟨653, 4045, by norm_num⟩; exact ⟨535, 3909, by norm_num⟩; exact ⟨62, 3719, by norm_num⟩; exact ⟨132, 3667, by norm_num⟩; exact ⟨240, 3683, by norm_num⟩; exact ⟨615, 3869, by norm_num⟩; exact ⟨800, 4027, by norm_num⟩; exact ⟨72, 3623, by norm_num⟩; exact ⟨118, 3615, by norm_num⟩; exact ⟨453, 3715, by norm_num⟩; exact ⟨776, 3935, by norm_num⟩; exact ⟨675, 3799, by norm_num⟩; exact ⟨566, 3695, by norm_num⟩; exact ⟨156, 3455, by norm_num⟩; exact ⟨585, 3617, by norm_num⟩; exact ⟨331, 3405, by norm_num⟩; exact ⟨24, 3331, by norm_num⟩; exact ⟨841, 3615, by norm_num⟩; exact ⟨636, 3425, by norm_num⟩; exact ⟨345, 3181, by norm_num⟩; exact ⟨222, 3137, by norm_num⟩; exact ⟨853, 3495, by norm_num⟩]
  · show 144 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert144
