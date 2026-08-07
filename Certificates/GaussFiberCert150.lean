/-
  Certificates.GaussFiberCert150 — fiber-h=150 EXCLUSION certificate for
  D = −26063211 (first odd-disc fundamental above X₀(150)).
  150 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −26063211 has size > 150,
  so h(−26063211) ≥ 151 — D is excluded from every fiber ≤ 150.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.FiberCert150
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 17, 19, 31, 37, 43, 47, 53, 61, 71, 109, 113, 131, 151, 163, 181, 199, 227, 233, 241, 257, 263, 269, 277, 281, 283, 307, 311, 317, 337, 347, 349, 353, 367, 373, 383, 389, 431, 433, 461, 467, 479, 487, 491, 503, 541, 557, 571, 577, 599, 601, 607, 613, 641, 659, 691, 701, 727, 743, 751, 761, 769, 787, 809, 821, 829, 839, 859, 877, 887, 907, 929, 941, 947, 953, 971, 977, 997, 1009, 1013, 1019, 1021, 1031, 1039, 1061, 1087, 1091, 1093, 1117, 1151, 1171, 1187, 1213, 1217, 1237, 1259, 1277, 1279, 1283, 1289, 1291, 1297, 1301, 1303, 1319, 1321, 1327, 1361, 1373, 1381, 1399, 1427, 1429, 1447, 1451, 1453, 1459, 1471, 1487, 1489, 1493, 1499, 1511, 1523, 1549, 1553, 1567, 1579, 1583, 1597, 1607, 1609, 1613, 1619, 1657, 1663, 1669, 1693, 1697, 1699, 1709, 1721, 1723, 1741, 1759, 1777, 1783, 1787]

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
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -26063211) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -26063211 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    150 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -26063211) (c₀ := 6515803) (ps := ps) (h := 150)
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
    fin_cases hp <;> [exact ⟨1, 2171935, by norm_num⟩; exact ⟨1, 1303161, by norm_num⟩; exact ⟨0, 930829, by norm_num⟩; exact ⟨6, 383285, by norm_num⟩; exact ⟨0, 342937, by norm_num⟩; exact ⟨7, 210189, by norm_num⟩; exact ⟨12, 176107, by norm_num⟩; exact ⟨5, 151531, by norm_num⟩; exact ⟨6, 138635, by norm_num⟩; exact ⟨24, 122951, by norm_num⟩; exact ⟨12, 106819, by norm_num⟩; exact ⟨22, 91779, by norm_num⟩; exact ⟨45, 59797, by norm_num⟩; exact ⟨18, 57665, by norm_num⟩; exact ⟨2, 49739, by norm_num⟩; exact ⟨69, 43183, by norm_num⟩; exact ⟨81, 40015, by norm_num⟩; exact ⟨50, 36013, by norm_num⟩; exact ⟨69, 32767, by norm_num⟩; exact ⟨96, 28745, by norm_num⟩; exact ⟨6, 27965, by norm_num⟩; exact ⟨39, 27043, by norm_num⟩; exact ⟨103, 25395, by norm_num⟩; exact ⟨51, 24785, by norm_num⟩; exact ⟨35, 24227, by norm_num⟩; exact ⟨78, 23545, by norm_num⟩; exact ⟨17, 23189, by norm_num⟩; exact ⟨16, 23025, by norm_num⟩; exact ⟨16, 21225, by norm_num⟩; exact ⟨149, 21023, by norm_num⟩; exact ⟨11, 20555, by norm_num⟩; exact ⟨116, 19375, by norm_num⟩; exact ⟨104, 18809, by norm_num⟩; exact ⟨157, 18741, by norm_num⟩; exact ⟨30, 18461, by norm_num⟩; exact ⟨136, 17805, by norm_num⟩; exact ⟨131, 17515, by norm_num⟩; exact ⟨111, 17045, by norm_num⟩; exact ⟨43, 16755, by norm_num⟩; exact ⟨126, 15155, by norm_num⟩; exact ⟨126, 15085, by norm_num⟩; exact ⟨115, 14163, by norm_num⟩; exact ⟨76, 13965, by norm_num⟩; exact ⟨31, 13605, by norm_num⟩; exact ⟨111, 13405, by norm_num⟩; exact ⟨144, 13313, by norm_num⟩; exact ⟨169, 13011, by norm_num⟩; exact ⟨172, 12099, by norm_num⟩; exact ⟨143, 11735, by norm_num⟩; exact ⟨46, 11415, by norm_num⟩; exact ⟨156, 11335, by norm_num⟩; exact ⟨101, 10895, by norm_num⟩; exact ⟨161, 10885, by norm_num⟩; exact ⟨18, 10735, by norm_num⟩; exact ⟨197, 10693, by norm_num⟩; exact ⟨147, 10199, by norm_num⟩; exact ⟨79, 9897, by norm_num⟩; exact ⟨61, 9435, by norm_num⟩; exact ⟨221, 9365, by norm_num⟩; exact ⟨153, 8995, by norm_num⟩; exact ⟨274, 8871, by norm_num⟩; exact ⟨191, 8725, by norm_num⟩; exact ⟨46, 8565, by norm_num⟩; exact ⟨318, 8605, by norm_num⟩; exact ⟨319, 8409, by norm_num⟩; exact ⟨225, 8117, by norm_num⟩; exact ⟨123, 7955, by norm_num⟩; exact ⟨193, 7905, by norm_num⟩; exact ⟨410, 7967, by norm_num⟩; exact ⟨237, 7651, by norm_num⟩; exact ⟨68, 7435, by norm_num⟩; exact ⟨296, 7445, by norm_num⟩; exact ⟨31, 7185, by norm_num⟩; exact ⟨434, 7217, by norm_num⟩; exact ⟨342, 7049, by norm_num⟩; exact ⟨399, 7049, by norm_num⟩; exact ⟨86, 6845, by norm_num⟩; exact ⟨265, 6783, by norm_num⟩; exact ⟨233, 6725, by norm_num⟩; exact ⟨107, 6547, by norm_num⟩; exact ⟨218, 6505, by norm_num⟩; exact ⟨94, 6441, by norm_num⟩; exact ⟨26, 6395, by norm_num⟩; exact ⟨308, 6475, by norm_num⟩; exact ⟨434, 6503, by norm_num⟩; exact ⟨386, 6415, by norm_num⟩; exact ⟨359, 6263, by norm_num⟩; exact ⟨117, 6007, by norm_num⟩; exact ⟨261, 6035, by norm_num⟩; exact ⟨237, 6013, by norm_num⟩; exact ⟨43, 5835, by norm_num⟩; exact ⟨505, 5883, by norm_num⟩; exact ⟨28, 5565, by norm_num⟩; exact ⟨136, 5505, by norm_num⟩; exact ⟨380, 5491, by norm_num⟩; exact ⟨499, 5559, by norm_num⟩; exact ⟨441, 5425, by norm_num⟩; exact ⟨371, 5285, by norm_num⟩; exact ⟨382, 5217, by norm_num⟩; exact ⟨26, 5095, by norm_num⟩; exact ⟨386, 5195, by norm_num⟩; exact ⟨344, 5147, by norm_num⟩; exact ⟨451, 5205, by norm_num⟩; exact ⟨647, 5347, by norm_num⟩; exact ⟨218, 5045, by norm_num⟩; exact ⟨280, 5061, by norm_num⟩; exact ⟨604, 5217, by norm_num⟩; exact ⟨619, 5223, by norm_num⟩; exact ⟨181, 4935, by norm_num⟩; exact ⟨360, 4883, by norm_num⟩; exact ⟨299, 4811, by norm_num⟩; exact ⟨418, 4845, by norm_num⟩; exact ⟨666, 4975, by norm_num⟩; exact ⟨64, 4569, by norm_num⟩; exact ⟨629, 4837, by norm_num⟩; exact ⟨703, 4845, by norm_num⟩; exact ⟨59, 4493, by norm_num⟩; exact ⟨534, 4681, by norm_num⟩; exact ⟨364, 4557, by norm_num⟩; exact ⟨228, 4465, by norm_num⟩; exact ⟨68, 4385, by norm_num⟩; exact ⟨296, 4435, by norm_num⟩; exact ⟨100, 4371, by norm_num⟩; exact ⟨257, 4391, by norm_num⟩; exact ⟨553, 4515, by norm_num⟩; exact ⟨64, 4281, by norm_num⟩; exact ⟨374, 4297, by norm_num⟩; exact ⟨567, 4403, by norm_num⟩; exact ⟨298, 4215, by norm_num⟩; exact ⟨737, 4471, by norm_num⟩; exact ⟨320, 4181, by norm_num⟩; exact ⟨428, 4195, by norm_num⟩; exact ⟨621, 4295, by norm_num⟩; exact ⟨47, 4051, by norm_num⟩; exact ⟨497, 4193, by norm_num⟩; exact ⟨190, 4047, by norm_num⟩; exact ⟨420, 4039, by norm_num⟩; exact ⟨211, 3945, by norm_num⟩; exact ⟨799, 4287, by norm_num⟩; exact ⟨103, 3855, by norm_num⟩; exact ⟨389, 3929, by norm_num⟩; exact ⟨524, 3997, by norm_num⟩; exact ⟨63, 3815, by norm_num⟩; exact ⟨318, 3845, by norm_num⟩; exact ⟨546, 3955, by norm_num⟩; exact ⟨619, 3963, by norm_num⟩; exact ⟨412, 3801, by norm_num⟩; exact ⟨584, 3859, by norm_num⟩; exact ⟨649, 3891, by norm_num⟩; exact ⟨766, 3975, by norm_num⟩]
  · show 150 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert150
