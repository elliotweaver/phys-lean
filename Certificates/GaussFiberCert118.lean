/-
  Certificates.GaussFiberCert118 — fiber-h=118 EXCLUSION certificate for
  D = −15942027 (first odd-disc fundamental above X₀(118)).
  118 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −15942027 has size > 118,
  so h(−15942027) ≥ 119 — D is excluded from every fiber ≤ 118.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert118
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 7, 11, 13, 23, 31, 59, 71, 89, 103, 107, 113, 137, 151, 157, 163, 167, 173, 191, 197, 199, 211, 229, 233, 241, 257, 263, 269, 271, 277, 307, 311, 313, 337, 347, 349, 353, 373, 383, 409, 421, 431, 433, 439, 449, 463, 499, 521, 541, 569, 571, 599, 613, 617, 619, 631, 641, 643, 647, 659, 661, 673, 683, 691, 719, 733, 739, 743, 751, 757, 761, 809, 811, 853, 859, 863, 877, 881, 883, 887, 907, 941, 947, 971, 977, 983, 991, 997, 1009, 1019, 1021, 1061, 1063, 1087, 1091, 1097, 1123, 1129, 1163, 1193, 1213, 1223, 1231, 1249, 1283, 1291, 1297, 1303, 1319, 1367, 1373, 1381, 1409, 1423, 1433, 1439, 1447, 1453]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -15942027) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -15942027 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    118 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -15942027) (c₀ := 3985507) (ps := ps) (h := 118)
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
    fin_cases hp <;> [exact ⟨1, 1328503, by norm_num⟩; exact ⟨2, 569359, by norm_num⟩; exact ⟨1, 362319, by norm_num⟩; exact ⟨4, 306579, by norm_num⟩; exact ⟨1, 173283, by norm_num⟩; exact ⟨11, 128569, by norm_num⟩; exact ⟨1, 67551, by norm_num⟩; exact ⟨30, 56147, by norm_num⟩; exact ⟨1, 44781, by norm_num⟩; exact ⟨50, 38719, by norm_num⟩; exact ⟨31, 37257, by norm_num⟩; exact ⟨18, 35273, by norm_num⟩; exact ⟨32, 29099, by norm_num⟩; exact ⟨70, 26427, by norm_num⟩; exact ⟨49, 25401, by norm_num⟩; exact ⟨2, 24451, by norm_num⟩; exact ⟨65, 23891, by norm_num⟩; exact ⟨15, 23039, by norm_num⟩; exact ⟨9, 20867, by norm_num⟩; exact ⟨0, 20231, by norm_num⟩; exact ⟨51, 20041, by norm_num⟩; exact ⟨8, 18889, by norm_num⟩; exact ⟨45, 17413, by norm_num⟩; exact ⟨74, 17129, by norm_num⟩; exact ⟨84, 16567, by norm_num⟩; exact ⟨17, 15509, by norm_num⟩; exact ⟨113, 15203, by norm_num⟩; exact ⟨63, 14831, by norm_num⟩; exact ⟨9, 14707, by norm_num⟩; exact ⟨92, 14419, by norm_num⟩; exact ⟨103, 13017, by norm_num⟩; exact ⟨149, 12887, by norm_num⟩; exact ⟨96, 12763, by norm_num⟩; exact ⟨101, 11857, by norm_num⟩; exact ⟨125, 11531, by norm_num⟩; exact ⟨77, 11437, by norm_num⟩; exact ⟨100, 11319, by norm_num⟩; exact ⟨154, 10749, by norm_num⟩; exact ⟨70, 10419, by norm_num⟩; exact ⟨51, 9751, by norm_num⟩; exact ⟨116, 9499, by norm_num⟩; exact ⟨28, 9249, by norm_num⟩; exact ⟨79, 9219, by norm_num⟩; exact ⟨79, 9093, by norm_num⟩; exact ⟨141, 8921, by norm_num⟩; exact ⟨207, 8701, by norm_num⟩; exact ⟨2, 7987, by norm_num⟩; exact ⟨123, 7679, by norm_num⟩; exact ⟨33, 7369, by norm_num⟩; exact ⟨270, 7133, by norm_num⟩; exact ⟨235, 7077, by norm_num⟩; exact ⟨168, 6701, by norm_num⟩; exact ⟨129, 6529, by norm_num⟩; exact ⟨30, 6461, by norm_num⟩; exact ⟨196, 6501, by norm_num⟩; exact ⟨160, 6357, by norm_num⟩; exact ⟨127, 6243, by norm_num⟩; exact ⟨140, 6229, by norm_num⟩; exact ⟨277, 6279, by norm_num⟩; exact ⟨197, 6107, by norm_num⟩; exact ⟨113, 6049, by norm_num⟩; exact ⟨255, 6019, by norm_num⟩; exact ⟨132, 5861, by norm_num⟩; exact ⟨184, 5817, by norm_num⟩; exact ⟨278, 5651, by norm_num⟩; exact ⟨232, 5511, by norm_num⟩; exact ⟨85, 5403, by norm_num⟩; exact ⟨60, 5369, by norm_num⟩; exact ⟨67, 5313, by norm_num⟩; exact ⟨110, 5281, by norm_num⟩; exact ⟨328, 5379, by norm_num⟩; exact ⟨228, 4991, by norm_num⟩; exact ⟨141, 4939, by norm_num⟩; exact ⟨199, 4719, by norm_num⟩; exact ⟨98, 4651, by norm_num⟩; exact ⟨353, 4763, by norm_num⟩; exact ⟨370, 4701, by norm_num⟩; exact ⟨362, 4673, by norm_num⟩; exact ⟨417, 4711, by norm_num⟩; exact ⟨125, 4511, by norm_num⟩; exact ⟨242, 4459, by norm_num⟩; exact ⟨104, 4247, by norm_num⟩; exact ⟨433, 4407, by norm_num⟩; exact ⟨118, 4119, by norm_num⟩; exact ⟨145, 4101, by norm_num⟩; exact ⟨218, 4103, by norm_num⟩; exact ⟨216, 4069, by norm_num⟩; exact ⟨171, 4027, by norm_num⟩; exact ⟨203, 3991, by norm_num⟩; exact ⟨270, 3983, by norm_num⟩; exact ⟨59, 3907, by norm_num⟩; exact ⟨313, 3849, by norm_num⟩; exact ⟨42, 3751, by norm_num⟩; exact ⟨435, 3841, by norm_num⟩; exact ⟨323, 3749, by norm_num⟩; exact ⟨123, 3647, by norm_num⟩; exact ⟨4, 3549, by norm_num⟩; exact ⟨31, 3531, by norm_num⟩; exact ⟨231, 3473, by norm_num⟩; exact ⟨17, 3341, by norm_num⟩; exact ⟨501, 3493, by norm_num⟩; exact ⟨546, 3503, by norm_num⟩; exact ⟨251, 3289, by norm_num⟩; exact ⟨50, 3193, by norm_num⟩; exact ⟨313, 3183, by norm_num⟩; exact ⟨520, 3297, by norm_num⟩; exact ⟨374, 3181, by norm_num⟩; exact ⟨382, 3171, by norm_num⟩; exact ⟨630, 3323, by norm_num⟩; exact ⟨145, 2931, by norm_num⟩; exact ⟨118, 2913, by norm_num⟩; exact ⟨265, 2937, by norm_num⟩; exact ⟨296, 2891, by norm_num⟩; exact ⟨474, 2959, by norm_num⟩; exact ⟨105, 2789, by norm_num⟩; exact ⟨551, 2981, by norm_num⟩; exact ⟨248, 2797, by norm_num⟩; exact ⟨8, 2743, by norm_num⟩]
  · show 118 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert118
