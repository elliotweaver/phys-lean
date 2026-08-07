/-
  Certificates.GaussFiberCert114 — fiber-h=114 EXCLUSION certificate for
  D = −15483031 (first odd-disc fundamental above X₀(114)).
  114 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −15483031 has size > 114,
  so h(−15483031) ≥ 115 — D is excluded from every fiber ≤ 114.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert114
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 17, 37, 41, 71, 73, 79, 83, 89, 97, 103, 107, 127, 131, 149, 191, 193, 223, 227, 233, 251, 277, 281, 311, 313, 331, 347, 349, 353, 367, 379, 397, 401, 419, 421, 449, 461, 479, 491, 499, 521, 523, 557, 569, 577, 587, 599, 601, 607, 613, 619, 641, 653, 659, 661, 673, 677, 719, 739, 743, 751, 757, 769, 773, 787, 853, 857, 859, 883, 887, 911, 941, 947, 967, 971, 977, 991, 997, 1009, 1031, 1033, 1049, 1061, 1091, 1109, 1129, 1151, 1171, 1181, 1193, 1223, 1229, 1231, 1249, 1259, 1277, 1289, 1297, 1303, 1319, 1321, 1361, 1367, 1399, 1439, 1451, 1487, 1489, 1493, 1511, 1523, 1553, 1559, 1567]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -15483031) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -15483031 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    114 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -15483031) (c₀ := 3870758) (ps := ps) (h := 114)
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
    fin_cases hp <;> [exact ⟨1, 774152, by norm_num⟩; exact ⟨2, 227692, by norm_num⟩; exact ⟨13, 104620, by norm_num⟩; exact ⟨19, 94418, by norm_num⟩; exact ⟨4, 54518, by norm_num⟩; exact ⟨29, 53036, by norm_num⟩; exact ⟨34, 49012, by norm_num⟩; exact ⟨5, 46636, by norm_num⟩; exact ⟨5, 43492, by norm_num⟩; exact ⟨38, 39920, by norm_num⟩; exact ⟨24, 37586, by norm_num⟩; exact ⟨30, 36184, by norm_num⟩; exact ⟨44, 30494, by norm_num⟩; exact ⟨5, 29548, by norm_num⟩; exact ⟨59, 26002, by norm_num⟩; exact ⟨28, 20270, by norm_num⟩; exact ⟨44, 20066, by norm_num⟩; exact ⟨79, 17386, by norm_num⟩; exact ⟨85, 17084, by norm_num⟩; exact ⟨63, 16630, by norm_num⟩; exact ⟨98, 15460, by norm_num⟩; exact ⟨47, 13982, by norm_num⟩; exact ⟨80, 13798, by norm_num⟩; exact ⟨99, 12478, by norm_num⟩; exact ⟨116, 12410, by norm_num⟩; exact ⟨120, 11738, by norm_num⟩; exact ⟨130, 11204, by norm_num⟩; exact ⟨143, 11150, by norm_num⟩; exact ⟨15, 10966, by norm_num⟩; exact ⟨99, 10574, by norm_num⟩; exact ⟨181, 10300, by norm_num⟩; exact ⟨74, 9764, by norm_num⟩; exact ⟨151, 9710, by norm_num⟩; exact ⟨40, 9242, by norm_num⟩; exact ⟨150, 9248, by norm_num⟩; exact ⟨82, 8636, by norm_num⟩; exact ⟨218, 8500, by norm_num⟩; exact ⟨100, 8102, by norm_num⟩; exact ⟨215, 7978, by norm_num⟩; exact ⟨38, 7760, by norm_num⟩; exact ⟨16, 7430, by norm_num⟩; exact ⟨169, 7456, by norm_num⟩; exact ⟨90, 6964, by norm_num⟩; exact ⟨260, 6922, by norm_num⟩; exact ⟨188, 6770, by norm_num⟩; exact ⟨96, 6610, by norm_num⟩; exact ⟨272, 6586, by norm_num⟩; exact ⟨256, 6550, by norm_num⟩; exact ⟨118, 6400, by norm_num⟩; exact ⟨249, 6416, by norm_num⟩; exact ⟨307, 6406, by norm_num⟩; exact ⟨311, 6190, by norm_num⟩; exact ⟨289, 6056, by norm_num⟩; exact ⟨238, 5960, by norm_num⟩; exact ⟨96, 5870, by norm_num⟩; exact ⟨138, 5780, by norm_num⟩; exact ⟨188, 5770, by norm_num⟩; exact ⟨201, 5440, by norm_num⟩; exact ⟨55, 5242, by norm_num⟩; exact ⟨16, 5210, by norm_num⟩; exact ⟨265, 5248, by norm_num⟩; exact ⟨289, 5224, by norm_num⟩; exact ⟨370, 5212, by norm_num⟩; exact ⟨98, 5020, by norm_num⟩; exact ⟨189, 4964, by norm_num⟩; exact ⟨12, 4538, by norm_num⟩; exact ⟨141, 4540, by norm_num⟩; exact ⟨315, 4622, by norm_num⟩; exact ⟨140, 4406, by norm_num⟩; exact ⟨10, 4364, by norm_num⟩; exact ⟨31, 4250, by norm_num⟩; exact ⟨78, 4120, by norm_num⟩; exact ⟨243, 4150, by norm_num⟩; exact ⟨306, 4100, by norm_num⟩; exact ⟨151, 4010, by norm_num⟩; exact ⟨45, 3964, by norm_num⟩; exact ⟨45, 3908, by norm_num⟩; exact ⟨425, 4064, by norm_num⟩; exact ⟨406, 4000, by norm_num⟩; exact ⟨471, 3970, by norm_num⟩; exact ⟨341, 3860, by norm_num⟩; exact ⟨446, 3880, by norm_num⟩; exact ⟨43, 3650, by norm_num⟩; exact ⟨10, 3548, by norm_num⟩; exact ⟨532, 3746, by norm_num⟩; exact ⟨216, 3470, by norm_num⟩; exact ⟨206, 3400, by norm_num⟩; exact ⟨270, 3368, by norm_num⟩; exact ⟨155, 3298, by norm_num⟩; exact ⟨252, 3298, by norm_num⟩; exact ⟨35, 3166, by norm_num⟩; exact ⟨113, 3160, by norm_num⟩; exact ⟨451, 3310, by norm_num⟩; exact ⟨196, 3130, by norm_num⟩; exact ⟨211, 3110, by norm_num⟩; exact ⟨60, 3034, by norm_num⟩; exact ⟨172, 3026, by norm_num⟩; exact ⟨440, 3134, by norm_num⟩; exact ⟨370, 3076, by norm_num⟩; exact ⟨339, 3022, by norm_num⟩; exact ⟨198, 2960, by norm_num⟩; exact ⟨321, 2920, by norm_num⟩; exact ⟨485, 3004, by norm_num⟩; exact ⟨674, 3092, by norm_num⟩; exact ⟨517, 2876, by norm_num⟩; exact ⟨319, 2738, by norm_num⟩; exact ⟨686, 2920, by norm_num⟩; exact ⟨575, 2822, by norm_num⟩; exact ⟨617, 2848, by norm_num⟩; exact ⟨339, 2638, by norm_num⟩; exact ⟨728, 2890, by norm_num⟩; exact ⟨677, 2788, by norm_num⟩; exact ⟨298, 2540, by norm_num⟩; exact ⟨440, 2594, by norm_num⟩]
  · show 114 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert114
