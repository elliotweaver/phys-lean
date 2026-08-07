/-
  Certificates.GaussFiberCert148 — fiber-h=148 EXCLUSION certificate for
  D = −25681467 (first odd-disc fundamental above X₀(148)).
  148 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −25681467 has size > 148,
  so h(−25681467) ≥ 149 — D is excluded from every fiber ≤ 148.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.FiberCert148
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 7, 17, 19, 29, 31, 37, 41, 43, 53, 59, 67, 73, 79, 83, 89, 101, 103, 131, 139, 149, 151, 157, 163, 167, 173, 181, 199, 223, 229, 233, 241, 251, 257, 269, 271, 277, 281, 293, 307, 331, 347, 353, 359, 367, 379, 389, 401, 419, 421, 431, 433, 449, 467, 499, 523, 547, 557, 569, 571, 617, 641, 643, 661, 677, 683, 701, 727, 733, 743, 761, 769, 787, 797, 811, 821, 823, 827, 853, 877, 881, 911, 919, 937, 947, 997, 1019, 1021, 1033, 1051, 1087, 1091, 1097, 1117, 1123, 1151, 1153, 1181, 1187, 1193, 1201, 1213, 1217, 1223, 1229, 1237, 1259, 1283, 1289, 1297, 1301, 1303, 1307, 1319, 1361, 1367, 1381, 1399, 1423, 1427, 1433, 1439, 1447, 1451, 1453, 1471, 1483, 1489, 1499, 1511, 1543, 1553, 1607, 1609, 1613, 1619, 1621, 1627, 1657, 1663, 1667, 1669, 1693, 1697, 1699, 1709, 1721, 1723]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -25681467) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -25681467 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    148 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -25681467) (c₀ := 6420367) (ps := ps) (h := 148)
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
    fin_cases hp <;> [exact ⟨1, 2140123, by norm_num⟩; exact ⟨3, 917197, by norm_num⟩; exact ⟨2, 377669, by norm_num⟩; exact ⟨7, 337917, by norm_num⟩; exact ⟨5, 221393, by norm_num⟩; exact ⟨3, 207109, by norm_num⟩; exact ⟨11, 173527, by norm_num⟩; exact ⟨10, 156597, by norm_num⟩; exact ⟨2, 149311, by norm_num⟩; exact ⟨0, 121139, by norm_num⟩; exact ⟨8, 108821, by norm_num⟩; exact ⟨6, 95827, by norm_num⟩; exact ⟨7, 87951, by norm_num⟩; exact ⟨6, 81271, by norm_num⟩; exact ⟨35, 77369, by norm_num⟩; exact ⟨13, 72141, by norm_num⟩; exact ⟨22, 63573, by norm_num⟩; exact ⟨27, 62341, by norm_num⟩; exact ⟨33, 49019, by norm_num⟩; exact ⟨13, 46191, by norm_num⟩; exact ⟨44, 43103, by norm_num⟩; exact ⟨1, 42519, by norm_num⟩; exact ⟨21, 40897, by norm_num⟩; exact ⟨72, 39421, by norm_num⟩; exact ⟨65, 38471, by norm_num⟩; exact ⟨13, 37113, by norm_num⟩; exact ⟨36, 35479, by norm_num⟩; exact ⟨52, 32277, by norm_num⟩; exact ⟨47, 28801, by norm_num⟩; exact ⟨107, 28087, by norm_num⟩; exact ⟨77, 27581, by norm_num⟩; exact ⟨39, 26647, by norm_num⟩; exact ⟨120, 25637, by norm_num⟩; exact ⟨42, 24989, by norm_num⟩; exact ⟨64, 23883, by norm_num⟩; exact ⟨86, 23719, by norm_num⟩; exact ⟨59, 23191, by norm_num⟩; exact ⟨49, 22857, by norm_num⟩; exact ⟨69, 21929, by norm_num⟩; exact ⟨152, 20989, by norm_num⟩; exact ⟨26, 19399, by norm_num⟩; exact ⟨47, 18509, by norm_num⟩; exact ⟨32, 18191, by norm_num⟩; exact ⟨145, 17943, by norm_num⟩; exact ⟨91, 17517, by norm_num⟩; exact ⟨16, 16941, by norm_num⟩; exact ⟨142, 16557, by norm_num⟩; exact ⟨49, 16017, by norm_num⟩; exact ⟨64, 15333, by norm_num⟩; exact ⟨162, 15313, by norm_num⟩; exact ⟨15, 14897, by norm_num⟩; exact ⟨209, 14929, by norm_num⟩; exact ⟨166, 14361, by norm_num⟩; exact ⟨184, 13821, by norm_num⟩; exact ⟨72, 12877, by norm_num⟩; exact ⟨220, 12369, by norm_num⟩; exact ⟨103, 11757, by norm_num⟩; exact ⟨211, 11607, by norm_num⟩; exact ⟨249, 11393, by norm_num⟩; exact ⟨275, 11377, by norm_num⟩; exact ⟨197, 10469, by norm_num⟩; exact ⟨180, 10067, by norm_num⟩; exact ⟨263, 10093, by norm_num⟩; exact ⟨205, 9777, by norm_num⟩; exact ⟨171, 9527, by norm_num⟩; exact ⟨339, 9569, by norm_num⟩; exact ⟨75, 9167, by norm_num⟩; exact ⟨292, 8949, by norm_num⟩; exact ⟨85, 8769, by norm_num⟩; exact ⟨255, 8729, by norm_num⟩; exact ⟨380, 8627, by norm_num⟩; exact ⟨293, 8461, by norm_num⟩; exact ⟨270, 8251, by norm_num⟩; exact ⟨181, 8097, by norm_num⟩; exact ⟨258, 7999, by norm_num⟩; exact ⟨187, 7863, by norm_num⟩; exact ⟨202, 7851, by norm_num⟩; exact ⟨120, 7781, by norm_num⟩; exact ⟨198, 7573, by norm_num⟩; exact ⟨151, 7347, by norm_num⟩; exact ⟨264, 7367, by norm_num⟩; exact ⟨236, 7109, by norm_num⟩; exact ⟨354, 7123, by norm_num⟩; exact ⟨304, 6951, by norm_num⟩; exact ⟨373, 6927, by norm_num⟩; exact ⟨490, 6681, by norm_num⟩; exact ⟨226, 6351, by norm_num⟩; exact ⟨26, 6289, by norm_num⟩; exact ⟨127, 6231, by norm_num⟩; exact ⟨251, 6169, by norm_num⟩; exact ⟨320, 6001, by norm_num⟩; exact ⟨524, 6137, by norm_num⟩; exact ⟨538, 6117, by norm_num⟩; exact ⟨219, 5791, by norm_num⟩; exact ⟨45, 5719, by norm_num⟩; exact ⟨323, 5669, by norm_num⟩; exact ⟨363, 5683, by norm_num⟩; exact ⟨244, 5487, by norm_num⟩; exact ⟨553, 5667, by norm_num⟩; exact ⟨462, 5561, by norm_num⟩; exact ⟨61, 5349, by norm_num⟩; exact ⟨6, 5293, by norm_num⟩; exact ⟨161, 5297, by norm_num⟩; exact ⟨330, 5339, by norm_num⟩; exact ⟨447, 5387, by norm_num⟩; exact ⟨250, 5241, by norm_num⟩; exact ⟨439, 5253, by norm_num⟩; exact ⟨604, 5289, by norm_num⟩; exact ⟨484, 5163, by norm_num⟩; exact ⟨271, 5007, by norm_num⟩; exact ⟨222, 4973, by norm_num⟩; exact ⟨305, 4999, by norm_num⟩; exact ⟨340, 5001, by norm_num⟩; exact ⟨520, 5073, by norm_num⟩; exact ⟨171, 4739, by norm_num⟩; exact ⟨339, 4781, by norm_num⟩; exact ⟨563, 4879, by norm_num⟩; exact ⟨512, 4777, by norm_num⟩; exact ⟨493, 4683, by norm_num⟩; exact ⟨480, 4661, by norm_num⟩; exact ⟨383, 4583, by norm_num⟩; exact ⟨358, 4551, by norm_num⟩; exact ⟨636, 4717, by norm_num⟩; exact ⟨377, 4523, by norm_num⟩; exact ⟨473, 4573, by norm_num⟩; exact ⟨662, 4663, by norm_num⟩; exact ⟨384, 4429, by norm_num⟩; exact ⟨438, 4441, by norm_num⟩; exact ⟨734, 4643, by norm_num⟩; exact ⟨560, 4457, by norm_num⟩; exact ⟨7, 4161, by norm_num⟩; exact ⟨746, 4493, by norm_num⟩; exact ⟨803, 4397, by norm_num⟩; exact ⟨702, 4297, by norm_num⟩; exact ⟨386, 4073, by norm_num⟩; exact ⟨645, 4223, by norm_num⟩; exact ⟨807, 4363, by norm_num⟩; exact ⟨155, 3961, by norm_num⟩; exact ⟨540, 4051, by norm_num⟩; exact ⟨629, 4099, by norm_num⟩; exact ⟨340, 3921, by norm_num⟩; exact ⟨271, 3891, by norm_num⟩; exact ⟨713, 4093, by norm_num⟩; exact ⟨353, 3857, by norm_num⟩; exact ⟨233, 3811, by norm_num⟩; exact ⟨762, 4097, by norm_num⟩; exact ⟨484, 3867, by norm_num⟩; exact ⟨685, 3999, by norm_num⟩]
  · show 148 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert148
