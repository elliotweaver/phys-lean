/-
  Certificates.GaussFiberCert133 — fiber-h=133 EXCLUSION certificate for
  D = −20457147 (first odd-disc fundamental above X₀(133)).
  133 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −20457147 has size > 133,
  so h(−20457147) ≥ 134 — D is excluded from every fiber ≤ 133.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert133
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 11, 13, 19, 29, 31, 41, 43, 59, 61, 71, 73, 83, 101, 107, 109, 127, 131, 151, 157, 167, 179, 181, 193, 197, 199, 239, 251, 269, 281, 283, 307, 317, 331, 353, 373, 379, 383, 421, 449, 457, 461, 503, 523, 541, 563, 571, 599, 607, 613, 617, 643, 661, 691, 709, 719, 751, 757, 797, 809, 829, 839, 853, 859, 941, 953, 977, 991, 997, 1009, 1013, 1019, 1021, 1033, 1051, 1061, 1063, 1097, 1103, 1109, 1153, 1201, 1217, 1237, 1277, 1279, 1289, 1303, 1307, 1319, 1367, 1381, 1409, 1423, 1427, 1433, 1439, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1499, 1523, 1553, 1583, 1609, 1619, 1637, 1721, 1733, 1747, 1753, 1759, 1787, 1789, 1801, 1831, 1847, 1867, 1877, 1889, 1901, 1907, 1933, 1949, 1951, 1979, 1987, 1993]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -20457147) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -20457147 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    133 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -20457147) (c₀ := 5114287) (ps := ps) (h := 133)
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
    fin_cases hp <;> [exact ⟨1, 1704763, by norm_num⟩; exact ⟨4, 464937, by norm_num⟩; exact ⟨5, 393409, by norm_num⟩; exact ⟨0, 269173, by norm_num⟩; exact ⟨13, 176361, by norm_num⟩; exact ⟨0, 164977, by norm_num⟩; exact ⟨3, 124739, by norm_num⟩; exact ⟨9, 118939, by norm_num⟩; exact ⟨24, 86693, by norm_num⟩; exact ⟨19, 83847, by norm_num⟩; exact ⟨7, 72033, by norm_num⟩; exact ⟨4, 70059, by norm_num⟩; exact ⟨9, 61619, by norm_num⟩; exact ⟨45, 50657, by norm_num⟩; exact ⟨20, 47801, by norm_num⟩; exact ⟨27, 46927, by norm_num⟩; exact ⟨46, 40287, by norm_num⟩; exact ⟨29, 39047, by norm_num⟩; exact ⟨64, 33897, by norm_num⟩; exact ⟨30, 32581, by norm_num⟩; exact ⟨27, 30629, by norm_num⟩; exact ⟨45, 28583, by norm_num⟩; exact ⟨88, 28299, by norm_num⟩; exact ⟨4, 26499, by norm_num⟩; exact ⟨5, 25961, by norm_num⟩; exact ⟨37, 25707, by norm_num⟩; exact ⟨23, 21401, by norm_num⟩; exact ⟨91, 20409, by norm_num⟩; exact ⟨14, 19013, by norm_num⟩; exact ⟨27, 18203, by norm_num⟩; exact ⟨45, 18079, by norm_num⟩; exact ⟨121, 16707, by norm_num⟩; exact ⟨86, 16157, by norm_num⟩; exact ⟨44, 15457, by norm_num⟩; exact ⟨104, 14519, by norm_num⟩; exact ⟨172, 13791, by norm_num⟩; exact ⟨84, 13513, by norm_num⟩; exact ⟨82, 13371, by norm_num⟩; exact ⟨170, 12217, by norm_num⟩; exact ⟨16, 11391, by norm_num⟩; exact ⟨0, 11191, by norm_num⟩; exact ⟨48, 11099, by norm_num⟩; exact ⟨133, 10203, by norm_num⟩; exact ⟨233, 9883, by norm_num⟩; exact ⟨185, 9517, by norm_num⟩; exact ⟨205, 9159, by norm_num⟩; exact ⟨122, 8983, by norm_num⟩; exact ⟨54, 8543, by norm_num⟩; exact ⟨83, 8437, by norm_num⟩; exact ⟨156, 8383, by norm_num⟩; exact ⟨35, 8291, by norm_num⟩; exact ⟨170, 7999, by norm_num⟩; exact ⟨80, 7747, by norm_num⟩; exact ⟨122, 7423, by norm_num⟩; exact ⟨73, 7221, by norm_num⟩; exact ⟨189, 7163, by norm_num⟩; exact ⟨157, 6843, by norm_num⟩; exact ⟨196, 6807, by norm_num⟩; exact ⟨126, 6437, by norm_num⟩; exact ⟨401, 6521, by norm_num⟩; exact ⟨190, 6213, by norm_num⟩; exact ⟨120, 6113, by norm_num⟩; exact ⟨178, 6033, by norm_num⟩; exact ⟨303, 6061, by norm_num⟩; exact ⟨390, 5597, by norm_num⟩; exact ⟨117, 5381, by norm_num⟩; exact ⟨480, 5471, by norm_num⟩; exact ⟨278, 5239, by norm_num⟩; exact ⟨311, 5227, by norm_num⟩; exact ⟨48, 5071, by norm_num⟩; exact ⟨450, 5249, by norm_num⟩; exact ⟨251, 5081, by norm_num⟩; exact ⟨416, 5179, by norm_num⟩; exact ⟨46, 4953, by norm_num⟩; exact ⟨30, 4867, by norm_num⟩; exact ⟨507, 5063, by norm_num⟩; exact ⟨200, 4849, by norm_num⟩; exact ⟨342, 4769, by norm_num⟩; exact ⟨322, 4731, by norm_num⟩; exact ⟨542, 4877, by norm_num⟩; exact ⟨141, 4453, by norm_num⟩; exact ⟨478, 4449, by norm_num⟩; exact ⟨373, 4317, by norm_num⟩; exact ⟨505, 4341, by norm_num⟩; exact ⟨51, 4007, by norm_num⟩; exact ⟨74, 4003, by norm_num⟩; exact ⟨514, 4173, by norm_num⟩; exact ⟨310, 3999, by norm_num⟩; exact ⟨418, 4047, by norm_num⟩; exact ⟨545, 4103, by norm_num⟩; exact ⟨646, 4047, by norm_num⟩; exact ⟨363, 3799, by norm_num⟩; exact ⟨399, 3743, by norm_num⟩; exact ⟨404, 3709, by norm_num⟩; exact ⟨136, 3597, by norm_num⟩; exact ⟨9, 3569, by norm_num⟩; exact ⟨373, 3651, by norm_num⟩; exact ⟨505, 3711, by norm_num⟩; exact ⟨441, 3659, by norm_num⟩; exact ⟨127, 3531, by norm_num⟩; exact ⟨193, 3531, by norm_num⟩; exact ⟨19, 3477, by norm_num⟩; exact ⟨254, 3497, by norm_num⟩; exact ⟨478, 3603, by norm_num⟩; exact ⟨179, 3461, by norm_num⟩; exact ⟨723, 3761, by norm_num⟩; exact ⟨479, 3509, by norm_num⟩; exact ⟨654, 3569, by norm_num⟩; exact ⟨500, 3389, by norm_num⟩; exact ⟨228, 3211, by norm_num⟩; exact ⟨410, 3263, by norm_num⟩; exact ⟨245, 3161, by norm_num⟩; exact ⟨503, 3119, by norm_num⟩; exact ⟨143, 2963, by norm_num⟩; exact ⟨534, 3091, by norm_num⟩; exact ⟨853, 3333, by norm_num⟩; exact ⟨78, 2911, by norm_num⟩; exact ⟨562, 3039, by norm_num⟩; exact ⟨604, 3063, by norm_num⟩; exact ⟨656, 3079, by norm_num⟩; exact ⟨414, 2887, by norm_num⟩; exact ⟨7, 2769, by norm_num⟩; exact ⟨685, 2991, by norm_num⟩; exact ⟨770, 3041, by norm_num⟩; exact ⟨734, 2993, by norm_num⟩; exact ⟨128, 2699, by norm_num⟩; exact ⟨584, 2861, by norm_num⟩; exact ⟨424, 2739, by norm_num⟩; exact ⟨275, 2663, by norm_num⟩; exact ⟨900, 3037, by norm_num⟩; exact ⟨512, 2717, by norm_num⟩; exact ⟨161, 2587, by norm_num⟩; exact ⟨911, 2983, by norm_num⟩]
  · show 133 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert133
