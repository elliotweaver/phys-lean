/-
  Certificates.GaussFiberCert139 — fiber-h=139 EXCLUSION certificate for
  D = −22425171 (first odd-disc fundamental above X₀(139)).
  139 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −22425171 has size > 139,
  so h(−22425171) ≥ 140 — D is excluded from every fiber ≤ 139.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert139
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 11, 19, 23, 29, 37, 41, 43, 59, 61, 67, 71, 73, 97, 103, 113, 131, 139, 157, 163, 181, 197, 199, 211, 227, 241, 251, 257, 263, 269, 271, 281, 293, 311, 313, 317, 331, 353, 359, 367, 373, 389, 397, 431, 439, 449, 467, 491, 503, 509, 521, 523, 541, 547, 557, 571, 577, 607, 643, 647, 661, 673, 677, 683, 727, 733, 761, 769, 773, 809, 823, 827, 829, 839, 853, 857, 877, 881, 883, 911, 919, 929, 937, 947, 953, 983, 991, 997, 1019, 1021, 1031, 1033, 1039, 1051, 1061, 1091, 1093, 1097, 1103, 1117, 1123, 1151, 1213, 1217, 1237, 1249, 1277, 1279, 1283, 1301, 1321, 1361, 1367, 1399, 1439, 1451, 1453, 1459, 1483, 1487, 1493, 1499, 1531, 1549, 1553, 1559, 1567, 1579, 1583, 1601, 1609, 1613, 1619, 1621, 1637, 1657, 1697]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -22425171) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -22425171 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    139 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -22425171) (c₀ := 5606293) (ps := ps) (h := 139)
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
    fin_cases hp <;> [exact ⟨1, 1868765, by norm_num⟩; exact ⟨1, 1121259, by norm_num⟩; exact ⟨0, 800899, by norm_num⟩; exact ⟨0, 509663, by norm_num⟩; exact ⟨7, 295071, by norm_num⟩; exact ⟨8, 243755, by norm_num⟩; exact ⟨11, 193325, by norm_num⟩; exact ⟨11, 151525, by norm_num⟩; exact ⟨2, 136739, by norm_num⟩; exact ⟨9, 130381, by norm_num⟩; exact ⟨13, 95025, by norm_num⟩; exact ⟨12, 91909, by norm_num⟩; exact ⟨29, 83689, by norm_num⟩; exact ⟨22, 78969, by norm_num⟩; exact ⟨32, 76813, by norm_num⟩; exact ⟨14, 57799, by norm_num⟩; exact ⟨17, 54433, by norm_num⟩; exact ⟨36, 49625, by norm_num⟩; exact ⟨61, 42825, by norm_num⟩; exact ⟨16, 40335, by norm_num⟩; exact ⟨4, 35709, by norm_num⟩; exact ⟨41, 34405, by norm_num⟩; exact ⟨13, 30975, by norm_num⟩; exact ⟨89, 28499, by norm_num⟩; exact ⟨30, 28177, by norm_num⟩; exact ⟨69, 26593, by norm_num⟩; exact ⟨19, 24699, by norm_num⟩; exact ⟨9, 23263, by norm_num⟩; exact ⟨57, 22349, by norm_num⟩; exact ⟨34, 21819, by norm_num⟩; exact ⟨119, 21371, by norm_num⟩; exact ⟨108, 20885, by norm_num⟩; exact ⟨92, 20719, by norm_num⟩; exact ⟨94, 19983, by norm_num⟩; exact ⟨56, 19145, by norm_num⟩; exact ⟨90, 18053, by norm_num⟩; exact ⟨124, 17961, by norm_num⟩; exact ⟨65, 17699, by norm_num⟩; exact ⟨111, 16975, by norm_num⟩; exact ⟨144, 15941, by norm_num⟩; exact ⟨14, 15617, by norm_num⟩; exact ⟨83, 15295, by norm_num⟩; exact ⟨150, 15091, by norm_num⟩; exact ⟨143, 14465, by norm_num⟩; exact ⟨36, 14125, by norm_num⟩; exact ⟨86, 13025, by norm_num⟩; exact ⟨103, 12795, by norm_num⟩; exact ⟨190, 12567, by norm_num⟩; exact ⟨6, 12005, by norm_num⟩; exact ⟨85, 11433, by norm_num⟩; exact ⟨98, 11165, by norm_num⟩; exact ⟨18, 11015, by norm_num⟩; exact ⟨86, 10775, by norm_num⟩; exact ⟨223, 10815, by norm_num⟩; exact ⟨9, 10363, by norm_num⟩; exact ⟨56, 10255, by norm_num⟩; exact ⟨240, 10169, by norm_num⟩; exact ⟨61, 9825, by norm_num⟩; exact ⟨114, 9739, by norm_num⟩; exact ⟨207, 9307, by norm_num⟩; exact ⟨248, 8815, by norm_num⟩; exact ⟨50, 8669, by norm_num⟩; exact ⟨318, 8635, by norm_num⟩; exact ⟨165, 8371, by norm_num⟩; exact ⟨51, 8285, by norm_num⟩; exact ⟨316, 8355, by norm_num⟩; exact ⟨279, 7819, by norm_num⟩; exact ⟨260, 7741, by norm_num⟩; exact ⟨165, 7403, by norm_num⟩; exact ⟨333, 7435, by norm_num⟩; exact ⟨236, 7325, by norm_num⟩; exact ⟨168, 6965, by norm_num⟩; exact ⟨352, 6963, by norm_num⟩; exact ⟨233, 6845, by norm_num⟩; exact ⟨43, 6765, by norm_num⟩; exact ⟨144, 6707, by norm_num⟩; exact ⟨103, 6585, by norm_num⟩; exact ⟨106, 6555, by norm_num⟩; exact ⟨305, 6499, by norm_num⟩; exact ⟨350, 6503, by norm_num⟩; exact ⟨40, 6351, by norm_num⟩; exact ⟨67, 6159, by norm_num⟩; exact ⟨137, 6121, by norm_num⟩; exact ⟨350, 6167, by norm_num⟩; exact ⟨202, 6027, by norm_num⟩; exact ⟨418, 6105, by norm_num⟩; exact ⟨243, 5945, by norm_num⟩; exact ⟨41, 5705, by norm_num⟩; exact ⟨177, 5689, by norm_num⟩; exact ⟨160, 5649, by norm_num⟩; exact ⟨189, 5537, by norm_num⟩; exact ⟨482, 5719, by norm_num⟩; exact ⟨125, 5453, by norm_num⟩; exact ⟨283, 5505, by norm_num⟩; exact ⟨34, 5397, by norm_num⟩; exact ⟨523, 5595, by norm_num⟩; exact ⟨175, 5313, by norm_num⟩; exact ⟨467, 5339, by norm_num⟩; exact ⟨122, 5143, by norm_num⟩; exact ⟨230, 5159, by norm_num⟩; exact ⟨332, 5183, by norm_num⟩; exact ⟨279, 5089, by norm_num⟩; exact ⟨559, 5271, by norm_num⟩; exact ⟨512, 5099, by norm_num⟩; exact ⟨37, 4623, by norm_num⟩; exact ⟨444, 4769, by norm_num⟩; exact ⟨342, 4627, by norm_num⟩; exact ⟨181, 4515, by norm_num⟩; exact ⟨581, 4655, by norm_num⟩; exact ⟨578, 4645, by norm_num⟩; exact ⟨280, 4431, by norm_num⟩; exact ⟨227, 4349, by norm_num⟩; exact ⟨379, 4353, by norm_num⟩; exact ⟨88, 4125, by norm_num⟩; exact ⟨464, 4259, by norm_num⟩; exact ⟨235, 4047, by norm_num⟩; exact ⟨450, 4037, by norm_num⟩; exact ⟨379, 3963, by norm_num⟩; exact ⟨196, 3885, by norm_num⟩; exact ⟨80, 3847, by norm_num⟩; exact ⟨30, 3781, by norm_num⟩; exact ⟨333, 3845, by norm_num⟩; exact ⟨646, 4035, by norm_num⟩; exact ⟨193, 3765, by norm_num⟩; exact ⟨451, 3795, by norm_num⟩; exact ⟨653, 3895, by norm_num⟩; exact ⟨219, 3641, by norm_num⟩; exact ⟨152, 3611, by norm_num⟩; exact ⟨583, 3795, by norm_num⟩; exact ⟨369, 3637, by norm_num⟩; exact ⟨758, 3905, by norm_num⟩; exact ⟨797, 3899, by norm_num⟩; exact ⟨65, 3487, by norm_num⟩; exact ⟨692, 3773, by norm_num⟩; exact ⟨390, 3557, by norm_num⟩; exact ⟨629, 3703, by norm_num⟩; exact ⟨292, 3477, by norm_num⟩; exact ⟨51, 3385, by norm_num⟩; exact ⟨545, 3479, by norm_num⟩]
  · show 139 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert139
