/-
  Certificates.GaussFiberCert147 — fiber-h=147 EXCLUSION certificate for
  D = −25357547 (first odd-disc fundamental above X₀(147)).
  147 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −25357547 has size > 147,
  so h(−25357547) ≥ 148 — D is excluded from every fiber ≤ 147.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Certificates.FiberCert147
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 7, 11, 19, 29, 31, 37, 41, 47, 53, 59, 67, 71, 73, 79, 97, 103, 107, 109, 113, 127, 131, 151, 193, 197, 199, 211, 227, 229, 233, 241, 257, 263, 277, 307, 317, 337, 347, 349, 373, 389, 397, 401, 419, 421, 431, 457, 491, 499, 503, 509, 521, 541, 557, 571, 577, 587, 613, 617, 631, 641, 643, 647, 661, 691, 719, 733, 739, 743, 769, 797, 811, 821, 823, 853, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 971, 977, 991, 997, 1021, 1031, 1033, 1061, 1063, 1069, 1087, 1097, 1103, 1117, 1129, 1151, 1187, 1193, 1201, 1213, 1217, 1231, 1237, 1249, 1289, 1297, 1301, 1307, 1319, 1321, 1361, 1367, 1373, 1381, 1399, 1409, 1423, 1427, 1429, 1439, 1447, 1451, 1453, 1459, 1471, 1487, 1499, 1523, 1543, 1549, 1559, 1597, 1607, 1609, 1637, 1663, 1699, 1709, 1733, 1741, 1747, 1777]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -25357547) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -25357547 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    147 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -25357547) (c₀ := 6339387) (ps := ps) (h := 147)
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
    fin_cases hp <;> [exact ⟨0, 2113129, by norm_num⟩; exact ⟨1, 905627, by norm_num⟩; exact ⟨3, 576309, by norm_num⟩; exact ⟨4, 333653, by norm_num⟩; exact ⟨6, 218601, by norm_num⟩; exact ⟨4, 204497, by norm_num⟩; exact ⟨12, 171339, by norm_num⟩; exact ⟨12, 154623, by norm_num⟩; exact ⟨4, 134881, by norm_num⟩; exact ⟨20, 119619, by norm_num⟩; exact ⟨28, 107461, by norm_num⟩; exact ⟨27, 94629, by norm_num⟩; exact ⟨11, 89289, by norm_num⟩; exact ⟨2, 86841, by norm_num⟩; exact ⟨24, 80253, by norm_num⟩; exact ⟨37, 65369, by norm_num⟩; exact ⟨34, 61559, by norm_num⟩; exact ⟨6, 59247, by norm_num⟩; exact ⟨19, 58163, by norm_num⟩; exact ⟨30, 56109, by norm_num⟩; exact ⟨8, 49917, by norm_num⟩; exact ⟨37, 48403, by norm_num⟩; exact ⟨25, 41987, by norm_num⟩; exact ⟨90, 32889, by norm_num⟩; exact ⟨58, 32197, by norm_num⟩; exact ⟨12, 31857, by norm_num⟩; exact ⟨62, 30063, by norm_num⟩; exact ⟨6, 27927, by norm_num⟩; exact ⟨4, 27683, by norm_num⟩; exact ⟨70, 27229, by norm_num⟩; exact ⟨24, 26307, by norm_num⟩; exact ⟨113, 24717, by norm_num⟩; exact ⟨42, 24111, by norm_num⟩; exact ⟨76, 22907, by norm_num⟩; exact ⟨59, 20661, by norm_num⟩; exact ⟨30, 20001, by norm_num⟩; exact ⟨129, 18861, by norm_num⟩; exact ⟨25, 18271, by norm_num⟩; exact ⟨80, 18183, by norm_num⟩; exact ⟨70, 17009, by norm_num⟩; exact ⟨187, 16387, by norm_num⟩; exact ⟨17, 15969, by norm_num⟩; exact ⟨63, 15819, by norm_num⟩; exact ⟨68, 15141, by norm_num⟩; exact ⟨131, 15099, by norm_num⟩; exact ⟨144, 14757, by norm_num⟩; exact ⟨83, 13887, by norm_num⟩; exact ⟨168, 12969, by norm_num⟩; exact ⟨37, 12707, by norm_num⟩; exact ⟨173, 12663, by norm_num⟩; exact ⟨245, 12573, by norm_num⟩; exact ⟨69, 12177, by norm_num⟩; exact ⟨52, 11723, by norm_num⟩; exact ⟨93, 11397, by norm_num⟩; exact ⟨132, 11133, by norm_num⟩; exact ⟨90, 11001, by norm_num⟩; exact ⟨183, 10857, by norm_num⟩; exact ⟨170, 10389, by norm_num⟩; exact ⟨52, 10279, by norm_num⟩; exact ⟨241, 10139, by norm_num⟩; exact ⟨285, 10017, by norm_num⟩; exact ⟨258, 9963, by norm_num⟩; exact ⟨314, 9951, by norm_num⟩; exact ⟨209, 9657, by norm_num⟩; exact ⟨150, 9207, by norm_num⟩; exact ⟨131, 8841, by norm_num⟩; exact ⟨210, 8709, by norm_num⟩; exact ⟨264, 8673, by norm_num⟩; exact ⟨323, 8673, by norm_num⟩; exact ⟨202, 8297, by norm_num⟩; exact ⟨227, 8019, by norm_num⟩; exact ⟨360, 7977, by norm_num⟩; exact ⟨302, 7833, by norm_num⟩; exact ⟨13, 7703, by norm_num⟩; exact ⟨200, 7479, by norm_num⟩; exact ⟨140, 7251, by norm_num⟩; exact ⟨307, 7303, by norm_num⟩; exact ⟨343, 7313, by norm_num⟩; exact ⟨1, 7147, by norm_num⟩; exact ⟨232, 7049, by norm_num⟩; exact ⟨62, 6963, by norm_num⟩; exact ⟨427, 7097, by norm_num⟩; exact ⟨359, 6963, by norm_num⟩; exact ⟨457, 6989, by norm_num⟩; exact ⟨221, 6789, by norm_num⟩; exact ⟨16, 6529, by norm_num⟩; exact ⟨166, 6517, by norm_num⟩; exact ⟨410, 6567, by norm_num⟩; exact ⟨102, 6369, by norm_num⟩; exact ⟨1, 6209, by norm_num⟩; exact ⟨476, 6369, by norm_num⟩; exact ⟨445, 6329, by norm_num⟩; exact ⟨184, 6007, by norm_num⟩; exact ⟨219, 6009, by norm_num⟩; exact ⟨401, 6081, by norm_num⟩; exact ⟨423, 5997, by norm_num⟩; exact ⟨115, 5791, by norm_num⟩; exact ⟨192, 5781, by norm_num⟩; exact ⟨199, 5711, by norm_num⟩; exact ⟨477, 5817, by norm_num⟩; exact ⟨156, 5529, by norm_num⟩; exact ⟨19, 5341, by norm_num⟩; exact ⟨322, 5401, by norm_num⟩; exact ⟨500, 5487, by norm_num⟩; exact ⟨335, 5319, by norm_num⟩; exact ⟨98, 5217, by norm_num⟩; exact ⟨106, 5159, by norm_num⟩; exact ⟨132, 5139, by norm_num⟩; exact ⟨609, 5373, by norm_num⟩; exact ⟨61, 4921, by norm_num⟩; exact ⟨643, 5207, by norm_num⟩; exact ⟨162, 4893, by norm_num⟩; exact ⟨29, 4851, by norm_num⟩; exact ⟨556, 5041, by norm_num⟩; exact ⟨154, 4817, by norm_num⟩; exact ⟨453, 4809, by norm_num⟩; exact ⟨163, 4657, by norm_num⟩; exact ⟨658, 4933, by norm_num⟩; exact ⟨279, 4647, by norm_num⟩; exact ⟨263, 4581, by norm_num⟩; exact ⟨465, 4653, by norm_num⟩; exact ⟨261, 4503, by norm_num⟩; exact ⟨487, 4609, by norm_num⟩; exact ⟨687, 4767, by norm_num⟩; exact ⟨104, 4413, by norm_num⟩; exact ⟨331, 4457, by norm_num⟩; exact ⟨502, 4543, by norm_num⟩; exact ⟨194, 4389, by norm_num⟩; exact ⟨461, 4491, by norm_num⟩; exact ⟨104, 4317, by norm_num⟩; exact ⟨432, 4389, by norm_num⟩; exact ⟨225, 4263, by norm_num⟩; exact ⟨442, 4291, by norm_num⟩; exact ⟨83, 4113, by norm_num⟩; exact ⟨279, 4143, by norm_num⟩; exact ⟨637, 4327, by norm_num⟩; exact ⟨468, 4107, by norm_num⟩; exact ⟨741, 4287, by norm_num⟩; exact ⟨223, 3971, by norm_num⟩; exact ⟨578, 4077, by norm_num⟩; exact ⟨714, 4119, by norm_num⟩; exact ⟨748, 4061, by norm_num⟩; exact ⟨830, 4113, by norm_num⟩; exact ⟨607, 3871, by norm_num⟩; exact ⟨840, 4047, by norm_num⟩; exact ⟨631, 3857, by norm_num⟩; exact ⟨204, 3591, by norm_num⟩]
  · show 147 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert147
