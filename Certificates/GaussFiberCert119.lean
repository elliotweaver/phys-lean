/-
  Certificates.GaussFiberCert119 — fiber-h=119 EXCLUSION certificate for
  D = −16618519 (first odd-disc fundamental above X₀(119)).
  119 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −16618519 has size > 119,
  so h(−16618519) ≥ 120 — D is excluded from every fiber ≤ 119.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert119
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 17, 23, 43, 61, 71, 73, 79, 97, 101, 103, 107, 113, 137, 149, 151, 163, 167, 173, 179, 181, 191, 197, 211, 223, 229, 241, 257, 271, 283, 293, 313, 331, 353, 373, 397, 421, 431, 439, 443, 457, 461, 479, 487, 499, 503, 541, 547, 557, 569, 571, 577, 587, 593, 601, 613, 617, 631, 643, 659, 701, 709, 719, 733, 739, 743, 751, 769, 797, 821, 853, 863, 883, 887, 907, 941, 953, 971, 983, 991, 1009, 1033, 1049, 1061, 1063, 1087, 1091, 1097, 1103, 1109, 1117, 1129, 1151, 1163, 1171, 1181, 1193, 1213, 1237, 1249, 1277, 1289, 1307, 1319, 1327, 1361, 1367, 1373, 1409, 1423, 1427, 1429, 1433, 1439, 1451, 1453, 1471, 1481, 1483]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -16618519) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -16618519 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    119 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -16618519) (c₀ := 4154630) (ps := ps) (h := 119)
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
    fin_cases hp <;> [exact ⟨0, 830926, by norm_num⟩; exact ⟨0, 244390, by norm_num⟩; exact ⟨9, 180640, by norm_num⟩; exact ⟨5, 96620, by norm_num⟩; exact ⟨28, 68122, by norm_num⟩; exact ⟨2, 58516, by norm_num⟩; exact ⟨35, 56930, by norm_num⟩; exact ⟨39, 52610, by norm_num⟩; exact ⟨21, 42836, by norm_num⟩; exact ⟨41, 41152, by norm_num⟩; exact ⟨49, 40360, by norm_num⟩; exact ⟨43, 38846, by norm_num⟩; exact ⟨19, 36770, by norm_num⟩; exact ⟨17, 30328, by norm_num⟩; exact ⟨67, 27914, by norm_num⟩; exact ⟨57, 27536, by norm_num⟩; exact ⟨15, 25490, by norm_num⟩; exact ⟨36, 24886, by norm_num⟩; exact ⟨65, 24040, by norm_num⟩; exact ⟨59, 23230, by norm_num⟩; exact ⟨71, 22982, by norm_num⟩; exact ⟨1, 21752, by norm_num⟩; exact ⟨45, 21100, by norm_num⟩; exact ⟨45, 19700, by norm_num⟩; exact ⟨17, 18632, by norm_num⟩; exact ⟨97, 18184, by norm_num⟩; exact ⟨14, 17240, by norm_num⟩; exact ⟨113, 16216, by norm_num⟩; exact ⟨18, 15332, by norm_num⟩; exact ⟨105, 14720, by norm_num⟩; exact ⟨10, 14180, by norm_num⟩; exact ⟨11, 13274, by norm_num⟩; exact ⟨37, 12556, by norm_num⟩; exact ⟨122, 11812, by norm_num⟩; exact ⟨127, 11182, by norm_num⟩; exact ⟨99, 10490, by norm_num⟩; exact ⟨38, 9872, by norm_num⟩; exact ⟨14, 9640, by norm_num⟩; exact ⟨162, 9524, by norm_num⟩; exact ⟨106, 9404, by norm_num⟩; exact ⟨149, 9140, by norm_num⟩; exact ⟨151, 9062, by norm_num⟩; exact ⟨161, 8728, by norm_num⟩; exact ⟨219, 8630, by norm_num⟩; exact ⟨236, 8438, by norm_num⟩; exact ⟨46, 8264, by norm_num⟩; exact ⟨36, 7682, by norm_num⟩; exact ⟨76, 7606, by norm_num⟩; exact ⟨147, 7498, by norm_num⟩; exact ⟨96, 7318, by norm_num⟩; exact ⟨175, 7330, by norm_num⟩; exact ⟨197, 7268, by norm_num⟩; exact ⟨12, 7078, by norm_num⟩; exact ⟨168, 7054, by norm_num⟩; exact ⟨65, 6920, by norm_num⟩; exact ⟨216, 6854, by norm_num⟩; exact ⟨38, 6736, by norm_num⟩; exact ⟨60, 6590, by norm_num⟩; exact ⟨41, 6464, by norm_num⟩; exact ⟨60, 6310, by norm_num⟩; exact ⟨103, 5942, by norm_num⟩; exact ⟨10, 5860, by norm_num⟩; exact ⟨34, 5780, by norm_num⟩; exact ⟨175, 5710, by norm_num⟩; exact ⟨203, 5678, by norm_num⟩; exact ⟨87, 5602, by norm_num⟩; exact ⟨346, 5692, by norm_num⟩; exact ⟨169, 5440, by norm_num⟩; exact ⟨371, 5386, by norm_num⟩; exact ⟨67, 5066, by norm_num⟩; exact ⟨89, 4880, by norm_num⟩; exact ⟨219, 4870, by norm_num⟩; exact ⟨88, 4714, by norm_num⟩; exact ⟨357, 4828, by norm_num⟩; exact ⟨243, 4646, by norm_num⟩; exact ⟨205, 4460, by norm_num⟩; exact ⟨312, 4462, by norm_num⟩; exact ⟨56, 4282, by norm_num⟩; exact ⟨393, 4384, by norm_num⟩; exact ⟨165, 4220, by norm_num⟩; exact ⟨49, 4120, by norm_num⟩; exact ⟨46, 4024, by norm_num⟩; exact ⟨99, 3970, by norm_num⟩; exact ⟨465, 4120, by norm_num⟩; exact ⟨347, 4022, by norm_num⟩; exact ⟨381, 3956, by norm_num⟩; exact ⟨161, 3832, by norm_num⟩; exact ⟨189, 3820, by norm_num⟩; exact ⟨228, 3814, by norm_num⟩; exact ⟨92, 3754, by norm_num⟩; exact ⟨207, 3758, by norm_num⟩; exact ⟨9, 3680, by norm_num⟩; exact ⟨109, 3620, by norm_num⟩; exact ⟨326, 3664, by norm_num⟩; exact ⟨290, 3620, by norm_num⟩; exact ⟨500, 3730, by norm_num⟩; exact ⟨152, 3502, by norm_num⟩; exact ⟨134, 3440, by norm_num⟩; exact ⟨606, 3656, by norm_num⟩; exact ⟨130, 3340, by norm_num⟩; exact ⟨382, 3368, by norm_num⟩; exact ⟨616, 3518, by norm_num⟩; exact ⟨248, 3226, by norm_num⟩; exact ⟨567, 3394, by norm_num⟩; exact ⟨423, 3266, by norm_num⟩; exact ⟨324, 3130, by norm_num⟩; exact ⟨678, 3376, by norm_num⟩; exact ⟨624, 3310, by norm_num⟩; exact ⟨488, 3118, by norm_num⟩; exact ⟨346, 3004, by norm_num⟩; exact ⟨110, 2920, by norm_num⟩; exact ⟨561, 3128, by norm_num⟩; exact ⟨247, 2942, by norm_num⟩; exact ⟨365, 2980, by norm_num⟩; exact ⟨520, 3050, by norm_num⟩; exact ⟨306, 2924, by norm_num⟩; exact ⟨247, 2866, by norm_num⟩; exact ⟨32, 2806, by norm_num⟩; exact ⟨514, 2980, by norm_num⟩]
  · show 119 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert119
