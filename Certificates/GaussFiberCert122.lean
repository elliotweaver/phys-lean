/-
  Certificates.GaussFiberCert122 — fiber-h=122 EXCLUSION certificate for
  D = −16906227 (first odd-disc fundamental above X₀(122)).
  122 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −16906227 has size > 122,
  so h(−16906227) ≥ 123 — D is excluded from every fiber ≤ 122.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert122
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 11, 13, 17, 19, 41, 43, 47, 59, 61, 67, 71, 79, 97, 109, 127, 131, 137, 139, 157, 163, 167, 173, 179, 191, 193, 197, 211, 223, 239, 241, 257, 269, 277, 281, 313, 337, 349, 353, 359, 367, 379, 389, 409, 419, 421, 431, 439, 443, 461, 463, 487, 491, 541, 547, 563, 577, 613, 619, 631, 641, 673, 677, 701, 709, 719, 733, 743, 761, 773, 787, 797, 809, 821, 827, 829, 859, 937, 941, 953, 977, 983, 1009, 1061, 1087, 1093, 1117, 1151, 1153, 1181, 1187, 1201, 1213, 1217, 1223, 1231, 1237, 1249, 1277, 1283, 1289, 1291, 1297, 1327, 1361, 1367, 1373, 1381, 1429, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1523, 1531, 1543, 1549]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -16906227) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -16906227 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    122 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -16906227) (c₀ := 4226557) (ps := ps) (h := 122)
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
    fin_cases hp <;> [exact ⟨1, 1408853, by norm_num⟩; exact ⟨2, 384233, by norm_num⟩; exact ⟨6, 325123, by norm_num⟩; exact ⟨0, 248621, by norm_num⟩; exact ⟨3, 222451, by norm_num⟩; exact ⟨20, 103097, by norm_num⟩; exact ⟨6, 98293, by norm_num⟩; exact ⟨3, 89927, by norm_num⟩; exact ⟨19, 71643, by norm_num⟩; exact ⟨8, 69289, by norm_num⟩; exact ⟨16, 63087, by norm_num⟩; exact ⟨1, 59529, by norm_num⟩; exact ⟨28, 53511, by norm_num⟩; exact ⟨48, 43597, by norm_num⟩; exact ⟨54, 38803, by norm_num⟩; exact ⟨46, 33297, by norm_num⟩; exact ⟨20, 32267, by norm_num⟩; exact ⟨5, 30851, by norm_num⟩; exact ⟨37, 30417, by norm_num⟩; exact ⟨77, 26959, by norm_num⟩; exact ⟨61, 25953, by norm_num⟩; exact ⟨19, 25311, by norm_num⟩; exact ⟨2, 24431, by norm_num⟩; exact ⟨83, 23651, by norm_num⟩; exact ⟨52, 22143, by norm_num⟩; exact ⟨51, 21913, by norm_num⟩; exact ⟨35, 21461, by norm_num⟩; exact ⟨61, 20049, by norm_num⟩; exact ⟨66, 18973, by norm_num⟩; exact ⟨45, 17693, by norm_num⟩; exact ⟨18, 17539, by norm_num⟩; exact ⟨127, 16509, by norm_num⟩; exact ⟨15, 15713, by norm_num⟩; exact ⟨103, 15297, by norm_num⟩; exact ⟨88, 15069, by norm_num⟩; exact ⟨119, 13549, by norm_num⟩; exact ⟨136, 12597, by norm_num⟩; exact ⟨13, 12111, by norm_num⟩; exact ⟨83, 11993, by norm_num⟩; exact ⟨59, 11783, by norm_num⟩; exact ⟨13, 11517, by norm_num⟩; exact ⟨89, 11173, by norm_num⟩; exact ⟨133, 10911, by norm_num⟩; exact ⟨155, 10393, by norm_num⟩; exact ⟨208, 10191, by norm_num⟩; exact ⟨158, 10099, by norm_num⟩; exact ⟨33, 9809, by norm_num⟩; exact ⟨124, 9663, by norm_num⟩; exact ⟨31, 9543, by norm_num⟩; exact ⟨82, 9183, by norm_num⟩; exact ⟨180, 9199, by norm_num⟩; exact ⟨159, 8731, by norm_num⟩; exact ⟨21, 8609, by norm_num⟩; exact ⟨228, 7909, by norm_num⟩; exact ⟨155, 7771, by norm_num⟩; exact ⟨276, 7643, by norm_num⟩; exact ⟨33, 7327, by norm_num⟩; exact ⟨264, 7009, by norm_num⟩; exact ⟨247, 6927, by norm_num⟩; exact ⟨175, 6747, by norm_num⟩; exact ⟨269, 6707, by norm_num⟩; exact ⟨244, 6369, by norm_num⟩; exact ⟨132, 6269, by norm_num⟩; exact ⟨301, 6159, by norm_num⟩; exact ⟨336, 6121, by norm_num⟩; exact ⟨228, 5951, by norm_num⟩; exact ⟨266, 5863, by norm_num⟩; exact ⟨197, 5741, by norm_num⟩; exact ⟨343, 5709, by norm_num⟩; exact ⟨298, 5583, by norm_num⟩; exact ⟨20, 5371, by norm_num⟩; exact ⟨119, 5321, by norm_num⟩; exact ⟨327, 5357, by norm_num⟩; exact ⟨363, 5309, by norm_num⟩; exact ⟨15, 5111, by norm_num⟩; exact ⟨294, 5203, by norm_num⟩; exact ⟨177, 4957, by norm_num⟩; exact ⟨464, 4741, by norm_num⟩; exact ⟨377, 4643, by norm_num⟩; exact ⟨115, 4449, by norm_num⟩; exact ⟨69, 4331, by norm_num⟩; exact ⟨151, 4323, by norm_num⟩; exact ⟨46, 4191, by norm_num⟩; exact ⟨263, 4049, by norm_num⟩; exact ⟨215, 3931, by norm_num⟩; exact ⟨299, 3949, by norm_num⟩; exact ⟨229, 3831, by norm_num⟩; exact ⟨200, 3707, by norm_num⟩; exact ⟨252, 3721, by norm_num⟩; exact ⟨243, 3629, by norm_num⟩; exact ⟨258, 3617, by norm_num⟩; exact ⟨108, 3529, by norm_num⟩; exact ⟨288, 3553, by norm_num⟩; exact ⟨424, 3621, by norm_num⟩; exact ⟨538, 3693, by norm_num⟩; exact ⟨538, 3669, by norm_num⟩; exact ⟨16, 3417, by norm_num⟩; exact ⟨459, 3553, by norm_num⟩; exact ⟨229, 3351, by norm_num⟩; exact ⟨462, 3461, by norm_num⟩; exact ⟨51, 3281, by norm_num⟩; exact ⟨285, 3337, by norm_num⟩; exact ⟨423, 3397, by norm_num⟩; exact ⟨145, 3201, by norm_num⟩; exact ⟨45, 3107, by norm_num⟩; exact ⟨516, 3287, by norm_num⟩; exact ⟨527, 3281, by norm_num⟩; exact ⟨224, 3097, by norm_num⟩; exact ⟨500, 3133, by norm_num⟩; exact ⟨170, 2941, by norm_num⟩; exact ⟨373, 3009, by norm_num⟩; exact ⟨441, 3043, by norm_num⟩; exact ⟨143, 2911, by norm_num⟩; exact ⟨342, 2953, by norm_num⟩; exact ⟨687, 3173, by norm_num⟩; exact ⟨115, 2859, by norm_num⟩; exact ⟨191, 2867, by norm_num⟩; exact ⟨251, 2881, by norm_num⟩; exact ⟨682, 3081, by norm_num⟩; exact ⟨137, 2773, by norm_num⟩; exact ⟨214, 2769, by norm_num⟩; exact ⟨149, 2743, by norm_num⟩]
  · show 122 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert122
