/-
  Certificates.GaussFiberCert106 — fiber-h=106 EXCLUSION certificate for
  D = −12341963 (first odd-disc fundamental above X₀(106)).
  106 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −12341963 has size > 106,
  so h(−12341963) ≥ 107 — D is excluded from every fiber ≤ 106.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert106
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 11, 13, 19, 31, 37, 41, 47, 61, 67, 71, 73, 79, 137, 139, 149, 151, 157, 163, 179, 181, 191, 193, 227, 251, 257, 277, 281, 283, 311, 337, 347, 349, 359, 397, 433, 439, 443, 463, 467, 487, 541, 547, 557, 571, 587, 593, 599, 613, 617, 619, 631, 641, 647, 661, 673, 677, 683, 691, 709, 719, 733, 751, 769, 797, 809, 811, 821, 823, 827, 839, 859, 887, 907, 911, 919, 929, 941, 971, 983, 997, 1009, 1019, 1021, 1031, 1039, 1049, 1061, 1063, 1069, 1087, 1093, 1103, 1117, 1123, 1129, 1151, 1153, 1163, 1181, 1193, 1229, 1231, 1279, 1283, 1289]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -12341963) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -12341963 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    106 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -12341963) (c₀ := 3085491) (ps := ps) (h := 106)
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
    fin_cases hp <;> [exact ⟨0, 1028497, by norm_num⟩; exact ⟨4, 280501, by norm_num⟩; exact ⟨4, 237347, by norm_num⟩; exact ⟨9, 162399, by norm_num⟩; exact ⟨12, 99537, by norm_num⟩; exact ⟨16, 83399, by norm_num⟩; exact ⟨14, 75261, by norm_num⟩; exact ⟨3, 65649, by norm_num⟩; exact ⟨8, 50583, by norm_num⟩; exact ⟨21, 46059, by norm_num⟩; exact ⟨15, 43461, by norm_num⟩; exact ⟨0, 42267, by norm_num⟩; exact ⟨3, 39057, by norm_num⟩; exact ⟨48, 22539, by norm_num⟩; exact ⟨39, 22209, by norm_num⟩; exact ⟨40, 20719, by norm_num⟩; exact ⟨66, 20463, by norm_num⟩; exact ⟨5, 19653, by norm_num⟩; exact ⟨43, 18941, by norm_num⟩; exact ⟨41, 17247, by norm_num⟩; exact ⟨50, 17061, by norm_num⟩; exact ⟨35, 16161, by norm_num⟩; exact ⟨0, 15987, by norm_num⟩; exact ⟨38, 13599, by norm_num⟩; exact ⟨32, 12297, by norm_num⟩; exact ⟨62, 12021, by norm_num⟩; exact ⟨3, 11139, by norm_num⟩; exact ⟨130, 11041, by norm_num⟩; exact ⟨34, 10907, by norm_num⟩; exact ⟨42, 9927, by norm_num⟩; exact ⟨88, 9179, by norm_num⟩; exact ⟨19, 8893, by norm_num⟩; exact ⟨129, 8889, by norm_num⟩; exact ⟨66, 8607, by norm_num⟩; exact ⟨103, 7799, by norm_num⟩; exact ⟨69, 7137, by norm_num⟩; exact ⟨15, 7029, by norm_num⟩; exact ⟨183, 7041, by norm_num⟩; exact ⟨47, 6669, by norm_num⟩; exact ⟨175, 6673, by norm_num⟩; exact ⟨106, 6359, by norm_num⟩; exact ⟨64, 5711, by norm_num⟩; exact ⟨178, 5699, by norm_num⟩; exact ⟨132, 5571, by norm_num⟩; exact ⟨99, 5421, by norm_num⟩; exact ⟨225, 5343, by norm_num⟩; exact ⟨90, 5217, by norm_num⟩; exact ⟨229, 5239, by norm_num⟩; exact ⟨239, 5127, by norm_num⟩; exact ⟨157, 5041, by norm_num⟩; exact ⟨132, 5013, by norm_num⟩; exact ⟨172, 4937, by norm_num⟩; exact ⟨257, 4917, by norm_num⟩; exact ⟨259, 4873, by norm_num⟩; exact ⟨77, 4677, by norm_num⟩; exact ⟨39, 4587, by norm_num⟩; exact ⟨60, 4563, by norm_num⟩; exact ⟨48, 4521, by norm_num⟩; exact ⟨161, 4503, by norm_num⟩; exact ⟨103, 4367, by norm_num⟩; exact ⟨164, 4329, by norm_num⟩; exact ⟨350, 4377, by norm_num⟩; exact ⟨322, 4247, by norm_num⟩; exact ⟨22, 4013, by norm_num⟩; exact ⟨118, 3889, by norm_num⟩; exact ⟨163, 3847, by norm_num⟩; exact ⟨115, 3821, by norm_num⟩; exact ⟨290, 3861, by norm_num⟩; exact ⟨303, 3861, by norm_num⟩; exact ⟨260, 3813, by norm_num⟩; exact ⟨34, 3679, by norm_num⟩; exact ⟨173, 3627, by norm_num⟩; exact ⟨211, 3529, by norm_num⟩; exact ⟨100, 3413, by norm_num⟩; exact ⟨409, 3571, by norm_num⟩; exact ⟨305, 3459, by norm_num⟩; exact ⟨210, 3369, by norm_num⟩; exact ⟨390, 3441, by norm_num⟩; exact ⟨284, 3261, by norm_num⟩; exact ⟨89, 3147, by norm_num⟩; exact ⟨306, 3189, by norm_num⟩; exact ⟨105, 3069, by norm_num⟩; exact ⟨204, 3069, by norm_num⟩; exact ⟨31, 3023, by norm_num⟩; exact ⟨366, 3123, by norm_num⟩; exact ⟨168, 2997, by norm_num⟩; exact ⟨89, 2949, by norm_num⟩; exact ⟨55, 2911, by norm_num⟩; exact ⟨306, 2991, by norm_num⟩; exact ⟨208, 2927, by norm_num⟩; exact ⟨284, 2913, by norm_num⟩; exact ⟨247, 2879, by norm_num⟩; exact ⟨42, 2799, by norm_num⟩; exact ⟨86, 2769, by norm_num⟩; exact ⟨210, 2787, by norm_num⟩; exact ⟨352, 2843, by norm_num⟩; exact ⟨437, 2847, by norm_num⟩; exact ⟨305, 2757, by norm_num⟩; exact ⟨250, 2707, by norm_num⟩; exact ⟨21, 2613, by norm_num⟩; exact ⟨332, 2679, by norm_num⟩; exact ⟨150, 2529, by norm_num⟩; exact ⟨74, 2511, by norm_num⟩; exact ⟨76, 2417, by norm_num⟩; exact ⟨72, 2409, by norm_num⟩; exact ⟨385, 2509, by norm_num⟩]
  · show 106 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert106
