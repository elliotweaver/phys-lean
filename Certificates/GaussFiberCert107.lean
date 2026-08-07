/-
  Certificates.GaussFiberCert107 — fiber-h=107 EXCLUSION certificate for
  D = −12571795 (first odd-disc fundamental above X₀(107)).
  107 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −12571795 has size > 107,
  so h(−12571795) ≥ 108 — D is excluded from every fiber ≤ 107.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert107
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 7, 19, 29, 31, 37, 47, 53, 61, 73, 83, 89, 101, 103, 127, 131, 149, 163, 167, 191, 193, 197, 223, 229, 239, 241, 269, 271, 281, 313, 373, 379, 389, 397, 401, 419, 421, 431, 449, 487, 491, 509, 521, 547, 557, 563, 569, 571, 599, 601, 607, 617, 641, 643, 647, 661, 673, 677, 683, 691, 709, 739, 743, 751, 757, 809, 827, 853, 859, 863, 877, 907, 911, 919, 947, 953, 983, 991, 1019, 1021, 1031, 1061, 1063, 1069, 1087, 1091, 1093, 1103, 1109, 1117, 1123, 1151, 1153, 1171, 1187, 1229, 1231, 1259, 1297, 1303, 1319, 1321, 1423, 1427, 1433, 1439, 1451]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -12571795) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -12571795 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    107 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -12571795) (c₀ := 3142949) (ps := ps) (h := 107)
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
    fin_cases hp <;> [exact ⟨2, 628591, by norm_num⟩; exact ⟨1, 448993, by norm_num⟩; exact ⟨3, 165419, by norm_num⟩; exact ⟨6, 108379, by norm_num⟩; exact ⟨10, 101389, by norm_num⟩; exact ⟨9, 84947, by norm_num⟩; exact ⟨23, 66883, by norm_num⟩; exact ⟨10, 59303, by norm_num⟩; exact ⟨30, 51539, by norm_num⟩; exact ⟨25, 43063, by norm_num⟩; exact ⟨3, 37867, by norm_num⟩; exact ⟨36, 35329, by norm_num⟩; exact ⟨16, 31121, by norm_num⟩; exact ⟨36, 30527, by norm_num⟩; exact ⟨34, 24757, by norm_num⟩; exact ⟨59, 24019, by norm_num⟩; exact ⟨61, 21119, by norm_num⟩; exact ⟨22, 19285, by norm_num⟩; exact ⟨46, 18833, by norm_num⟩; exact ⟨93, 16501, by norm_num⟩; exact ⟨7, 16285, by norm_num⟩; exact ⟨50, 15967, by norm_num⟩; exact ⟨80, 14123, by norm_num⟩; exact ⟨31, 13729, by norm_num⟩; exact ⟨85, 13181, by norm_num⟩; exact ⟨57, 13055, by norm_num⟩; exact ⟨85, 11711, by norm_num⟩; exact ⟨19, 11599, by norm_num⟩; exact ⟨41, 11191, by norm_num⟩; exact ⟨99, 10073, by norm_num⟩; exact ⟨57, 8435, by norm_num⟩; exact ⟨78, 8309, by norm_num⟩; exact ⟨77, 8095, by norm_num⟩; exact ⟨197, 8015, by norm_num⟩; exact ⟨96, 7861, by norm_num⟩; exact ⟨64, 7511, by norm_num⟩; exact ⟨138, 7511, by norm_num⟩; exact ⟨61, 7301, by norm_num⟩; exact ⟨148, 7049, by norm_num⟩; exact ⟨80, 6467, by norm_num⟩; exact ⟨156, 6451, by norm_num⟩; exact ⟨46, 6179, by norm_num⟩; exact ⟨226, 6131, by norm_num⟩; exact ⟨102, 5765, by norm_num⟩; exact ⟨106, 5663, by norm_num⟩; exact ⟨37, 5585, by norm_num⟩; exact ⟨93, 5539, by norm_num⟩; exact ⟨123, 5531, by norm_num⟩; exact ⟨176, 5299, by norm_num⟩; exact ⟨244, 5329, by norm_num⟩; exact ⟨189, 5237, by norm_num⟩; exact ⟨108, 5113, by norm_num⟩; exact ⟨133, 4931, by norm_num⟩; exact ⟨307, 5035, by norm_num⟩; exact ⟨192, 4915, by norm_num⟩; exact ⟨131, 4781, by norm_num⟩; exact ⟨44, 4673, by norm_num⟩; exact ⟨233, 4723, by norm_num⟩; exact ⟨131, 4627, by norm_num⟩; exact ⟨67, 4555, by norm_num⟩; exact ⟨92, 4445, by norm_num⟩; exact ⟨328, 4399, by norm_num⟩; exact ⟨130, 4253, by norm_num⟩; exact ⟨122, 4205, by norm_num⟩; exact ⟨176, 4193, by norm_num⟩; exact ⟨106, 3899, by norm_num⟩; exact ⟨310, 3917, by norm_num⟩; exact ⟨383, 3857, by norm_num⟩; exact ⟨11, 3659, by norm_num⟩; exact ⟨286, 3737, by norm_num⟩; exact ⟨438, 3803, by norm_num⟩; exact ⟨212, 3515, by norm_num⟩; exact ⟨67, 3455, by norm_num⟩; exact ⟨255, 3491, by norm_num⟩; exact ⟨334, 3437, by norm_num⟩; exact ⟨154, 3323, by norm_num⟩; exact ⟨192, 3235, by norm_num⟩; exact ⟨221, 3221, by norm_num⟩; exact ⟨158, 3109, by norm_num⟩; exact ⟨104, 3089, by norm_num⟩; exact ⟨273, 3121, by norm_num⟩; exact ⟨507, 3205, by norm_num⟩; exact ⟨18, 2957, by norm_num⟩; exact ⟨72, 2945, by norm_num⟩; exact ⟨369, 3017, by norm_num⟩; exact ⟨162, 2905, by norm_num⟩; exact ⟨417, 3035, by norm_num⟩; exact ⟨203, 2887, by norm_num⟩; exact ⟨422, 2995, by norm_num⟩; exact ⟨37, 2815, by norm_num⟩; exact ⟨96, 2807, by norm_num⟩; exact ⟨167, 2755, by norm_num⟩; exact ⟨102, 2735, by norm_num⟩; exact ⟨447, 2855, by norm_num⟩; exact ⟨78, 2653, by norm_num⟩; exact ⟨353, 2659, by norm_num⟩; exact ⟨47, 2555, by norm_num⟩; exact ⟨596, 2779, by norm_num⟩; exact ⟨591, 2693, by norm_num⟩; exact ⟨34, 2413, by norm_num⟩; exact ⟨462, 2545, by norm_num⟩; exact ⟨48, 2381, by norm_num⟩; exact ⟨567, 2435, by norm_num⟩; exact ⟨680, 2527, by norm_num⟩; exact ⟨366, 2287, by norm_num⟩; exact ⟨99, 2191, by norm_num⟩; exact ⟨647, 2455, by norm_num⟩]
  · show 107 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert107
